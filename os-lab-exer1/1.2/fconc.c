#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void doWrite(int fd, const char *buff, size_t len)
{
    size_t idx = 0;
    ssize_t wcount = 0;
    do
    {
        wcount = write(fd, buff + idx, len - idx);
        if (wcount == -1)
        { /* error */
            perror("write");
            exit(1);
        }
        idx += wcount;
    } while (idx < len);
}

void write_file(int fd, const char *infile)
{
    char buff[1024];
    ssize_t rcnt = 0; 
    int fd3;

    fd3 = open(infile, O_RDONLY);
    if (fd3 == -1)
    {
        perror("open error");
        exit(1);
    }
    for (;;)
    {
        rcnt = read(fd3, buff, sizeof(buff));
        if (rcnt == 0)
            break;
        if (rcnt == -1)
        { /* error */
            perror("read");
            close(fd3);
            exit(1);
        }
        doWrite(fd, buff, rcnt);
    }
    close(fd3);
}

int main(int argc, char **argv)
{
    if (argc <= 2 || argc > 4)
    {
        perror("Usage: ./fconc infile1 infile2 [outfile (default:fconc.out)]");
        exit(1);
    }
    else
    {
        int fd_out, oflags, mode;
        oflags = O_CREAT | O_WRONLY | O_TRUNC;
        mode = S_IRUSR | S_IWUSR;
        if (argc == 3)
        {
            fd_out = open("fconc.out", oflags, mode);
        }
        else
        {
            fd_out = open(argv[3], oflags, mode);
        }
        
        if (fd_out == -1)
        {
            perror("Cannot open the file");
            exit(1);
        }
        // If the file openned succesfully proceed to writing
        else
        {
            write_file(fd_out, argv[1]);
            write_file(fd_out, argv[2]);
            close(fd_out);
        }
    }
    return 0;
}
