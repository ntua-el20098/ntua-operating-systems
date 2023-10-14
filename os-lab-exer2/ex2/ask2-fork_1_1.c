#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

#define SLEEP_PROC_SEC 10
#define SLEEP_TREE_SEC 3

/*
 * Create this process tree:
 * A-+-B---D
 *   `-C
 */
/**/

void fork_procs(void)
{
	/*
	 * initial process is A.
	 */

	/* ... */

	int statusA;
	change_pname("A");
	printf("Creating... B\n");

	pid_t pA = fork();
	if (pA < 0)
	{
		perror("A: fork");
		exit(16);
	}
	if (pA == 0)
	{
		int statusB;
		change_pname("B");
		printf("Creating... D\n");
		pid_t pB = fork();
		if (pB < 0)
		{
			perror("B: fork");
			exit(19);
		}
		if (pB == 0)
		{
			change_pname("D");
			printf("D: Sleeping...\n");
			sleep(SLEEP_PROC_SEC);
			printf("D: Exiting...\n");
			exit(13);
		}
		printf("B: Waiting...\n");
		pB = wait(&statusB);
		explain_wait_status(pB, statusB);
		printf("B: Exiting...\n");
		exit(19);
	}
	printf("Creating... C\n");
	pid_t pA_2 = fork();
	if (pA_2 == -1)
	{
		perror("A: fork");
		exit(16);
	}
	if (pA_2 == 0)
	{
		change_pname("C");
		printf("C: Sleeping...\n");
		sleep(SLEEP_PROC_SEC);
		printf("C: Exiting...\n");
		exit(17);
	}
	// A waiting for its 2 children
	//	for (int i = 0; i < 2; ++i)
	//{
	for (int i = 0; i < 2; ++i)
	{
		printf("A: Waiting...\n");
		pA_2 = wait(&statusA);
		explain_wait_status(pA_2, statusA);
	}
	//	}
	printf("A: Exiting...\n");
	exit(16);
}

int main()
{
	pid_t p;
	int status;
	/* Fork root of process tree */
	printf("Creating... A\n");
	p = fork();
	if (p < 0)
	{
		perror("main: fork");
		exit(1);
	}

	if (p == 0)
	{
		/* Child */
		fork_procs();
		exit(1);
	}

	/*
	 * Father
	 */
	/* for ask2-{fork, tree} */
	sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */

	show_pstree(p);

	/* Wait for the root of the process tree to terminate */
	p = wait(&status);
	explain_wait_status(p, status);

	return 0;
}
