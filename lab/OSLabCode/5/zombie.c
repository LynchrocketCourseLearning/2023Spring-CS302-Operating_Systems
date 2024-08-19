#include<unistd.h>
#include<stdio.h>
int main(){
    if(!fork()){
        printf("I'm child process.\n");
    }else{
        printf("I'm parent process.\n");
        while(1);
    }
    return 0;
}