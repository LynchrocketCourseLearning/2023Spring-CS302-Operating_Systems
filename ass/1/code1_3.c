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
    node_ptr *to_arr = (node_ptr *)malloc(sizeof(node_ptr) * n);
    for (int i = 0; i < n; ++i)
    {
        ll val;
        scanf("%lld", &val);
        arr[i] = (node_ptr)malloc(sizeof(node));
        arr[i]->val = val;
        arr[i]->rank = i;
        to_arr[i] = arr[i];
    }

    qsort(arr, n, sizeof(node_ptr), comp);

    node_ptr head = (node_ptr)malloc(sizeof(node));
    head->prev = NULL;
    head->rank = -1;
    head->val = -1;
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
    tail->val = -1;
    cur->next = tail;
    cur->next->prev = cur;

    // for (int i = 0; i < n; i++)
    // {
    //     printf("%d,%lld ", arr[i]->rank, arr[i]->val);
    // }
    // printf("\n");
    // for (int i = 0; i < n; i++)
    // {
    //     printf("%d,%lld ", to_arr[i]->rank, to_arr[i]->val);
    // }
    // printf("\n");

    // for (int i = 0; i < n; i++)
    // {
    //     printf("%lld ", arr[i]->val);
    // }
    // printf("\n");
    // for (int i = 0; i < n; i++)
    // {
    //     printf("%lld ", to_arr[i]->val);
    // }
    // printf("\n");

    node_ptr pr, ne;
    ll prev_mwd = -1, next_mwd = -1;
    for (int i = 0; i < n - 1; ++i)
    {
        cur = to_arr[i];
        pr = cur->prev;
        ne = cur->next;
        prev_mwd = next_mwd = -1;
        while (pr->rank < cur->rank && NULL != pr->prev)
            pr = pr->prev;
        if (pr->rank != -1)
            prev_mwd = (pr->val > cur->val) ? pr->val - cur->val : cur->val - pr->val;

        while (ne->rank < cur->rank && NULL != ne->next)
            ne = ne->next;
        if (ne->rank != -1)
            next_mwd = (ne->val > cur->val) ? ne->val - cur->val : cur->val - ne->val;

        if (prev_mwd == -1)
            res[i] = next_mwd;
        else if (next_mwd == -1)
            res[i] = prev_mwd;
        else
            res[i] = (prev_mwd < next_mwd) ? prev_mwd : next_mwd;

        cur->prev->next = cur->next;
        cur->next->prev = cur->prev;
        node_ptr tmp = cur;
        cur = to_arr[i + 1];
        free(tmp);
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
