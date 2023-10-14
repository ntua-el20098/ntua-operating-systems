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
#include <sys/mman.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <errno.h>
#include <stdint.h>
#include <signal.h>
#include <sys/wait.h>

#include <semaphore.h>
/*TODO header file for m(un)map*/

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000
#define _GNU_SOURCE
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

sem_t *S;

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

void sig_handler(int signum)
{
	printf(" Color will be restored after signal : %d\n", signum);
	reset_xterm_color(1);
	printf("Color restored\n");
	printf("Exiting...\n");
	exit(EXIT_SUCCESS);
}
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

void children_draw(int line, int numprocs)
{
	int color_val[x_chars];
	for (int index = line; index < y_chars; index += numprocs)
	{
		compute_mandel_line(index, color_val);
		if (sem_wait(&S[line]) < 0)
		{
			perror("sem_wait");
		}
		output_mandel_line(1, color_val);
		if (sem_post(&S[(index + 1) % numprocs]) < 0)
		{
			perror("sem_post");
		}
	}
	return;
}
/*
 * Create a shared memory area, usable by all descendants of the calling
 * process.
 */
void *create_shared_memory_area(unsigned int numbytes)
{
	int pages;
	void *addr;

	if (numbytes == 0)
	{
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}

	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

	/* Create a shared, anonymous mapping for this number of pages */
	/* TODO:*/
	addr = mmap(NULL, pages * sysconf(_SC_PAGE_SIZE), PROT_READ | PROT_WRITE,
				MAP_SHARED | MAP_ANONYMOUS, -1, 0);
	if (addr == MAP_FAILED)
	{
		perror("mmap");
		exit(1);
	}
	return addr;
}

void destroy_shared_memory_area(void *addr, unsigned int numbytes)
{
	int pages;

	if (numbytes == 0)
	{
		fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
		exit(1);
	}

	/*
	 * Determine the number of pages needed, round up the requested number of
	 * pages
	 */
	pages = (numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

	if (munmap(addr, pages * sysconf(_SC_PAGE_SIZE)) == -1)
	{
		perror("destroy_shared_memory_area: munmap failed");
		exit(1);
	}
}

int main(int argc, char *argv[])
{
	int numprocs;
	xstep = (xmax - xmin) / x_chars;
	ystep = (ymax - ymin) / y_chars;

	if (safe_atoi(argv[1], &numprocs) < 0 || numprocs <= 0)
	{
		fprintf(stderr, "`%s' is not valid for `numprocs'\n", argv[1]);
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

	S = create_shared_memory_area(numprocs * sizeof(sem_t));

	// Initialiaze the semaphores
	sem_init(&S[0], 1, 1);
	for (int j = 1; j < numprocs; ++j)
	{
		if (sem_init(&S[j], 1, 0))
		{
			perror("semaphore init");
			exit(EXIT_FAILURE);
		}
	}

	/*
	 * draw the Mandelbrot Set, one line at a time.
	 * Output is sent to file descriptor '1', i.e., standard output.
	 */

	// Let's make some children to draw
	pid_t pid;
	int status;
	for (int i = 0; i < numprocs; i++)
	{
		pid = fork();
		if (pid < 0)
		{
			perror("error with creation of child");
			exit(EXIT_FAILURE);
		}
		if (pid == 0)
		{
			children_draw(i, numprocs);
			exit(EXIT_FAILURE);
		}
	}
	for (int i = 0; i < numprocs; i++)
	{
		pid = wait(&status);
	}

	for (int i = 0; i < numprocs; i++)
	{
		sem_destroy(&S[i]);
	}

	destroy_shared_memory_area(S, numprocs * sizeof(sem_t));

	reset_xterm_color(1);
	return 0;
}
