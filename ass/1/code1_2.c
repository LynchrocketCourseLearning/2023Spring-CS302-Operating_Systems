#include <stdio.h>
#include <stdlib.h>
#define ll long long

ll res[2000010];
typedef struct link_node *node_ptr;
typedef struct link_node
{
    ll val;
    int rank;
    node_ptr prev;
    node_ptr next;
} node, *node_ptr;

int comp(const void *p1, const void *p2)
{
    return ((**(node_ptr *)p1).val - (**(node_ptr *)p2).val);
}

int main()
{
    int n;
    scanf("%d\n", &n);
    node_ptr *arr = (node_ptr *)malloc(sizeof(node_ptr) * n);
    for (int i = 0; i < n; ++i)
    {
        ll val;
        scanf("%lld", &val);
        arr[i] = (node_ptr)malloc(sizeof(node));
        arr[i]->val = val;
        arr[i]->rank = i;
    }

    qsort(arr, n, sizeof(node_ptr), comp);

    node_ptr head = (node_ptr)malloc(sizeof(node));
    head->prev = NULL;
    head->rank = -1;
    head->val = -1000000010;
    node_ptr cur = head;
    for (int i = 0; i < n; ++i)
    {
        cur->next = arr[i];
        cur->next->prev = cur;
        cur = cur->next;
    }
    node_ptr tail = (node_ptr)malloc(sizeof(node));
    tail->prev = NULL;
    tail->rank = -1;
    tail->val = 1000000010;
    cur->next = tail;
    cur->next->prev = cur;

    cur = head->next;
    node_ptr pr, ne;
    int flag = 0;
    for (int i = 0; i < n; ++i)
    {
        pr = cur->prev;
        ne = cur->next;
        for (int j = 0; j < n; ++j)
        {
            if (cur->rank == n - 1)
                continue;
            ll prev_mwd = -1, next_mwd = -1;
            int prev_flag = 0, next_flag = 0;

            if (pr->rank > cur->rank)
            {
                prev_mwd = (cur->val > pr->val) ? cur->val - pr->val : pr->val - cur->val;
                prev_flag = 1;
            }
            else
            {
                if (NULL != pr->prev)
                    pr = pr->prev;
                else
                    prev_flag = 2;
            }
            if (ne->rank > cur->rank)
            {
                next_mwd = (cur->val > ne->val) ? cur->val - ne->val : ne->val - cur->val;
                next_flag = 1;
            }
            else
            {
                if (NULL != ne->next)
                    ne = ne->next;
                else
                    next_flag = 2;
            }

            if (NULL == ne->next && NULL == pr->prev)
                break;
            if (prev_flag == 0 && next_flag == 0)
                continue;

            if (prev_flag == 1)
            {
                if (next_flag == 2)
                {
                    res[cur->rank] = prev_mwd;
                    cur->prev->next = cur->next;
                    cur->next->prev = cur->prev;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                    flag = 1;
                    break;
                }
                if (next_flag == 1)
                {
                    res[cur->rank] = (prev_mwd > next_flag) ? next_flag : prev_flag;
                    cur->prev->next = cur->next;
                    cur->next->prev = cur->prev;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                    flag = 1;
                    break;
                }
            }
            if (next_flag == 1)
            {
                if (prev_flag == 2)
                {
                    res[cur->rank] = next_mwd;
                    cur->prev->next = cur->next;
                    cur->next->prev = cur->prev;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                    break;
                }
                if (prev_flag == 1)
                {
                    res[cur->rank] = (prev_mwd > next_flag) ? next_flag : prev_flag;
                    cur->prev->next = cur->next;
                    cur->next->prev = cur->prev;
                    node_ptr tmp = cur;
                    cur = cur->next;
                    free(tmp);
                    break;
                }
            }
        }
        cur = cur->next;
    }

    for (int i = 0; i < n - 1; ++i)
    {
        printf("%lld\n", res[i]);
    }

    cur = head;
    while (cur)
    {
        node_ptr tmp = cur;
        cur = cur->next;
        free(tmp);
    }

    return 0;
}
