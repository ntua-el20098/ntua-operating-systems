/*
 * mandel.c
 *
 * A program to draw the Mandelbrot Set on a 256-color xterm.
 *
 */

#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <pthread.h>

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000

#define perror_pthread(ret, msg) \
    do                           \
    {                            \
        errno = ret;             \
        perror(msg);             \
    } while (0)

/***************************
 * Compile-time parameters *
 ***************************/

int safe_atoi(char *s, int *val)
{
    long l;
    char *endp;

    l = strtol(s, &endp, 10);
    if (s != endp && *endp == '\0')
    {
        *val = l;
        return 0;
    }
    else
        return -1;
}

void *safe_malloc(size_t size)
{
    void *p;

    if ((p = malloc(size)) == NULL)
    {
        fprintf(stderr, "Out of memory, failed to allocate %zd bytes\n",
                size);
        exit(1);
    }

    return p;
}

void sig_handler(int signum)
{
    printf("   Color will be restored after signal : %d\n", signum);
    reset_xterm_color(1);
    printf("Color restored\n");
    printf("Exiting...\n");
    exit(EXIT_SUCCESS);
}
/***************************
 * Compile-time parameters *
 ***************************/

/*
 * Output at the terminal is is x_chars wide by y_chars long
 */
int y_chars = 50;
int x_chars = 90;

/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin)
 */
double xmin = -1.8, xmax = 1.0;
double ymin = -1.0, ymax = 1.0;

/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;

/*
 * This function computes a line of output
 * as an array of x_char color values.
 */
void compute_mandel_line(int line, int color_val[])
{
    /*
     * x and y traverse the complex plane.
     */
    double x, y;

    int n;
    int val;

    /* Find out the y value corresponding to this line */
    y = ymax - ystep * line;

    /* and iterate for all points on this line */
    for (x = xmin, n = 0; n < x_chars; x += xstep, n++)
    {

        /* Compute the point's color value */
        val = mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
        if (val > 255)
            val = 255;

        /* And store it in the color_val[] array */
        val = xterm_color(val);
        color_val[n] = val;
    }
}

/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
    int i;

    char point = '@';
    char newline = '\n';

    for (i = 0; i < x_chars; i++)
    {
        /* Set the current color, then output the point */
        set_xterm_color(fd, color_val[i]);
        if (write(fd, &point, 1) != 1)
        {
            perror("compute_and_output_mandel_line: write point");
            exit(1);
        }
    }

    /* Now that the line is done, output a newline character */
    if (write(fd, &newline, 1) != 1)
    {
        perror("compute_and_output_mandel_line: write newline");
        exit(1);
    }
}

// The Condition variable and the mutex
// pthread_cond_t MyTurn;
// pthread_cond_t *MyTurn;
pthread_cond_t MyTurn;
pthread_mutex_t linewriter = PTHREAD_MUTEX_INITIALIZER;
int threadcnt;
int g_index = -1;
int err_ret;

void waiting_for_myturn(int thread_index, int index_line, int color_val[])
{

    err_ret = pthread_mutex_lock(&linewriter);
    if (err_ret != 0)
    {
        perror_pthread(err_ret, "lock problem");
    }
    while (index_line != g_index + 1)
    {
        // pthread_cond_wait(&MyTurn[thread_index], &linewriter);
        pthread_cond_wait(&MyTurn, &linewriter);
    }
    output_mandel_line(1, color_val);
    g_index = index_line;
    pthread_cond_broadcast(&MyTurn);
    // pthread_cond_signal(&MyTurn[(thread_index + 1) % threadcnt]);
    err_ret = pthread_mutex_unlock(&linewriter);
    if (err_ret != 0)
    {
        perror_pthread(err_ret, "unlock problem");
    }
    return;
}

void *start_fn(void *arg)
{
    /*
     * A temporary array, used to hold color values for the line being drawn
     */
    int color_val[x_chars];
    int thread_index = (__intptr_t)arg;

    for (int index_line = thread_index; index_line < y_chars; index_line += threadcnt)
    {
        compute_mandel_line(index_line, color_val);
        waiting_for_myturn(thread_index, index_line, color_val);
    }
    return NULL;
}

int main(int argc, char *argv[])
{

    if (safe_atoi(argv[1], &threadcnt) < 0 || threadcnt <= 0)
    {
        fprintf(stderr, "`%s' is not valid for `thread_count'\n", argv[1]);
        exit(1);
    }

    struct sigaction act;
    act.sa_handler = sig_handler;
    sigemptyset(&act.sa_mask);
    act.sa_flags = 0;
    if (sigaction(SIGINT, &act, NULL) == -1)
    {
        perror("sigaction");
        exit(EXIT_FAILURE);
    }

    pthread_t *threads;
    // MyTurn = (pthread_cond_t *)safe_malloc(threadcnt * sizeof(*MyTurn));
    threads = (pthread_t *)safe_malloc(threadcnt * sizeof(*threads));

    int ret;
    xstep = (xmax - xmin) / x_chars;
    ystep = (ymax - ymin) / y_chars;

    // Initialiaze the mutex and the conditional variable

    /*
    for (int i = 0; i < threadcnt; ++i)
    {
        pthread_cond_init(&MyTurn[i], NULL);
    }
    */
    if (pthread_cond_init(&MyTurn, NULL) != 0)
    {
        perror("problem in initializing a conditional variable");
    }

    /*
     * draw the Mandelbrot Set, one line at a time.
     * Output is sent to file descriptor '1', i.e., standard output.
     */
    /* Spawn threadcnt new threads */
    for (int i = 0; i < threadcnt; ++i)
    {

        ret = pthread_create(&threads[i], NULL, start_fn, (void *)(__intptr_t)i);
        if (ret)
        {
            perror_pthread(ret, "pthread_create");
            exit(1);
        }
    }
    /*
     * Wait for all threads to terminate
     */
    for (int i = 0; i < threadcnt; i++)
    {
        ret = pthread_join(threads[i], NULL);
        if (ret)
        {
            perror_pthread(ret, "pthread_join");
            exit(1);
        }
    }

    pthread_mutex_destroy(&linewriter);
    /*
    for (int i = 0; i < threadcnt; ++i)
    {
       if(pthread_cond_destroy(&MyTurn[i]) !=0)
       {
         perror("problem in destroying a conditional variable");
       }
    }
    */
    pthread_cond_destroy(&MyTurn);
    if (pthread_cond_destroy(&MyTurn) != 0)
    {
        perror("problem in destroying a conditional variable");
    }
    free(threads);
    // free(MyTurn);
    reset_xterm_color(1);
    return 0;
}
