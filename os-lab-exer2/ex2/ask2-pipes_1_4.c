#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <assert.h>
#include <sys/types.h>
#include <sys/wait.h>
#include <string.h>
#include <signal.h>

#include "tree.h"
#include "proc-common.h"

void fork_procs(struct tree_node *root, int fd)
{
	int status;
	change_pname(root->name);
	printf("%s(%ld) is created...\n", root->name, (long)getpid());

	// If the node is a leaf
	if (root->nr_children == 0)
	{
		printf("The leaf node %s is created...\n", root->name);
		int value = atoi(root->name);
		if (write(fd, &value, sizeof(value)) != sizeof(value))
		{
			perror("Leaf : write");
			exit(1);
		}
		close(fd);
		raise(SIGSTOP);
		exit(10);
	}

	int pfd[2];
	pid_t pid[root->nr_children]; // pid[2] for us
	printf("%s creating a pipe...\n", root->name);
	if (pipe(pfd) < 0)
	{
		perror("pipe");
		exit(1);
	}
	/*If the parent wants to receive data from the child, it should close pfd[1],
	and the child should close pfd[0]. If the parent wants to send data to the child, it should close fd[0], and the child should close fd[1].
	Since descriptors are shared between the parent and child, we should always be sure to close the end of pipe we aren't concerned with. On a technical note, the EOF will never be returned if the unnecessary ends of the pipe are not explicitly closed. */
	int value[root->nr_children];
	for (int i = 0; i < root->nr_children; ++i)
	{
		pid[i] = fork();
		if (pid[i] < 0)
		{
			fprintf(stderr, "%s : fork\n", root->name);
			exit(1);
		}
		if (pid[i] == 0)
		{
			close(pfd[0]);
			fork_procs(root->children + i, pfd[1]);
			exit(10);
		}
	}
	close(pfd[1]);
	for (int i = 0; i < root->nr_children; ++i)
	{
		if (read(pfd[0], &value[i], sizeof(value[i])) != sizeof(value[i]))
		{
			perror("read");
			exit(1);
		}
	}

	close(pfd[0]);
	int result;
	if (!strcmp(root->name, "+"))
	{
		result = value[0] + value[1];
		printf("Node %ld : %d + %d = %d\n", (long)getpid(), value[0], value[1], result);
	}

	if (!strcmp(root->name, "*"))
	{
		result = value[0] * value[1];
		printf("Node %ld : %d * %d = %d\n", (long)getpid(), value[0], value[1], result);
	}
	if (write(fd, &result, sizeof(result)) != sizeof(result))
	{ // write to parent
		perror("write to pipe");
		exit(1);
	}
	close(fd);
	raise(SIGSTOP); // then stops

	// Let's wake up our children
	for (int i = 0; i < root->nr_children; ++i)
	{
		kill(pid[i], SIGCONT);
		pid[i] = wait(&status);
		explain_wait_status(pid[i], status);
		// printf("My child with PID : %d sent me %d\n", pid[i], value[i]);
	}
	exit(0);
}

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
	int pfd[2];
	if (pipe(pfd) < 0)
	{
		perror("pipe");
		exit(1);
	}

	int value;
	pid = fork();
	if (pid < 0)
	{
		perror("main: fork");
		exit(1);
	}
	if (pid == 0)
	{
		close(pfd[0]);
		fork_procs(root, pfd[1]);
		exit(0);
	}

	close(pfd[1]);

	if (read(pfd[0], &value, sizeof(value)) != sizeof(value))
	{
		perror("read");
		exit(1);
	}

	close(pfd[0]);

	/* Print the process tree root at pid */
	show_pstree(pid);
	printf("\n\n");
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
	printf("Done... Final result is: %d\n", value);

	return 0;
}