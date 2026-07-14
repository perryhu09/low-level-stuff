#include <stdio.h>
#include <unistd.h>

int main() {
    int x;
    FILE *fd;

    x = fork(); //creates new process (returns PID) that runs the code after it
    //Can be useful, for example a webserver gets a connection and has to deal
    //with it, you fork it to deal with it while the main code still listens for
    //any additional connections. 
    while(1) {
        fd = fopen("test.txt", "a");
        fprintf(fd, "%d\n", x);
        fclose(fd);
        sleep(1);
    }
    return 0;
}
