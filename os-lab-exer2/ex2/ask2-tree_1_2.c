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

void fork_procs(struct tree_node *root)
{
	pid_t pid;
	int status;
	int i;
	change_pname(root->name);

	if (root->nr_children == 0) // if the process is leaf
	{
		printf("%s: Sleeping...\n", root->name);
		sleep(SLEEP_PROC_SEC);
		printf("%s: Exiting...\n", root->name);
		exit(10);
	}
	for (i = 0; i < root->nr_children; ++i)
	{
		pid = fork();
		if (pid < 0)
		{
			fprintf(stderr, "%s : fork", root->name);
			exit(1);
		}
		if (pid == 0)
		{
			fork_procs(root->children + i);
		}
	}
	printf("%s: Waiting...\n", root->name);
	for (int i = 0; i < root->nr_children; i++)
	{
		pid = wait(&status);
		if (pid < -1)
		{
			perror("wait");
			exit(1);
		}
		explain_wait_status(pid, status);
	}
	printf("%s : Exiting..\n", root->name);
	exit(11);
}


/*
 * The initial process forks th
 e root of the process tree,
 * waits for the process tree to be completely created,
 * then takes a photo of it using show_pstree().
 *
 * How to wait for the process tree to be ready?
 * In ask2-{fork, tree}:
 *      wait for a few seconds, hope for the best.
 * In ask2-signals:
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
		fprintf(stderr, "Usage: %s <input_tree_file>\n\n", argv[0]);
		exit(1);
	}

	root = get_tree_from_file(argv[1]);
	print_tree(root);

	/* Fork root of process tree */
	pid = fork();
	if (pid < 0)
	{
		perror("main: fork");
		exit(1);
	}
	if (pid == 0)
	{
		fork_procs(root);
		exit(1);
	}


	sleep(SLEEP_TREE_SEC);

	/* Print the process tree root at pid */

	show_pstree(pid);

	/* Wait for the root of the process tree to terminate */
	pid = wait(&status);
	explain_wait_status(pid, status);

	return 0;
}
