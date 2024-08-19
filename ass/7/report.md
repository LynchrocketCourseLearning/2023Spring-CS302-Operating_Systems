# OS Assignment 7 Report
name: 刘乐奇

sid: 12011327

## 1. Page & TLB

### (1) How much time is needed to access the above 3 virtual address in turn?

Before calculating the time, some prerequisite information is required.

Since page size is $4KB=2^{12}bit$, i.e, the offset in virtual address is $12$-bit long. Thus, the virtual page number of 2333H, 1555H, 2555H are 2H, 1H, 2H, and the offset are 333H, 555H, 555H, respectively.

If we access 2333H, 1555H, 2555H in turn, we have the following solution:

* access 2333H, with VPN = 2H, offset = 333H. \
   1. access TLB, empty, not found. (10ns)
   2. access page table, VPN = 2H exists, get the corresponding PFN = 233H. (100ns) Then update this PTE into TLB.
   3. calculate the physical address and then access memory. (100ns)
   * total time = $(10+100+100)ns = 210ns$
* access 1555H, with VPN = 1H, offset = 555H. \
   1. access TLB, not found. (10ns)
   2. access page table, VPN = 1H with present bit 0. (100ns)
   3. cause page fault. ($10^8$ns, be careful it contains updating page table and TLB)
   4. back to the instruction casing previous page fault, executing it and access TLB. (10ns)
   5. calculate the physical address and then access memory. (100ns)
   * total time = $(10+100+10^8+10+100)ns = (220+10^8)ns$
* access 2555H, with VPN = 2H, offset = 555H. \
   1. access TLB, found VPN = 2H. (10ns)
   2. calculate the physical address and then access memory. (100ns)
   * total time = $(10+100)ns = 110ns$

### (2) What is the physical address of virtual address 1555H?

When access virtual address 1555H, PTEs with VPN = 0H and 2H has PFN = 122H and 233H, respectively. Since the previous one accessed PTE with VPN = 2H, this time PTE with VPN = 0H turns to be invalid, and PTE with VPN = 1H turns to valid and its PFN = 122H. Thus, the virtual address is $122555H$.

## 2. Fill in the blank
1. 0x00_0000_8400_0000; 0x84; 0x00_0000_0008_6000_0001_0001
2. 0x00_0000_8600_0000; 0x11A; 0x00_0000_0008_6001_0001_0001
3. 0x00_0000_8600_1000; 0x56; 0x00_0000_0008_6002_0001_0001
4. 0x00_0000_8600_2789