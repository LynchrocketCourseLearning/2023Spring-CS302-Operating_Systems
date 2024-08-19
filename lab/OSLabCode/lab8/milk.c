/*dad_mem_mutex.c*/
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <time.h> 
#include <sys/stat.h>

#define MAX_BOTTLE 3
int count = 0;
pthread_mutex_t mutex;
pthread_cond_t cond;

void *mom(){
    printf("Mom came home.\n");
    sleep(rand()%2+1);
    int max_bottle = MAX_BOTTLE;
    while(max_bottle--){
        pthread_mutex_lock(&mutex);
        printf("Mom checked the fridge.\n");
        count++;
        printf("Mom brought a milk.\n");
        printf("in producer count is %d\n", count);
        if(count > 0){
            printf("Mom reminded Dad or You.\n");
            pthread_cond_signal(&cond);
        }
        printf("Mom released a lock.\n");
        pthread_mutex_unlock(&mutex);
    }
}

void *dad(){
    printf("Dad came home.\n");
    sleep(rand()%2+1);
    int max_bottle = MAX_BOTTLE;
    while(max_bottle--){
        pthread_mutex_lock(&mutex);
        printf("Dad checked the fridge.\n");
        if(count <= 0){
            printf("Dad was waiting for milk.\n");
            pthread_cond_wait(&cond, &mutex);
            printf("Dad got milk.\n");
        }
        count--;
        printf("in consumer count is %d\n", count);
        printf("Dad released a lock.\n");
        pthread_mutex_unlock(&mutex);
    }
}

void *you(){
    printf("You came home.\n");
    sleep(rand()%2+1);
    int max_bottle = MAX_BOTTLE;
    while(max_bottle--){
        pthread_mutex_lock(&mutex);
        printf("You checked the fridge.\n");
        if(count <= 0){
            printf("You were waiting for milk.\n");
            pthread_cond_wait(&cond, &mutex);
            printf("You got milk.\n");
        }
        count--;
        printf("in consumer count is %d\n", count);
        printf("You released a lock.\n");
        pthread_mutex_unlock(&mutex);
    }
}

void *sister(){
    printf("Sister came home.\n");
    sleep(rand()%2+1);
    int max_bottle = MAX_BOTTLE;
    while(max_bottle--){
        pthread_mutex_lock(&mutex);
        printf("Sister checked the fridge.\n");
        count++;
        printf("Sister brought a milk.\n");
        printf("in producer count is %d\n", count);
        if(count > 0){
            printf("Sister reminded Dad or You.\n");
            pthread_cond_signal(&cond);
        }
        printf("Sister released a lock.\n");
        pthread_mutex_unlock(&mutex);
    }
}

int main(int argc, char * argv[]) {
    srand(time(0));
    pthread_t p1, p2, p3, p4;

    pthread_mutex_init(&mutex, NULL);
    pthread_cond_init(&cond, NULL);
    // Create two threads (both run func)  
    pthread_create(&p1, NULL, mom, NULL); 
    pthread_create(&p2, NULL, dad, NULL);
    pthread_create(&p3, NULL, you, NULL);
    pthread_create(&p4, NULL, sister, NULL);
  
    // Wait for the threads to end. 
    pthread_join(p1, NULL); 
    pthread_join(p2, NULL);
    pthread_join(p3, NULL);
    pthread_join(p4, NULL);

    pthread_mutex_destroy(&mutex);
    pthread_cond_destroy(&cond);
}
