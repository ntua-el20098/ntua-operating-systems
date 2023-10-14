#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <signal.h>
#include <sys/types.h>
#include <sys/wait.h>

#include "tree.h"
#include "proc-common.h"

void fork_procs(struct tree_node *root)
{
	/*
	 * Start
	 */
	printf("PID = %ld, name %s, starting...\n",(long)getpid(), root->name);
	change_pname(root->name);
	if(root->nr_children == 0)
	{
		printf("%s: Stoping...\n", root->name);
	        raise(SIGSTOP);
		printf("PID = %ld, name = %s is awake\n",(long)getpid(), root->name);		
		exit(20);
	}
	pid_t pid[root->nr_children]; // We create an array where the parent-process will save the children's pids
	for (int i = 0; i < root->nr_children; ++i) 
	{
		pid[i] = fork();
		if (pid[i] < 0)
		{
			fprintf(stderr, "%s : fork", root->name);
			exit(1);
		}
		if (pid[i] == 0)
		{
			fork_procs(root->children + i);
		}
	}
	/*........*/
	printf("%s: Waiting for my children to stop...", root->name);
	wait_for_ready_children(root->nr_children);
	/*
	 * Suspend Self
	 */
	printf("%s: Stoping...\n", root->name);
	raise(SIGSTOP);
	/* ... */
	printf("PID = %ld, name = %s is awake\n",(long)getpid(), root->name);

        int status;
	for (int i = 0; i < root->nr_children; ++i)
	{
		kill(pid[i], SIGCONT); //let's send a wake up signal to each of our children
		pid[i] = wait(&status);
		explain_wait_status(pid[i],status);
	}
	/*
	 * Exit
	 */

	exit(0);
}

/*
 * The initial process forks the root of the process tree,
 * waits for the process tree to be completely created,
 * then takes a photo of it using show_pstree().
 *
 * How to wait for the process tree to be ready?
 * In ask2-signals:_
 *      use wait_for_ready_children() to wait until
 *      the first process raises SIGSTOP.
 */

int main(int argc, char *argv[])
{
	pid_t pid;
	int status;
	struct tree_node *root;

	if (argc != 2)
	{
		fprintf(stderr, "Usage: %s <tree_file>\n", argv[0]);
		exit(1);
	}

	/* Read tree into memory */
	root = get_tree_from_file(argv[1]);

	/* Fork root of process tree */
	pid = fork();
	if (pid < 0)
	{
		perror("main: fork");
		exit(1);
	}
	if (pid == 0)
	{
		/* Child */
		fork_procs(root);
		exit(1);
	}

	/*
	 * Father
	 */
	/* for ask2-signals */
	wait_for_ready_children(1); // the father of the root process waits for its child 

	/* Print the process tree root at pid */
	show_pstree(pid);
	printf("");
	/* for ask2-signals */
	if (kill(pid, SIGCONT) == -1)
	{
		perror("kill");
		exit(1);
	}

	/* Wait for the root of the process tree to terminate */
	if (wait(&status) == -1)
	{
		perror("wait");
		exit(1);
	}
	explain_wait_status(pid, status);

	return 0;
}
