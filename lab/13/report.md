# OS lab13 Report
name: 刘乐奇

sid: 12011327

## 1. swap_in和swap_out分别发生在什么时候？

在理内存分配页面中，当没有空闲页面，又需要分配新的页面时，需要进行页面置换。

swap_in：在缺页中断后将缺页地址对应的硬盘数据读到page中，并与页表项建立映射

swap_out：将一个或多个页内的数据置换到硬盘，并把pra_list的头几个移除掉。

## 2. (list_entry_t*) mm->sm_priv 指向的链表是做什么用的，什么情况下会将页面加入这个链表？

(list_entry_t*) mm->sm_priv 指向的链表是一个队列，用于管理进来的 page。每次换入 page 的时候都把最靠前的 page 置换出去。

## 3. 为什么说OPT是理论算法，它存在的意义是什么？

因为 OPT 所要求的信息是存在于未来的，也即需要预知未来最长时间不会被用到的 page。但是该算法的存在保证了 page replacement 算法的最优情况，不会有比这更好的算法。

## 4. 一个系统给进程分配了4个物理页面，给定页面访问序列7 0 1 2 0 3 0 4 2 3 0 3 2 1 2 0 1 7 0 1，请参照理论课件L08 Demand Paging中22页的表格给出物理页内容的置换过程（分别使用LRU算法和CLOCK算法），并给出对应的缺页数量。

LRU

缺页数量：8

|| 7 | 0 | 1 | 2 | 0 | 3 | 0 | 4 | 2 | 3 | 0 | 3 | 2 | 1 | 2 | 0 | 1 | 7 | 0 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|一| 7 | 7 | 7 | 7 | 7 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 7 | 7 | 7 |
|二|  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|三|  |  | 1 | 1 | 1 | 1 | 1 | 4 | 4 | 4 | 4 | 4 | 4 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
|四|  |  |  | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 |
|缺页| √ | √ | √ | √ | × | √ | × | √ | × | × | × | × | × | √ | × | × | × | √ | × | × |

CLOCK

缺页数量：8

|| 7 | 0 | 1 | 2 | 0 | 3 | 0 | 4 | 2 | 3 | 0 | 3 | 2 | 1 | 2 | 0 | 1 | 7 | 0 | 1 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
|一| 7 | 7 | 7 | 7 | 7 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 3 | 2 | 2 | 2 | 2 | 2 | 2 |
|二|  | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 | 0 |
|三|  |  | 1 | 1 | 1 | 1 | 1 | 4 | 4 | 4 | 4 | 4 | 4 | 4 | 4 | 4 | 4 | 7 | 7 | 7 |
|四|  |  |  | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 2 | 1 | 1 | 1 | 1 | 1 | 1 | 1 |
|缺页| √ | √ | √ | √ | × | √ | × | √ | × | × | × | × | × | √ | × | × | × | √ | × | × |