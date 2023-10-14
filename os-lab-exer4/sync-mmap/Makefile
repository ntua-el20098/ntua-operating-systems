#
# Makefile
# 

CC = gcc

# CAUTION: Always use '-pthread' when compiling POSIX threads-based
# applications, instead of linking with "-lpthread" directly.
CFLAGS = -Wall -O2 -pthread
LIBS = 

all: mandel-fork-sem mandel-nosem


## Mandel

mandel-fork-sem: mandel-lib.o mandel-fork-sem.o
	$(CC) $(CFLAGS) -o mandel-fork-sem mandel-lib.o mandel-fork-sem.o $(LIBS)

mandel-nosem: mandel-lib.o mandel-nosem.o
	$(CC) $(CFLAGS) -o mandel-nosem mandel-lib.o mandel-nosem.o $(LIBS)

mandel-lib.o: mandel-lib.h mandel-lib.c
	$(CC) $(CFLAGS) -c -o mandel-lib.o mandel-lib.c $(LIBS)

mandel-fork-sem.o: mandel-fork-sem.c
	$(CC) $(CFLAGS) -c -o mandel-fork-sem.o mandel-fork-sem.c $(LIBS)


mandel-nosem.o: mandel-nosem.c
	$(CC) $(CFLAGS) -c -o mandel-nosem.o mandel-nosem.c $(LIBS)


clean:
	rm -f *.s *.o mandel-fork 
