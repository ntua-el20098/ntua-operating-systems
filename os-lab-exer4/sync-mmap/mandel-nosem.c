/*
 * A program to draw the Mandelbrot set on a 256-color xterm.
 */

#include <stdio.h>
#include <unistd.h>
#include <assert.h>
#include <string.h>
#include <math.h>
#include <stdlib.h>
#include <errno.h>
#include <signal.h>
#include <sys/mman.h>
#include <sys/wait.h>

#include "mandel-lib.h"

#define MANDEL_MAX_ITERATION 100000


int **buff; //2D Mandelbrot set output

/*
 * Output at the terminal is is x_chars wide by y_chars long.
*/
int y_chars=50;
int x_chars=90;

/*
 * The part of the complex plane to be drawn:
 * upper left corner is (xmin, ymax), lower right corner is (xmax, ymin).
*/
double xmin=-1.8, xmax=1.0;
double ymin=-1.0, ymax=1.0;

/*
 * Every character in the final output is
 * xstep x ystep units wide on the complex plane.
 */
double xstep;
double ystep;

//helping functions
int safe_atoi(char *s, int *val)
{
        long l;
        char *endp;

        l=strtol(s, &endp, 10);
        if(s!=endp && *endp=='\0') {
                *val=l;
                return 0;
        } else
                return -1;
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
        y=ymax-ystep*line;

        /* and iterate for all points on this line */
        for(x=xmin, n=0; n<x_chars; x+=xstep, n++) {

                /* Compute the point's color value */
                val=mandel_iterations_at_point(x, y, MANDEL_MAX_ITERATION);
                if(val>255)
                        val=255;

                /* And store it in the color_val[] array */
                val=xterm_color(val);
                color_val[n]=val;
        }
}

/*
 * This function outputs an array of x_char color values
 * to a 256-color xterm.
 */
void output_mandel_line(int fd, int color_val[])
{
        int i;
        char point='@';
        char newline='\n';

        for(i=0; i<x_chars; i++) {
                /* Set the current color, then output the point */
                set_xterm_color(fd, color_val[i]);
                if(write(fd, &point, 1)!=1) {
                        perror("compute_and_output_mandel_line: write point");
                        exit(1);
                }
        }

        /* Now that the line is done, output a newline character */
        if(write(fd, &newline, 1)!=1) {
                perror("compute_and_output_mandel_line: write newline");
                exit(1);
        }
}

void usage(char *argv0)
{
        fprintf(stderr, "Usage: %s processes_count\n\n"
                "Exactly one argument required:\n"
                "       processes_count: The number of processes to create.\n",
                argv0);
        exit(1);
}

/*
 * Create a shared memory area, usable by all descendants of the calling
 * process.
 */
void *create_shared_memory_area(unsigned int numbytes)
{
        int pages;
        void *addr;

        if (numbytes == 0) {
                fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
                exit(1);
        }

        /*
         * Determine the number of pages needed, round up the requested number of
         * pages
         */
        pages=(numbytes - 1) / sysconf(_SC_PAGE_SIZE) + 1;

        /* Create a shared, anonymous mapping for this number of pages */
        addr=mmap(NULL, pages * sysconf(_SC_PAGE_SIZE), PROT_READ | PROT_WRITE,
		 MAP_SHARED | MAP_ANONYMOUS, -1,0);

	if(addr==MAP_FAILED) {
		perror("mmap");
		exit(1);
	}

        return addr;
}

void destroy_shared_memory_area(void *addr, unsigned int numbytes) {
        int pages;

        if(numbytes==0) {
                fprintf(stderr, "%s: internal error: called for numbytes == 0\n", __func__);
                exit(1);
        }

        /*
         * Determine the number of pages needed, round up the requested number of
         * pages
         */
        pages=(numbytes-1)/sysconf(_SC_PAGE_SIZE)+1;

        if(munmap(addr, pages*sysconf(_SC_PAGE_SIZE))==-1) {
                perror("destroy_shared_memory_area: munmap failed");
                exit(1);
        }
}

/*
 * Catch SIGINT (Ctrl-C) with the sigint_handler to ensure the prompt is not
 * drawn in a funny colour if the user "terminates" the execution with Ctrl-C.
 */
void sigint_handler(int signum)
{
        reset_xterm_color(1);
        exit(1);
}

void fork_execute(int line, int procnt)
{
        int line_num;
	//every process writes to the buffer
        for (line_num=line ; line_num<y_chars; line_num+=procnt) {
                compute_mandel_line(line_num, buff[line_num]);
        }
        return;
}


int main(int argc, char *argv[])
{
        int i, procnt, status;

        xstep=(xmax - xmin) / x_chars;
        ystep=(ymax - ymin) / y_chars;

        if(argc!=2)
                usage(argv[0]);
        if(safe_atoi(argv[1], &procnt)<0 || procnt<=0) {
                fprintf(stderr, "`%s' is not valid for `processes_count'\n", argv[1]);
                exit(1);
        }

	 /*
         * signal handling
         */
        struct sigaction sa;
        sa.sa_handler=sigint_handler;
        sa.sa_flags=0;
        sigemptyset(&sa.sa_mask);
        if(sigaction(SIGINT, &sa, NULL)<0) {
                perror("sigaction");
                exit(1);
        }


        buff=create_shared_memory_area(y_chars * sizeof(int)); //create the initial 1d array
        for (i=0; i<y_chars; i++) {
          buff[i]=create_shared_memory_area(x_chars * sizeof(char));
	  //go to every potition and make x_chars of memory
        }

	//create processes and call execution function
        pid_t child_pid;
        for(i=0 ; i<procnt ; i++) {
                child_pid=fork();
                if(child_pid<0) {
                        perror("error with creation of child");
                        exit(1);
                }
                if(child_pid==0) {
                        fork_execute(i, procnt);
                        exit(1);
                }
        }

        for(i=0; i<procnt ; i++) {
                child_pid=wait(&status);
        }

        for(i=0; i<y_chars ; i++) {
                output_mandel_line(1, buff[i]);
        }

	for(i=0; i<y_chars; i++){
        	destroy_shared_memory_area(buff[i], sizeof(buff[i]));
	}
	destroy_shared_memory_area(buff, sizeof(buff));
        reset_xterm_color(1);
        return 0;
}