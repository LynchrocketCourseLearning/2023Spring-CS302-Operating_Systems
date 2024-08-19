# OS Assignment 10 Report
name：刘乐奇

sid：12011327

## 1. Disk scheduling
(1) seek time; rotation latency; transfer time

(2) Use FIFO\SSTF\SCAN\CSCAN algorithm to read the six sectors

* FIFO \
Track access sequence: 70, 30, 90, 120, 60, 20 \
Total time is 260ms. Listed as below

|| 70 | 30 | 90 | 120 | 60 | 20 |
|---|---|---|---|---|---|---|
| seek time | (100-70)\*1ms=30ms | (70-30)\*1ms=40ms | (90-30)\*1ms=60ms | (120-90)\*1ms=30ms | (120-60)\*1ms=60ms| (60-20)\*1ms=40ms |

* SSTF\
Track access sequence: 90, 70, 60, 30, 20, 120 \
Total time is 180ms. Listed as below

|| 90 | 70 | 60 | 30 | 20 | 120 |
|---|---|---|---|---|---|---|
| seek time | (100-90)\*1ms=10ms | (90-70)\*1ms=20ms | (70-60)\*1ms=10ms | (60-30)\*1ms=30ms | (30-20)\*1ms=10ms| (120-20)\*1ms=100ms |

* SCAN
Track access sequence: 120, 90, 70, 60, 30, 20 \
Total time is 280ms. Listed as below

|| 120 | 90 | 70 | 60 | 30 | 20 |
|---|---|---|---|---|---|---|
| seek time | (120-100)\*1ms=20ms | (200-120+200-90)\*1ms=190ms | (90-70)\*1ms=20ms | (70-60)\*1ms=10ms | (60-30)\*1ms=30ms| (30-20)\*1ms=10ms |

* CSCAN
Track access sequence: 120, 20, 30, 60, 70, 90 \
Total time is 190ms. Listed as below

|| 120 | 20 | 30 | 60 | 70 | 90 |
|---|---|---|---|---|---|---|
| seek time | (120-100)\*1ms=20ms | (200-120+20)\*1ms=100ms | (30-20)\*1ms=10ms | (60-30)\*1ms=30ms | (70-60)\*1ms=10ms| (90-70)\*1ms=20ms |



