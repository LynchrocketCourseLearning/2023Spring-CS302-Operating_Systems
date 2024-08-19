#include <stdio.h>
#include <stdlib.h>
typedef struct link_node *node_ptr;
typedef struct link_node
{
    char c;
    node_ptr prev;
    node_ptr next;
} node, *node_ptr;

char edits[100010];

int main()
{
    int Q;
    scanf("%d\n", &Q);
    scanf("%s", &edits);
    node_ptr eol = (node_ptr)malloc(sizeof(node));
    eol->c = '\n';
    eol->next = NULL;
    eol->prev = NULL;
    node_ptr cur = eol;
    for (int i = 0; i < Q;)
    {
        char edit = edits[i++];
        if (edit >= '0' && edit <= '9')
        {
            node_ptr tmp = (node_ptr)malloc(sizeof(node));
            tmp->c = edit;
            tmp->next = cur;
            tmp->prev = NULL;
            if (NULL != cur->prev)
            {
                cur->prev->next = tmp;
                tmp->prev = cur->prev;
            }
            cur->prev = tmp;
        }
        else
        {
            switch (edit)
            {
            case 'r':
            {
                char next_edit = edits[i++];
                if (NULL != cur->next)
                    cur->c = next_edit;
                else
                {
                    node_ptr tmp = (node_ptr)malloc(sizeof(node));
                    tmp->c = next_edit;
                    tmp->next = cur;
                    tmp->prev = NULL;
                    if (NULL != cur->prev)
                    {
                        cur->prev->next = tmp;
                        tmp->prev = cur->prev;
                    }
                    cur->prev = tmp;
                    cur = tmp;
                }
                break;
            }
            case 'I':
                while (NULL != cur->prev)
                    cur = cur->prev;
                break;
            case 'L':
                if (NULL != cur->prev)
                    cur = cur->prev;
                break;
            case 'R':
                if (NULL != cur->next)
                    cur = cur->next;
                break;
            case 'd':
                if (NULL != cur->prev && NULL != cur->next)
                {
                    cur->prev->next = cur->next;
                    cur->next->prev = cur->prev;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                }
                else if (NULL != cur->next)
                {
                    cur->next->prev = NULL;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                }
                break;
            default:
                break;
            }
        }
    }
    cur = eol;
    int cnt = 0;
    while (NULL != cur)
    {
        edits[cnt] = cur->c;
        node_ptr tmp = cur;
        cur = cur->prev;
        free(tmp);
        ++cnt;
    }
    free(cur);
    while (cnt--)
    {
        printf("%c", edits[cnt]);
    }
    return 0;
}
