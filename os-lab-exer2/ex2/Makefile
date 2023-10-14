.PHONY: all clean

all: ask2-fork_1_1 ask2-tree_1_2 ask2-signals_1_3 ask2-pipes_1_4

CC = gcc
CFLAGS = -g -Wall -O2
SHELL= /bin/bash

ask2-fork_1_1: ask2-fork_1_1.o proc-common.o tree.o
	$(CC) $(CFLAGS) $^ -o $@

ask2-tree_1_2: ask2-tree_1_2.o proc-common.o tree.o
	$(CC) $(CFLAGS) $^ -o $@

ask2-signals_1_3: ask2-signals_1_3.o proc-common.o tree.o
	$(CC) $(CFLAGS) $^ -o $@

ask2-pipes_1_4: ask2-pipes_1_4.o proc-common.o tree.o
	$(CC) $(CFLAGS) $^ -o $@

%.s: %.c
	$(CC) $(CFLAGS) -S -fverbose-asm $<

%.o: %.c
	$(CC) $(CFLAGS) -c $<

%.i: %.c
	gcc -Wall -E $< | indent -kr > $@

clean: 
	rm -f *.o pstree-this ask2-fork_1_1,ask2-tree_1_2,ask2-signals_1_3,ask2-pipes_1_4
