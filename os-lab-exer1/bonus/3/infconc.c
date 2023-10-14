#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>

void doWrite(int fd, const char *buff, int len)
{
    int idx = 0;
    int wcount = 0;
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
    ssize_t rcnt = 0, fd3;

    fd3 = open(infile, O_RDONLY);
    if (fd3 == -1)
    {
        perror("open error");
        exit(1);
    }
    for (;;)
    {
        ssize_t temp_rcnt = 0;
        rcnt += temp_rcnt = read(fd3, buff, sizeof(buff) - 1);
        if (temp_rcnt == 0)
            break;
        if (rcnt == -1)
        { /* error */
            perror("read");
            close(fd3);
            exit(1);
        }
    }
    buff[rcnt] = '\0';
    close(fd3);
    int len = strlen(buff);
    doWrite(fd, buff, len);
}

int main(int argc, char **argv)
{
    if (argc <= 2)
    {
        perror("Usage: ./fconc infile1 infile2 ... infileN [outfile (default:fconc.out)]");
        printf("2 is the minimum number of infiles");
        exit(1);
    }
    else
    {
        int fd_out, oflags, mode;
        oflags = O_CREAT | O_WRONLY | O_TRUNC | O_APPEND;
        mode = S_IRUSR | S_IWUSR;
        fd_out = open(argv[argc - 1], oflags, mode);

        if (fd_out == -1)
        {
            perror("Cannot open the output file");
            exit(1);
        }
        // If the file openned succesfully proceed to writing
        else
        {
            for (int i = 1; i < argc-1;++i)
            {
                write_file(fd_out, argv[i]);
            }
            close(fd_out);
        }
    }
    return 0;
}
