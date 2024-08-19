#include <stdio.h>
#include <condvar.h>
#include <kmalloc.h>
#include <assert.h>

void     
cond_init (condvar_t *cvp) {
//================your code=====================
    cvp->count = 0;
    sem_init(&(cvp->mutex), 1);
    sem_init(&(cvp->wait), 2);
}

// Unlock one of threads waiting on the condition variable. 
void 
cond_signal (condvar_t *cvp) {
//================your code=====================
    down(&(cvp->mutex));
    if (cvp->count > 0){
        cvp->count--;
        up(&(cvp->wait));
    }
    up(&(cvp->mutex));
}

void
cond_wait (condvar_t *cvp, semaphore_t *mutex) {
//================your code=====================
    up(mutex); // release mutex lock
    
    down(&(cvp->mutex));
    cvp->count++;
    up(&(cvp->mutex));

    down(&(cvp->wait));
}
