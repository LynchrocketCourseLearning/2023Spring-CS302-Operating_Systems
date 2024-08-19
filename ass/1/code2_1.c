#include <stdio.h>
#include <string.h>
typedef struct link_node
{
    char c;
    node* prev;
    node* next;
} node;

char res[100010];
char edits[100010];
int p = 0, ed = 0; // pointer to current place, to EOF

int main(){
    int Q;
    scanf("%d\n", &Q);
    scanf("%s", &edits);
    for (int i = 0; i < Q; ) {
        char edit = edits[i++];
        if(edit >= '0' && edit <= '9') {
            if(p == ed) {
                res[p++] = edit;
            } else {
                for(int j = ed; j > p; --j) {
                    res[j] = res[j-1];
                }
                res[p-1] = edit;
            }
            ++ed;
        } else {
            switch (edit)
            {
                case 'r':
                    char next_edit = edits[i];
                    res[p] = next_edit;
                    if(p == ed) ++ed;
                    break;
                case 'I':
                    p = 0;
                    break;
                case 'L':
                    if(p != 0) --p;
                    break;
                case 'R':
                    if(p != ed) ++p;
                    break;
                case 'd':
                    if(p != ed) {
                        ++p;
                    }
                    break;
                default:
                    break;
            }
        }
    }
    return 0;
}
