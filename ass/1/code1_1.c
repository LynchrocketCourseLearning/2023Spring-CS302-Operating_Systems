#include <stdio.h>
#define ll long long
ll a[2000101];

int main(){
    int n;
    scanf("%d\n", &n);
    for(int i = 0; i < n; ++i){
        scanf("%lld", &a[i]);
    }
    for(int i = 0; i < n-1; ++i){
        ll tmp = 1000000010;
        for(int j = i+1; j < n; ++j){
            ll diff = (a[i] > a[j]) ? a[i]-a[j] : a[j]-a[i];
            if(tmp > diff) tmp = diff;
        }
        printf("%lld\n", tmp);
    }
    return 0;
}