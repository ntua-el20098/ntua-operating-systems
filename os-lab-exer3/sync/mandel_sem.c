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
#include <semaphore.h>
#include <signal.h>
#include <errno.h>
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

// The Semaphore
sem_t *S;
int threadcnt;

void *compute_and_output_mandel_line(void *arg)
{
    /*
     * A temporary array, used to hold color values for the line being drawn
     */
    int color_val[x_chars], index;
    int thread_index = (__intptr_t)arg;
    for (index = thread_index; index < y_chars; index += threadcnt)
    {
        compute_mandel_line(index, color_val);
        if (sem_wait(&S[thread_index]) < 0)
        {
            perror("sem_wait");
        }
        output_mandel_line(1, color_val);
        if (sem_post(&S[(thread_index + 1) % threadcnt]) < 0)
        {
            perror("sem_post");
        }
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
    S = (sem_t *)safe_malloc(threadcnt * sizeof(*S));
    threads = (pthread_t *)safe_malloc(threadcnt * sizeof(*threads));

    int ret;
    xstep = (xmax - xmin) / x_chars;
    ystep = (ymax - ymin) / y_chars;

    // Initialiaze the semaphores
    sem_init(&S[0], 0, 1);
    for (int j = 1; j < threadcnt; ++j)
    {
        sem_init(&S[j], 0, 0);
    }
    /*
     * draw the Mandelbrot Set, one line at a time.
     * Output is sent to file descriptor '1', i.e., standard output.
     */
    /* Spawn threadcnt new threads */
    for (int i = 0; i < threadcnt; ++i)
    {
        ret = pthread_create(&threads[i], NULL, compute_and_output_mandel_line, (void *)(__intptr_t)i);
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
    for (int i = 0; i < threadcnt; i++)
    {
        if (sem_destroy(&S[i]) < 0)
        {
            perror("sem_destroy");
            exit(1);
        }
    }

    free(S);
    free(threads);
    reset_xterm_color(1);
    return 0;
}
