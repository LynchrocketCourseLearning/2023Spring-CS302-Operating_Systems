#include <stdio.h>
#define SUM(x) (x)+(x)

int main(){
    // after pre-precessor:
    // SUM(4*3)*SUM(4*3) ---> (4*3)+(4*3)*(4*3)+(4*3)
    printf("%d\n", SUM(4*3)*SUM(4*3));
    return 0;
}
