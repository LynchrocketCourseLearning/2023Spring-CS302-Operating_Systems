# 期末考试模拟试卷
## P1.True of False (1pt * 30)
### 1. Aging is an effective solution to priority inversion.
(F)
### 2. Dual-mode operation is supported by the CPU to protect the OS from applications. 
(T)
### 3. TLB works well because of spatial locality and temporal locality, where temporal locality means accesses to the same page tend to be close in time.
(T)
### 4. Peterson's solution is an example of the spin-based locks.
(T)
### 5. TLB entries can be extended with ASID to avoid TLB flushes during context switch.
(T)
### 6. In linux, kernel logic addresses are physically continuous; most kernel data structures, like page tables or per-process kernel stacks , are stored in kernel logic address.
(T)
### 7. Memory-mapped I/O does not need special I/O instructions to operate the I/O ports and registers.
(T)
### 8. SJF can be regarded as dynamic priority scheduling where its priority is the next CPU burst time.
(F)
### 9. A priority scheduling algorithm must be preemptive.
(F)
### 10. Exit() is always invoked when the process terminates.
(T)
### 11. seL4 is a formally verified micro kernel.
(T)
### 12. A process switches from running to waiting state when it has used up its CPU quota and begin to wait until its next turn.
(F)
### 13. Copy-on-write allows the parent process and the child process to share memory, so race condition may occur if they write to the same global variable concurrently.
(F)
### 14. Peterson's solution can be extended to more than two processes with some modification.
(T)
### 15. When CPU scheduling is considered, a process can be described as either I/O bound or memory bound.
(F)
### 16. DMA can bypass CPU to transfer data directly between I/O device and memory.
(T)
### 17. If the size of a page frame is 512 bytes, the least significant 10 bits will be used as page offset in the virtual address.
(F)
### 18. Shortest-job-first scheduling algorithm is optimal with respect to the average turnaround time.
(F)
### 19. In linux completely fair scheduler, a process with higher priority has higher decay factor for its virtual run time.
(F)
### 20. Bounded waiting requires that a process trying to enter the critical section will eventually get in if no process is currently in it.
(T)
### 21. Page table pages cannot be swap out to the disk by the linux kernel.
(T
)
### 22. IA-32 only supports 6 segments per process as it only has six segment registers.
(F)
### 23. The inverted page table is used to translate physical addresses into virtual addresses.
(F)
### 24. DMA controllers can steal memory access cycle from the main CPU.
(T)
### 25. The memory management unit(MMU) is a software component of the operating system to translate logical addresses to physical addresses.
(F) MMU is hardware
### 26. When a user process accesses a virtual address, it is the operating system that converts the virtual address into a physical address.
(F) MMU
### 27. With paging, virtually continuous memory can be discontinues.
(T)
### 28. Both segmentation and paging schemes are used in IA-32.
(T)
### 29. A round-robin scheduling algorithm is non-preemptive, because it does not preempt the running process when another process switches from waiting to ready.
(F) Preemptive when quantum running out.
### 30. Re-parenting happens when the parent process terminates before the child process.
(T)
## P2. Short answers (30pts)
### (3pts) 1. A solution to the critical problem must satisfy ___, ___ and ___
mutual exclusion, bounded waiting, process
### (3pts) 2. The sv39 paging mechanism of the riscv64 architecture supports the hugepage mechanism. The virtual address of sv39 is composed of a 9-bit first level virtual page number, a 9-bit second level virtual page number, a 9-bit third level page number, and a 12-bit offset. What are the page size of a Gigapage(吉页), Megapage(巨页), and page(基页)?
1GB, 2MB, 4KB
### (2pts) 3. The limitations of the Base & Bounds schemes are ___, ___, ___ (Hint: two correct blanks get full points)
hard to extend, external fragmentation, ?
### (2pts) 4. What is Translation Look-aside Buffer(TLB)? When do uCore need to refresh TLB?
TLB is the cache of PTE. uCore needs to refresh TLB when page replacement happens.
### (3pts) 5. The limitations of the segmentation scheme are ___, ___, ___, ___. (Hint: three correct blanks get full points)
?, ?, ?, ?
### (3pts) 6. What are the three privilege levels of RISC-V?
machine, supervisor, user
### (3pts) 7. What are three general methods used to pass system call parameters? ___, ___, ___.
by registers, by stack, by blocks
### (2pts) 8. Hard link and soft link in iNode-based file systems are different. When creating a hard/soft link, ___; when deleting a hard/soft link, ___
the link count of the file's iNode is increased by 1, an iNode is created and points to the file; the link count of the file's iNode is decreased by 1, the new created iNode is deleted.
### (2pts) 9. The FAT32 file system stores file names in ___ and file attributes in ___, but ext2/3 file system stores file names in ___ and file attributes in ___ . (Hint: two correct blanks get full points)
root directory, root directory, data blocks, data blocks
### (3pts) 10. What are the three thread models for mapping user-level thread to kernel-level thread.
one-to-one, many-to-one, many-to-many
### (2pts) 11. The memory content at address 0x20 is 0xe7, address 0x21 is 0x34, address 0x22 is 0x42, address 0x23 is 0xdd, What is the value of an integer at address 0x20 if the CPU is little endian (in hexadecimal)?
0xdd4234e7
### (2pts) 12. ___ is the phenomenon in which increasing the number of page frames results in an increase in the number of page faults for certain memory access patterns. This phenomenon is commonly experienced when using the ___ page replacement algorithm.
Belady's anomaly, FIFO

## P3. Questions and Answers (60pts)
### (8pts) 1. On some CPU architecture, the page size is 16B, each page table entry is 4B, the virtual address has 8 bits.
#### (1) What is the size of the virtual space?
$2^8$ Bytes.
#### (2) If each level of page table fits into one page, how many levels of page tables are needed?
To cover the virtual space, $\frac{2^8B}{16B}=16$ pages is needed, i.e., $16$ PTE is needed. A page table has $\frac{16B}{4B}=4$ PTE. Then $2$ levels of page tables are needed. 
#### (3) If the relevant last-level page table is show as below, what is the physiccal address of 0x64?
The virtual address = 0x64 = 0b0110_0100. So the L1 page table index is 0b01, the L2 page table index is 0b10, the offset is 0b0100=0x4. Therefore, its physical address is 0x3e4.

#### (4) If the CPU architecture changes to support page size of 32B, everything else remains unchanged. With the following page table, what is the physical address of 0x64?
| index | PFN |
|---|---|
| 00 | 0x15 |
| 01 | 0x24 |
| 10 | 0x3e |
| 11 | 0x64 |
| ... | ... |

To cover the virtual space, $\frac{2^8B}{32B}=8$ pages is needed, i.e., $8$ PTE is needed. A page table has $\frac{32B}{4B}=8$ PTE. At this time, $1$ level of page table is needed.

The virtual address = 0x64 = 0b0110_0100. So the page table index is 0b011, the offset is 0b00100 = 0x4. Therefore, its physical address is 0x644.

#### (5) The physical address of the virtual address 0x364 is 0x1164. What is the corresponding page frame number（in decimal numbers）?
The first 3-bit of virtual address is used to represent VPN, and thus the length of offset is 9-bit. Since the last 9-bit of physical address is offset, the corresponding PFN is 8 (in decimal).

### (16pts) 2. Suppose we have 3 page frames (1,2,3), 4 virtual pages (A,B,C,D), consider the following reference string: A B C A D B A C B C. What are the number of page faults for the following page replacement policies? Show each step in the table to get full points.
#### (1) MIN
\# page fault: 2
| | A | B | C | A | D | B | A | C | B | C |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | A | A | A | A | A | A | A | C | C | C |
| 2 |---| B | B | B | B | B | B | B | B | B |
| 3 |---|---| C | C | D | D | D | D | D | D |
#### (2) LRU
\# page fault: 3
| | A | B | C | A | D | B | A | C | B | C |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | A | A | A | A | A | A | A | A | A | A |
| 2 |---| B | B | B | D | D | D | C | C | C |
| 3 |---|---| C | C | C | B | B | B | B | B |
#### (3) FIFO
\# page fault: 4
| | A | B | C | A | D | B | A | C | B | C |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | A | A | A | A | D | D | D | D | D | C |
| 2 |---| B | B | B | B | B | A | A | A | A |
| 3 |---|---| C | C | C | C | C | C | B | B |
#### (4) Clock (hint: only second page reference set reference bit)
\# page fault: 3
| | A | B | C | A | D | B | A | C | B | C |
|---|---|---|---|---|---|---|---|---|---|---|
| 1 | A | A | A | A | D | D | D | C | C | C |
| 2 |---| B | B | B | B | B | B | B | B | B |
| 3 |---|---| C | C | C | C | A | A | A | A |


### (4pts) 3. In a computer system that supports demand-paging, the memory access time is 50 nanoseconds, the average page fault service time is 5 milliseconds. The page fault rate p is 1/5000. What is the Effective Access Time?
hit rate = 1-page fault rate = $\frac{4999}{5000}$

hit time = 50 ns

miss rate = page fault rate = $\frac{1}{5000}$

miss penalty = 5ms

Therefore, Effective Access Time = hit rate $\times$ hit time + miss rate $\times$ miss penalty = $\frac{4999}{5000}\times50ns+\frac{1}{5000}\times5ms=49.99ns+1000ns=1049.99ns$

### (12pts) 4. Consider a set of 4 processes, with their arrival time and CPU burst time shown in the table. What is the average turnaround time with the following CPU scheduling algorithms?
| Process ID | Arrival time t | Estimated burst time |
|---|---|---|
| P1 | 0 | 6 |
| P2 | 1 | 3 |
| P3 | 2 | 1 |
| P4 | 4 | 2 |
#### (1) Non-preemptive SJF
|| P1 | P2 | P3 | P4 |
|---|---|---|---|---|
| waiting time | 6 | 11 | 5 | 5 |
The average turnaround time is $\frac{6+11+5+5}{4}=6.75$ 
#### (2) Preemptive SJF
|| P1 | P2 | P3 | P4 |
|---|---|---|---|---|
| waiting time | 12 | 4 | 1 | 3 |
The average turnaround time is $\frac{12+4+1+3}{4}=5$ 
#### (3) Round robin with a scheduling quantum of 2 (let's assume here if 2 processes arrive at the ready queue at the same time, the one with running-ready state transition is placed at the end of the queue).
|| P1 | P2 | P3 | P4 |
|---|---|---|---|---|
| waiting time | 12 | 9 | 3 | 5 |
The average turnaround time is $\frac{12+9+3+5}{4}=7.25$ 

### (16pts) 5. In a disk scheduling algorithm, the range of the cylinders is 0~99. The arm head is originally located at track 50. The queue of requests is 25, 98, 52, 67, 42, 8. What is head movement distance, considering the following disk scheduling algorithms? Hint: for SCAN/C-SCAN/LOOK/C-LOOK, the arm head moves towards 99 first; for C-LOOK/C-SCAN, both directions count towards movement distance.
#### (1) SSTF
|| 52 | 42 | 25 | 8 | 67 | 98 |
|---|---|---|---|---|---|---|
| distance | 2 | 10 | 17 | 17 | 59 | 31 |
The head movement distance is 2+10+17+17+59+31=136
#### (2) C-LOOK
|| 52 | 67 | 98 | 8 | 25 | 42 |
|---|---|---|---|---|---|---|
| distance | - | 48 | - | 90 | - | 34 |
The head movement distance is 48+90+34=172
#### (3) SCAN
|| 52 | 67 | 98 | 42 | 25 | 8 |
|---|---|---|---|---|---|---|
| distance | - | 49 | - | - | 91 | - |
The head movement distance is 49+91=140
#### (4) FIFO
|| 25 | 98 | 52 | 67 | 42 | 8 |
|---|---|---|---|---|---|---|
| distance | 25 | 73 | 46 | 15 | 25 | 34 |
The head movement distance is 25+73+46+15+25+34=218

### (4pts) 6. A Turing Class student designed an inode-based filesystem, called TCFS. The structure of an inode in Site FS has 256 bytes, with 10 dierct block pointers, 2 single indirect block pointers, and 1 double indirect block pointers. A block pointer takes 8 bytes. The block size is 8KB.
#### (1) What is the maximum size of a file in TCFS?
$10\times8KB+2\times\frac{8KB}{8B}\times8KB+1\times(\frac{8KB}{8B})^2\times8KB=80KB+16MB+8GB$
#### (2) What is the maximum size of a filesystem with TCFS format?
filesystem maximum size = number of block address * block size = $2^{64}\times8KB=2^{67}KB$
