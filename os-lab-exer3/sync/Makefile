#
# Makefile
# 

CC = gcc

# CAUTION: Always use '-pthread' when compiling POSIX threads-based
# applications, instead of linking with "-lpthread" directly.
CFLAGS = -Wall -O2 -pthread
LIBS = 

all: pthread-test simplesync-mutex simplesync-atomic mandel mandel_sem mandel_cond simplesync-mutex.s simplesync-atomic.s

## Pthread test
pthread-test: pthread-test.o
	$(CC) $(CFLAGS) -o pthread-test pthread-test.o $(LIBS)

pthread-test.o: pthread-test.c
	$(CC) $(CFLAGS) -c -o pthread-test.o pthread-test.c

## Simple sync (two versions)
simplesync-mutex: simplesync-mutex.o
	$(CC) $(CFLAGS) -o simplesync-mutex simplesync-mutex.o $(LIBS)

simplesync-atomic: simplesync-atomic.o
	$(CC) $(CFLAGS) -o simplesync-atomic simplesync-atomic.o $(LIBS)

simplesync-mutex.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_MUTEX -c -o simplesync-mutex.o simplesync.c

simplesync-atomic.o: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_ATOMIC -c -o simplesync-atomic.o simplesync.c

simplesync-mutex.s: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_MUTEX -S -g -o simplesync-mutex.s simplesync.c

simplesync-atomic.s: simplesync.c
	$(CC) $(CFLAGS) -DSYNC_ATOMIC -S -g -o simplesync-atomic.s simplesync.c



## Mandel
mandel: mandel-lib.o mandel.o
	$(CC) $(CFLAGS) -o mandel mandel-lib.o mandel.o $(LIBS)

mandel_sem: mandel-lib.o mandel_sem.o
	$(CC) $(CFLAGS) -o mandel_sem mandel-lib.o mandel_sem.o $(LIBS)

mandel_cond: mandel-lib.o mandel_cond.o
	$(CC) $(CFLAGS) -o mandel_cond mandel-lib.o mandel_cond.o $(LIBS)

mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c $(LIBS)

mandel.o: mandel.c
	$(CC) $(CFLAGS) -c -o mandel.o mandel.c $(LIBS)

mandel_sem.o: mandel_sem.c
	$(CC) $(CFLAGS) -c -o mandel_sem.o mandel_sem.c $(LIBS)

mandel_cond.o: mandel_cond.c
	$(CC) $(CFLAGS) -c -o mandel_cond.o mandel_cond.c $(LIBS)

clean:
	rm -f *.s *.o pthread-test simplesync-{atomic,mutex} mandel mandel_sem mandel_cond 
