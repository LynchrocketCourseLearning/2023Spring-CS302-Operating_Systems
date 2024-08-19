
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c020d2b7          	lui	t0,0xc020d
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c020d137          	lui	sp,0xc020d
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	0000e517          	auipc	a0,0xe
ffffffffc0200036:	06250513          	addi	a0,a0,98 # ffffffffc020e094 <edata>
ffffffffc020003a:	00019617          	auipc	a2,0x19
ffffffffc020003e:	69660613          	addi	a2,a2,1686 # ffffffffc02196d0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	46f070ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc020004e:	570000ef          	jal	ra,ffffffffc02005be <cons_init>
ffffffffc0200052:	00008597          	auipc	a1,0x8
ffffffffc0200056:	09658593          	addi	a1,a1,150 # ffffffffc02080e8 <etext+0x2>
ffffffffc020005a:	00008517          	auipc	a0,0x8
ffffffffc020005e:	0a650513          	addi	a0,a0,166 # ffffffffc0208100 <etext+0x1a>
ffffffffc0200062:	06a000ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200066:	5f5000ef          	jal	ra,ffffffffc0200e5a <pmm_init>
ffffffffc020006a:	5c6000ef          	jal	ra,ffffffffc0200630 <pic_init>
ffffffffc020006e:	5d0000ef          	jal	ra,ffffffffc020063e <idt_init>
ffffffffc0200072:	237010ef          	jal	ra,ffffffffc0201aa8 <vmm_init>
ffffffffc0200076:	2b9040ef          	jal	ra,ffffffffc0204b2e <sched_init>
ffffffffc020007a:	0a7040ef          	jal	ra,ffffffffc0204920 <proc_init>
ffffffffc020007e:	4a2000ef          	jal	ra,ffffffffc0200520 <ide_init>
ffffffffc0200082:	3bf010ef          	jal	ra,ffffffffc0201c40 <swap_init>
ffffffffc0200086:	4f0000ef          	jal	ra,ffffffffc0200576 <clock_init>
ffffffffc020008a:	5a8000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020008e:	1c9040ef          	jal	ra,ffffffffc0204a56 <cpu_idle>

ffffffffc0200092 <cputch>:
ffffffffc0200092:	1141                	addi	sp,sp,-16
ffffffffc0200094:	e022                	sd	s0,0(sp)
ffffffffc0200096:	e406                	sd	ra,8(sp)
ffffffffc0200098:	842e                	mv	s0,a1
ffffffffc020009a:	526000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020009e:	401c                	lw	a5,0(s0)
ffffffffc02000a0:	60a2                	ld	ra,8(sp)
ffffffffc02000a2:	2785                	addiw	a5,a5,1
ffffffffc02000a4:	c01c                	sw	a5,0(s0)
ffffffffc02000a6:	6402                	ld	s0,0(sp)
ffffffffc02000a8:	0141                	addi	sp,sp,16
ffffffffc02000aa:	8082                	ret

ffffffffc02000ac <vcprintf>:
ffffffffc02000ac:	1101                	addi	sp,sp,-32
ffffffffc02000ae:	862a                	mv	a2,a0
ffffffffc02000b0:	86ae                	mv	a3,a1
ffffffffc02000b2:	00000517          	auipc	a0,0x0
ffffffffc02000b6:	fe050513          	addi	a0,a0,-32 # ffffffffc0200092 <cputch>
ffffffffc02000ba:	006c                	addi	a1,sp,12
ffffffffc02000bc:	ec06                	sd	ra,24(sp)
ffffffffc02000be:	c602                	sw	zero,12(sp)
ffffffffc02000c0:	48f070ef          	jal	ra,ffffffffc0207d4e <vprintfmt>
ffffffffc02000c4:	60e2                	ld	ra,24(sp)
ffffffffc02000c6:	4532                	lw	a0,12(sp)
ffffffffc02000c8:	6105                	addi	sp,sp,32
ffffffffc02000ca:	8082                	ret

ffffffffc02000cc <cprintf>:
ffffffffc02000cc:	711d                	addi	sp,sp,-96
ffffffffc02000ce:	02810313          	addi	t1,sp,40 # ffffffffc020d028 <boot_page_table_sv39+0x28>
ffffffffc02000d2:	8e2a                	mv	t3,a0
ffffffffc02000d4:	f42e                	sd	a1,40(sp)
ffffffffc02000d6:	f832                	sd	a2,48(sp)
ffffffffc02000d8:	fc36                	sd	a3,56(sp)
ffffffffc02000da:	00000517          	auipc	a0,0x0
ffffffffc02000de:	fb850513          	addi	a0,a0,-72 # ffffffffc0200092 <cputch>
ffffffffc02000e2:	004c                	addi	a1,sp,4
ffffffffc02000e4:	869a                	mv	a3,t1
ffffffffc02000e6:	8672                	mv	a2,t3
ffffffffc02000e8:	ec06                	sd	ra,24(sp)
ffffffffc02000ea:	e0ba                	sd	a4,64(sp)
ffffffffc02000ec:	e4be                	sd	a5,72(sp)
ffffffffc02000ee:	e8c2                	sd	a6,80(sp)
ffffffffc02000f0:	ecc6                	sd	a7,88(sp)
ffffffffc02000f2:	e41a                	sd	t1,8(sp)
ffffffffc02000f4:	c202                	sw	zero,4(sp)
ffffffffc02000f6:	459070ef          	jal	ra,ffffffffc0207d4e <vprintfmt>
ffffffffc02000fa:	60e2                	ld	ra,24(sp)
ffffffffc02000fc:	4512                	lw	a0,4(sp)
ffffffffc02000fe:	6125                	addi	sp,sp,96
ffffffffc0200100:	8082                	ret

ffffffffc0200102 <cputchar>:
ffffffffc0200102:	a97d                	j	ffffffffc02005c0 <cons_putc>

ffffffffc0200104 <cputs>:
ffffffffc0200104:	1101                	addi	sp,sp,-32
ffffffffc0200106:	e822                	sd	s0,16(sp)
ffffffffc0200108:	ec06                	sd	ra,24(sp)
ffffffffc020010a:	e426                	sd	s1,8(sp)
ffffffffc020010c:	842a                	mv	s0,a0
ffffffffc020010e:	00054503          	lbu	a0,0(a0)
ffffffffc0200112:	c51d                	beqz	a0,ffffffffc0200140 <cputs+0x3c>
ffffffffc0200114:	0405                	addi	s0,s0,1
ffffffffc0200116:	4485                	li	s1,1
ffffffffc0200118:	9c81                	subw	s1,s1,s0
ffffffffc020011a:	4a6000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc020011e:	00044503          	lbu	a0,0(s0)
ffffffffc0200122:	008487bb          	addw	a5,s1,s0
ffffffffc0200126:	0405                	addi	s0,s0,1
ffffffffc0200128:	f96d                	bnez	a0,ffffffffc020011a <cputs+0x16>
ffffffffc020012a:	0017841b          	addiw	s0,a5,1
ffffffffc020012e:	4529                	li	a0,10
ffffffffc0200130:	490000ef          	jal	ra,ffffffffc02005c0 <cons_putc>
ffffffffc0200134:	60e2                	ld	ra,24(sp)
ffffffffc0200136:	8522                	mv	a0,s0
ffffffffc0200138:	6442                	ld	s0,16(sp)
ffffffffc020013a:	64a2                	ld	s1,8(sp)
ffffffffc020013c:	6105                	addi	sp,sp,32
ffffffffc020013e:	8082                	ret
ffffffffc0200140:	4405                	li	s0,1
ffffffffc0200142:	b7f5                	j	ffffffffc020012e <cputs+0x2a>

ffffffffc0200144 <getchar>:
ffffffffc0200144:	1141                	addi	sp,sp,-16
ffffffffc0200146:	e406                	sd	ra,8(sp)
ffffffffc0200148:	4ac000ef          	jal	ra,ffffffffc02005f4 <cons_getc>
ffffffffc020014c:	dd75                	beqz	a0,ffffffffc0200148 <getchar+0x4>
ffffffffc020014e:	60a2                	ld	ra,8(sp)
ffffffffc0200150:	0141                	addi	sp,sp,16
ffffffffc0200152:	8082                	ret

ffffffffc0200154 <readline>:
ffffffffc0200154:	715d                	addi	sp,sp,-80
ffffffffc0200156:	e486                	sd	ra,72(sp)
ffffffffc0200158:	e0a6                	sd	s1,64(sp)
ffffffffc020015a:	fc4a                	sd	s2,56(sp)
ffffffffc020015c:	f84e                	sd	s3,48(sp)
ffffffffc020015e:	f452                	sd	s4,40(sp)
ffffffffc0200160:	f056                	sd	s5,32(sp)
ffffffffc0200162:	ec5a                	sd	s6,24(sp)
ffffffffc0200164:	e85e                	sd	s7,16(sp)
ffffffffc0200166:	c901                	beqz	a0,ffffffffc0200176 <readline+0x22>
ffffffffc0200168:	85aa                	mv	a1,a0
ffffffffc020016a:	00008517          	auipc	a0,0x8
ffffffffc020016e:	f9e50513          	addi	a0,a0,-98 # ffffffffc0208108 <etext+0x22>
ffffffffc0200172:	f5bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200176:	4481                	li	s1,0
ffffffffc0200178:	497d                	li	s2,31
ffffffffc020017a:	49a1                	li	s3,8
ffffffffc020017c:	4aa9                	li	s5,10
ffffffffc020017e:	4b35                	li	s6,13
ffffffffc0200180:	0000eb97          	auipc	s7,0xe
ffffffffc0200184:	f18b8b93          	addi	s7,s7,-232 # ffffffffc020e098 <buf>
ffffffffc0200188:	3fe00a13          	li	s4,1022
ffffffffc020018c:	fb9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc0200190:	00054a63          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc0200194:	00a95a63          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc0200198:	029a5263          	bge	s4,s1,ffffffffc02001bc <readline+0x68>
ffffffffc020019c:	fa9ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001a0:	fe055ae3          	bgez	a0,ffffffffc0200194 <readline+0x40>
ffffffffc02001a4:	4501                	li	a0,0
ffffffffc02001a6:	a091                	j	ffffffffc02001ea <readline+0x96>
ffffffffc02001a8:	03351463          	bne	a0,s3,ffffffffc02001d0 <readline+0x7c>
ffffffffc02001ac:	e8a9                	bnez	s1,ffffffffc02001fe <readline+0xaa>
ffffffffc02001ae:	f97ff0ef          	jal	ra,ffffffffc0200144 <getchar>
ffffffffc02001b2:	fe0549e3          	bltz	a0,ffffffffc02001a4 <readline+0x50>
ffffffffc02001b6:	fea959e3          	bge	s2,a0,ffffffffc02001a8 <readline+0x54>
ffffffffc02001ba:	4481                	li	s1,0
ffffffffc02001bc:	e42a                	sd	a0,8(sp)
ffffffffc02001be:	f45ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001c2:	6522                	ld	a0,8(sp)
ffffffffc02001c4:	009b87b3          	add	a5,s7,s1
ffffffffc02001c8:	2485                	addiw	s1,s1,1
ffffffffc02001ca:	00a78023          	sb	a0,0(a5)
ffffffffc02001ce:	bf7d                	j	ffffffffc020018c <readline+0x38>
ffffffffc02001d0:	01550463          	beq	a0,s5,ffffffffc02001d8 <readline+0x84>
ffffffffc02001d4:	fb651ce3          	bne	a0,s6,ffffffffc020018c <readline+0x38>
ffffffffc02001d8:	f2bff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc02001dc:	0000e517          	auipc	a0,0xe
ffffffffc02001e0:	ebc50513          	addi	a0,a0,-324 # ffffffffc020e098 <buf>
ffffffffc02001e4:	94aa                	add	s1,s1,a0
ffffffffc02001e6:	00048023          	sb	zero,0(s1)
ffffffffc02001ea:	60a6                	ld	ra,72(sp)
ffffffffc02001ec:	6486                	ld	s1,64(sp)
ffffffffc02001ee:	7962                	ld	s2,56(sp)
ffffffffc02001f0:	79c2                	ld	s3,48(sp)
ffffffffc02001f2:	7a22                	ld	s4,40(sp)
ffffffffc02001f4:	7a82                	ld	s5,32(sp)
ffffffffc02001f6:	6b62                	ld	s6,24(sp)
ffffffffc02001f8:	6bc2                	ld	s7,16(sp)
ffffffffc02001fa:	6161                	addi	sp,sp,80
ffffffffc02001fc:	8082                	ret
ffffffffc02001fe:	4521                	li	a0,8
ffffffffc0200200:	f03ff0ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc0200204:	34fd                	addiw	s1,s1,-1
ffffffffc0200206:	b759                	j	ffffffffc020018c <readline+0x38>

ffffffffc0200208 <__panic>:
ffffffffc0200208:	00019317          	auipc	t1,0x19
ffffffffc020020c:	2c030313          	addi	t1,t1,704 # ffffffffc02194c8 <is_panic>
ffffffffc0200210:	00033e03          	ld	t3,0(t1)
ffffffffc0200214:	715d                	addi	sp,sp,-80
ffffffffc0200216:	ec06                	sd	ra,24(sp)
ffffffffc0200218:	e822                	sd	s0,16(sp)
ffffffffc020021a:	f436                	sd	a3,40(sp)
ffffffffc020021c:	f83a                	sd	a4,48(sp)
ffffffffc020021e:	fc3e                	sd	a5,56(sp)
ffffffffc0200220:	e0c2                	sd	a6,64(sp)
ffffffffc0200222:	e4c6                	sd	a7,72(sp)
ffffffffc0200224:	020e1a63          	bnez	t3,ffffffffc0200258 <__panic+0x50>
ffffffffc0200228:	4785                	li	a5,1
ffffffffc020022a:	00f33023          	sd	a5,0(t1)
ffffffffc020022e:	8432                	mv	s0,a2
ffffffffc0200230:	103c                	addi	a5,sp,40
ffffffffc0200232:	862e                	mv	a2,a1
ffffffffc0200234:	85aa                	mv	a1,a0
ffffffffc0200236:	00008517          	auipc	a0,0x8
ffffffffc020023a:	eda50513          	addi	a0,a0,-294 # ffffffffc0208110 <etext+0x2a>
ffffffffc020023e:	e43e                	sd	a5,8(sp)
ffffffffc0200240:	e8dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200244:	65a2                	ld	a1,8(sp)
ffffffffc0200246:	8522                	mv	a0,s0
ffffffffc0200248:	e65ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc020024c:	0000a517          	auipc	a0,0xa
ffffffffc0200250:	94c50513          	addi	a0,a0,-1716 # ffffffffc0209b98 <default_pmm_manager+0x6c0>
ffffffffc0200254:	e79ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200258:	4501                	li	a0,0
ffffffffc020025a:	4581                	li	a1,0
ffffffffc020025c:	4601                	li	a2,0
ffffffffc020025e:	48a1                	li	a7,8
ffffffffc0200260:	00000073          	ecall
ffffffffc0200264:	3d4000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200268:	4501                	li	a0,0
ffffffffc020026a:	174000ef          	jal	ra,ffffffffc02003de <kmonitor>
ffffffffc020026e:	bfed                	j	ffffffffc0200268 <__panic+0x60>

ffffffffc0200270 <__warn>:
ffffffffc0200270:	715d                	addi	sp,sp,-80
ffffffffc0200272:	832e                	mv	t1,a1
ffffffffc0200274:	e822                	sd	s0,16(sp)
ffffffffc0200276:	85aa                	mv	a1,a0
ffffffffc0200278:	8432                	mv	s0,a2
ffffffffc020027a:	fc3e                	sd	a5,56(sp)
ffffffffc020027c:	861a                	mv	a2,t1
ffffffffc020027e:	103c                	addi	a5,sp,40
ffffffffc0200280:	00008517          	auipc	a0,0x8
ffffffffc0200284:	eb050513          	addi	a0,a0,-336 # ffffffffc0208130 <etext+0x4a>
ffffffffc0200288:	ec06                	sd	ra,24(sp)
ffffffffc020028a:	f436                	sd	a3,40(sp)
ffffffffc020028c:	f83a                	sd	a4,48(sp)
ffffffffc020028e:	e0c2                	sd	a6,64(sp)
ffffffffc0200290:	e4c6                	sd	a7,72(sp)
ffffffffc0200292:	e43e                	sd	a5,8(sp)
ffffffffc0200294:	e39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200298:	65a2                	ld	a1,8(sp)
ffffffffc020029a:	8522                	mv	a0,s0
ffffffffc020029c:	e11ff0ef          	jal	ra,ffffffffc02000ac <vcprintf>
ffffffffc02002a0:	0000a517          	auipc	a0,0xa
ffffffffc02002a4:	8f850513          	addi	a0,a0,-1800 # ffffffffc0209b98 <default_pmm_manager+0x6c0>
ffffffffc02002a8:	e25ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ac:	60e2                	ld	ra,24(sp)
ffffffffc02002ae:	6442                	ld	s0,16(sp)
ffffffffc02002b0:	6161                	addi	sp,sp,80
ffffffffc02002b2:	8082                	ret

ffffffffc02002b4 <print_kerninfo>:
ffffffffc02002b4:	1141                	addi	sp,sp,-16
ffffffffc02002b6:	00008517          	auipc	a0,0x8
ffffffffc02002ba:	e9a50513          	addi	a0,a0,-358 # ffffffffc0208150 <etext+0x6a>
ffffffffc02002be:	e406                	sd	ra,8(sp)
ffffffffc02002c0:	e0dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002c4:	00000597          	auipc	a1,0x0
ffffffffc02002c8:	d6e58593          	addi	a1,a1,-658 # ffffffffc0200032 <kern_init>
ffffffffc02002cc:	00008517          	auipc	a0,0x8
ffffffffc02002d0:	ea450513          	addi	a0,a0,-348 # ffffffffc0208170 <etext+0x8a>
ffffffffc02002d4:	df9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002d8:	00008597          	auipc	a1,0x8
ffffffffc02002dc:	e0e58593          	addi	a1,a1,-498 # ffffffffc02080e6 <etext>
ffffffffc02002e0:	00008517          	auipc	a0,0x8
ffffffffc02002e4:	eb050513          	addi	a0,a0,-336 # ffffffffc0208190 <etext+0xaa>
ffffffffc02002e8:	de5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02002ec:	0000e597          	auipc	a1,0xe
ffffffffc02002f0:	da858593          	addi	a1,a1,-600 # ffffffffc020e094 <edata>
ffffffffc02002f4:	00008517          	auipc	a0,0x8
ffffffffc02002f8:	ebc50513          	addi	a0,a0,-324 # ffffffffc02081b0 <etext+0xca>
ffffffffc02002fc:	dd1ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200300:	00019597          	auipc	a1,0x19
ffffffffc0200304:	3d058593          	addi	a1,a1,976 # ffffffffc02196d0 <end>
ffffffffc0200308:	00008517          	auipc	a0,0x8
ffffffffc020030c:	ec850513          	addi	a0,a0,-312 # ffffffffc02081d0 <etext+0xea>
ffffffffc0200310:	dbdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200314:	00019597          	auipc	a1,0x19
ffffffffc0200318:	7bb58593          	addi	a1,a1,1979 # ffffffffc0219acf <end+0x3ff>
ffffffffc020031c:	00000797          	auipc	a5,0x0
ffffffffc0200320:	d1678793          	addi	a5,a5,-746 # ffffffffc0200032 <kern_init>
ffffffffc0200324:	40f587b3          	sub	a5,a1,a5
ffffffffc0200328:	43f7d593          	srai	a1,a5,0x3f
ffffffffc020032c:	60a2                	ld	ra,8(sp)
ffffffffc020032e:	3ff5f593          	andi	a1,a1,1023
ffffffffc0200332:	95be                	add	a1,a1,a5
ffffffffc0200334:	85a9                	srai	a1,a1,0xa
ffffffffc0200336:	00008517          	auipc	a0,0x8
ffffffffc020033a:	eba50513          	addi	a0,a0,-326 # ffffffffc02081f0 <etext+0x10a>
ffffffffc020033e:	0141                	addi	sp,sp,16
ffffffffc0200340:	b371                	j	ffffffffc02000cc <cprintf>

ffffffffc0200342 <print_stackframe>:
ffffffffc0200342:	1141                	addi	sp,sp,-16
ffffffffc0200344:	00008617          	auipc	a2,0x8
ffffffffc0200348:	edc60613          	addi	a2,a2,-292 # ffffffffc0208220 <etext+0x13a>
ffffffffc020034c:	05b00593          	li	a1,91
ffffffffc0200350:	00008517          	auipc	a0,0x8
ffffffffc0200354:	ee850513          	addi	a0,a0,-280 # ffffffffc0208238 <etext+0x152>
ffffffffc0200358:	e406                	sd	ra,8(sp)
ffffffffc020035a:	eafff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020035e <mon_help>:
ffffffffc020035e:	1141                	addi	sp,sp,-16
ffffffffc0200360:	00008617          	auipc	a2,0x8
ffffffffc0200364:	ef060613          	addi	a2,a2,-272 # ffffffffc0208250 <etext+0x16a>
ffffffffc0200368:	00008597          	auipc	a1,0x8
ffffffffc020036c:	f0858593          	addi	a1,a1,-248 # ffffffffc0208270 <etext+0x18a>
ffffffffc0200370:	00008517          	auipc	a0,0x8
ffffffffc0200374:	f0850513          	addi	a0,a0,-248 # ffffffffc0208278 <etext+0x192>
ffffffffc0200378:	e406                	sd	ra,8(sp)
ffffffffc020037a:	d53ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020037e:	00008617          	auipc	a2,0x8
ffffffffc0200382:	f0a60613          	addi	a2,a2,-246 # ffffffffc0208288 <etext+0x1a2>
ffffffffc0200386:	00008597          	auipc	a1,0x8
ffffffffc020038a:	f2a58593          	addi	a1,a1,-214 # ffffffffc02082b0 <etext+0x1ca>
ffffffffc020038e:	00008517          	auipc	a0,0x8
ffffffffc0200392:	eea50513          	addi	a0,a0,-278 # ffffffffc0208278 <etext+0x192>
ffffffffc0200396:	d37ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020039a:	00008617          	auipc	a2,0x8
ffffffffc020039e:	f2660613          	addi	a2,a2,-218 # ffffffffc02082c0 <etext+0x1da>
ffffffffc02003a2:	00008597          	auipc	a1,0x8
ffffffffc02003a6:	f3e58593          	addi	a1,a1,-194 # ffffffffc02082e0 <etext+0x1fa>
ffffffffc02003aa:	00008517          	auipc	a0,0x8
ffffffffc02003ae:	ece50513          	addi	a0,a0,-306 # ffffffffc0208278 <etext+0x192>
ffffffffc02003b2:	d1bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02003b6:	60a2                	ld	ra,8(sp)
ffffffffc02003b8:	4501                	li	a0,0
ffffffffc02003ba:	0141                	addi	sp,sp,16
ffffffffc02003bc:	8082                	ret

ffffffffc02003be <mon_kerninfo>:
ffffffffc02003be:	1141                	addi	sp,sp,-16
ffffffffc02003c0:	e406                	sd	ra,8(sp)
ffffffffc02003c2:	ef3ff0ef          	jal	ra,ffffffffc02002b4 <print_kerninfo>
ffffffffc02003c6:	60a2                	ld	ra,8(sp)
ffffffffc02003c8:	4501                	li	a0,0
ffffffffc02003ca:	0141                	addi	sp,sp,16
ffffffffc02003cc:	8082                	ret

ffffffffc02003ce <mon_backtrace>:
ffffffffc02003ce:	1141                	addi	sp,sp,-16
ffffffffc02003d0:	e406                	sd	ra,8(sp)
ffffffffc02003d2:	f71ff0ef          	jal	ra,ffffffffc0200342 <print_stackframe>
ffffffffc02003d6:	60a2                	ld	ra,8(sp)
ffffffffc02003d8:	4501                	li	a0,0
ffffffffc02003da:	0141                	addi	sp,sp,16
ffffffffc02003dc:	8082                	ret

ffffffffc02003de <kmonitor>:
ffffffffc02003de:	7115                	addi	sp,sp,-224
ffffffffc02003e0:	e962                	sd	s8,144(sp)
ffffffffc02003e2:	8c2a                	mv	s8,a0
ffffffffc02003e4:	00008517          	auipc	a0,0x8
ffffffffc02003e8:	f0c50513          	addi	a0,a0,-244 # ffffffffc02082f0 <etext+0x20a>
ffffffffc02003ec:	ed86                	sd	ra,216(sp)
ffffffffc02003ee:	e9a2                	sd	s0,208(sp)
ffffffffc02003f0:	e5a6                	sd	s1,200(sp)
ffffffffc02003f2:	e1ca                	sd	s2,192(sp)
ffffffffc02003f4:	fd4e                	sd	s3,184(sp)
ffffffffc02003f6:	f952                	sd	s4,176(sp)
ffffffffc02003f8:	f556                	sd	s5,168(sp)
ffffffffc02003fa:	f15a                	sd	s6,160(sp)
ffffffffc02003fc:	ed5e                	sd	s7,152(sp)
ffffffffc02003fe:	e566                	sd	s9,136(sp)
ffffffffc0200400:	e16a                	sd	s10,128(sp)
ffffffffc0200402:	ccbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200406:	00008517          	auipc	a0,0x8
ffffffffc020040a:	f1250513          	addi	a0,a0,-238 # ffffffffc0208318 <etext+0x232>
ffffffffc020040e:	cbfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200412:	000c0563          	beqz	s8,ffffffffc020041c <kmonitor+0x3e>
ffffffffc0200416:	8562                	mv	a0,s8
ffffffffc0200418:	40e000ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc020041c:	00008c97          	auipc	s9,0x8
ffffffffc0200420:	f6cc8c93          	addi	s9,s9,-148 # ffffffffc0208388 <commands>
ffffffffc0200424:	00008997          	auipc	s3,0x8
ffffffffc0200428:	f1c98993          	addi	s3,s3,-228 # ffffffffc0208340 <etext+0x25a>
ffffffffc020042c:	00008917          	auipc	s2,0x8
ffffffffc0200430:	f1c90913          	addi	s2,s2,-228 # ffffffffc0208348 <etext+0x262>
ffffffffc0200434:	4a3d                	li	s4,15
ffffffffc0200436:	00008b17          	auipc	s6,0x8
ffffffffc020043a:	f1ab0b13          	addi	s6,s6,-230 # ffffffffc0208350 <etext+0x26a>
ffffffffc020043e:	00008a97          	auipc	s5,0x8
ffffffffc0200442:	e32a8a93          	addi	s5,s5,-462 # ffffffffc0208270 <etext+0x18a>
ffffffffc0200446:	4b8d                	li	s7,3
ffffffffc0200448:	854e                	mv	a0,s3
ffffffffc020044a:	d0bff0ef          	jal	ra,ffffffffc0200154 <readline>
ffffffffc020044e:	842a                	mv	s0,a0
ffffffffc0200450:	dd65                	beqz	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200452:	00054583          	lbu	a1,0(a0)
ffffffffc0200456:	4481                	li	s1,0
ffffffffc0200458:	c999                	beqz	a1,ffffffffc020046e <kmonitor+0x90>
ffffffffc020045a:	854a                	mv	a0,s2
ffffffffc020045c:	047070ef          	jal	ra,ffffffffc0207ca2 <strchr>
ffffffffc0200460:	c925                	beqz	a0,ffffffffc02004d0 <kmonitor+0xf2>
ffffffffc0200462:	00144583          	lbu	a1,1(s0)
ffffffffc0200466:	00040023          	sb	zero,0(s0)
ffffffffc020046a:	0405                	addi	s0,s0,1
ffffffffc020046c:	f5fd                	bnez	a1,ffffffffc020045a <kmonitor+0x7c>
ffffffffc020046e:	dce9                	beqz	s1,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc0200470:	6582                	ld	a1,0(sp)
ffffffffc0200472:	00008d17          	auipc	s10,0x8
ffffffffc0200476:	f16d0d13          	addi	s10,s10,-234 # ffffffffc0208388 <commands>
ffffffffc020047a:	8556                	mv	a0,s5
ffffffffc020047c:	4401                	li	s0,0
ffffffffc020047e:	0d61                	addi	s10,s10,24
ffffffffc0200480:	005070ef          	jal	ra,ffffffffc0207c84 <strcmp>
ffffffffc0200484:	c919                	beqz	a0,ffffffffc020049a <kmonitor+0xbc>
ffffffffc0200486:	2405                	addiw	s0,s0,1
ffffffffc0200488:	09740463          	beq	s0,s7,ffffffffc0200510 <kmonitor+0x132>
ffffffffc020048c:	000d3503          	ld	a0,0(s10)
ffffffffc0200490:	6582                	ld	a1,0(sp)
ffffffffc0200492:	0d61                	addi	s10,s10,24
ffffffffc0200494:	7f0070ef          	jal	ra,ffffffffc0207c84 <strcmp>
ffffffffc0200498:	f57d                	bnez	a0,ffffffffc0200486 <kmonitor+0xa8>
ffffffffc020049a:	00141793          	slli	a5,s0,0x1
ffffffffc020049e:	97a2                	add	a5,a5,s0
ffffffffc02004a0:	078e                	slli	a5,a5,0x3
ffffffffc02004a2:	97e6                	add	a5,a5,s9
ffffffffc02004a4:	6b9c                	ld	a5,16(a5)
ffffffffc02004a6:	8662                	mv	a2,s8
ffffffffc02004a8:	002c                	addi	a1,sp,8
ffffffffc02004aa:	fff4851b          	addiw	a0,s1,-1
ffffffffc02004ae:	9782                	jalr	a5
ffffffffc02004b0:	f8055ce3          	bgez	a0,ffffffffc0200448 <kmonitor+0x6a>
ffffffffc02004b4:	60ee                	ld	ra,216(sp)
ffffffffc02004b6:	644e                	ld	s0,208(sp)
ffffffffc02004b8:	64ae                	ld	s1,200(sp)
ffffffffc02004ba:	690e                	ld	s2,192(sp)
ffffffffc02004bc:	79ea                	ld	s3,184(sp)
ffffffffc02004be:	7a4a                	ld	s4,176(sp)
ffffffffc02004c0:	7aaa                	ld	s5,168(sp)
ffffffffc02004c2:	7b0a                	ld	s6,160(sp)
ffffffffc02004c4:	6bea                	ld	s7,152(sp)
ffffffffc02004c6:	6c4a                	ld	s8,144(sp)
ffffffffc02004c8:	6caa                	ld	s9,136(sp)
ffffffffc02004ca:	6d0a                	ld	s10,128(sp)
ffffffffc02004cc:	612d                	addi	sp,sp,224
ffffffffc02004ce:	8082                	ret
ffffffffc02004d0:	00044783          	lbu	a5,0(s0)
ffffffffc02004d4:	dfc9                	beqz	a5,ffffffffc020046e <kmonitor+0x90>
ffffffffc02004d6:	03448863          	beq	s1,s4,ffffffffc0200506 <kmonitor+0x128>
ffffffffc02004da:	00349793          	slli	a5,s1,0x3
ffffffffc02004de:	0118                	addi	a4,sp,128
ffffffffc02004e0:	97ba                	add	a5,a5,a4
ffffffffc02004e2:	f887b023          	sd	s0,-128(a5)
ffffffffc02004e6:	00044583          	lbu	a1,0(s0)
ffffffffc02004ea:	2485                	addiw	s1,s1,1
ffffffffc02004ec:	e591                	bnez	a1,ffffffffc02004f8 <kmonitor+0x11a>
ffffffffc02004ee:	b749                	j	ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f0:	00144583          	lbu	a1,1(s0)
ffffffffc02004f4:	0405                	addi	s0,s0,1
ffffffffc02004f6:	ddad                	beqz	a1,ffffffffc0200470 <kmonitor+0x92>
ffffffffc02004f8:	854a                	mv	a0,s2
ffffffffc02004fa:	7a8070ef          	jal	ra,ffffffffc0207ca2 <strchr>
ffffffffc02004fe:	d96d                	beqz	a0,ffffffffc02004f0 <kmonitor+0x112>
ffffffffc0200500:	00044583          	lbu	a1,0(s0)
ffffffffc0200504:	bf91                	j	ffffffffc0200458 <kmonitor+0x7a>
ffffffffc0200506:	45c1                	li	a1,16
ffffffffc0200508:	855a                	mv	a0,s6
ffffffffc020050a:	bc3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020050e:	b7f1                	j	ffffffffc02004da <kmonitor+0xfc>
ffffffffc0200510:	6582                	ld	a1,0(sp)
ffffffffc0200512:	00008517          	auipc	a0,0x8
ffffffffc0200516:	e5e50513          	addi	a0,a0,-418 # ffffffffc0208370 <etext+0x28a>
ffffffffc020051a:	bb3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020051e:	b72d                	j	ffffffffc0200448 <kmonitor+0x6a>

ffffffffc0200520 <ide_init>:
ffffffffc0200520:	8082                	ret

ffffffffc0200522 <ide_device_valid>:
ffffffffc0200522:	00253513          	sltiu	a0,a0,2
ffffffffc0200526:	8082                	ret

ffffffffc0200528 <ide_device_size>:
ffffffffc0200528:	03800513          	li	a0,56
ffffffffc020052c:	8082                	ret

ffffffffc020052e <ide_read_secs>:
ffffffffc020052e:	0000e797          	auipc	a5,0xe
ffffffffc0200532:	f6a78793          	addi	a5,a5,-150 # ffffffffc020e498 <ide>
ffffffffc0200536:	0095959b          	slliw	a1,a1,0x9
ffffffffc020053a:	1141                	addi	sp,sp,-16
ffffffffc020053c:	8532                	mv	a0,a2
ffffffffc020053e:	95be                	add	a1,a1,a5
ffffffffc0200540:	00969613          	slli	a2,a3,0x9
ffffffffc0200544:	e406                	sd	ra,8(sp)
ffffffffc0200546:	784070ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc020054a:	60a2                	ld	ra,8(sp)
ffffffffc020054c:	4501                	li	a0,0
ffffffffc020054e:	0141                	addi	sp,sp,16
ffffffffc0200550:	8082                	ret

ffffffffc0200552 <ide_write_secs>:
ffffffffc0200552:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200556:	0000e517          	auipc	a0,0xe
ffffffffc020055a:	f4250513          	addi	a0,a0,-190 # ffffffffc020e498 <ide>
ffffffffc020055e:	1141                	addi	sp,sp,-16
ffffffffc0200560:	85b2                	mv	a1,a2
ffffffffc0200562:	953e                	add	a0,a0,a5
ffffffffc0200564:	00969613          	slli	a2,a3,0x9
ffffffffc0200568:	e406                	sd	ra,8(sp)
ffffffffc020056a:	760070ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc020056e:	60a2                	ld	ra,8(sp)
ffffffffc0200570:	4501                	li	a0,0
ffffffffc0200572:	0141                	addi	sp,sp,16
ffffffffc0200574:	8082                	ret

ffffffffc0200576 <clock_init>:
ffffffffc0200576:	02000793          	li	a5,32
ffffffffc020057a:	1047a7f3          	csrrs	a5,sie,a5
ffffffffc020057e:	c0102573          	rdtime	a0
ffffffffc0200582:	67e1                	lui	a5,0x18
ffffffffc0200584:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc0200588:	953e                	add	a0,a0,a5
ffffffffc020058a:	4581                	li	a1,0
ffffffffc020058c:	4601                	li	a2,0
ffffffffc020058e:	4881                	li	a7,0
ffffffffc0200590:	00000073          	ecall
ffffffffc0200594:	00008517          	auipc	a0,0x8
ffffffffc0200598:	e3c50513          	addi	a0,a0,-452 # ffffffffc02083d0 <commands+0x48>
ffffffffc020059c:	00019797          	auipc	a5,0x19
ffffffffc02005a0:	f807ba23          	sd	zero,-108(a5) # ffffffffc0219530 <ticks>
ffffffffc02005a4:	b625                	j	ffffffffc02000cc <cprintf>

ffffffffc02005a6 <clock_set_next_event>:
ffffffffc02005a6:	c0102573          	rdtime	a0
ffffffffc02005aa:	67e1                	lui	a5,0x18
ffffffffc02005ac:	6a078793          	addi	a5,a5,1696 # 186a0 <kern_entry-0xffffffffc01e7960>
ffffffffc02005b0:	953e                	add	a0,a0,a5
ffffffffc02005b2:	4581                	li	a1,0
ffffffffc02005b4:	4601                	li	a2,0
ffffffffc02005b6:	4881                	li	a7,0
ffffffffc02005b8:	00000073          	ecall
ffffffffc02005bc:	8082                	ret

ffffffffc02005be <cons_init>:
ffffffffc02005be:	8082                	ret

ffffffffc02005c0 <cons_putc>:
ffffffffc02005c0:	100027f3          	csrr	a5,sstatus
ffffffffc02005c4:	8b89                	andi	a5,a5,2
ffffffffc02005c6:	0ff57513          	andi	a0,a0,255
ffffffffc02005ca:	e799                	bnez	a5,ffffffffc02005d8 <cons_putc+0x18>
ffffffffc02005cc:	4581                	li	a1,0
ffffffffc02005ce:	4601                	li	a2,0
ffffffffc02005d0:	4885                	li	a7,1
ffffffffc02005d2:	00000073          	ecall
ffffffffc02005d6:	8082                	ret
ffffffffc02005d8:	1101                	addi	sp,sp,-32
ffffffffc02005da:	ec06                	sd	ra,24(sp)
ffffffffc02005dc:	e42a                	sd	a0,8(sp)
ffffffffc02005de:	05a000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02005e2:	6522                	ld	a0,8(sp)
ffffffffc02005e4:	4581                	li	a1,0
ffffffffc02005e6:	4601                	li	a2,0
ffffffffc02005e8:	4885                	li	a7,1
ffffffffc02005ea:	00000073          	ecall
ffffffffc02005ee:	60e2                	ld	ra,24(sp)
ffffffffc02005f0:	6105                	addi	sp,sp,32
ffffffffc02005f2:	a081                	j	ffffffffc0200632 <intr_enable>

ffffffffc02005f4 <cons_getc>:
ffffffffc02005f4:	100027f3          	csrr	a5,sstatus
ffffffffc02005f8:	8b89                	andi	a5,a5,2
ffffffffc02005fa:	eb89                	bnez	a5,ffffffffc020060c <cons_getc+0x18>
ffffffffc02005fc:	4501                	li	a0,0
ffffffffc02005fe:	4581                	li	a1,0
ffffffffc0200600:	4601                	li	a2,0
ffffffffc0200602:	4889                	li	a7,2
ffffffffc0200604:	00000073          	ecall
ffffffffc0200608:	2501                	sext.w	a0,a0
ffffffffc020060a:	8082                	ret
ffffffffc020060c:	1101                	addi	sp,sp,-32
ffffffffc020060e:	ec06                	sd	ra,24(sp)
ffffffffc0200610:	028000ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200614:	4501                	li	a0,0
ffffffffc0200616:	4581                	li	a1,0
ffffffffc0200618:	4601                	li	a2,0
ffffffffc020061a:	4889                	li	a7,2
ffffffffc020061c:	00000073          	ecall
ffffffffc0200620:	2501                	sext.w	a0,a0
ffffffffc0200622:	e42a                	sd	a0,8(sp)
ffffffffc0200624:	00e000ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200628:	60e2                	ld	ra,24(sp)
ffffffffc020062a:	6522                	ld	a0,8(sp)
ffffffffc020062c:	6105                	addi	sp,sp,32
ffffffffc020062e:	8082                	ret

ffffffffc0200630 <pic_init>:
ffffffffc0200630:	8082                	ret

ffffffffc0200632 <intr_enable>:
ffffffffc0200632:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc0200636:	8082                	ret

ffffffffc0200638 <intr_disable>:
ffffffffc0200638:	100177f3          	csrrci	a5,sstatus,2
ffffffffc020063c:	8082                	ret

ffffffffc020063e <idt_init>:
ffffffffc020063e:	14005073          	csrwi	sscratch,0
ffffffffc0200642:	00000797          	auipc	a5,0x0
ffffffffc0200646:	61e78793          	addi	a5,a5,1566 # ffffffffc0200c60 <__alltraps>
ffffffffc020064a:	10579073          	csrw	stvec,a5
ffffffffc020064e:	000407b7          	lui	a5,0x40
ffffffffc0200652:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200656:	8082                	ret

ffffffffc0200658 <print_regs>:
ffffffffc0200658:	610c                	ld	a1,0(a0)
ffffffffc020065a:	1141                	addi	sp,sp,-16
ffffffffc020065c:	e022                	sd	s0,0(sp)
ffffffffc020065e:	842a                	mv	s0,a0
ffffffffc0200660:	00008517          	auipc	a0,0x8
ffffffffc0200664:	d9050513          	addi	a0,a0,-624 # ffffffffc02083f0 <commands+0x68>
ffffffffc0200668:	e406                	sd	ra,8(sp)
ffffffffc020066a:	a63ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020066e:	640c                	ld	a1,8(s0)
ffffffffc0200670:	00008517          	auipc	a0,0x8
ffffffffc0200674:	d9850513          	addi	a0,a0,-616 # ffffffffc0208408 <commands+0x80>
ffffffffc0200678:	a55ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020067c:	680c                	ld	a1,16(s0)
ffffffffc020067e:	00008517          	auipc	a0,0x8
ffffffffc0200682:	da250513          	addi	a0,a0,-606 # ffffffffc0208420 <commands+0x98>
ffffffffc0200686:	a47ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020068a:	6c0c                	ld	a1,24(s0)
ffffffffc020068c:	00008517          	auipc	a0,0x8
ffffffffc0200690:	dac50513          	addi	a0,a0,-596 # ffffffffc0208438 <commands+0xb0>
ffffffffc0200694:	a39ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200698:	700c                	ld	a1,32(s0)
ffffffffc020069a:	00008517          	auipc	a0,0x8
ffffffffc020069e:	db650513          	addi	a0,a0,-586 # ffffffffc0208450 <commands+0xc8>
ffffffffc02006a2:	a2bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006a6:	740c                	ld	a1,40(s0)
ffffffffc02006a8:	00008517          	auipc	a0,0x8
ffffffffc02006ac:	dc050513          	addi	a0,a0,-576 # ffffffffc0208468 <commands+0xe0>
ffffffffc02006b0:	a1dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006b4:	780c                	ld	a1,48(s0)
ffffffffc02006b6:	00008517          	auipc	a0,0x8
ffffffffc02006ba:	dca50513          	addi	a0,a0,-566 # ffffffffc0208480 <commands+0xf8>
ffffffffc02006be:	a0fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006c2:	7c0c                	ld	a1,56(s0)
ffffffffc02006c4:	00008517          	auipc	a0,0x8
ffffffffc02006c8:	dd450513          	addi	a0,a0,-556 # ffffffffc0208498 <commands+0x110>
ffffffffc02006cc:	a01ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006d0:	602c                	ld	a1,64(s0)
ffffffffc02006d2:	00008517          	auipc	a0,0x8
ffffffffc02006d6:	dde50513          	addi	a0,a0,-546 # ffffffffc02084b0 <commands+0x128>
ffffffffc02006da:	9f3ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006de:	642c                	ld	a1,72(s0)
ffffffffc02006e0:	00008517          	auipc	a0,0x8
ffffffffc02006e4:	de850513          	addi	a0,a0,-536 # ffffffffc02084c8 <commands+0x140>
ffffffffc02006e8:	9e5ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006ec:	682c                	ld	a1,80(s0)
ffffffffc02006ee:	00008517          	auipc	a0,0x8
ffffffffc02006f2:	df250513          	addi	a0,a0,-526 # ffffffffc02084e0 <commands+0x158>
ffffffffc02006f6:	9d7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02006fa:	6c2c                	ld	a1,88(s0)
ffffffffc02006fc:	00008517          	auipc	a0,0x8
ffffffffc0200700:	dfc50513          	addi	a0,a0,-516 # ffffffffc02084f8 <commands+0x170>
ffffffffc0200704:	9c9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200708:	702c                	ld	a1,96(s0)
ffffffffc020070a:	00008517          	auipc	a0,0x8
ffffffffc020070e:	e0650513          	addi	a0,a0,-506 # ffffffffc0208510 <commands+0x188>
ffffffffc0200712:	9bbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200716:	742c                	ld	a1,104(s0)
ffffffffc0200718:	00008517          	auipc	a0,0x8
ffffffffc020071c:	e1050513          	addi	a0,a0,-496 # ffffffffc0208528 <commands+0x1a0>
ffffffffc0200720:	9adff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200724:	782c                	ld	a1,112(s0)
ffffffffc0200726:	00008517          	auipc	a0,0x8
ffffffffc020072a:	e1a50513          	addi	a0,a0,-486 # ffffffffc0208540 <commands+0x1b8>
ffffffffc020072e:	99fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200732:	7c2c                	ld	a1,120(s0)
ffffffffc0200734:	00008517          	auipc	a0,0x8
ffffffffc0200738:	e2450513          	addi	a0,a0,-476 # ffffffffc0208558 <commands+0x1d0>
ffffffffc020073c:	991ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200740:	604c                	ld	a1,128(s0)
ffffffffc0200742:	00008517          	auipc	a0,0x8
ffffffffc0200746:	e2e50513          	addi	a0,a0,-466 # ffffffffc0208570 <commands+0x1e8>
ffffffffc020074a:	983ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020074e:	644c                	ld	a1,136(s0)
ffffffffc0200750:	00008517          	auipc	a0,0x8
ffffffffc0200754:	e3850513          	addi	a0,a0,-456 # ffffffffc0208588 <commands+0x200>
ffffffffc0200758:	975ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020075c:	684c                	ld	a1,144(s0)
ffffffffc020075e:	00008517          	auipc	a0,0x8
ffffffffc0200762:	e4250513          	addi	a0,a0,-446 # ffffffffc02085a0 <commands+0x218>
ffffffffc0200766:	967ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020076a:	6c4c                	ld	a1,152(s0)
ffffffffc020076c:	00008517          	auipc	a0,0x8
ffffffffc0200770:	e4c50513          	addi	a0,a0,-436 # ffffffffc02085b8 <commands+0x230>
ffffffffc0200774:	959ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200778:	704c                	ld	a1,160(s0)
ffffffffc020077a:	00008517          	auipc	a0,0x8
ffffffffc020077e:	e5650513          	addi	a0,a0,-426 # ffffffffc02085d0 <commands+0x248>
ffffffffc0200782:	94bff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200786:	744c                	ld	a1,168(s0)
ffffffffc0200788:	00008517          	auipc	a0,0x8
ffffffffc020078c:	e6050513          	addi	a0,a0,-416 # ffffffffc02085e8 <commands+0x260>
ffffffffc0200790:	93dff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200794:	784c                	ld	a1,176(s0)
ffffffffc0200796:	00008517          	auipc	a0,0x8
ffffffffc020079a:	e6a50513          	addi	a0,a0,-406 # ffffffffc0208600 <commands+0x278>
ffffffffc020079e:	92fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007a2:	7c4c                	ld	a1,184(s0)
ffffffffc02007a4:	00008517          	auipc	a0,0x8
ffffffffc02007a8:	e7450513          	addi	a0,a0,-396 # ffffffffc0208618 <commands+0x290>
ffffffffc02007ac:	921ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007b0:	606c                	ld	a1,192(s0)
ffffffffc02007b2:	00008517          	auipc	a0,0x8
ffffffffc02007b6:	e7e50513          	addi	a0,a0,-386 # ffffffffc0208630 <commands+0x2a8>
ffffffffc02007ba:	913ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007be:	646c                	ld	a1,200(s0)
ffffffffc02007c0:	00008517          	auipc	a0,0x8
ffffffffc02007c4:	e8850513          	addi	a0,a0,-376 # ffffffffc0208648 <commands+0x2c0>
ffffffffc02007c8:	905ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007cc:	686c                	ld	a1,208(s0)
ffffffffc02007ce:	00008517          	auipc	a0,0x8
ffffffffc02007d2:	e9250513          	addi	a0,a0,-366 # ffffffffc0208660 <commands+0x2d8>
ffffffffc02007d6:	8f7ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007da:	6c6c                	ld	a1,216(s0)
ffffffffc02007dc:	00008517          	auipc	a0,0x8
ffffffffc02007e0:	e9c50513          	addi	a0,a0,-356 # ffffffffc0208678 <commands+0x2f0>
ffffffffc02007e4:	8e9ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007e8:	706c                	ld	a1,224(s0)
ffffffffc02007ea:	00008517          	auipc	a0,0x8
ffffffffc02007ee:	ea650513          	addi	a0,a0,-346 # ffffffffc0208690 <commands+0x308>
ffffffffc02007f2:	8dbff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02007f6:	746c                	ld	a1,232(s0)
ffffffffc02007f8:	00008517          	auipc	a0,0x8
ffffffffc02007fc:	eb050513          	addi	a0,a0,-336 # ffffffffc02086a8 <commands+0x320>
ffffffffc0200800:	8cdff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200804:	786c                	ld	a1,240(s0)
ffffffffc0200806:	00008517          	auipc	a0,0x8
ffffffffc020080a:	eba50513          	addi	a0,a0,-326 # ffffffffc02086c0 <commands+0x338>
ffffffffc020080e:	8bfff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200812:	7c6c                	ld	a1,248(s0)
ffffffffc0200814:	6402                	ld	s0,0(sp)
ffffffffc0200816:	60a2                	ld	ra,8(sp)
ffffffffc0200818:	00008517          	auipc	a0,0x8
ffffffffc020081c:	ec050513          	addi	a0,a0,-320 # ffffffffc02086d8 <commands+0x350>
ffffffffc0200820:	0141                	addi	sp,sp,16
ffffffffc0200822:	8abff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200826 <print_trapframe>:
ffffffffc0200826:	1141                	addi	sp,sp,-16
ffffffffc0200828:	e022                	sd	s0,0(sp)
ffffffffc020082a:	85aa                	mv	a1,a0
ffffffffc020082c:	842a                	mv	s0,a0
ffffffffc020082e:	00008517          	auipc	a0,0x8
ffffffffc0200832:	ec250513          	addi	a0,a0,-318 # ffffffffc02086f0 <commands+0x368>
ffffffffc0200836:	e406                	sd	ra,8(sp)
ffffffffc0200838:	895ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020083c:	8522                	mv	a0,s0
ffffffffc020083e:	e1bff0ef          	jal	ra,ffffffffc0200658 <print_regs>
ffffffffc0200842:	10043583          	ld	a1,256(s0)
ffffffffc0200846:	00008517          	auipc	a0,0x8
ffffffffc020084a:	ec250513          	addi	a0,a0,-318 # ffffffffc0208708 <commands+0x380>
ffffffffc020084e:	87fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200852:	10843583          	ld	a1,264(s0)
ffffffffc0200856:	00008517          	auipc	a0,0x8
ffffffffc020085a:	eca50513          	addi	a0,a0,-310 # ffffffffc0208720 <commands+0x398>
ffffffffc020085e:	86fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200862:	11043583          	ld	a1,272(s0)
ffffffffc0200866:	00008517          	auipc	a0,0x8
ffffffffc020086a:	ed250513          	addi	a0,a0,-302 # ffffffffc0208738 <commands+0x3b0>
ffffffffc020086e:	85fff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200872:	11843583          	ld	a1,280(s0)
ffffffffc0200876:	6402                	ld	s0,0(sp)
ffffffffc0200878:	60a2                	ld	ra,8(sp)
ffffffffc020087a:	00008517          	auipc	a0,0x8
ffffffffc020087e:	ece50513          	addi	a0,a0,-306 # ffffffffc0208748 <commands+0x3c0>
ffffffffc0200882:	0141                	addi	sp,sp,16
ffffffffc0200884:	849ff06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0200888 <pgfault_handler>:
ffffffffc0200888:	1101                	addi	sp,sp,-32
ffffffffc020088a:	e426                	sd	s1,8(sp)
ffffffffc020088c:	00019497          	auipc	s1,0x19
ffffffffc0200890:	ccc48493          	addi	s1,s1,-820 # ffffffffc0219558 <check_mm_struct>
ffffffffc0200894:	609c                	ld	a5,0(s1)
ffffffffc0200896:	e822                	sd	s0,16(sp)
ffffffffc0200898:	ec06                	sd	ra,24(sp)
ffffffffc020089a:	842a                	mv	s0,a0
ffffffffc020089c:	cbad                	beqz	a5,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc020089e:	10053783          	ld	a5,256(a0)
ffffffffc02008a2:	11053583          	ld	a1,272(a0)
ffffffffc02008a6:	04b00613          	li	a2,75
ffffffffc02008aa:	1007f793          	andi	a5,a5,256
ffffffffc02008ae:	c7b1                	beqz	a5,ffffffffc02008fa <pgfault_handler+0x72>
ffffffffc02008b0:	11843703          	ld	a4,280(s0)
ffffffffc02008b4:	47bd                	li	a5,15
ffffffffc02008b6:	05700693          	li	a3,87
ffffffffc02008ba:	00f70463          	beq	a4,a5,ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc02008be:	05200693          	li	a3,82
ffffffffc02008c2:	00008517          	auipc	a0,0x8
ffffffffc02008c6:	e9e50513          	addi	a0,a0,-354 # ffffffffc0208760 <commands+0x3d8>
ffffffffc02008ca:	803ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02008ce:	6088                	ld	a0,0(s1)
ffffffffc02008d0:	cd1d                	beqz	a0,ffffffffc020090e <pgfault_handler+0x86>
ffffffffc02008d2:	00019717          	auipc	a4,0x19
ffffffffc02008d6:	c2e73703          	ld	a4,-978(a4) # ffffffffc0219500 <current>
ffffffffc02008da:	00019797          	auipc	a5,0x19
ffffffffc02008de:	c2e7b783          	ld	a5,-978(a5) # ffffffffc0219508 <idleproc>
ffffffffc02008e2:	04f71663          	bne	a4,a5,ffffffffc020092e <pgfault_handler+0xa6>
ffffffffc02008e6:	11043603          	ld	a2,272(s0)
ffffffffc02008ea:	11843583          	ld	a1,280(s0)
ffffffffc02008ee:	6442                	ld	s0,16(sp)
ffffffffc02008f0:	60e2                	ld	ra,24(sp)
ffffffffc02008f2:	64a2                	ld	s1,8(sp)
ffffffffc02008f4:	6105                	addi	sp,sp,32
ffffffffc02008f6:	1b40106f          	j	ffffffffc0201aaa <do_pgfault>
ffffffffc02008fa:	11843703          	ld	a4,280(s0)
ffffffffc02008fe:	47bd                	li	a5,15
ffffffffc0200900:	05500613          	li	a2,85
ffffffffc0200904:	05700693          	li	a3,87
ffffffffc0200908:	faf71be3          	bne	a4,a5,ffffffffc02008be <pgfault_handler+0x36>
ffffffffc020090c:	bf5d                	j	ffffffffc02008c2 <pgfault_handler+0x3a>
ffffffffc020090e:	00019797          	auipc	a5,0x19
ffffffffc0200912:	bf27b783          	ld	a5,-1038(a5) # ffffffffc0219500 <current>
ffffffffc0200916:	cf85                	beqz	a5,ffffffffc020094e <pgfault_handler+0xc6>
ffffffffc0200918:	11043603          	ld	a2,272(s0)
ffffffffc020091c:	11843583          	ld	a1,280(s0)
ffffffffc0200920:	6442                	ld	s0,16(sp)
ffffffffc0200922:	60e2                	ld	ra,24(sp)
ffffffffc0200924:	64a2                	ld	s1,8(sp)
ffffffffc0200926:	7788                	ld	a0,40(a5)
ffffffffc0200928:	6105                	addi	sp,sp,32
ffffffffc020092a:	1800106f          	j	ffffffffc0201aaa <do_pgfault>
ffffffffc020092e:	00008697          	auipc	a3,0x8
ffffffffc0200932:	e5268693          	addi	a3,a3,-430 # ffffffffc0208780 <commands+0x3f8>
ffffffffc0200936:	00008617          	auipc	a2,0x8
ffffffffc020093a:	e6260613          	addi	a2,a2,-414 # ffffffffc0208798 <commands+0x410>
ffffffffc020093e:	06c00593          	li	a1,108
ffffffffc0200942:	00008517          	auipc	a0,0x8
ffffffffc0200946:	e6e50513          	addi	a0,a0,-402 # ffffffffc02087b0 <commands+0x428>
ffffffffc020094a:	8bfff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020094e:	8522                	mv	a0,s0
ffffffffc0200950:	ed7ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200954:	10043783          	ld	a5,256(s0)
ffffffffc0200958:	11043583          	ld	a1,272(s0)
ffffffffc020095c:	04b00613          	li	a2,75
ffffffffc0200960:	1007f793          	andi	a5,a5,256
ffffffffc0200964:	e399                	bnez	a5,ffffffffc020096a <pgfault_handler+0xe2>
ffffffffc0200966:	05500613          	li	a2,85
ffffffffc020096a:	11843703          	ld	a4,280(s0)
ffffffffc020096e:	47bd                	li	a5,15
ffffffffc0200970:	02f70663          	beq	a4,a5,ffffffffc020099c <pgfault_handler+0x114>
ffffffffc0200974:	05200693          	li	a3,82
ffffffffc0200978:	00008517          	auipc	a0,0x8
ffffffffc020097c:	de850513          	addi	a0,a0,-536 # ffffffffc0208760 <commands+0x3d8>
ffffffffc0200980:	f4cff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200984:	00008617          	auipc	a2,0x8
ffffffffc0200988:	e4460613          	addi	a2,a2,-444 # ffffffffc02087c8 <commands+0x440>
ffffffffc020098c:	07300593          	li	a1,115
ffffffffc0200990:	00008517          	auipc	a0,0x8
ffffffffc0200994:	e2050513          	addi	a0,a0,-480 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200998:	871ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020099c:	05700693          	li	a3,87
ffffffffc02009a0:	bfe1                	j	ffffffffc0200978 <pgfault_handler+0xf0>

ffffffffc02009a2 <interrupt_handler>:
ffffffffc02009a2:	11853783          	ld	a5,280(a0)
ffffffffc02009a6:	472d                	li	a4,11
ffffffffc02009a8:	0786                	slli	a5,a5,0x1
ffffffffc02009aa:	8385                	srli	a5,a5,0x1
ffffffffc02009ac:	06f76863          	bltu	a4,a5,ffffffffc0200a1c <interrupt_handler+0x7a>
ffffffffc02009b0:	00008717          	auipc	a4,0x8
ffffffffc02009b4:	ed070713          	addi	a4,a4,-304 # ffffffffc0208880 <commands+0x4f8>
ffffffffc02009b8:	078a                	slli	a5,a5,0x2
ffffffffc02009ba:	97ba                	add	a5,a5,a4
ffffffffc02009bc:	439c                	lw	a5,0(a5)
ffffffffc02009be:	97ba                	add	a5,a5,a4
ffffffffc02009c0:	8782                	jr	a5
ffffffffc02009c2:	00008517          	auipc	a0,0x8
ffffffffc02009c6:	e7e50513          	addi	a0,a0,-386 # ffffffffc0208840 <commands+0x4b8>
ffffffffc02009ca:	f02ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009ce:	00008517          	auipc	a0,0x8
ffffffffc02009d2:	e5250513          	addi	a0,a0,-430 # ffffffffc0208820 <commands+0x498>
ffffffffc02009d6:	ef6ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009da:	00008517          	auipc	a0,0x8
ffffffffc02009de:	e0650513          	addi	a0,a0,-506 # ffffffffc02087e0 <commands+0x458>
ffffffffc02009e2:	eeaff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009e6:	00008517          	auipc	a0,0x8
ffffffffc02009ea:	e1a50513          	addi	a0,a0,-486 # ffffffffc0208800 <commands+0x478>
ffffffffc02009ee:	edeff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc02009f2:	1141                	addi	sp,sp,-16
ffffffffc02009f4:	e406                	sd	ra,8(sp)
ffffffffc02009f6:	bb1ff0ef          	jal	ra,ffffffffc02005a6 <clock_set_next_event>
ffffffffc02009fa:	00019717          	auipc	a4,0x19
ffffffffc02009fe:	b3670713          	addi	a4,a4,-1226 # ffffffffc0219530 <ticks>
ffffffffc0200a02:	631c                	ld	a5,0(a4)
ffffffffc0200a04:	60a2                	ld	ra,8(sp)
ffffffffc0200a06:	0785                	addi	a5,a5,1
ffffffffc0200a08:	e31c                	sd	a5,0(a4)
ffffffffc0200a0a:	0141                	addi	sp,sp,16
ffffffffc0200a0c:	4380406f          	j	ffffffffc0204e44 <run_timer_list>
ffffffffc0200a10:	00008517          	auipc	a0,0x8
ffffffffc0200a14:	e5050513          	addi	a0,a0,-432 # ffffffffc0208860 <commands+0x4d8>
ffffffffc0200a18:	eb4ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a1c:	b529                	j	ffffffffc0200826 <print_trapframe>

ffffffffc0200a1e <exception_handler>:
ffffffffc0200a1e:	11853783          	ld	a5,280(a0)
ffffffffc0200a22:	1101                	addi	sp,sp,-32
ffffffffc0200a24:	e822                	sd	s0,16(sp)
ffffffffc0200a26:	ec06                	sd	ra,24(sp)
ffffffffc0200a28:	e426                	sd	s1,8(sp)
ffffffffc0200a2a:	473d                	li	a4,15
ffffffffc0200a2c:	842a                	mv	s0,a0
ffffffffc0200a2e:	16f76163          	bltu	a4,a5,ffffffffc0200b90 <exception_handler+0x172>
ffffffffc0200a32:	00008717          	auipc	a4,0x8
ffffffffc0200a36:	01670713          	addi	a4,a4,22 # ffffffffc0208a48 <commands+0x6c0>
ffffffffc0200a3a:	078a                	slli	a5,a5,0x2
ffffffffc0200a3c:	97ba                	add	a5,a5,a4
ffffffffc0200a3e:	439c                	lw	a5,0(a5)
ffffffffc0200a40:	97ba                	add	a5,a5,a4
ffffffffc0200a42:	8782                	jr	a5
ffffffffc0200a44:	00008517          	auipc	a0,0x8
ffffffffc0200a48:	f5c50513          	addi	a0,a0,-164 # ffffffffc02089a0 <commands+0x618>
ffffffffc0200a4c:	e80ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a50:	10843783          	ld	a5,264(s0)
ffffffffc0200a54:	60e2                	ld	ra,24(sp)
ffffffffc0200a56:	64a2                	ld	s1,8(sp)
ffffffffc0200a58:	0791                	addi	a5,a5,4
ffffffffc0200a5a:	10f43423          	sd	a5,264(s0)
ffffffffc0200a5e:	6442                	ld	s0,16(sp)
ffffffffc0200a60:	6105                	addi	sp,sp,32
ffffffffc0200a62:	1840706f          	j	ffffffffc0207be6 <syscall>
ffffffffc0200a66:	00008517          	auipc	a0,0x8
ffffffffc0200a6a:	f5a50513          	addi	a0,a0,-166 # ffffffffc02089c0 <commands+0x638>
ffffffffc0200a6e:	6442                	ld	s0,16(sp)
ffffffffc0200a70:	60e2                	ld	ra,24(sp)
ffffffffc0200a72:	64a2                	ld	s1,8(sp)
ffffffffc0200a74:	6105                	addi	sp,sp,32
ffffffffc0200a76:	e56ff06f          	j	ffffffffc02000cc <cprintf>
ffffffffc0200a7a:	00008517          	auipc	a0,0x8
ffffffffc0200a7e:	f6650513          	addi	a0,a0,-154 # ffffffffc02089e0 <commands+0x658>
ffffffffc0200a82:	b7f5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a84:	00008517          	auipc	a0,0x8
ffffffffc0200a88:	f7c50513          	addi	a0,a0,-132 # ffffffffc0208a00 <commands+0x678>
ffffffffc0200a8c:	b7cd                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200a8e:	00008517          	auipc	a0,0x8
ffffffffc0200a92:	f8a50513          	addi	a0,a0,-118 # ffffffffc0208a18 <commands+0x690>
ffffffffc0200a96:	e36ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200a9a:	8522                	mv	a0,s0
ffffffffc0200a9c:	dedff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200aa0:	84aa                	mv	s1,a0
ffffffffc0200aa2:	10051963          	bnez	a0,ffffffffc0200bb4 <exception_handler+0x196>
ffffffffc0200aa6:	60e2                	ld	ra,24(sp)
ffffffffc0200aa8:	6442                	ld	s0,16(sp)
ffffffffc0200aaa:	64a2                	ld	s1,8(sp)
ffffffffc0200aac:	6105                	addi	sp,sp,32
ffffffffc0200aae:	8082                	ret
ffffffffc0200ab0:	00008517          	auipc	a0,0x8
ffffffffc0200ab4:	f8050513          	addi	a0,a0,-128 # ffffffffc0208a30 <commands+0x6a8>
ffffffffc0200ab8:	e14ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200abc:	8522                	mv	a0,s0
ffffffffc0200abe:	dcbff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200ac2:	84aa                	mv	s1,a0
ffffffffc0200ac4:	d16d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200ac6:	8522                	mv	a0,s0
ffffffffc0200ac8:	d5fff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200acc:	86a6                	mv	a3,s1
ffffffffc0200ace:	00008617          	auipc	a2,0x8
ffffffffc0200ad2:	e8260613          	addi	a2,a2,-382 # ffffffffc0208950 <commands+0x5c8>
ffffffffc0200ad6:	0f600593          	li	a1,246
ffffffffc0200ada:	00008517          	auipc	a0,0x8
ffffffffc0200ade:	cd650513          	addi	a0,a0,-810 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200ae2:	f26ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200ae6:	00008517          	auipc	a0,0x8
ffffffffc0200aea:	dca50513          	addi	a0,a0,-566 # ffffffffc02088b0 <commands+0x528>
ffffffffc0200aee:	b741                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200af0:	00008517          	auipc	a0,0x8
ffffffffc0200af4:	de050513          	addi	a0,a0,-544 # ffffffffc02088d0 <commands+0x548>
ffffffffc0200af8:	bf9d                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200afa:	00008517          	auipc	a0,0x8
ffffffffc0200afe:	df650513          	addi	a0,a0,-522 # ffffffffc02088f0 <commands+0x568>
ffffffffc0200b02:	b7b5                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b04:	00008517          	auipc	a0,0x8
ffffffffc0200b08:	e0450513          	addi	a0,a0,-508 # ffffffffc0208908 <commands+0x580>
ffffffffc0200b0c:	dc0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b10:	6458                	ld	a4,136(s0)
ffffffffc0200b12:	47a9                	li	a5,10
ffffffffc0200b14:	f8f719e3          	bne	a4,a5,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b18:	bf25                	j	ffffffffc0200a50 <exception_handler+0x32>
ffffffffc0200b1a:	00008517          	auipc	a0,0x8
ffffffffc0200b1e:	dfe50513          	addi	a0,a0,-514 # ffffffffc0208918 <commands+0x590>
ffffffffc0200b22:	b7b1                	j	ffffffffc0200a6e <exception_handler+0x50>
ffffffffc0200b24:	00008517          	auipc	a0,0x8
ffffffffc0200b28:	e1450513          	addi	a0,a0,-492 # ffffffffc0208938 <commands+0x5b0>
ffffffffc0200b2c:	da0ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b30:	8522                	mv	a0,s0
ffffffffc0200b32:	d57ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b36:	84aa                	mv	s1,a0
ffffffffc0200b38:	d53d                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b3a:	8522                	mv	a0,s0
ffffffffc0200b3c:	cebff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b40:	86a6                	mv	a3,s1
ffffffffc0200b42:	00008617          	auipc	a2,0x8
ffffffffc0200b46:	e0e60613          	addi	a2,a2,-498 # ffffffffc0208950 <commands+0x5c8>
ffffffffc0200b4a:	0cb00593          	li	a1,203
ffffffffc0200b4e:	00008517          	auipc	a0,0x8
ffffffffc0200b52:	c6250513          	addi	a0,a0,-926 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200b56:	eb2ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b5a:	00008517          	auipc	a0,0x8
ffffffffc0200b5e:	e2e50513          	addi	a0,a0,-466 # ffffffffc0208988 <commands+0x600>
ffffffffc0200b62:	d6aff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200b66:	8522                	mv	a0,s0
ffffffffc0200b68:	d21ff0ef          	jal	ra,ffffffffc0200888 <pgfault_handler>
ffffffffc0200b6c:	84aa                	mv	s1,a0
ffffffffc0200b6e:	dd05                	beqz	a0,ffffffffc0200aa6 <exception_handler+0x88>
ffffffffc0200b70:	8522                	mv	a0,s0
ffffffffc0200b72:	cb5ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200b76:	86a6                	mv	a3,s1
ffffffffc0200b78:	00008617          	auipc	a2,0x8
ffffffffc0200b7c:	dd860613          	addi	a2,a2,-552 # ffffffffc0208950 <commands+0x5c8>
ffffffffc0200b80:	0d500593          	li	a1,213
ffffffffc0200b84:	00008517          	auipc	a0,0x8
ffffffffc0200b88:	c2c50513          	addi	a0,a0,-980 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200b8c:	e7cff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200b90:	8522                	mv	a0,s0
ffffffffc0200b92:	6442                	ld	s0,16(sp)
ffffffffc0200b94:	60e2                	ld	ra,24(sp)
ffffffffc0200b96:	64a2                	ld	s1,8(sp)
ffffffffc0200b98:	6105                	addi	sp,sp,32
ffffffffc0200b9a:	b171                	j	ffffffffc0200826 <print_trapframe>
ffffffffc0200b9c:	00008617          	auipc	a2,0x8
ffffffffc0200ba0:	dd460613          	addi	a2,a2,-556 # ffffffffc0208970 <commands+0x5e8>
ffffffffc0200ba4:	0cf00593          	li	a1,207
ffffffffc0200ba8:	00008517          	auipc	a0,0x8
ffffffffc0200bac:	c0850513          	addi	a0,a0,-1016 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200bb0:	e58ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200bb4:	8522                	mv	a0,s0
ffffffffc0200bb6:	c71ff0ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0200bba:	86a6                	mv	a3,s1
ffffffffc0200bbc:	00008617          	auipc	a2,0x8
ffffffffc0200bc0:	d9460613          	addi	a2,a2,-620 # ffffffffc0208950 <commands+0x5c8>
ffffffffc0200bc4:	0ef00593          	li	a1,239
ffffffffc0200bc8:	00008517          	auipc	a0,0x8
ffffffffc0200bcc:	be850513          	addi	a0,a0,-1048 # ffffffffc02087b0 <commands+0x428>
ffffffffc0200bd0:	e38ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200bd4 <trap>:
ffffffffc0200bd4:	1101                	addi	sp,sp,-32
ffffffffc0200bd6:	e822                	sd	s0,16(sp)
ffffffffc0200bd8:	00019417          	auipc	s0,0x19
ffffffffc0200bdc:	92840413          	addi	s0,s0,-1752 # ffffffffc0219500 <current>
ffffffffc0200be0:	6018                	ld	a4,0(s0)
ffffffffc0200be2:	ec06                	sd	ra,24(sp)
ffffffffc0200be4:	e426                	sd	s1,8(sp)
ffffffffc0200be6:	e04a                	sd	s2,0(sp)
ffffffffc0200be8:	11853683          	ld	a3,280(a0)
ffffffffc0200bec:	cf1d                	beqz	a4,ffffffffc0200c2a <trap+0x56>
ffffffffc0200bee:	10053483          	ld	s1,256(a0)
ffffffffc0200bf2:	0a073903          	ld	s2,160(a4)
ffffffffc0200bf6:	f348                	sd	a0,160(a4)
ffffffffc0200bf8:	1004f493          	andi	s1,s1,256
ffffffffc0200bfc:	0206c463          	bltz	a3,ffffffffc0200c24 <trap+0x50>
ffffffffc0200c00:	e1fff0ef          	jal	ra,ffffffffc0200a1e <exception_handler>
ffffffffc0200c04:	601c                	ld	a5,0(s0)
ffffffffc0200c06:	0b27b023          	sd	s2,160(a5)
ffffffffc0200c0a:	e499                	bnez	s1,ffffffffc0200c18 <trap+0x44>
ffffffffc0200c0c:	0b07a703          	lw	a4,176(a5)
ffffffffc0200c10:	8b05                	andi	a4,a4,1
ffffffffc0200c12:	e329                	bnez	a4,ffffffffc0200c54 <trap+0x80>
ffffffffc0200c14:	6f9c                	ld	a5,24(a5)
ffffffffc0200c16:	eb85                	bnez	a5,ffffffffc0200c46 <trap+0x72>
ffffffffc0200c18:	60e2                	ld	ra,24(sp)
ffffffffc0200c1a:	6442                	ld	s0,16(sp)
ffffffffc0200c1c:	64a2                	ld	s1,8(sp)
ffffffffc0200c1e:	6902                	ld	s2,0(sp)
ffffffffc0200c20:	6105                	addi	sp,sp,32
ffffffffc0200c22:	8082                	ret
ffffffffc0200c24:	d7fff0ef          	jal	ra,ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c28:	bff1                	j	ffffffffc0200c04 <trap+0x30>
ffffffffc0200c2a:	0006c863          	bltz	a3,ffffffffc0200c3a <trap+0x66>
ffffffffc0200c2e:	6442                	ld	s0,16(sp)
ffffffffc0200c30:	60e2                	ld	ra,24(sp)
ffffffffc0200c32:	64a2                	ld	s1,8(sp)
ffffffffc0200c34:	6902                	ld	s2,0(sp)
ffffffffc0200c36:	6105                	addi	sp,sp,32
ffffffffc0200c38:	b3dd                	j	ffffffffc0200a1e <exception_handler>
ffffffffc0200c3a:	6442                	ld	s0,16(sp)
ffffffffc0200c3c:	60e2                	ld	ra,24(sp)
ffffffffc0200c3e:	64a2                	ld	s1,8(sp)
ffffffffc0200c40:	6902                	ld	s2,0(sp)
ffffffffc0200c42:	6105                	addi	sp,sp,32
ffffffffc0200c44:	bbb9                	j	ffffffffc02009a2 <interrupt_handler>
ffffffffc0200c46:	6442                	ld	s0,16(sp)
ffffffffc0200c48:	60e2                	ld	ra,24(sp)
ffffffffc0200c4a:	64a2                	ld	s1,8(sp)
ffffffffc0200c4c:	6902                	ld	s2,0(sp)
ffffffffc0200c4e:	6105                	addi	sp,sp,32
ffffffffc0200c50:	7e30306f          	j	ffffffffc0204c32 <schedule>
ffffffffc0200c54:	555d                	li	a0,-9
ffffffffc0200c56:	262030ef          	jal	ra,ffffffffc0203eb8 <do_exit>
ffffffffc0200c5a:	601c                	ld	a5,0(s0)
ffffffffc0200c5c:	bf65                	j	ffffffffc0200c14 <trap+0x40>
	...

ffffffffc0200c60 <__alltraps>:
ffffffffc0200c60:	14011173          	csrrw	sp,sscratch,sp
ffffffffc0200c64:	00011463          	bnez	sp,ffffffffc0200c6c <__alltraps+0xc>
ffffffffc0200c68:	14002173          	csrr	sp,sscratch
ffffffffc0200c6c:	712d                	addi	sp,sp,-288
ffffffffc0200c6e:	e002                	sd	zero,0(sp)
ffffffffc0200c70:	e406                	sd	ra,8(sp)
ffffffffc0200c72:	ec0e                	sd	gp,24(sp)
ffffffffc0200c74:	f012                	sd	tp,32(sp)
ffffffffc0200c76:	f416                	sd	t0,40(sp)
ffffffffc0200c78:	f81a                	sd	t1,48(sp)
ffffffffc0200c7a:	fc1e                	sd	t2,56(sp)
ffffffffc0200c7c:	e0a2                	sd	s0,64(sp)
ffffffffc0200c7e:	e4a6                	sd	s1,72(sp)
ffffffffc0200c80:	e8aa                	sd	a0,80(sp)
ffffffffc0200c82:	ecae                	sd	a1,88(sp)
ffffffffc0200c84:	f0b2                	sd	a2,96(sp)
ffffffffc0200c86:	f4b6                	sd	a3,104(sp)
ffffffffc0200c88:	f8ba                	sd	a4,112(sp)
ffffffffc0200c8a:	fcbe                	sd	a5,120(sp)
ffffffffc0200c8c:	e142                	sd	a6,128(sp)
ffffffffc0200c8e:	e546                	sd	a7,136(sp)
ffffffffc0200c90:	e94a                	sd	s2,144(sp)
ffffffffc0200c92:	ed4e                	sd	s3,152(sp)
ffffffffc0200c94:	f152                	sd	s4,160(sp)
ffffffffc0200c96:	f556                	sd	s5,168(sp)
ffffffffc0200c98:	f95a                	sd	s6,176(sp)
ffffffffc0200c9a:	fd5e                	sd	s7,184(sp)
ffffffffc0200c9c:	e1e2                	sd	s8,192(sp)
ffffffffc0200c9e:	e5e6                	sd	s9,200(sp)
ffffffffc0200ca0:	e9ea                	sd	s10,208(sp)
ffffffffc0200ca2:	edee                	sd	s11,216(sp)
ffffffffc0200ca4:	f1f2                	sd	t3,224(sp)
ffffffffc0200ca6:	f5f6                	sd	t4,232(sp)
ffffffffc0200ca8:	f9fa                	sd	t5,240(sp)
ffffffffc0200caa:	fdfe                	sd	t6,248(sp)
ffffffffc0200cac:	14001473          	csrrw	s0,sscratch,zero
ffffffffc0200cb0:	100024f3          	csrr	s1,sstatus
ffffffffc0200cb4:	14102973          	csrr	s2,sepc
ffffffffc0200cb8:	143029f3          	csrr	s3,stval
ffffffffc0200cbc:	14202a73          	csrr	s4,scause
ffffffffc0200cc0:	e822                	sd	s0,16(sp)
ffffffffc0200cc2:	e226                	sd	s1,256(sp)
ffffffffc0200cc4:	e64a                	sd	s2,264(sp)
ffffffffc0200cc6:	ea4e                	sd	s3,272(sp)
ffffffffc0200cc8:	ee52                	sd	s4,280(sp)
ffffffffc0200cca:	850a                	mv	a0,sp
ffffffffc0200ccc:	f09ff0ef          	jal	ra,ffffffffc0200bd4 <trap>

ffffffffc0200cd0 <__trapret>:
ffffffffc0200cd0:	6492                	ld	s1,256(sp)
ffffffffc0200cd2:	6932                	ld	s2,264(sp)
ffffffffc0200cd4:	1004f413          	andi	s0,s1,256
ffffffffc0200cd8:	e401                	bnez	s0,ffffffffc0200ce0 <__trapret+0x10>
ffffffffc0200cda:	1200                	addi	s0,sp,288
ffffffffc0200cdc:	14041073          	csrw	sscratch,s0
ffffffffc0200ce0:	10049073          	csrw	sstatus,s1
ffffffffc0200ce4:	14191073          	csrw	sepc,s2
ffffffffc0200ce8:	60a2                	ld	ra,8(sp)
ffffffffc0200cea:	61e2                	ld	gp,24(sp)
ffffffffc0200cec:	7202                	ld	tp,32(sp)
ffffffffc0200cee:	72a2                	ld	t0,40(sp)
ffffffffc0200cf0:	7342                	ld	t1,48(sp)
ffffffffc0200cf2:	73e2                	ld	t2,56(sp)
ffffffffc0200cf4:	6406                	ld	s0,64(sp)
ffffffffc0200cf6:	64a6                	ld	s1,72(sp)
ffffffffc0200cf8:	6546                	ld	a0,80(sp)
ffffffffc0200cfa:	65e6                	ld	a1,88(sp)
ffffffffc0200cfc:	7606                	ld	a2,96(sp)
ffffffffc0200cfe:	76a6                	ld	a3,104(sp)
ffffffffc0200d00:	7746                	ld	a4,112(sp)
ffffffffc0200d02:	77e6                	ld	a5,120(sp)
ffffffffc0200d04:	680a                	ld	a6,128(sp)
ffffffffc0200d06:	68aa                	ld	a7,136(sp)
ffffffffc0200d08:	694a                	ld	s2,144(sp)
ffffffffc0200d0a:	69ea                	ld	s3,152(sp)
ffffffffc0200d0c:	7a0a                	ld	s4,160(sp)
ffffffffc0200d0e:	7aaa                	ld	s5,168(sp)
ffffffffc0200d10:	7b4a                	ld	s6,176(sp)
ffffffffc0200d12:	7bea                	ld	s7,184(sp)
ffffffffc0200d14:	6c0e                	ld	s8,192(sp)
ffffffffc0200d16:	6cae                	ld	s9,200(sp)
ffffffffc0200d18:	6d4e                	ld	s10,208(sp)
ffffffffc0200d1a:	6dee                	ld	s11,216(sp)
ffffffffc0200d1c:	7e0e                	ld	t3,224(sp)
ffffffffc0200d1e:	7eae                	ld	t4,232(sp)
ffffffffc0200d20:	7f4e                	ld	t5,240(sp)
ffffffffc0200d22:	7fee                	ld	t6,248(sp)
ffffffffc0200d24:	6142                	ld	sp,16(sp)
ffffffffc0200d26:	10200073          	sret

ffffffffc0200d2a <forkrets>:
ffffffffc0200d2a:	812a                	mv	sp,a0
ffffffffc0200d2c:	b755                	j	ffffffffc0200cd0 <__trapret>

ffffffffc0200d2e <pa2page.part.0>:
ffffffffc0200d2e:	1141                	addi	sp,sp,-16
ffffffffc0200d30:	00008617          	auipc	a2,0x8
ffffffffc0200d34:	d5860613          	addi	a2,a2,-680 # ffffffffc0208a88 <commands+0x700>
ffffffffc0200d38:	06200593          	li	a1,98
ffffffffc0200d3c:	00008517          	auipc	a0,0x8
ffffffffc0200d40:	d6c50513          	addi	a0,a0,-660 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0200d44:	e406                	sd	ra,8(sp)
ffffffffc0200d46:	cc2ff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0200d4a <alloc_pages>:
ffffffffc0200d4a:	7139                	addi	sp,sp,-64
ffffffffc0200d4c:	f426                	sd	s1,40(sp)
ffffffffc0200d4e:	f04a                	sd	s2,32(sp)
ffffffffc0200d50:	ec4e                	sd	s3,24(sp)
ffffffffc0200d52:	e852                	sd	s4,16(sp)
ffffffffc0200d54:	e456                	sd	s5,8(sp)
ffffffffc0200d56:	e05a                	sd	s6,0(sp)
ffffffffc0200d58:	fc06                	sd	ra,56(sp)
ffffffffc0200d5a:	f822                	sd	s0,48(sp)
ffffffffc0200d5c:	84aa                	mv	s1,a0
ffffffffc0200d5e:	00018917          	auipc	s2,0x18
ffffffffc0200d62:	7da90913          	addi	s2,s2,2010 # ffffffffc0219538 <pmm_manager>
ffffffffc0200d66:	4a05                	li	s4,1
ffffffffc0200d68:	00018a97          	auipc	s5,0x18
ffffffffc0200d6c:	788a8a93          	addi	s5,s5,1928 # ffffffffc02194f0 <swap_init_ok>
ffffffffc0200d70:	0005099b          	sext.w	s3,a0
ffffffffc0200d74:	00018b17          	auipc	s6,0x18
ffffffffc0200d78:	7e4b0b13          	addi	s6,s6,2020 # ffffffffc0219558 <check_mm_struct>
ffffffffc0200d7c:	a01d                	j	ffffffffc0200da2 <alloc_pages+0x58>
ffffffffc0200d7e:	00093783          	ld	a5,0(s2)
ffffffffc0200d82:	6f9c                	ld	a5,24(a5)
ffffffffc0200d84:	9782                	jalr	a5
ffffffffc0200d86:	842a                	mv	s0,a0
ffffffffc0200d88:	4601                	li	a2,0
ffffffffc0200d8a:	85ce                	mv	a1,s3
ffffffffc0200d8c:	ec0d                	bnez	s0,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d8e:	029a6c63          	bltu	s4,s1,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d92:	000aa783          	lw	a5,0(s5)
ffffffffc0200d96:	2781                	sext.w	a5,a5
ffffffffc0200d98:	c79d                	beqz	a5,ffffffffc0200dc6 <alloc_pages+0x7c>
ffffffffc0200d9a:	000b3503          	ld	a0,0(s6)
ffffffffc0200d9e:	745000ef          	jal	ra,ffffffffc0201ce2 <swap_out>
ffffffffc0200da2:	100027f3          	csrr	a5,sstatus
ffffffffc0200da6:	8b89                	andi	a5,a5,2
ffffffffc0200da8:	8526                	mv	a0,s1
ffffffffc0200daa:	dbf1                	beqz	a5,ffffffffc0200d7e <alloc_pages+0x34>
ffffffffc0200dac:	88dff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200db0:	00093783          	ld	a5,0(s2)
ffffffffc0200db4:	8526                	mv	a0,s1
ffffffffc0200db6:	6f9c                	ld	a5,24(a5)
ffffffffc0200db8:	9782                	jalr	a5
ffffffffc0200dba:	842a                	mv	s0,a0
ffffffffc0200dbc:	877ff0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200dc0:	4601                	li	a2,0
ffffffffc0200dc2:	85ce                	mv	a1,s3
ffffffffc0200dc4:	d469                	beqz	s0,ffffffffc0200d8e <alloc_pages+0x44>
ffffffffc0200dc6:	70e2                	ld	ra,56(sp)
ffffffffc0200dc8:	8522                	mv	a0,s0
ffffffffc0200dca:	7442                	ld	s0,48(sp)
ffffffffc0200dcc:	74a2                	ld	s1,40(sp)
ffffffffc0200dce:	7902                	ld	s2,32(sp)
ffffffffc0200dd0:	69e2                	ld	s3,24(sp)
ffffffffc0200dd2:	6a42                	ld	s4,16(sp)
ffffffffc0200dd4:	6aa2                	ld	s5,8(sp)
ffffffffc0200dd6:	6b02                	ld	s6,0(sp)
ffffffffc0200dd8:	6121                	addi	sp,sp,64
ffffffffc0200dda:	8082                	ret

ffffffffc0200ddc <free_pages>:
ffffffffc0200ddc:	100027f3          	csrr	a5,sstatus
ffffffffc0200de0:	8b89                	andi	a5,a5,2
ffffffffc0200de2:	eb81                	bnez	a5,ffffffffc0200df2 <free_pages+0x16>
ffffffffc0200de4:	00018797          	auipc	a5,0x18
ffffffffc0200de8:	7547b783          	ld	a5,1876(a5) # ffffffffc0219538 <pmm_manager>
ffffffffc0200dec:	0207b303          	ld	t1,32(a5)
ffffffffc0200df0:	8302                	jr	t1
ffffffffc0200df2:	1101                	addi	sp,sp,-32
ffffffffc0200df4:	ec06                	sd	ra,24(sp)
ffffffffc0200df6:	e822                	sd	s0,16(sp)
ffffffffc0200df8:	e426                	sd	s1,8(sp)
ffffffffc0200dfa:	842a                	mv	s0,a0
ffffffffc0200dfc:	84ae                	mv	s1,a1
ffffffffc0200dfe:	83bff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200e02:	00018797          	auipc	a5,0x18
ffffffffc0200e06:	7367b783          	ld	a5,1846(a5) # ffffffffc0219538 <pmm_manager>
ffffffffc0200e0a:	739c                	ld	a5,32(a5)
ffffffffc0200e0c:	85a6                	mv	a1,s1
ffffffffc0200e0e:	8522                	mv	a0,s0
ffffffffc0200e10:	9782                	jalr	a5
ffffffffc0200e12:	6442                	ld	s0,16(sp)
ffffffffc0200e14:	60e2                	ld	ra,24(sp)
ffffffffc0200e16:	64a2                	ld	s1,8(sp)
ffffffffc0200e18:	6105                	addi	sp,sp,32
ffffffffc0200e1a:	819ff06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0200e1e <nr_free_pages>:
ffffffffc0200e1e:	100027f3          	csrr	a5,sstatus
ffffffffc0200e22:	8b89                	andi	a5,a5,2
ffffffffc0200e24:	eb81                	bnez	a5,ffffffffc0200e34 <nr_free_pages+0x16>
ffffffffc0200e26:	00018797          	auipc	a5,0x18
ffffffffc0200e2a:	7127b783          	ld	a5,1810(a5) # ffffffffc0219538 <pmm_manager>
ffffffffc0200e2e:	0287b303          	ld	t1,40(a5)
ffffffffc0200e32:	8302                	jr	t1
ffffffffc0200e34:	1141                	addi	sp,sp,-16
ffffffffc0200e36:	e406                	sd	ra,8(sp)
ffffffffc0200e38:	e022                	sd	s0,0(sp)
ffffffffc0200e3a:	ffeff0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0200e3e:	00018797          	auipc	a5,0x18
ffffffffc0200e42:	6fa7b783          	ld	a5,1786(a5) # ffffffffc0219538 <pmm_manager>
ffffffffc0200e46:	779c                	ld	a5,40(a5)
ffffffffc0200e48:	9782                	jalr	a5
ffffffffc0200e4a:	842a                	mv	s0,a0
ffffffffc0200e4c:	fe6ff0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0200e50:	60a2                	ld	ra,8(sp)
ffffffffc0200e52:	8522                	mv	a0,s0
ffffffffc0200e54:	6402                	ld	s0,0(sp)
ffffffffc0200e56:	0141                	addi	sp,sp,16
ffffffffc0200e58:	8082                	ret

ffffffffc0200e5a <pmm_init>:
ffffffffc0200e5a:	00008797          	auipc	a5,0x8
ffffffffc0200e5e:	67e78793          	addi	a5,a5,1662 # ffffffffc02094d8 <default_pmm_manager>
ffffffffc0200e62:	638c                	ld	a1,0(a5)
ffffffffc0200e64:	1101                	addi	sp,sp,-32
ffffffffc0200e66:	e426                	sd	s1,8(sp)
ffffffffc0200e68:	00008517          	auipc	a0,0x8
ffffffffc0200e6c:	c5050513          	addi	a0,a0,-944 # ffffffffc0208ab8 <commands+0x730>
ffffffffc0200e70:	00018497          	auipc	s1,0x18
ffffffffc0200e74:	6c848493          	addi	s1,s1,1736 # ffffffffc0219538 <pmm_manager>
ffffffffc0200e78:	ec06                	sd	ra,24(sp)
ffffffffc0200e7a:	e822                	sd	s0,16(sp)
ffffffffc0200e7c:	e09c                	sd	a5,0(s1)
ffffffffc0200e7e:	a4eff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200e82:	609c                	ld	a5,0(s1)
ffffffffc0200e84:	00018417          	auipc	s0,0x18
ffffffffc0200e88:	6bc40413          	addi	s0,s0,1724 # ffffffffc0219540 <va_pa_offset>
ffffffffc0200e8c:	679c                	ld	a5,8(a5)
ffffffffc0200e8e:	9782                	jalr	a5
ffffffffc0200e90:	57f5                	li	a5,-3
ffffffffc0200e92:	07fa                	slli	a5,a5,0x1e
ffffffffc0200e94:	00008517          	auipc	a0,0x8
ffffffffc0200e98:	c3c50513          	addi	a0,a0,-964 # ffffffffc0208ad0 <commands+0x748>
ffffffffc0200e9c:	e01c                	sd	a5,0(s0)
ffffffffc0200e9e:	a2eff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200ea2:	44300693          	li	a3,1091
ffffffffc0200ea6:	06d6                	slli	a3,a3,0x15
ffffffffc0200ea8:	40100613          	li	a2,1025
ffffffffc0200eac:	0656                	slli	a2,a2,0x15
ffffffffc0200eae:	088005b7          	lui	a1,0x8800
ffffffffc0200eb2:	16fd                	addi	a3,a3,-1
ffffffffc0200eb4:	00008517          	auipc	a0,0x8
ffffffffc0200eb8:	c3450513          	addi	a0,a0,-972 # ffffffffc0208ae8 <commands+0x760>
ffffffffc0200ebc:	a10ff0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0200ec0:	777d                	lui	a4,0xfffff
ffffffffc0200ec2:	0001a797          	auipc	a5,0x1a
ffffffffc0200ec6:	80d78793          	addi	a5,a5,-2035 # ffffffffc021a6cf <end+0xfff>
ffffffffc0200eca:	8ff9                	and	a5,a5,a4
ffffffffc0200ecc:	00088737          	lui	a4,0x88
ffffffffc0200ed0:	60070713          	addi	a4,a4,1536 # 88600 <kern_entry-0xffffffffc0177a00>
ffffffffc0200ed4:	00018597          	auipc	a1,0x18
ffffffffc0200ed8:	60458593          	addi	a1,a1,1540 # ffffffffc02194d8 <npage>
ffffffffc0200edc:	00018617          	auipc	a2,0x18
ffffffffc0200ee0:	67460613          	addi	a2,a2,1652 # ffffffffc0219550 <pages>
ffffffffc0200ee4:	e198                	sd	a4,0(a1)
ffffffffc0200ee6:	e21c                	sd	a5,0(a2)
ffffffffc0200ee8:	4701                	li	a4,0
ffffffffc0200eea:	4505                	li	a0,1
ffffffffc0200eec:	fff80837          	lui	a6,0xfff80
ffffffffc0200ef0:	a011                	j	ffffffffc0200ef4 <pmm_init+0x9a>
ffffffffc0200ef2:	621c                	ld	a5,0(a2)
ffffffffc0200ef4:	00671693          	slli	a3,a4,0x6
ffffffffc0200ef8:	97b6                	add	a5,a5,a3
ffffffffc0200efa:	07a1                	addi	a5,a5,8
ffffffffc0200efc:	40a7b02f          	amoor.d	zero,a0,(a5)
ffffffffc0200f00:	0005b883          	ld	a7,0(a1)
ffffffffc0200f04:	0705                	addi	a4,a4,1
ffffffffc0200f06:	010886b3          	add	a3,a7,a6
ffffffffc0200f0a:	fed764e3          	bltu	a4,a3,ffffffffc0200ef2 <pmm_init+0x98>
ffffffffc0200f0e:	6208                	ld	a0,0(a2)
ffffffffc0200f10:	069a                	slli	a3,a3,0x6
ffffffffc0200f12:	c02007b7          	lui	a5,0xc0200
ffffffffc0200f16:	96aa                	add	a3,a3,a0
ffffffffc0200f18:	06f6e163          	bltu	a3,a5,ffffffffc0200f7a <pmm_init+0x120>
ffffffffc0200f1c:	601c                	ld	a5,0(s0)
ffffffffc0200f1e:	44300593          	li	a1,1091
ffffffffc0200f22:	05d6                	slli	a1,a1,0x15
ffffffffc0200f24:	8e9d                	sub	a3,a3,a5
ffffffffc0200f26:	02b6f363          	bgeu	a3,a1,ffffffffc0200f4c <pmm_init+0xf2>
ffffffffc0200f2a:	6785                	lui	a5,0x1
ffffffffc0200f2c:	17fd                	addi	a5,a5,-1
ffffffffc0200f2e:	96be                	add	a3,a3,a5
ffffffffc0200f30:	00c6d793          	srli	a5,a3,0xc
ffffffffc0200f34:	0717fb63          	bgeu	a5,a7,ffffffffc0200faa <pmm_init+0x150>
ffffffffc0200f38:	6098                	ld	a4,0(s1)
ffffffffc0200f3a:	767d                	lui	a2,0xfffff
ffffffffc0200f3c:	8ef1                	and	a3,a3,a2
ffffffffc0200f3e:	97c2                	add	a5,a5,a6
ffffffffc0200f40:	6b18                	ld	a4,16(a4)
ffffffffc0200f42:	8d95                	sub	a1,a1,a3
ffffffffc0200f44:	079a                	slli	a5,a5,0x6
ffffffffc0200f46:	81b1                	srli	a1,a1,0xc
ffffffffc0200f48:	953e                	add	a0,a0,a5
ffffffffc0200f4a:	9702                	jalr	a4
ffffffffc0200f4c:	0000c697          	auipc	a3,0xc
ffffffffc0200f50:	0b468693          	addi	a3,a3,180 # ffffffffc020d000 <boot_page_table_sv39>
ffffffffc0200f54:	00018797          	auipc	a5,0x18
ffffffffc0200f58:	56d7be23          	sd	a3,1404(a5) # ffffffffc02194d0 <boot_pgdir>
ffffffffc0200f5c:	c02007b7          	lui	a5,0xc0200
ffffffffc0200f60:	02f6e963          	bltu	a3,a5,ffffffffc0200f92 <pmm_init+0x138>
ffffffffc0200f64:	601c                	ld	a5,0(s0)
ffffffffc0200f66:	60e2                	ld	ra,24(sp)
ffffffffc0200f68:	6442                	ld	s0,16(sp)
ffffffffc0200f6a:	8e9d                	sub	a3,a3,a5
ffffffffc0200f6c:	00018797          	auipc	a5,0x18
ffffffffc0200f70:	5cd7be23          	sd	a3,1500(a5) # ffffffffc0219548 <boot_cr3>
ffffffffc0200f74:	64a2                	ld	s1,8(sp)
ffffffffc0200f76:	6105                	addi	sp,sp,32
ffffffffc0200f78:	8082                	ret
ffffffffc0200f7a:	00008617          	auipc	a2,0x8
ffffffffc0200f7e:	b9660613          	addi	a2,a2,-1130 # ffffffffc0208b10 <commands+0x788>
ffffffffc0200f82:	07f00593          	li	a1,127
ffffffffc0200f86:	00008517          	auipc	a0,0x8
ffffffffc0200f8a:	bb250513          	addi	a0,a0,-1102 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0200f8e:	a7aff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200f92:	00008617          	auipc	a2,0x8
ffffffffc0200f96:	b7e60613          	addi	a2,a2,-1154 # ffffffffc0208b10 <commands+0x788>
ffffffffc0200f9a:	0c100593          	li	a1,193
ffffffffc0200f9e:	00008517          	auipc	a0,0x8
ffffffffc0200fa2:	b9a50513          	addi	a0,a0,-1126 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0200fa6:	a62ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0200faa:	d85ff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0200fae <get_pte>:
ffffffffc0200fae:	01e5d793          	srli	a5,a1,0x1e
ffffffffc0200fb2:	1ff7f793          	andi	a5,a5,511
ffffffffc0200fb6:	7139                	addi	sp,sp,-64
ffffffffc0200fb8:	078e                	slli	a5,a5,0x3
ffffffffc0200fba:	f426                	sd	s1,40(sp)
ffffffffc0200fbc:	00f504b3          	add	s1,a0,a5
ffffffffc0200fc0:	6094                	ld	a3,0(s1)
ffffffffc0200fc2:	f04a                	sd	s2,32(sp)
ffffffffc0200fc4:	ec4e                	sd	s3,24(sp)
ffffffffc0200fc6:	e852                	sd	s4,16(sp)
ffffffffc0200fc8:	fc06                	sd	ra,56(sp)
ffffffffc0200fca:	f822                	sd	s0,48(sp)
ffffffffc0200fcc:	e456                	sd	s5,8(sp)
ffffffffc0200fce:	e05a                	sd	s6,0(sp)
ffffffffc0200fd0:	0016f793          	andi	a5,a3,1
ffffffffc0200fd4:	892e                	mv	s2,a1
ffffffffc0200fd6:	89b2                	mv	s3,a2
ffffffffc0200fd8:	00018a17          	auipc	s4,0x18
ffffffffc0200fdc:	500a0a13          	addi	s4,s4,1280 # ffffffffc02194d8 <npage>
ffffffffc0200fe0:	e7b5                	bnez	a5,ffffffffc020104c <get_pte+0x9e>
ffffffffc0200fe2:	12060b63          	beqz	a2,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0200fe6:	4505                	li	a0,1
ffffffffc0200fe8:	d63ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0200fec:	842a                	mv	s0,a0
ffffffffc0200fee:	12050563          	beqz	a0,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0200ff2:	00018b17          	auipc	s6,0x18
ffffffffc0200ff6:	55eb0b13          	addi	s6,s6,1374 # ffffffffc0219550 <pages>
ffffffffc0200ffa:	000b3503          	ld	a0,0(s6)
ffffffffc0200ffe:	00080ab7          	lui	s5,0x80
ffffffffc0201002:	00018a17          	auipc	s4,0x18
ffffffffc0201006:	4d6a0a13          	addi	s4,s4,1238 # ffffffffc02194d8 <npage>
ffffffffc020100a:	40a40533          	sub	a0,s0,a0
ffffffffc020100e:	8519                	srai	a0,a0,0x6
ffffffffc0201010:	9556                	add	a0,a0,s5
ffffffffc0201012:	000a3703          	ld	a4,0(s4)
ffffffffc0201016:	00c51793          	slli	a5,a0,0xc
ffffffffc020101a:	4685                	li	a3,1
ffffffffc020101c:	c014                	sw	a3,0(s0)
ffffffffc020101e:	83b1                	srli	a5,a5,0xc
ffffffffc0201020:	0532                	slli	a0,a0,0xc
ffffffffc0201022:	14e7f263          	bgeu	a5,a4,ffffffffc0201166 <get_pte+0x1b8>
ffffffffc0201026:	00018797          	auipc	a5,0x18
ffffffffc020102a:	51a7b783          	ld	a5,1306(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc020102e:	6605                	lui	a2,0x1
ffffffffc0201030:	4581                	li	a1,0
ffffffffc0201032:	953e                	add	a0,a0,a5
ffffffffc0201034:	485060ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc0201038:	000b3683          	ld	a3,0(s6)
ffffffffc020103c:	40d406b3          	sub	a3,s0,a3
ffffffffc0201040:	8699                	srai	a3,a3,0x6
ffffffffc0201042:	96d6                	add	a3,a3,s5
ffffffffc0201044:	06aa                	slli	a3,a3,0xa
ffffffffc0201046:	0116e693          	ori	a3,a3,17
ffffffffc020104a:	e094                	sd	a3,0(s1)
ffffffffc020104c:	77fd                	lui	a5,0xfffff
ffffffffc020104e:	068a                	slli	a3,a3,0x2
ffffffffc0201050:	000a3703          	ld	a4,0(s4)
ffffffffc0201054:	8efd                	and	a3,a3,a5
ffffffffc0201056:	00c6d793          	srli	a5,a3,0xc
ffffffffc020105a:	0ce7f163          	bgeu	a5,a4,ffffffffc020111c <get_pte+0x16e>
ffffffffc020105e:	00018a97          	auipc	s5,0x18
ffffffffc0201062:	4e2a8a93          	addi	s5,s5,1250 # ffffffffc0219540 <va_pa_offset>
ffffffffc0201066:	000ab403          	ld	s0,0(s5)
ffffffffc020106a:	01595793          	srli	a5,s2,0x15
ffffffffc020106e:	1ff7f793          	andi	a5,a5,511
ffffffffc0201072:	96a2                	add	a3,a3,s0
ffffffffc0201074:	00379413          	slli	s0,a5,0x3
ffffffffc0201078:	9436                	add	s0,s0,a3
ffffffffc020107a:	6014                	ld	a3,0(s0)
ffffffffc020107c:	0016f793          	andi	a5,a3,1
ffffffffc0201080:	e3ad                	bnez	a5,ffffffffc02010e2 <get_pte+0x134>
ffffffffc0201082:	08098b63          	beqz	s3,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0201086:	4505                	li	a0,1
ffffffffc0201088:	cc3ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020108c:	84aa                	mv	s1,a0
ffffffffc020108e:	c549                	beqz	a0,ffffffffc0201118 <get_pte+0x16a>
ffffffffc0201090:	00018b17          	auipc	s6,0x18
ffffffffc0201094:	4c0b0b13          	addi	s6,s6,1216 # ffffffffc0219550 <pages>
ffffffffc0201098:	000b3503          	ld	a0,0(s6)
ffffffffc020109c:	000809b7          	lui	s3,0x80
ffffffffc02010a0:	000a3703          	ld	a4,0(s4)
ffffffffc02010a4:	40a48533          	sub	a0,s1,a0
ffffffffc02010a8:	8519                	srai	a0,a0,0x6
ffffffffc02010aa:	954e                	add	a0,a0,s3
ffffffffc02010ac:	00c51793          	slli	a5,a0,0xc
ffffffffc02010b0:	4685                	li	a3,1
ffffffffc02010b2:	c094                	sw	a3,0(s1)
ffffffffc02010b4:	83b1                	srli	a5,a5,0xc
ffffffffc02010b6:	0532                	slli	a0,a0,0xc
ffffffffc02010b8:	08e7fa63          	bgeu	a5,a4,ffffffffc020114c <get_pte+0x19e>
ffffffffc02010bc:	000ab783          	ld	a5,0(s5)
ffffffffc02010c0:	6605                	lui	a2,0x1
ffffffffc02010c2:	4581                	li	a1,0
ffffffffc02010c4:	953e                	add	a0,a0,a5
ffffffffc02010c6:	3f3060ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc02010ca:	000b3683          	ld	a3,0(s6)
ffffffffc02010ce:	40d486b3          	sub	a3,s1,a3
ffffffffc02010d2:	8699                	srai	a3,a3,0x6
ffffffffc02010d4:	96ce                	add	a3,a3,s3
ffffffffc02010d6:	06aa                	slli	a3,a3,0xa
ffffffffc02010d8:	0116e693          	ori	a3,a3,17
ffffffffc02010dc:	e014                	sd	a3,0(s0)
ffffffffc02010de:	000a3703          	ld	a4,0(s4)
ffffffffc02010e2:	068a                	slli	a3,a3,0x2
ffffffffc02010e4:	757d                	lui	a0,0xfffff
ffffffffc02010e6:	8ee9                	and	a3,a3,a0
ffffffffc02010e8:	00c6d793          	srli	a5,a3,0xc
ffffffffc02010ec:	04e7f463          	bgeu	a5,a4,ffffffffc0201134 <get_pte+0x186>
ffffffffc02010f0:	000ab503          	ld	a0,0(s5)
ffffffffc02010f4:	00c95913          	srli	s2,s2,0xc
ffffffffc02010f8:	1ff97913          	andi	s2,s2,511
ffffffffc02010fc:	96aa                	add	a3,a3,a0
ffffffffc02010fe:	00391513          	slli	a0,s2,0x3
ffffffffc0201102:	9536                	add	a0,a0,a3
ffffffffc0201104:	70e2                	ld	ra,56(sp)
ffffffffc0201106:	7442                	ld	s0,48(sp)
ffffffffc0201108:	74a2                	ld	s1,40(sp)
ffffffffc020110a:	7902                	ld	s2,32(sp)
ffffffffc020110c:	69e2                	ld	s3,24(sp)
ffffffffc020110e:	6a42                	ld	s4,16(sp)
ffffffffc0201110:	6aa2                	ld	s5,8(sp)
ffffffffc0201112:	6b02                	ld	s6,0(sp)
ffffffffc0201114:	6121                	addi	sp,sp,64
ffffffffc0201116:	8082                	ret
ffffffffc0201118:	4501                	li	a0,0
ffffffffc020111a:	b7ed                	j	ffffffffc0201104 <get_pte+0x156>
ffffffffc020111c:	00008617          	auipc	a2,0x8
ffffffffc0201120:	a2c60613          	addi	a2,a2,-1492 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0201124:	0fe00593          	li	a1,254
ffffffffc0201128:	00008517          	auipc	a0,0x8
ffffffffc020112c:	a1050513          	addi	a0,a0,-1520 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201130:	8d8ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201134:	00008617          	auipc	a2,0x8
ffffffffc0201138:	a1460613          	addi	a2,a2,-1516 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc020113c:	10900593          	li	a1,265
ffffffffc0201140:	00008517          	auipc	a0,0x8
ffffffffc0201144:	9f850513          	addi	a0,a0,-1544 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201148:	8c0ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020114c:	86aa                	mv	a3,a0
ffffffffc020114e:	00008617          	auipc	a2,0x8
ffffffffc0201152:	9fa60613          	addi	a2,a2,-1542 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0201156:	10600593          	li	a1,262
ffffffffc020115a:	00008517          	auipc	a0,0x8
ffffffffc020115e:	9de50513          	addi	a0,a0,-1570 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201162:	8a6ff0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201166:	86aa                	mv	a3,a0
ffffffffc0201168:	00008617          	auipc	a2,0x8
ffffffffc020116c:	9e060613          	addi	a2,a2,-1568 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0201170:	0fa00593          	li	a1,250
ffffffffc0201174:	00008517          	auipc	a0,0x8
ffffffffc0201178:	9c450513          	addi	a0,a0,-1596 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020117c:	88cff0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201180 <unmap_range>:
ffffffffc0201180:	711d                	addi	sp,sp,-96
ffffffffc0201182:	00c5e7b3          	or	a5,a1,a2
ffffffffc0201186:	ec86                	sd	ra,88(sp)
ffffffffc0201188:	e8a2                	sd	s0,80(sp)
ffffffffc020118a:	e4a6                	sd	s1,72(sp)
ffffffffc020118c:	e0ca                	sd	s2,64(sp)
ffffffffc020118e:	fc4e                	sd	s3,56(sp)
ffffffffc0201190:	f852                	sd	s4,48(sp)
ffffffffc0201192:	f456                	sd	s5,40(sp)
ffffffffc0201194:	f05a                	sd	s6,32(sp)
ffffffffc0201196:	ec5e                	sd	s7,24(sp)
ffffffffc0201198:	e862                	sd	s8,16(sp)
ffffffffc020119a:	e466                	sd	s9,8(sp)
ffffffffc020119c:	17d2                	slli	a5,a5,0x34
ffffffffc020119e:	ebf1                	bnez	a5,ffffffffc0201272 <unmap_range+0xf2>
ffffffffc02011a0:	002007b7          	lui	a5,0x200
ffffffffc02011a4:	842e                	mv	s0,a1
ffffffffc02011a6:	0af5e663          	bltu	a1,a5,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011aa:	8932                	mv	s2,a2
ffffffffc02011ac:	0ac5f363          	bgeu	a1,a2,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011b0:	4785                	li	a5,1
ffffffffc02011b2:	07fe                	slli	a5,a5,0x1f
ffffffffc02011b4:	08c7ef63          	bltu	a5,a2,ffffffffc0201252 <unmap_range+0xd2>
ffffffffc02011b8:	89aa                	mv	s3,a0
ffffffffc02011ba:	6a05                	lui	s4,0x1
ffffffffc02011bc:	00018c97          	auipc	s9,0x18
ffffffffc02011c0:	31cc8c93          	addi	s9,s9,796 # ffffffffc02194d8 <npage>
ffffffffc02011c4:	00018c17          	auipc	s8,0x18
ffffffffc02011c8:	38cc0c13          	addi	s8,s8,908 # ffffffffc0219550 <pages>
ffffffffc02011cc:	fff80bb7          	lui	s7,0xfff80
ffffffffc02011d0:	00200b37          	lui	s6,0x200
ffffffffc02011d4:	ffe00ab7          	lui	s5,0xffe00
ffffffffc02011d8:	4601                	li	a2,0
ffffffffc02011da:	85a2                	mv	a1,s0
ffffffffc02011dc:	854e                	mv	a0,s3
ffffffffc02011de:	dd1ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02011e2:	84aa                	mv	s1,a0
ffffffffc02011e4:	cd21                	beqz	a0,ffffffffc020123c <unmap_range+0xbc>
ffffffffc02011e6:	611c                	ld	a5,0(a0)
ffffffffc02011e8:	e38d                	bnez	a5,ffffffffc020120a <unmap_range+0x8a>
ffffffffc02011ea:	9452                	add	s0,s0,s4
ffffffffc02011ec:	ff2466e3          	bltu	s0,s2,ffffffffc02011d8 <unmap_range+0x58>
ffffffffc02011f0:	60e6                	ld	ra,88(sp)
ffffffffc02011f2:	6446                	ld	s0,80(sp)
ffffffffc02011f4:	64a6                	ld	s1,72(sp)
ffffffffc02011f6:	6906                	ld	s2,64(sp)
ffffffffc02011f8:	79e2                	ld	s3,56(sp)
ffffffffc02011fa:	7a42                	ld	s4,48(sp)
ffffffffc02011fc:	7aa2                	ld	s5,40(sp)
ffffffffc02011fe:	7b02                	ld	s6,32(sp)
ffffffffc0201200:	6be2                	ld	s7,24(sp)
ffffffffc0201202:	6c42                	ld	s8,16(sp)
ffffffffc0201204:	6ca2                	ld	s9,8(sp)
ffffffffc0201206:	6125                	addi	sp,sp,96
ffffffffc0201208:	8082                	ret
ffffffffc020120a:	0017f713          	andi	a4,a5,1
ffffffffc020120e:	df71                	beqz	a4,ffffffffc02011ea <unmap_range+0x6a>
ffffffffc0201210:	000cb703          	ld	a4,0(s9)
ffffffffc0201214:	078a                	slli	a5,a5,0x2
ffffffffc0201216:	83b1                	srli	a5,a5,0xc
ffffffffc0201218:	06e7fd63          	bgeu	a5,a4,ffffffffc0201292 <unmap_range+0x112>
ffffffffc020121c:	000c3503          	ld	a0,0(s8)
ffffffffc0201220:	97de                	add	a5,a5,s7
ffffffffc0201222:	079a                	slli	a5,a5,0x6
ffffffffc0201224:	953e                	add	a0,a0,a5
ffffffffc0201226:	411c                	lw	a5,0(a0)
ffffffffc0201228:	fff7871b          	addiw	a4,a5,-1
ffffffffc020122c:	c118                	sw	a4,0(a0)
ffffffffc020122e:	cf11                	beqz	a4,ffffffffc020124a <unmap_range+0xca>
ffffffffc0201230:	0004b023          	sd	zero,0(s1)
ffffffffc0201234:	12040073          	sfence.vma	s0
ffffffffc0201238:	9452                	add	s0,s0,s4
ffffffffc020123a:	bf4d                	j	ffffffffc02011ec <unmap_range+0x6c>
ffffffffc020123c:	945a                	add	s0,s0,s6
ffffffffc020123e:	01547433          	and	s0,s0,s5
ffffffffc0201242:	d45d                	beqz	s0,ffffffffc02011f0 <unmap_range+0x70>
ffffffffc0201244:	f9246ae3          	bltu	s0,s2,ffffffffc02011d8 <unmap_range+0x58>
ffffffffc0201248:	b765                	j	ffffffffc02011f0 <unmap_range+0x70>
ffffffffc020124a:	4585                	li	a1,1
ffffffffc020124c:	b91ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0201250:	b7c5                	j	ffffffffc0201230 <unmap_range+0xb0>
ffffffffc0201252:	00008697          	auipc	a3,0x8
ffffffffc0201256:	94e68693          	addi	a3,a3,-1714 # ffffffffc0208ba0 <commands+0x818>
ffffffffc020125a:	00007617          	auipc	a2,0x7
ffffffffc020125e:	53e60613          	addi	a2,a2,1342 # ffffffffc0208798 <commands+0x410>
ffffffffc0201262:	14100593          	li	a1,321
ffffffffc0201266:	00008517          	auipc	a0,0x8
ffffffffc020126a:	8d250513          	addi	a0,a0,-1838 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020126e:	f9bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201272:	00008697          	auipc	a3,0x8
ffffffffc0201276:	8fe68693          	addi	a3,a3,-1794 # ffffffffc0208b70 <commands+0x7e8>
ffffffffc020127a:	00007617          	auipc	a2,0x7
ffffffffc020127e:	51e60613          	addi	a2,a2,1310 # ffffffffc0208798 <commands+0x410>
ffffffffc0201282:	14000593          	li	a1,320
ffffffffc0201286:	00008517          	auipc	a0,0x8
ffffffffc020128a:	8b250513          	addi	a0,a0,-1870 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020128e:	f7bfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201292:	a9dff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0201296 <exit_range>:
ffffffffc0201296:	715d                	addi	sp,sp,-80
ffffffffc0201298:	00c5e7b3          	or	a5,a1,a2
ffffffffc020129c:	e486                	sd	ra,72(sp)
ffffffffc020129e:	e0a2                	sd	s0,64(sp)
ffffffffc02012a0:	fc26                	sd	s1,56(sp)
ffffffffc02012a2:	f84a                	sd	s2,48(sp)
ffffffffc02012a4:	f44e                	sd	s3,40(sp)
ffffffffc02012a6:	f052                	sd	s4,32(sp)
ffffffffc02012a8:	ec56                	sd	s5,24(sp)
ffffffffc02012aa:	e85a                	sd	s6,16(sp)
ffffffffc02012ac:	e45e                	sd	s7,8(sp)
ffffffffc02012ae:	17d2                	slli	a5,a5,0x34
ffffffffc02012b0:	e3f1                	bnez	a5,ffffffffc0201374 <exit_range+0xde>
ffffffffc02012b2:	002007b7          	lui	a5,0x200
ffffffffc02012b6:	08f5ef63          	bltu	a1,a5,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012ba:	89b2                	mv	s3,a2
ffffffffc02012bc:	08c5fc63          	bgeu	a1,a2,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012c0:	4785                	li	a5,1
ffffffffc02012c2:	ffe004b7          	lui	s1,0xffe00
ffffffffc02012c6:	07fe                	slli	a5,a5,0x1f
ffffffffc02012c8:	8ced                	and	s1,s1,a1
ffffffffc02012ca:	08c7e563          	bltu	a5,a2,ffffffffc0201354 <exit_range+0xbe>
ffffffffc02012ce:	8a2a                	mv	s4,a0
ffffffffc02012d0:	00018b17          	auipc	s6,0x18
ffffffffc02012d4:	208b0b13          	addi	s6,s6,520 # ffffffffc02194d8 <npage>
ffffffffc02012d8:	00018b97          	auipc	s7,0x18
ffffffffc02012dc:	278b8b93          	addi	s7,s7,632 # ffffffffc0219550 <pages>
ffffffffc02012e0:	fff80937          	lui	s2,0xfff80
ffffffffc02012e4:	00200ab7          	lui	s5,0x200
ffffffffc02012e8:	a019                	j	ffffffffc02012ee <exit_range+0x58>
ffffffffc02012ea:	0334fe63          	bgeu	s1,s3,ffffffffc0201326 <exit_range+0x90>
ffffffffc02012ee:	01e4d413          	srli	s0,s1,0x1e
ffffffffc02012f2:	1ff47413          	andi	s0,s0,511
ffffffffc02012f6:	040e                	slli	s0,s0,0x3
ffffffffc02012f8:	9452                	add	s0,s0,s4
ffffffffc02012fa:	601c                	ld	a5,0(s0)
ffffffffc02012fc:	0017f713          	andi	a4,a5,1
ffffffffc0201300:	c30d                	beqz	a4,ffffffffc0201322 <exit_range+0x8c>
ffffffffc0201302:	000b3703          	ld	a4,0(s6)
ffffffffc0201306:	078a                	slli	a5,a5,0x2
ffffffffc0201308:	83b1                	srli	a5,a5,0xc
ffffffffc020130a:	02e7f963          	bgeu	a5,a4,ffffffffc020133c <exit_range+0xa6>
ffffffffc020130e:	000bb503          	ld	a0,0(s7)
ffffffffc0201312:	97ca                	add	a5,a5,s2
ffffffffc0201314:	079a                	slli	a5,a5,0x6
ffffffffc0201316:	4585                	li	a1,1
ffffffffc0201318:	953e                	add	a0,a0,a5
ffffffffc020131a:	ac3ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020131e:	00043023          	sd	zero,0(s0)
ffffffffc0201322:	94d6                	add	s1,s1,s5
ffffffffc0201324:	f0f9                	bnez	s1,ffffffffc02012ea <exit_range+0x54>
ffffffffc0201326:	60a6                	ld	ra,72(sp)
ffffffffc0201328:	6406                	ld	s0,64(sp)
ffffffffc020132a:	74e2                	ld	s1,56(sp)
ffffffffc020132c:	7942                	ld	s2,48(sp)
ffffffffc020132e:	79a2                	ld	s3,40(sp)
ffffffffc0201330:	7a02                	ld	s4,32(sp)
ffffffffc0201332:	6ae2                	ld	s5,24(sp)
ffffffffc0201334:	6b42                	ld	s6,16(sp)
ffffffffc0201336:	6ba2                	ld	s7,8(sp)
ffffffffc0201338:	6161                	addi	sp,sp,80
ffffffffc020133a:	8082                	ret
ffffffffc020133c:	00007617          	auipc	a2,0x7
ffffffffc0201340:	74c60613          	addi	a2,a2,1868 # ffffffffc0208a88 <commands+0x700>
ffffffffc0201344:	06200593          	li	a1,98
ffffffffc0201348:	00007517          	auipc	a0,0x7
ffffffffc020134c:	76050513          	addi	a0,a0,1888 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0201350:	eb9fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201354:	00008697          	auipc	a3,0x8
ffffffffc0201358:	84c68693          	addi	a3,a3,-1972 # ffffffffc0208ba0 <commands+0x818>
ffffffffc020135c:	00007617          	auipc	a2,0x7
ffffffffc0201360:	43c60613          	addi	a2,a2,1084 # ffffffffc0208798 <commands+0x410>
ffffffffc0201364:	15200593          	li	a1,338
ffffffffc0201368:	00007517          	auipc	a0,0x7
ffffffffc020136c:	7d050513          	addi	a0,a0,2000 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201370:	e99fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201374:	00007697          	auipc	a3,0x7
ffffffffc0201378:	7fc68693          	addi	a3,a3,2044 # ffffffffc0208b70 <commands+0x7e8>
ffffffffc020137c:	00007617          	auipc	a2,0x7
ffffffffc0201380:	41c60613          	addi	a2,a2,1052 # ffffffffc0208798 <commands+0x410>
ffffffffc0201384:	15100593          	li	a1,337
ffffffffc0201388:	00007517          	auipc	a0,0x7
ffffffffc020138c:	7b050513          	addi	a0,a0,1968 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201390:	e79fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201394 <page_insert>:
ffffffffc0201394:	7179                	addi	sp,sp,-48
ffffffffc0201396:	e44e                	sd	s3,8(sp)
ffffffffc0201398:	89b2                	mv	s3,a2
ffffffffc020139a:	f022                	sd	s0,32(sp)
ffffffffc020139c:	4605                	li	a2,1
ffffffffc020139e:	842e                	mv	s0,a1
ffffffffc02013a0:	85ce                	mv	a1,s3
ffffffffc02013a2:	ec26                	sd	s1,24(sp)
ffffffffc02013a4:	f406                	sd	ra,40(sp)
ffffffffc02013a6:	e84a                	sd	s2,16(sp)
ffffffffc02013a8:	e052                	sd	s4,0(sp)
ffffffffc02013aa:	84b6                	mv	s1,a3
ffffffffc02013ac:	c03ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02013b0:	cd41                	beqz	a0,ffffffffc0201448 <page_insert+0xb4>
ffffffffc02013b2:	4014                	lw	a3,0(s0)
ffffffffc02013b4:	611c                	ld	a5,0(a0)
ffffffffc02013b6:	892a                	mv	s2,a0
ffffffffc02013b8:	0016871b          	addiw	a4,a3,1
ffffffffc02013bc:	c018                	sw	a4,0(s0)
ffffffffc02013be:	0017f713          	andi	a4,a5,1
ffffffffc02013c2:	eb1d                	bnez	a4,ffffffffc02013f8 <page_insert+0x64>
ffffffffc02013c4:	00018717          	auipc	a4,0x18
ffffffffc02013c8:	18c73703          	ld	a4,396(a4) # ffffffffc0219550 <pages>
ffffffffc02013cc:	8c19                	sub	s0,s0,a4
ffffffffc02013ce:	000807b7          	lui	a5,0x80
ffffffffc02013d2:	8419                	srai	s0,s0,0x6
ffffffffc02013d4:	943e                	add	s0,s0,a5
ffffffffc02013d6:	042a                	slli	s0,s0,0xa
ffffffffc02013d8:	8c45                	or	s0,s0,s1
ffffffffc02013da:	00146413          	ori	s0,s0,1
ffffffffc02013de:	00893023          	sd	s0,0(s2) # fffffffffff80000 <end+0x3fd66930>
ffffffffc02013e2:	12098073          	sfence.vma	s3
ffffffffc02013e6:	4501                	li	a0,0
ffffffffc02013e8:	70a2                	ld	ra,40(sp)
ffffffffc02013ea:	7402                	ld	s0,32(sp)
ffffffffc02013ec:	64e2                	ld	s1,24(sp)
ffffffffc02013ee:	6942                	ld	s2,16(sp)
ffffffffc02013f0:	69a2                	ld	s3,8(sp)
ffffffffc02013f2:	6a02                	ld	s4,0(sp)
ffffffffc02013f4:	6145                	addi	sp,sp,48
ffffffffc02013f6:	8082                	ret
ffffffffc02013f8:	078a                	slli	a5,a5,0x2
ffffffffc02013fa:	83b1                	srli	a5,a5,0xc
ffffffffc02013fc:	00018717          	auipc	a4,0x18
ffffffffc0201400:	0dc73703          	ld	a4,220(a4) # ffffffffc02194d8 <npage>
ffffffffc0201404:	04e7f463          	bgeu	a5,a4,ffffffffc020144c <page_insert+0xb8>
ffffffffc0201408:	00018a17          	auipc	s4,0x18
ffffffffc020140c:	148a0a13          	addi	s4,s4,328 # ffffffffc0219550 <pages>
ffffffffc0201410:	000a3703          	ld	a4,0(s4)
ffffffffc0201414:	fff80537          	lui	a0,0xfff80
ffffffffc0201418:	97aa                	add	a5,a5,a0
ffffffffc020141a:	079a                	slli	a5,a5,0x6
ffffffffc020141c:	97ba                	add	a5,a5,a4
ffffffffc020141e:	00f40a63          	beq	s0,a5,ffffffffc0201432 <page_insert+0x9e>
ffffffffc0201422:	4394                	lw	a3,0(a5)
ffffffffc0201424:	fff6861b          	addiw	a2,a3,-1
ffffffffc0201428:	c390                	sw	a2,0(a5)
ffffffffc020142a:	c611                	beqz	a2,ffffffffc0201436 <page_insert+0xa2>
ffffffffc020142c:	12098073          	sfence.vma	s3
ffffffffc0201430:	bf71                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201432:	c014                	sw	a3,0(s0)
ffffffffc0201434:	bf61                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201436:	4585                	li	a1,1
ffffffffc0201438:	853e                	mv	a0,a5
ffffffffc020143a:	9a3ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020143e:	000a3703          	ld	a4,0(s4)
ffffffffc0201442:	12098073          	sfence.vma	s3
ffffffffc0201446:	b759                	j	ffffffffc02013cc <page_insert+0x38>
ffffffffc0201448:	5571                	li	a0,-4
ffffffffc020144a:	bf79                	j	ffffffffc02013e8 <page_insert+0x54>
ffffffffc020144c:	8e3ff0ef          	jal	ra,ffffffffc0200d2e <pa2page.part.0>

ffffffffc0201450 <copy_range>:
ffffffffc0201450:	7159                	addi	sp,sp,-112
ffffffffc0201452:	00d667b3          	or	a5,a2,a3
ffffffffc0201456:	f486                	sd	ra,104(sp)
ffffffffc0201458:	f0a2                	sd	s0,96(sp)
ffffffffc020145a:	eca6                	sd	s1,88(sp)
ffffffffc020145c:	e8ca                	sd	s2,80(sp)
ffffffffc020145e:	e4ce                	sd	s3,72(sp)
ffffffffc0201460:	e0d2                	sd	s4,64(sp)
ffffffffc0201462:	fc56                	sd	s5,56(sp)
ffffffffc0201464:	f85a                	sd	s6,48(sp)
ffffffffc0201466:	f45e                	sd	s7,40(sp)
ffffffffc0201468:	f062                	sd	s8,32(sp)
ffffffffc020146a:	ec66                	sd	s9,24(sp)
ffffffffc020146c:	e86a                	sd	s10,16(sp)
ffffffffc020146e:	e46e                	sd	s11,8(sp)
ffffffffc0201470:	17d2                	slli	a5,a5,0x34
ffffffffc0201472:	1e079763          	bnez	a5,ffffffffc0201660 <copy_range+0x210>
ffffffffc0201476:	002007b7          	lui	a5,0x200
ffffffffc020147a:	8432                	mv	s0,a2
ffffffffc020147c:	16f66a63          	bltu	a2,a5,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc0201480:	8936                	mv	s2,a3
ffffffffc0201482:	16d67763          	bgeu	a2,a3,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc0201486:	4785                	li	a5,1
ffffffffc0201488:	07fe                	slli	a5,a5,0x1f
ffffffffc020148a:	16d7e363          	bltu	a5,a3,ffffffffc02015f0 <copy_range+0x1a0>
ffffffffc020148e:	5b7d                	li	s6,-1
ffffffffc0201490:	8aaa                	mv	s5,a0
ffffffffc0201492:	89ae                	mv	s3,a1
ffffffffc0201494:	6a05                	lui	s4,0x1
ffffffffc0201496:	00018c97          	auipc	s9,0x18
ffffffffc020149a:	042c8c93          	addi	s9,s9,66 # ffffffffc02194d8 <npage>
ffffffffc020149e:	00018c17          	auipc	s8,0x18
ffffffffc02014a2:	0b2c0c13          	addi	s8,s8,178 # ffffffffc0219550 <pages>
ffffffffc02014a6:	00080bb7          	lui	s7,0x80
ffffffffc02014aa:	00cb5b13          	srli	s6,s6,0xc
ffffffffc02014ae:	4601                	li	a2,0
ffffffffc02014b0:	85a2                	mv	a1,s0
ffffffffc02014b2:	854e                	mv	a0,s3
ffffffffc02014b4:	afbff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02014b8:	84aa                	mv	s1,a0
ffffffffc02014ba:	c175                	beqz	a0,ffffffffc020159e <copy_range+0x14e>
ffffffffc02014bc:	611c                	ld	a5,0(a0)
ffffffffc02014be:	8b85                	andi	a5,a5,1
ffffffffc02014c0:	e785                	bnez	a5,ffffffffc02014e8 <copy_range+0x98>
ffffffffc02014c2:	9452                	add	s0,s0,s4
ffffffffc02014c4:	ff2465e3          	bltu	s0,s2,ffffffffc02014ae <copy_range+0x5e>
ffffffffc02014c8:	4501                	li	a0,0
ffffffffc02014ca:	70a6                	ld	ra,104(sp)
ffffffffc02014cc:	7406                	ld	s0,96(sp)
ffffffffc02014ce:	64e6                	ld	s1,88(sp)
ffffffffc02014d0:	6946                	ld	s2,80(sp)
ffffffffc02014d2:	69a6                	ld	s3,72(sp)
ffffffffc02014d4:	6a06                	ld	s4,64(sp)
ffffffffc02014d6:	7ae2                	ld	s5,56(sp)
ffffffffc02014d8:	7b42                	ld	s6,48(sp)
ffffffffc02014da:	7ba2                	ld	s7,40(sp)
ffffffffc02014dc:	7c02                	ld	s8,32(sp)
ffffffffc02014de:	6ce2                	ld	s9,24(sp)
ffffffffc02014e0:	6d42                	ld	s10,16(sp)
ffffffffc02014e2:	6da2                	ld	s11,8(sp)
ffffffffc02014e4:	6165                	addi	sp,sp,112
ffffffffc02014e6:	8082                	ret
ffffffffc02014e8:	4605                	li	a2,1
ffffffffc02014ea:	85a2                	mv	a1,s0
ffffffffc02014ec:	8556                	mv	a0,s5
ffffffffc02014ee:	ac1ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc02014f2:	c161                	beqz	a0,ffffffffc02015b2 <copy_range+0x162>
ffffffffc02014f4:	609c                	ld	a5,0(s1)
ffffffffc02014f6:	0017f713          	andi	a4,a5,1
ffffffffc02014fa:	01f7f493          	andi	s1,a5,31
ffffffffc02014fe:	14070563          	beqz	a4,ffffffffc0201648 <copy_range+0x1f8>
ffffffffc0201502:	000cb683          	ld	a3,0(s9)
ffffffffc0201506:	078a                	slli	a5,a5,0x2
ffffffffc0201508:	00c7d713          	srli	a4,a5,0xc
ffffffffc020150c:	12d77263          	bgeu	a4,a3,ffffffffc0201630 <copy_range+0x1e0>
ffffffffc0201510:	000c3783          	ld	a5,0(s8)
ffffffffc0201514:	fff806b7          	lui	a3,0xfff80
ffffffffc0201518:	9736                	add	a4,a4,a3
ffffffffc020151a:	071a                	slli	a4,a4,0x6
ffffffffc020151c:	4505                	li	a0,1
ffffffffc020151e:	00e78db3          	add	s11,a5,a4
ffffffffc0201522:	829ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201526:	8d2a                	mv	s10,a0
ffffffffc0201528:	0a0d8463          	beqz	s11,ffffffffc02015d0 <copy_range+0x180>
ffffffffc020152c:	c175                	beqz	a0,ffffffffc0201610 <copy_range+0x1c0>
ffffffffc020152e:	000c3703          	ld	a4,0(s8)
ffffffffc0201532:	000cb603          	ld	a2,0(s9)
ffffffffc0201536:	40ed86b3          	sub	a3,s11,a4
ffffffffc020153a:	8699                	srai	a3,a3,0x6
ffffffffc020153c:	96de                	add	a3,a3,s7
ffffffffc020153e:	0166f7b3          	and	a5,a3,s6
ffffffffc0201542:	06b2                	slli	a3,a3,0xc
ffffffffc0201544:	06c7fa63          	bgeu	a5,a2,ffffffffc02015b8 <copy_range+0x168>
ffffffffc0201548:	40e507b3          	sub	a5,a0,a4
ffffffffc020154c:	00018717          	auipc	a4,0x18
ffffffffc0201550:	ff470713          	addi	a4,a4,-12 # ffffffffc0219540 <va_pa_offset>
ffffffffc0201554:	6308                	ld	a0,0(a4)
ffffffffc0201556:	8799                	srai	a5,a5,0x6
ffffffffc0201558:	97de                	add	a5,a5,s7
ffffffffc020155a:	0167f733          	and	a4,a5,s6
ffffffffc020155e:	00a685b3          	add	a1,a3,a0
ffffffffc0201562:	07b2                	slli	a5,a5,0xc
ffffffffc0201564:	04c77963          	bgeu	a4,a2,ffffffffc02015b6 <copy_range+0x166>
ffffffffc0201568:	6605                	lui	a2,0x1
ffffffffc020156a:	953e                	add	a0,a0,a5
ffffffffc020156c:	75e060ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc0201570:	86a6                	mv	a3,s1
ffffffffc0201572:	8622                	mv	a2,s0
ffffffffc0201574:	85ea                	mv	a1,s10
ffffffffc0201576:	8556                	mv	a0,s5
ffffffffc0201578:	e1dff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc020157c:	d139                	beqz	a0,ffffffffc02014c2 <copy_range+0x72>
ffffffffc020157e:	00007697          	auipc	a3,0x7
ffffffffc0201582:	68268693          	addi	a3,a3,1666 # ffffffffc0208c00 <commands+0x878>
ffffffffc0201586:	00007617          	auipc	a2,0x7
ffffffffc020158a:	21260613          	addi	a2,a2,530 # ffffffffc0208798 <commands+0x410>
ffffffffc020158e:	19900593          	li	a1,409
ffffffffc0201592:	00007517          	auipc	a0,0x7
ffffffffc0201596:	5a650513          	addi	a0,a0,1446 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020159a:	c6ffe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020159e:	00200637          	lui	a2,0x200
ffffffffc02015a2:	9432                	add	s0,s0,a2
ffffffffc02015a4:	ffe00637          	lui	a2,0xffe00
ffffffffc02015a8:	8c71                	and	s0,s0,a2
ffffffffc02015aa:	dc19                	beqz	s0,ffffffffc02014c8 <copy_range+0x78>
ffffffffc02015ac:	f12461e3          	bltu	s0,s2,ffffffffc02014ae <copy_range+0x5e>
ffffffffc02015b0:	bf21                	j	ffffffffc02014c8 <copy_range+0x78>
ffffffffc02015b2:	5571                	li	a0,-4
ffffffffc02015b4:	bf19                	j	ffffffffc02014ca <copy_range+0x7a>
ffffffffc02015b6:	86be                	mv	a3,a5
ffffffffc02015b8:	00007617          	auipc	a2,0x7
ffffffffc02015bc:	59060613          	addi	a2,a2,1424 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc02015c0:	06900593          	li	a1,105
ffffffffc02015c4:	00007517          	auipc	a0,0x7
ffffffffc02015c8:	4e450513          	addi	a0,a0,1252 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02015cc:	c3dfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02015d0:	00007697          	auipc	a3,0x7
ffffffffc02015d4:	61068693          	addi	a3,a3,1552 # ffffffffc0208be0 <commands+0x858>
ffffffffc02015d8:	00007617          	auipc	a2,0x7
ffffffffc02015dc:	1c060613          	addi	a2,a2,448 # ffffffffc0208798 <commands+0x410>
ffffffffc02015e0:	17e00593          	li	a1,382
ffffffffc02015e4:	00007517          	auipc	a0,0x7
ffffffffc02015e8:	55450513          	addi	a0,a0,1364 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc02015ec:	c1dfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02015f0:	00007697          	auipc	a3,0x7
ffffffffc02015f4:	5b068693          	addi	a3,a3,1456 # ffffffffc0208ba0 <commands+0x818>
ffffffffc02015f8:	00007617          	auipc	a2,0x7
ffffffffc02015fc:	1a060613          	addi	a2,a2,416 # ffffffffc0208798 <commands+0x410>
ffffffffc0201600:	16a00593          	li	a1,362
ffffffffc0201604:	00007517          	auipc	a0,0x7
ffffffffc0201608:	53450513          	addi	a0,a0,1332 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020160c:	bfdfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201610:	00007697          	auipc	a3,0x7
ffffffffc0201614:	5e068693          	addi	a3,a3,1504 # ffffffffc0208bf0 <commands+0x868>
ffffffffc0201618:	00007617          	auipc	a2,0x7
ffffffffc020161c:	18060613          	addi	a2,a2,384 # ffffffffc0208798 <commands+0x410>
ffffffffc0201620:	17f00593          	li	a1,383
ffffffffc0201624:	00007517          	auipc	a0,0x7
ffffffffc0201628:	51450513          	addi	a0,a0,1300 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020162c:	bddfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201630:	00007617          	auipc	a2,0x7
ffffffffc0201634:	45860613          	addi	a2,a2,1112 # ffffffffc0208a88 <commands+0x700>
ffffffffc0201638:	06200593          	li	a1,98
ffffffffc020163c:	00007517          	auipc	a0,0x7
ffffffffc0201640:	46c50513          	addi	a0,a0,1132 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0201644:	bc5fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201648:	00007617          	auipc	a2,0x7
ffffffffc020164c:	57060613          	addi	a2,a2,1392 # ffffffffc0208bb8 <commands+0x830>
ffffffffc0201650:	07400593          	li	a1,116
ffffffffc0201654:	00007517          	auipc	a0,0x7
ffffffffc0201658:	45450513          	addi	a0,a0,1108 # ffffffffc0208aa8 <commands+0x720>
ffffffffc020165c:	badfe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201660:	00007697          	auipc	a3,0x7
ffffffffc0201664:	51068693          	addi	a3,a3,1296 # ffffffffc0208b70 <commands+0x7e8>
ffffffffc0201668:	00007617          	auipc	a2,0x7
ffffffffc020166c:	13060613          	addi	a2,a2,304 # ffffffffc0208798 <commands+0x410>
ffffffffc0201670:	16900593          	li	a1,361
ffffffffc0201674:	00007517          	auipc	a0,0x7
ffffffffc0201678:	4c450513          	addi	a0,a0,1220 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc020167c:	b8dfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201680 <tlb_invalidate>:
ffffffffc0201680:	12058073          	sfence.vma	a1
ffffffffc0201684:	8082                	ret

ffffffffc0201686 <pgdir_alloc_page>:
ffffffffc0201686:	7179                	addi	sp,sp,-48
ffffffffc0201688:	e84a                	sd	s2,16(sp)
ffffffffc020168a:	892a                	mv	s2,a0
ffffffffc020168c:	4505                	li	a0,1
ffffffffc020168e:	f022                	sd	s0,32(sp)
ffffffffc0201690:	ec26                	sd	s1,24(sp)
ffffffffc0201692:	e44e                	sd	s3,8(sp)
ffffffffc0201694:	f406                	sd	ra,40(sp)
ffffffffc0201696:	84ae                	mv	s1,a1
ffffffffc0201698:	89b2                	mv	s3,a2
ffffffffc020169a:	eb0ff0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020169e:	842a                	mv	s0,a0
ffffffffc02016a0:	cd05                	beqz	a0,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016a2:	85aa                	mv	a1,a0
ffffffffc02016a4:	86ce                	mv	a3,s3
ffffffffc02016a6:	8626                	mv	a2,s1
ffffffffc02016a8:	854a                	mv	a0,s2
ffffffffc02016aa:	cebff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc02016ae:	ed0d                	bnez	a0,ffffffffc02016e8 <pgdir_alloc_page+0x62>
ffffffffc02016b0:	00018797          	auipc	a5,0x18
ffffffffc02016b4:	e407a783          	lw	a5,-448(a5) # ffffffffc02194f0 <swap_init_ok>
ffffffffc02016b8:	c385                	beqz	a5,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016ba:	00018517          	auipc	a0,0x18
ffffffffc02016be:	e9e53503          	ld	a0,-354(a0) # ffffffffc0219558 <check_mm_struct>
ffffffffc02016c2:	c919                	beqz	a0,ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016c4:	4681                	li	a3,0
ffffffffc02016c6:	8622                	mv	a2,s0
ffffffffc02016c8:	85a6                	mv	a1,s1
ffffffffc02016ca:	60a000ef          	jal	ra,ffffffffc0201cd4 <swap_map_swappable>
ffffffffc02016ce:	4018                	lw	a4,0(s0)
ffffffffc02016d0:	fc04                	sd	s1,56(s0)
ffffffffc02016d2:	4785                	li	a5,1
ffffffffc02016d4:	02f71063          	bne	a4,a5,ffffffffc02016f4 <pgdir_alloc_page+0x6e>
ffffffffc02016d8:	70a2                	ld	ra,40(sp)
ffffffffc02016da:	8522                	mv	a0,s0
ffffffffc02016dc:	7402                	ld	s0,32(sp)
ffffffffc02016de:	64e2                	ld	s1,24(sp)
ffffffffc02016e0:	6942                	ld	s2,16(sp)
ffffffffc02016e2:	69a2                	ld	s3,8(sp)
ffffffffc02016e4:	6145                	addi	sp,sp,48
ffffffffc02016e6:	8082                	ret
ffffffffc02016e8:	8522                	mv	a0,s0
ffffffffc02016ea:	4585                	li	a1,1
ffffffffc02016ec:	ef0ff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02016f0:	4401                	li	s0,0
ffffffffc02016f2:	b7dd                	j	ffffffffc02016d8 <pgdir_alloc_page+0x52>
ffffffffc02016f4:	00007697          	auipc	a3,0x7
ffffffffc02016f8:	51c68693          	addi	a3,a3,1308 # ffffffffc0208c10 <commands+0x888>
ffffffffc02016fc:	00007617          	auipc	a2,0x7
ffffffffc0201700:	09c60613          	addi	a2,a2,156 # ffffffffc0208798 <commands+0x410>
ffffffffc0201704:	1d800593          	li	a1,472
ffffffffc0201708:	00007517          	auipc	a0,0x7
ffffffffc020170c:	43050513          	addi	a0,a0,1072 # ffffffffc0208b38 <commands+0x7b0>
ffffffffc0201710:	af9fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201714 <check_vma_overlap.isra.0.part.0>:
ffffffffc0201714:	1141                	addi	sp,sp,-16
ffffffffc0201716:	00007697          	auipc	a3,0x7
ffffffffc020171a:	51268693          	addi	a3,a3,1298 # ffffffffc0208c28 <commands+0x8a0>
ffffffffc020171e:	00007617          	auipc	a2,0x7
ffffffffc0201722:	07a60613          	addi	a2,a2,122 # ffffffffc0208798 <commands+0x410>
ffffffffc0201726:	06d00593          	li	a1,109
ffffffffc020172a:	00007517          	auipc	a0,0x7
ffffffffc020172e:	51e50513          	addi	a0,a0,1310 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201732:	e406                	sd	ra,8(sp)
ffffffffc0201734:	ad5fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201738 <mm_create>:
ffffffffc0201738:	1141                	addi	sp,sp,-16
ffffffffc020173a:	05800513          	li	a0,88
ffffffffc020173e:	e022                	sd	s0,0(sp)
ffffffffc0201740:	e406                	sd	ra,8(sp)
ffffffffc0201742:	12f000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc0201746:	842a                	mv	s0,a0
ffffffffc0201748:	c51d                	beqz	a0,ffffffffc0201776 <mm_create+0x3e>
ffffffffc020174a:	e408                	sd	a0,8(s0)
ffffffffc020174c:	e008                	sd	a0,0(s0)
ffffffffc020174e:	00053823          	sd	zero,16(a0)
ffffffffc0201752:	00053c23          	sd	zero,24(a0)
ffffffffc0201756:	02052023          	sw	zero,32(a0)
ffffffffc020175a:	00018797          	auipc	a5,0x18
ffffffffc020175e:	d967a783          	lw	a5,-618(a5) # ffffffffc02194f0 <swap_init_ok>
ffffffffc0201762:	ef99                	bnez	a5,ffffffffc0201780 <mm_create+0x48>
ffffffffc0201764:	02053423          	sd	zero,40(a0)
ffffffffc0201768:	02042823          	sw	zero,48(s0)
ffffffffc020176c:	4585                	li	a1,1
ffffffffc020176e:	03840513          	addi	a0,s0,56
ffffffffc0201772:	6ab010ef          	jal	ra,ffffffffc020361c <sem_init>
ffffffffc0201776:	60a2                	ld	ra,8(sp)
ffffffffc0201778:	8522                	mv	a0,s0
ffffffffc020177a:	6402                	ld	s0,0(sp)
ffffffffc020177c:	0141                	addi	sp,sp,16
ffffffffc020177e:	8082                	ret
ffffffffc0201780:	546000ef          	jal	ra,ffffffffc0201cc6 <swap_init_mm>
ffffffffc0201784:	b7d5                	j	ffffffffc0201768 <mm_create+0x30>

ffffffffc0201786 <find_vma>:
ffffffffc0201786:	86aa                	mv	a3,a0
ffffffffc0201788:	c505                	beqz	a0,ffffffffc02017b0 <find_vma+0x2a>
ffffffffc020178a:	6908                	ld	a0,16(a0)
ffffffffc020178c:	c501                	beqz	a0,ffffffffc0201794 <find_vma+0xe>
ffffffffc020178e:	651c                	ld	a5,8(a0)
ffffffffc0201790:	02f5f263          	bgeu	a1,a5,ffffffffc02017b4 <find_vma+0x2e>
ffffffffc0201794:	669c                	ld	a5,8(a3)
ffffffffc0201796:	00f68d63          	beq	a3,a5,ffffffffc02017b0 <find_vma+0x2a>
ffffffffc020179a:	fe87b703          	ld	a4,-24(a5)
ffffffffc020179e:	00e5e663          	bltu	a1,a4,ffffffffc02017aa <find_vma+0x24>
ffffffffc02017a2:	ff07b703          	ld	a4,-16(a5)
ffffffffc02017a6:	00e5ec63          	bltu	a1,a4,ffffffffc02017be <find_vma+0x38>
ffffffffc02017aa:	679c                	ld	a5,8(a5)
ffffffffc02017ac:	fef697e3          	bne	a3,a5,ffffffffc020179a <find_vma+0x14>
ffffffffc02017b0:	4501                	li	a0,0
ffffffffc02017b2:	8082                	ret
ffffffffc02017b4:	691c                	ld	a5,16(a0)
ffffffffc02017b6:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0201794 <find_vma+0xe>
ffffffffc02017ba:	ea88                	sd	a0,16(a3)
ffffffffc02017bc:	8082                	ret
ffffffffc02017be:	fe078513          	addi	a0,a5,-32
ffffffffc02017c2:	ea88                	sd	a0,16(a3)
ffffffffc02017c4:	8082                	ret

ffffffffc02017c6 <insert_vma_struct>:
ffffffffc02017c6:	6590                	ld	a2,8(a1)
ffffffffc02017c8:	0105b803          	ld	a6,16(a1)
ffffffffc02017cc:	1141                	addi	sp,sp,-16
ffffffffc02017ce:	e406                	sd	ra,8(sp)
ffffffffc02017d0:	87aa                	mv	a5,a0
ffffffffc02017d2:	01066763          	bltu	a2,a6,ffffffffc02017e0 <insert_vma_struct+0x1a>
ffffffffc02017d6:	a085                	j	ffffffffc0201836 <insert_vma_struct+0x70>
ffffffffc02017d8:	fe87b703          	ld	a4,-24(a5)
ffffffffc02017dc:	04e66863          	bltu	a2,a4,ffffffffc020182c <insert_vma_struct+0x66>
ffffffffc02017e0:	86be                	mv	a3,a5
ffffffffc02017e2:	679c                	ld	a5,8(a5)
ffffffffc02017e4:	fef51ae3          	bne	a0,a5,ffffffffc02017d8 <insert_vma_struct+0x12>
ffffffffc02017e8:	02a68463          	beq	a3,a0,ffffffffc0201810 <insert_vma_struct+0x4a>
ffffffffc02017ec:	ff06b703          	ld	a4,-16(a3)
ffffffffc02017f0:	fe86b883          	ld	a7,-24(a3)
ffffffffc02017f4:	08e8f163          	bgeu	a7,a4,ffffffffc0201876 <insert_vma_struct+0xb0>
ffffffffc02017f8:	04e66f63          	bltu	a2,a4,ffffffffc0201856 <insert_vma_struct+0x90>
ffffffffc02017fc:	00f50a63          	beq	a0,a5,ffffffffc0201810 <insert_vma_struct+0x4a>
ffffffffc0201800:	fe87b703          	ld	a4,-24(a5)
ffffffffc0201804:	05076963          	bltu	a4,a6,ffffffffc0201856 <insert_vma_struct+0x90>
ffffffffc0201808:	ff07b603          	ld	a2,-16(a5)
ffffffffc020180c:	02c77363          	bgeu	a4,a2,ffffffffc0201832 <insert_vma_struct+0x6c>
ffffffffc0201810:	5118                	lw	a4,32(a0)
ffffffffc0201812:	e188                	sd	a0,0(a1)
ffffffffc0201814:	02058613          	addi	a2,a1,32
ffffffffc0201818:	e390                	sd	a2,0(a5)
ffffffffc020181a:	e690                	sd	a2,8(a3)
ffffffffc020181c:	60a2                	ld	ra,8(sp)
ffffffffc020181e:	f59c                	sd	a5,40(a1)
ffffffffc0201820:	f194                	sd	a3,32(a1)
ffffffffc0201822:	0017079b          	addiw	a5,a4,1
ffffffffc0201826:	d11c                	sw	a5,32(a0)
ffffffffc0201828:	0141                	addi	sp,sp,16
ffffffffc020182a:	8082                	ret
ffffffffc020182c:	fca690e3          	bne	a3,a0,ffffffffc02017ec <insert_vma_struct+0x26>
ffffffffc0201830:	bfd1                	j	ffffffffc0201804 <insert_vma_struct+0x3e>
ffffffffc0201832:	ee3ff0ef          	jal	ra,ffffffffc0201714 <check_vma_overlap.isra.0.part.0>
ffffffffc0201836:	00007697          	auipc	a3,0x7
ffffffffc020183a:	42268693          	addi	a3,a3,1058 # ffffffffc0208c58 <commands+0x8d0>
ffffffffc020183e:	00007617          	auipc	a2,0x7
ffffffffc0201842:	f5a60613          	addi	a2,a2,-166 # ffffffffc0208798 <commands+0x410>
ffffffffc0201846:	07400593          	li	a1,116
ffffffffc020184a:	00007517          	auipc	a0,0x7
ffffffffc020184e:	3fe50513          	addi	a0,a0,1022 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201852:	9b7fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201856:	00007697          	auipc	a3,0x7
ffffffffc020185a:	44268693          	addi	a3,a3,1090 # ffffffffc0208c98 <commands+0x910>
ffffffffc020185e:	00007617          	auipc	a2,0x7
ffffffffc0201862:	f3a60613          	addi	a2,a2,-198 # ffffffffc0208798 <commands+0x410>
ffffffffc0201866:	06c00593          	li	a1,108
ffffffffc020186a:	00007517          	auipc	a0,0x7
ffffffffc020186e:	3de50513          	addi	a0,a0,990 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201872:	997fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0201876:	00007697          	auipc	a3,0x7
ffffffffc020187a:	40268693          	addi	a3,a3,1026 # ffffffffc0208c78 <commands+0x8f0>
ffffffffc020187e:	00007617          	auipc	a2,0x7
ffffffffc0201882:	f1a60613          	addi	a2,a2,-230 # ffffffffc0208798 <commands+0x410>
ffffffffc0201886:	06b00593          	li	a1,107
ffffffffc020188a:	00007517          	auipc	a0,0x7
ffffffffc020188e:	3be50513          	addi	a0,a0,958 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201892:	977fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201896 <mm_destroy>:
ffffffffc0201896:	591c                	lw	a5,48(a0)
ffffffffc0201898:	1141                	addi	sp,sp,-16
ffffffffc020189a:	e406                	sd	ra,8(sp)
ffffffffc020189c:	e022                	sd	s0,0(sp)
ffffffffc020189e:	e78d                	bnez	a5,ffffffffc02018c8 <mm_destroy+0x32>
ffffffffc02018a0:	842a                	mv	s0,a0
ffffffffc02018a2:	6508                	ld	a0,8(a0)
ffffffffc02018a4:	00a40c63          	beq	s0,a0,ffffffffc02018bc <mm_destroy+0x26>
ffffffffc02018a8:	6118                	ld	a4,0(a0)
ffffffffc02018aa:	651c                	ld	a5,8(a0)
ffffffffc02018ac:	1501                	addi	a0,a0,-32
ffffffffc02018ae:	e71c                	sd	a5,8(a4)
ffffffffc02018b0:	e398                	sd	a4,0(a5)
ffffffffc02018b2:	06f000ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc02018b6:	6408                	ld	a0,8(s0)
ffffffffc02018b8:	fea418e3          	bne	s0,a0,ffffffffc02018a8 <mm_destroy+0x12>
ffffffffc02018bc:	8522                	mv	a0,s0
ffffffffc02018be:	6402                	ld	s0,0(sp)
ffffffffc02018c0:	60a2                	ld	ra,8(sp)
ffffffffc02018c2:	0141                	addi	sp,sp,16
ffffffffc02018c4:	05d0006f          	j	ffffffffc0202120 <kfree>
ffffffffc02018c8:	00007697          	auipc	a3,0x7
ffffffffc02018cc:	3f068693          	addi	a3,a3,1008 # ffffffffc0208cb8 <commands+0x930>
ffffffffc02018d0:	00007617          	auipc	a2,0x7
ffffffffc02018d4:	ec860613          	addi	a2,a2,-312 # ffffffffc0208798 <commands+0x410>
ffffffffc02018d8:	09400593          	li	a1,148
ffffffffc02018dc:	00007517          	auipc	a0,0x7
ffffffffc02018e0:	36c50513          	addi	a0,a0,876 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc02018e4:	925fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02018e8 <mm_map>:
ffffffffc02018e8:	7139                	addi	sp,sp,-64
ffffffffc02018ea:	f822                	sd	s0,48(sp)
ffffffffc02018ec:	6405                	lui	s0,0x1
ffffffffc02018ee:	147d                	addi	s0,s0,-1
ffffffffc02018f0:	77fd                	lui	a5,0xfffff
ffffffffc02018f2:	9622                	add	a2,a2,s0
ffffffffc02018f4:	962e                	add	a2,a2,a1
ffffffffc02018f6:	f426                	sd	s1,40(sp)
ffffffffc02018f8:	fc06                	sd	ra,56(sp)
ffffffffc02018fa:	00f5f4b3          	and	s1,a1,a5
ffffffffc02018fe:	f04a                	sd	s2,32(sp)
ffffffffc0201900:	ec4e                	sd	s3,24(sp)
ffffffffc0201902:	e852                	sd	s4,16(sp)
ffffffffc0201904:	e456                	sd	s5,8(sp)
ffffffffc0201906:	002005b7          	lui	a1,0x200
ffffffffc020190a:	00f67433          	and	s0,a2,a5
ffffffffc020190e:	06b4e363          	bltu	s1,a1,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201912:	0684f163          	bgeu	s1,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201916:	4785                	li	a5,1
ffffffffc0201918:	07fe                	slli	a5,a5,0x1f
ffffffffc020191a:	0487ed63          	bltu	a5,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc020191e:	89aa                	mv	s3,a0
ffffffffc0201920:	cd21                	beqz	a0,ffffffffc0201978 <mm_map+0x90>
ffffffffc0201922:	85a6                	mv	a1,s1
ffffffffc0201924:	8ab6                	mv	s5,a3
ffffffffc0201926:	8a3a                	mv	s4,a4
ffffffffc0201928:	e5fff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc020192c:	c501                	beqz	a0,ffffffffc0201934 <mm_map+0x4c>
ffffffffc020192e:	651c                	ld	a5,8(a0)
ffffffffc0201930:	0487e263          	bltu	a5,s0,ffffffffc0201974 <mm_map+0x8c>
ffffffffc0201934:	03000513          	li	a0,48
ffffffffc0201938:	738000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc020193c:	892a                	mv	s2,a0
ffffffffc020193e:	5571                	li	a0,-4
ffffffffc0201940:	02090163          	beqz	s2,ffffffffc0201962 <mm_map+0x7a>
ffffffffc0201944:	854e                	mv	a0,s3
ffffffffc0201946:	00993423          	sd	s1,8(s2)
ffffffffc020194a:	00893823          	sd	s0,16(s2)
ffffffffc020194e:	01592c23          	sw	s5,24(s2)
ffffffffc0201952:	85ca                	mv	a1,s2
ffffffffc0201954:	e73ff0ef          	jal	ra,ffffffffc02017c6 <insert_vma_struct>
ffffffffc0201958:	4501                	li	a0,0
ffffffffc020195a:	000a0463          	beqz	s4,ffffffffc0201962 <mm_map+0x7a>
ffffffffc020195e:	012a3023          	sd	s2,0(s4) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0201962:	70e2                	ld	ra,56(sp)
ffffffffc0201964:	7442                	ld	s0,48(sp)
ffffffffc0201966:	74a2                	ld	s1,40(sp)
ffffffffc0201968:	7902                	ld	s2,32(sp)
ffffffffc020196a:	69e2                	ld	s3,24(sp)
ffffffffc020196c:	6a42                	ld	s4,16(sp)
ffffffffc020196e:	6aa2                	ld	s5,8(sp)
ffffffffc0201970:	6121                	addi	sp,sp,64
ffffffffc0201972:	8082                	ret
ffffffffc0201974:	5575                	li	a0,-3
ffffffffc0201976:	b7f5                	j	ffffffffc0201962 <mm_map+0x7a>
ffffffffc0201978:	00007697          	auipc	a3,0x7
ffffffffc020197c:	35868693          	addi	a3,a3,856 # ffffffffc0208cd0 <commands+0x948>
ffffffffc0201980:	00007617          	auipc	a2,0x7
ffffffffc0201984:	e1860613          	addi	a2,a2,-488 # ffffffffc0208798 <commands+0x410>
ffffffffc0201988:	0a700593          	li	a1,167
ffffffffc020198c:	00007517          	auipc	a0,0x7
ffffffffc0201990:	2bc50513          	addi	a0,a0,700 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201994:	875fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201998 <dup_mmap>:
ffffffffc0201998:	7139                	addi	sp,sp,-64
ffffffffc020199a:	fc06                	sd	ra,56(sp)
ffffffffc020199c:	f822                	sd	s0,48(sp)
ffffffffc020199e:	f426                	sd	s1,40(sp)
ffffffffc02019a0:	f04a                	sd	s2,32(sp)
ffffffffc02019a2:	ec4e                	sd	s3,24(sp)
ffffffffc02019a4:	e852                	sd	s4,16(sp)
ffffffffc02019a6:	e456                	sd	s5,8(sp)
ffffffffc02019a8:	c52d                	beqz	a0,ffffffffc0201a12 <dup_mmap+0x7a>
ffffffffc02019aa:	892a                	mv	s2,a0
ffffffffc02019ac:	84ae                	mv	s1,a1
ffffffffc02019ae:	842e                	mv	s0,a1
ffffffffc02019b0:	e595                	bnez	a1,ffffffffc02019dc <dup_mmap+0x44>
ffffffffc02019b2:	a085                	j	ffffffffc0201a12 <dup_mmap+0x7a>
ffffffffc02019b4:	854a                	mv	a0,s2
ffffffffc02019b6:	0155b423          	sd	s5,8(a1) # 200008 <kern_entry-0xffffffffbffffff8>
ffffffffc02019ba:	0145b823          	sd	s4,16(a1)
ffffffffc02019be:	0135ac23          	sw	s3,24(a1)
ffffffffc02019c2:	e05ff0ef          	jal	ra,ffffffffc02017c6 <insert_vma_struct>
ffffffffc02019c6:	ff043683          	ld	a3,-16(s0) # ff0 <kern_entry-0xffffffffc01ff010>
ffffffffc02019ca:	fe843603          	ld	a2,-24(s0)
ffffffffc02019ce:	6c8c                	ld	a1,24(s1)
ffffffffc02019d0:	01893503          	ld	a0,24(s2)
ffffffffc02019d4:	4701                	li	a4,0
ffffffffc02019d6:	a7bff0ef          	jal	ra,ffffffffc0201450 <copy_range>
ffffffffc02019da:	e105                	bnez	a0,ffffffffc02019fa <dup_mmap+0x62>
ffffffffc02019dc:	6000                	ld	s0,0(s0)
ffffffffc02019de:	02848863          	beq	s1,s0,ffffffffc0201a0e <dup_mmap+0x76>
ffffffffc02019e2:	03000513          	li	a0,48
ffffffffc02019e6:	fe843a83          	ld	s5,-24(s0)
ffffffffc02019ea:	ff043a03          	ld	s4,-16(s0)
ffffffffc02019ee:	ff842983          	lw	s3,-8(s0)
ffffffffc02019f2:	67e000ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc02019f6:	85aa                	mv	a1,a0
ffffffffc02019f8:	fd55                	bnez	a0,ffffffffc02019b4 <dup_mmap+0x1c>
ffffffffc02019fa:	5571                	li	a0,-4
ffffffffc02019fc:	70e2                	ld	ra,56(sp)
ffffffffc02019fe:	7442                	ld	s0,48(sp)
ffffffffc0201a00:	74a2                	ld	s1,40(sp)
ffffffffc0201a02:	7902                	ld	s2,32(sp)
ffffffffc0201a04:	69e2                	ld	s3,24(sp)
ffffffffc0201a06:	6a42                	ld	s4,16(sp)
ffffffffc0201a08:	6aa2                	ld	s5,8(sp)
ffffffffc0201a0a:	6121                	addi	sp,sp,64
ffffffffc0201a0c:	8082                	ret
ffffffffc0201a0e:	4501                	li	a0,0
ffffffffc0201a10:	b7f5                	j	ffffffffc02019fc <dup_mmap+0x64>
ffffffffc0201a12:	00007697          	auipc	a3,0x7
ffffffffc0201a16:	2ce68693          	addi	a3,a3,718 # ffffffffc0208ce0 <commands+0x958>
ffffffffc0201a1a:	00007617          	auipc	a2,0x7
ffffffffc0201a1e:	d7e60613          	addi	a2,a2,-642 # ffffffffc0208798 <commands+0x410>
ffffffffc0201a22:	0c000593          	li	a1,192
ffffffffc0201a26:	00007517          	auipc	a0,0x7
ffffffffc0201a2a:	22250513          	addi	a0,a0,546 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201a2e:	fdafe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201a32 <exit_mmap>:
ffffffffc0201a32:	1101                	addi	sp,sp,-32
ffffffffc0201a34:	ec06                	sd	ra,24(sp)
ffffffffc0201a36:	e822                	sd	s0,16(sp)
ffffffffc0201a38:	e426                	sd	s1,8(sp)
ffffffffc0201a3a:	e04a                	sd	s2,0(sp)
ffffffffc0201a3c:	c531                	beqz	a0,ffffffffc0201a88 <exit_mmap+0x56>
ffffffffc0201a3e:	591c                	lw	a5,48(a0)
ffffffffc0201a40:	84aa                	mv	s1,a0
ffffffffc0201a42:	e3b9                	bnez	a5,ffffffffc0201a88 <exit_mmap+0x56>
ffffffffc0201a44:	6500                	ld	s0,8(a0)
ffffffffc0201a46:	01853903          	ld	s2,24(a0)
ffffffffc0201a4a:	02850663          	beq	a0,s0,ffffffffc0201a76 <exit_mmap+0x44>
ffffffffc0201a4e:	ff043603          	ld	a2,-16(s0)
ffffffffc0201a52:	fe843583          	ld	a1,-24(s0)
ffffffffc0201a56:	854a                	mv	a0,s2
ffffffffc0201a58:	f28ff0ef          	jal	ra,ffffffffc0201180 <unmap_range>
ffffffffc0201a5c:	6400                	ld	s0,8(s0)
ffffffffc0201a5e:	fe8498e3          	bne	s1,s0,ffffffffc0201a4e <exit_mmap+0x1c>
ffffffffc0201a62:	6400                	ld	s0,8(s0)
ffffffffc0201a64:	00848c63          	beq	s1,s0,ffffffffc0201a7c <exit_mmap+0x4a>
ffffffffc0201a68:	ff043603          	ld	a2,-16(s0)
ffffffffc0201a6c:	fe843583          	ld	a1,-24(s0)
ffffffffc0201a70:	854a                	mv	a0,s2
ffffffffc0201a72:	825ff0ef          	jal	ra,ffffffffc0201296 <exit_range>
ffffffffc0201a76:	6400                	ld	s0,8(s0)
ffffffffc0201a78:	fe8498e3          	bne	s1,s0,ffffffffc0201a68 <exit_mmap+0x36>
ffffffffc0201a7c:	60e2                	ld	ra,24(sp)
ffffffffc0201a7e:	6442                	ld	s0,16(sp)
ffffffffc0201a80:	64a2                	ld	s1,8(sp)
ffffffffc0201a82:	6902                	ld	s2,0(sp)
ffffffffc0201a84:	6105                	addi	sp,sp,32
ffffffffc0201a86:	8082                	ret
ffffffffc0201a88:	00007697          	auipc	a3,0x7
ffffffffc0201a8c:	27868693          	addi	a3,a3,632 # ffffffffc0208d00 <commands+0x978>
ffffffffc0201a90:	00007617          	auipc	a2,0x7
ffffffffc0201a94:	d0860613          	addi	a2,a2,-760 # ffffffffc0208798 <commands+0x410>
ffffffffc0201a98:	0d600593          	li	a1,214
ffffffffc0201a9c:	00007517          	auipc	a0,0x7
ffffffffc0201aa0:	1ac50513          	addi	a0,a0,428 # ffffffffc0208c48 <commands+0x8c0>
ffffffffc0201aa4:	f64fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201aa8 <vmm_init>:
ffffffffc0201aa8:	8082                	ret

ffffffffc0201aaa <do_pgfault>:
ffffffffc0201aaa:	7139                	addi	sp,sp,-64
ffffffffc0201aac:	85b2                	mv	a1,a2
ffffffffc0201aae:	f822                	sd	s0,48(sp)
ffffffffc0201ab0:	f426                	sd	s1,40(sp)
ffffffffc0201ab2:	fc06                	sd	ra,56(sp)
ffffffffc0201ab4:	f04a                	sd	s2,32(sp)
ffffffffc0201ab6:	ec4e                	sd	s3,24(sp)
ffffffffc0201ab8:	8432                	mv	s0,a2
ffffffffc0201aba:	84aa                	mv	s1,a0
ffffffffc0201abc:	ccbff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc0201ac0:	00018797          	auipc	a5,0x18
ffffffffc0201ac4:	a207a783          	lw	a5,-1504(a5) # ffffffffc02194e0 <pgfault_num>
ffffffffc0201ac8:	2785                	addiw	a5,a5,1
ffffffffc0201aca:	00018717          	auipc	a4,0x18
ffffffffc0201ace:	a0f72b23          	sw	a5,-1514(a4) # ffffffffc02194e0 <pgfault_num>
ffffffffc0201ad2:	c545                	beqz	a0,ffffffffc0201b7a <do_pgfault+0xd0>
ffffffffc0201ad4:	651c                	ld	a5,8(a0)
ffffffffc0201ad6:	0af46263          	bltu	s0,a5,ffffffffc0201b7a <do_pgfault+0xd0>
ffffffffc0201ada:	4d1c                	lw	a5,24(a0)
ffffffffc0201adc:	49c1                	li	s3,16
ffffffffc0201ade:	8b89                	andi	a5,a5,2
ffffffffc0201ae0:	efb1                	bnez	a5,ffffffffc0201b3c <do_pgfault+0x92>
ffffffffc0201ae2:	75fd                	lui	a1,0xfffff
ffffffffc0201ae4:	6c88                	ld	a0,24(s1)
ffffffffc0201ae6:	8c6d                	and	s0,s0,a1
ffffffffc0201ae8:	4605                	li	a2,1
ffffffffc0201aea:	85a2                	mv	a1,s0
ffffffffc0201aec:	cc2ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201af0:	c555                	beqz	a0,ffffffffc0201b9c <do_pgfault+0xf2>
ffffffffc0201af2:	610c                	ld	a1,0(a0)
ffffffffc0201af4:	c5a5                	beqz	a1,ffffffffc0201b5c <do_pgfault+0xb2>
ffffffffc0201af6:	00018797          	auipc	a5,0x18
ffffffffc0201afa:	9fa7a783          	lw	a5,-1542(a5) # ffffffffc02194f0 <swap_init_ok>
ffffffffc0201afe:	c7d9                	beqz	a5,ffffffffc0201b8c <do_pgfault+0xe2>
ffffffffc0201b00:	0030                	addi	a2,sp,8
ffffffffc0201b02:	85a2                	mv	a1,s0
ffffffffc0201b04:	8526                	mv	a0,s1
ffffffffc0201b06:	e402                	sd	zero,8(sp)
ffffffffc0201b08:	2ee000ef          	jal	ra,ffffffffc0201df6 <swap_in>
ffffffffc0201b0c:	892a                	mv	s2,a0
ffffffffc0201b0e:	e90d                	bnez	a0,ffffffffc0201b40 <do_pgfault+0x96>
ffffffffc0201b10:	65a2                	ld	a1,8(sp)
ffffffffc0201b12:	6c88                	ld	a0,24(s1)
ffffffffc0201b14:	86ce                	mv	a3,s3
ffffffffc0201b16:	8622                	mv	a2,s0
ffffffffc0201b18:	87dff0ef          	jal	ra,ffffffffc0201394 <page_insert>
ffffffffc0201b1c:	6622                	ld	a2,8(sp)
ffffffffc0201b1e:	4685                	li	a3,1
ffffffffc0201b20:	85a2                	mv	a1,s0
ffffffffc0201b22:	8526                	mv	a0,s1
ffffffffc0201b24:	1b0000ef          	jal	ra,ffffffffc0201cd4 <swap_map_swappable>
ffffffffc0201b28:	67a2                	ld	a5,8(sp)
ffffffffc0201b2a:	ff80                	sd	s0,56(a5)
ffffffffc0201b2c:	70e2                	ld	ra,56(sp)
ffffffffc0201b2e:	7442                	ld	s0,48(sp)
ffffffffc0201b30:	74a2                	ld	s1,40(sp)
ffffffffc0201b32:	69e2                	ld	s3,24(sp)
ffffffffc0201b34:	854a                	mv	a0,s2
ffffffffc0201b36:	7902                	ld	s2,32(sp)
ffffffffc0201b38:	6121                	addi	sp,sp,64
ffffffffc0201b3a:	8082                	ret
ffffffffc0201b3c:	49dd                	li	s3,23
ffffffffc0201b3e:	b755                	j	ffffffffc0201ae2 <do_pgfault+0x38>
ffffffffc0201b40:	00007517          	auipc	a0,0x7
ffffffffc0201b44:	25850513          	addi	a0,a0,600 # ffffffffc0208d98 <commands+0xa10>
ffffffffc0201b48:	d84fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b4c:	70e2                	ld	ra,56(sp)
ffffffffc0201b4e:	7442                	ld	s0,48(sp)
ffffffffc0201b50:	74a2                	ld	s1,40(sp)
ffffffffc0201b52:	69e2                	ld	s3,24(sp)
ffffffffc0201b54:	854a                	mv	a0,s2
ffffffffc0201b56:	7902                	ld	s2,32(sp)
ffffffffc0201b58:	6121                	addi	sp,sp,64
ffffffffc0201b5a:	8082                	ret
ffffffffc0201b5c:	6c88                	ld	a0,24(s1)
ffffffffc0201b5e:	864e                	mv	a2,s3
ffffffffc0201b60:	85a2                	mv	a1,s0
ffffffffc0201b62:	b25ff0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc0201b66:	4901                	li	s2,0
ffffffffc0201b68:	f171                	bnez	a0,ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b6a:	00007517          	auipc	a0,0x7
ffffffffc0201b6e:	20650513          	addi	a0,a0,518 # ffffffffc0208d70 <commands+0x9e8>
ffffffffc0201b72:	d5afe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b76:	5971                	li	s2,-4
ffffffffc0201b78:	bf55                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b7a:	85a2                	mv	a1,s0
ffffffffc0201b7c:	00007517          	auipc	a0,0x7
ffffffffc0201b80:	1a450513          	addi	a0,a0,420 # ffffffffc0208d20 <commands+0x998>
ffffffffc0201b84:	d48fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b88:	5975                	li	s2,-3
ffffffffc0201b8a:	b74d                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b8c:	00007517          	auipc	a0,0x7
ffffffffc0201b90:	22c50513          	addi	a0,a0,556 # ffffffffc0208db8 <commands+0xa30>
ffffffffc0201b94:	d38fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201b98:	5971                	li	s2,-4
ffffffffc0201b9a:	bf49                	j	ffffffffc0201b2c <do_pgfault+0x82>
ffffffffc0201b9c:	00007517          	auipc	a0,0x7
ffffffffc0201ba0:	1b450513          	addi	a0,a0,436 # ffffffffc0208d50 <commands+0x9c8>
ffffffffc0201ba4:	d28fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201ba8:	5971                	li	s2,-4
ffffffffc0201baa:	b749                	j	ffffffffc0201b2c <do_pgfault+0x82>

ffffffffc0201bac <user_mem_check>:
ffffffffc0201bac:	7179                	addi	sp,sp,-48
ffffffffc0201bae:	f022                	sd	s0,32(sp)
ffffffffc0201bb0:	f406                	sd	ra,40(sp)
ffffffffc0201bb2:	ec26                	sd	s1,24(sp)
ffffffffc0201bb4:	e84a                	sd	s2,16(sp)
ffffffffc0201bb6:	e44e                	sd	s3,8(sp)
ffffffffc0201bb8:	e052                	sd	s4,0(sp)
ffffffffc0201bba:	842e                	mv	s0,a1
ffffffffc0201bbc:	c135                	beqz	a0,ffffffffc0201c20 <user_mem_check+0x74>
ffffffffc0201bbe:	002007b7          	lui	a5,0x200
ffffffffc0201bc2:	04f5e663          	bltu	a1,a5,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bc6:	00c584b3          	add	s1,a1,a2
ffffffffc0201bca:	0495f263          	bgeu	a1,s1,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bce:	4785                	li	a5,1
ffffffffc0201bd0:	07fe                	slli	a5,a5,0x1f
ffffffffc0201bd2:	0297ee63          	bltu	a5,s1,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bd6:	892a                	mv	s2,a0
ffffffffc0201bd8:	89b6                	mv	s3,a3
ffffffffc0201bda:	6a05                	lui	s4,0x1
ffffffffc0201bdc:	a821                	j	ffffffffc0201bf4 <user_mem_check+0x48>
ffffffffc0201bde:	0027f693          	andi	a3,a5,2
ffffffffc0201be2:	9752                	add	a4,a4,s4
ffffffffc0201be4:	8ba1                	andi	a5,a5,8
ffffffffc0201be6:	c685                	beqz	a3,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201be8:	c399                	beqz	a5,ffffffffc0201bee <user_mem_check+0x42>
ffffffffc0201bea:	02e46263          	bltu	s0,a4,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bee:	6900                	ld	s0,16(a0)
ffffffffc0201bf0:	04947663          	bgeu	s0,s1,ffffffffc0201c3c <user_mem_check+0x90>
ffffffffc0201bf4:	85a2                	mv	a1,s0
ffffffffc0201bf6:	854a                	mv	a0,s2
ffffffffc0201bf8:	b8fff0ef          	jal	ra,ffffffffc0201786 <find_vma>
ffffffffc0201bfc:	c909                	beqz	a0,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201bfe:	6518                	ld	a4,8(a0)
ffffffffc0201c00:	00e46763          	bltu	s0,a4,ffffffffc0201c0e <user_mem_check+0x62>
ffffffffc0201c04:	4d1c                	lw	a5,24(a0)
ffffffffc0201c06:	fc099ce3          	bnez	s3,ffffffffc0201bde <user_mem_check+0x32>
ffffffffc0201c0a:	8b85                	andi	a5,a5,1
ffffffffc0201c0c:	f3ed                	bnez	a5,ffffffffc0201bee <user_mem_check+0x42>
ffffffffc0201c0e:	4501                	li	a0,0
ffffffffc0201c10:	70a2                	ld	ra,40(sp)
ffffffffc0201c12:	7402                	ld	s0,32(sp)
ffffffffc0201c14:	64e2                	ld	s1,24(sp)
ffffffffc0201c16:	6942                	ld	s2,16(sp)
ffffffffc0201c18:	69a2                	ld	s3,8(sp)
ffffffffc0201c1a:	6a02                	ld	s4,0(sp)
ffffffffc0201c1c:	6145                	addi	sp,sp,48
ffffffffc0201c1e:	8082                	ret
ffffffffc0201c20:	c02007b7          	lui	a5,0xc0200
ffffffffc0201c24:	4501                	li	a0,0
ffffffffc0201c26:	fef5e5e3          	bltu	a1,a5,ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c2a:	962e                	add	a2,a2,a1
ffffffffc0201c2c:	fec5f2e3          	bgeu	a1,a2,ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c30:	c8000537          	lui	a0,0xc8000
ffffffffc0201c34:	0505                	addi	a0,a0,1
ffffffffc0201c36:	00a63533          	sltu	a0,a2,a0
ffffffffc0201c3a:	bfd9                	j	ffffffffc0201c10 <user_mem_check+0x64>
ffffffffc0201c3c:	4505                	li	a0,1
ffffffffc0201c3e:	bfc9                	j	ffffffffc0201c10 <user_mem_check+0x64>

ffffffffc0201c40 <swap_init>:
ffffffffc0201c40:	1101                	addi	sp,sp,-32
ffffffffc0201c42:	ec06                	sd	ra,24(sp)
ffffffffc0201c44:	e822                	sd	s0,16(sp)
ffffffffc0201c46:	e426                	sd	s1,8(sp)
ffffffffc0201c48:	299010ef          	jal	ra,ffffffffc02036e0 <swapfs_init>
ffffffffc0201c4c:	00018697          	auipc	a3,0x18
ffffffffc0201c50:	99c6b683          	ld	a3,-1636(a3) # ffffffffc02195e8 <max_swap_offset>
ffffffffc0201c54:	010007b7          	lui	a5,0x1000
ffffffffc0201c58:	ff968713          	addi	a4,a3,-7
ffffffffc0201c5c:	17e1                	addi	a5,a5,-8
ffffffffc0201c5e:	04e7e863          	bltu	a5,a4,ffffffffc0201cae <swap_init+0x6e>
ffffffffc0201c62:	0000c797          	auipc	a5,0xc
ffffffffc0201c66:	3ae78793          	addi	a5,a5,942 # ffffffffc020e010 <swap_manager_fifo>
ffffffffc0201c6a:	6798                	ld	a4,8(a5)
ffffffffc0201c6c:	00018497          	auipc	s1,0x18
ffffffffc0201c70:	87c48493          	addi	s1,s1,-1924 # ffffffffc02194e8 <sm>
ffffffffc0201c74:	e09c                	sd	a5,0(s1)
ffffffffc0201c76:	9702                	jalr	a4
ffffffffc0201c78:	842a                	mv	s0,a0
ffffffffc0201c7a:	c519                	beqz	a0,ffffffffc0201c88 <swap_init+0x48>
ffffffffc0201c7c:	60e2                	ld	ra,24(sp)
ffffffffc0201c7e:	8522                	mv	a0,s0
ffffffffc0201c80:	6442                	ld	s0,16(sp)
ffffffffc0201c82:	64a2                	ld	s1,8(sp)
ffffffffc0201c84:	6105                	addi	sp,sp,32
ffffffffc0201c86:	8082                	ret
ffffffffc0201c88:	609c                	ld	a5,0(s1)
ffffffffc0201c8a:	00007517          	auipc	a0,0x7
ffffffffc0201c8e:	18650513          	addi	a0,a0,390 # ffffffffc0208e10 <commands+0xa88>
ffffffffc0201c92:	638c                	ld	a1,0(a5)
ffffffffc0201c94:	4785                	li	a5,1
ffffffffc0201c96:	00018717          	auipc	a4,0x18
ffffffffc0201c9a:	84f72d23          	sw	a5,-1958(a4) # ffffffffc02194f0 <swap_init_ok>
ffffffffc0201c9e:	c2efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201ca2:	60e2                	ld	ra,24(sp)
ffffffffc0201ca4:	8522                	mv	a0,s0
ffffffffc0201ca6:	6442                	ld	s0,16(sp)
ffffffffc0201ca8:	64a2                	ld	s1,8(sp)
ffffffffc0201caa:	6105                	addi	sp,sp,32
ffffffffc0201cac:	8082                	ret
ffffffffc0201cae:	00007617          	auipc	a2,0x7
ffffffffc0201cb2:	13260613          	addi	a2,a2,306 # ffffffffc0208de0 <commands+0xa58>
ffffffffc0201cb6:	02800593          	li	a1,40
ffffffffc0201cba:	00007517          	auipc	a0,0x7
ffffffffc0201cbe:	14650513          	addi	a0,a0,326 # ffffffffc0208e00 <commands+0xa78>
ffffffffc0201cc2:	d46fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201cc6 <swap_init_mm>:
ffffffffc0201cc6:	00018797          	auipc	a5,0x18
ffffffffc0201cca:	8227b783          	ld	a5,-2014(a5) # ffffffffc02194e8 <sm>
ffffffffc0201cce:	0107b303          	ld	t1,16(a5)
ffffffffc0201cd2:	8302                	jr	t1

ffffffffc0201cd4 <swap_map_swappable>:
ffffffffc0201cd4:	00018797          	auipc	a5,0x18
ffffffffc0201cd8:	8147b783          	ld	a5,-2028(a5) # ffffffffc02194e8 <sm>
ffffffffc0201cdc:	0207b303          	ld	t1,32(a5)
ffffffffc0201ce0:	8302                	jr	t1

ffffffffc0201ce2 <swap_out>:
ffffffffc0201ce2:	711d                	addi	sp,sp,-96
ffffffffc0201ce4:	ec86                	sd	ra,88(sp)
ffffffffc0201ce6:	e8a2                	sd	s0,80(sp)
ffffffffc0201ce8:	e4a6                	sd	s1,72(sp)
ffffffffc0201cea:	e0ca                	sd	s2,64(sp)
ffffffffc0201cec:	fc4e                	sd	s3,56(sp)
ffffffffc0201cee:	f852                	sd	s4,48(sp)
ffffffffc0201cf0:	f456                	sd	s5,40(sp)
ffffffffc0201cf2:	f05a                	sd	s6,32(sp)
ffffffffc0201cf4:	ec5e                	sd	s7,24(sp)
ffffffffc0201cf6:	e862                	sd	s8,16(sp)
ffffffffc0201cf8:	cde9                	beqz	a1,ffffffffc0201dd2 <swap_out+0xf0>
ffffffffc0201cfa:	8a2e                	mv	s4,a1
ffffffffc0201cfc:	892a                	mv	s2,a0
ffffffffc0201cfe:	8ab2                	mv	s5,a2
ffffffffc0201d00:	4401                	li	s0,0
ffffffffc0201d02:	00017997          	auipc	s3,0x17
ffffffffc0201d06:	7e698993          	addi	s3,s3,2022 # ffffffffc02194e8 <sm>
ffffffffc0201d0a:	00007b17          	auipc	s6,0x7
ffffffffc0201d0e:	17eb0b13          	addi	s6,s6,382 # ffffffffc0208e88 <commands+0xb00>
ffffffffc0201d12:	00007b97          	auipc	s7,0x7
ffffffffc0201d16:	15eb8b93          	addi	s7,s7,350 # ffffffffc0208e70 <commands+0xae8>
ffffffffc0201d1a:	a825                	j	ffffffffc0201d52 <swap_out+0x70>
ffffffffc0201d1c:	67a2                	ld	a5,8(sp)
ffffffffc0201d1e:	8626                	mv	a2,s1
ffffffffc0201d20:	85a2                	mv	a1,s0
ffffffffc0201d22:	7f94                	ld	a3,56(a5)
ffffffffc0201d24:	855a                	mv	a0,s6
ffffffffc0201d26:	2405                	addiw	s0,s0,1
ffffffffc0201d28:	82b1                	srli	a3,a3,0xc
ffffffffc0201d2a:	0685                	addi	a3,a3,1
ffffffffc0201d2c:	ba0fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201d30:	6522                	ld	a0,8(sp)
ffffffffc0201d32:	4585                	li	a1,1
ffffffffc0201d34:	7d1c                	ld	a5,56(a0)
ffffffffc0201d36:	83b1                	srli	a5,a5,0xc
ffffffffc0201d38:	0785                	addi	a5,a5,1
ffffffffc0201d3a:	07a2                	slli	a5,a5,0x8
ffffffffc0201d3c:	00fc3023          	sd	a5,0(s8)
ffffffffc0201d40:	89cff0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0201d44:	01893503          	ld	a0,24(s2)
ffffffffc0201d48:	85a6                	mv	a1,s1
ffffffffc0201d4a:	937ff0ef          	jal	ra,ffffffffc0201680 <tlb_invalidate>
ffffffffc0201d4e:	048a0d63          	beq	s4,s0,ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201d52:	0009b783          	ld	a5,0(s3)
ffffffffc0201d56:	8656                	mv	a2,s5
ffffffffc0201d58:	002c                	addi	a1,sp,8
ffffffffc0201d5a:	7b9c                	ld	a5,48(a5)
ffffffffc0201d5c:	854a                	mv	a0,s2
ffffffffc0201d5e:	9782                	jalr	a5
ffffffffc0201d60:	e12d                	bnez	a0,ffffffffc0201dc2 <swap_out+0xe0>
ffffffffc0201d62:	67a2                	ld	a5,8(sp)
ffffffffc0201d64:	01893503          	ld	a0,24(s2)
ffffffffc0201d68:	4601                	li	a2,0
ffffffffc0201d6a:	7f84                	ld	s1,56(a5)
ffffffffc0201d6c:	85a6                	mv	a1,s1
ffffffffc0201d6e:	a40ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201d72:	611c                	ld	a5,0(a0)
ffffffffc0201d74:	8c2a                	mv	s8,a0
ffffffffc0201d76:	8b85                	andi	a5,a5,1
ffffffffc0201d78:	cfb9                	beqz	a5,ffffffffc0201dd6 <swap_out+0xf4>
ffffffffc0201d7a:	65a2                	ld	a1,8(sp)
ffffffffc0201d7c:	7d9c                	ld	a5,56(a1)
ffffffffc0201d7e:	83b1                	srli	a5,a5,0xc
ffffffffc0201d80:	0785                	addi	a5,a5,1
ffffffffc0201d82:	00879513          	slli	a0,a5,0x8
ffffffffc0201d86:	221010ef          	jal	ra,ffffffffc02037a6 <swapfs_write>
ffffffffc0201d8a:	d949                	beqz	a0,ffffffffc0201d1c <swap_out+0x3a>
ffffffffc0201d8c:	855e                	mv	a0,s7
ffffffffc0201d8e:	b3efe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201d92:	0009b783          	ld	a5,0(s3)
ffffffffc0201d96:	6622                	ld	a2,8(sp)
ffffffffc0201d98:	4681                	li	a3,0
ffffffffc0201d9a:	739c                	ld	a5,32(a5)
ffffffffc0201d9c:	85a6                	mv	a1,s1
ffffffffc0201d9e:	854a                	mv	a0,s2
ffffffffc0201da0:	2405                	addiw	s0,s0,1
ffffffffc0201da2:	9782                	jalr	a5
ffffffffc0201da4:	fa8a17e3          	bne	s4,s0,ffffffffc0201d52 <swap_out+0x70>
ffffffffc0201da8:	60e6                	ld	ra,88(sp)
ffffffffc0201daa:	8522                	mv	a0,s0
ffffffffc0201dac:	6446                	ld	s0,80(sp)
ffffffffc0201dae:	64a6                	ld	s1,72(sp)
ffffffffc0201db0:	6906                	ld	s2,64(sp)
ffffffffc0201db2:	79e2                	ld	s3,56(sp)
ffffffffc0201db4:	7a42                	ld	s4,48(sp)
ffffffffc0201db6:	7aa2                	ld	s5,40(sp)
ffffffffc0201db8:	7b02                	ld	s6,32(sp)
ffffffffc0201dba:	6be2                	ld	s7,24(sp)
ffffffffc0201dbc:	6c42                	ld	s8,16(sp)
ffffffffc0201dbe:	6125                	addi	sp,sp,96
ffffffffc0201dc0:	8082                	ret
ffffffffc0201dc2:	85a2                	mv	a1,s0
ffffffffc0201dc4:	00007517          	auipc	a0,0x7
ffffffffc0201dc8:	06450513          	addi	a0,a0,100 # ffffffffc0208e28 <commands+0xaa0>
ffffffffc0201dcc:	b00fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201dd0:	bfe1                	j	ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201dd2:	4401                	li	s0,0
ffffffffc0201dd4:	bfd1                	j	ffffffffc0201da8 <swap_out+0xc6>
ffffffffc0201dd6:	00007697          	auipc	a3,0x7
ffffffffc0201dda:	08268693          	addi	a3,a3,130 # ffffffffc0208e58 <commands+0xad0>
ffffffffc0201dde:	00007617          	auipc	a2,0x7
ffffffffc0201de2:	9ba60613          	addi	a2,a2,-1606 # ffffffffc0208798 <commands+0x410>
ffffffffc0201de6:	06800593          	li	a1,104
ffffffffc0201dea:	00007517          	auipc	a0,0x7
ffffffffc0201dee:	01650513          	addi	a0,a0,22 # ffffffffc0208e00 <commands+0xa78>
ffffffffc0201df2:	c16fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201df6 <swap_in>:
ffffffffc0201df6:	7179                	addi	sp,sp,-48
ffffffffc0201df8:	e84a                	sd	s2,16(sp)
ffffffffc0201dfa:	892a                	mv	s2,a0
ffffffffc0201dfc:	4505                	li	a0,1
ffffffffc0201dfe:	ec26                	sd	s1,24(sp)
ffffffffc0201e00:	e44e                	sd	s3,8(sp)
ffffffffc0201e02:	f406                	sd	ra,40(sp)
ffffffffc0201e04:	f022                	sd	s0,32(sp)
ffffffffc0201e06:	84ae                	mv	s1,a1
ffffffffc0201e08:	89b2                	mv	s3,a2
ffffffffc0201e0a:	f41fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201e0e:	c129                	beqz	a0,ffffffffc0201e50 <swap_in+0x5a>
ffffffffc0201e10:	842a                	mv	s0,a0
ffffffffc0201e12:	01893503          	ld	a0,24(s2)
ffffffffc0201e16:	4601                	li	a2,0
ffffffffc0201e18:	85a6                	mv	a1,s1
ffffffffc0201e1a:	994ff0ef          	jal	ra,ffffffffc0200fae <get_pte>
ffffffffc0201e1e:	892a                	mv	s2,a0
ffffffffc0201e20:	6108                	ld	a0,0(a0)
ffffffffc0201e22:	85a2                	mv	a1,s0
ffffffffc0201e24:	0f5010ef          	jal	ra,ffffffffc0203718 <swapfs_read>
ffffffffc0201e28:	00093583          	ld	a1,0(s2)
ffffffffc0201e2c:	8626                	mv	a2,s1
ffffffffc0201e2e:	00007517          	auipc	a0,0x7
ffffffffc0201e32:	0aa50513          	addi	a0,a0,170 # ffffffffc0208ed8 <commands+0xb50>
ffffffffc0201e36:	81a1                	srli	a1,a1,0x8
ffffffffc0201e38:	a94fe0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0201e3c:	70a2                	ld	ra,40(sp)
ffffffffc0201e3e:	0089b023          	sd	s0,0(s3)
ffffffffc0201e42:	7402                	ld	s0,32(sp)
ffffffffc0201e44:	64e2                	ld	s1,24(sp)
ffffffffc0201e46:	6942                	ld	s2,16(sp)
ffffffffc0201e48:	69a2                	ld	s3,8(sp)
ffffffffc0201e4a:	4501                	li	a0,0
ffffffffc0201e4c:	6145                	addi	sp,sp,48
ffffffffc0201e4e:	8082                	ret
ffffffffc0201e50:	00007697          	auipc	a3,0x7
ffffffffc0201e54:	07868693          	addi	a3,a3,120 # ffffffffc0208ec8 <commands+0xb40>
ffffffffc0201e58:	00007617          	auipc	a2,0x7
ffffffffc0201e5c:	94060613          	addi	a2,a2,-1728 # ffffffffc0208798 <commands+0x410>
ffffffffc0201e60:	07e00593          	li	a1,126
ffffffffc0201e64:	00007517          	auipc	a0,0x7
ffffffffc0201e68:	f9c50513          	addi	a0,a0,-100 # ffffffffc0208e00 <commands+0xa78>
ffffffffc0201e6c:	b9cfe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201e70 <slob_free>:
ffffffffc0201e70:	c145                	beqz	a0,ffffffffc0201f10 <slob_free+0xa0>
ffffffffc0201e72:	1141                	addi	sp,sp,-16
ffffffffc0201e74:	e022                	sd	s0,0(sp)
ffffffffc0201e76:	e406                	sd	ra,8(sp)
ffffffffc0201e78:	842a                	mv	s0,a0
ffffffffc0201e7a:	edb1                	bnez	a1,ffffffffc0201ed6 <slob_free+0x66>
ffffffffc0201e7c:	100027f3          	csrr	a5,sstatus
ffffffffc0201e80:	8b89                	andi	a5,a5,2
ffffffffc0201e82:	4501                	li	a0,0
ffffffffc0201e84:	e3ad                	bnez	a5,ffffffffc0201ee6 <slob_free+0x76>
ffffffffc0201e86:	0000c617          	auipc	a2,0xc
ffffffffc0201e8a:	1fa60613          	addi	a2,a2,506 # ffffffffc020e080 <slobfree>
ffffffffc0201e8e:	621c                	ld	a5,0(a2)
ffffffffc0201e90:	6798                	ld	a4,8(a5)
ffffffffc0201e92:	0087fa63          	bgeu	a5,s0,ffffffffc0201ea6 <slob_free+0x36>
ffffffffc0201e96:	00e46c63          	bltu	s0,a4,ffffffffc0201eae <slob_free+0x3e>
ffffffffc0201e9a:	00e7fa63          	bgeu	a5,a4,ffffffffc0201eae <slob_free+0x3e>
ffffffffc0201e9e:	87ba                	mv	a5,a4
ffffffffc0201ea0:	6798                	ld	a4,8(a5)
ffffffffc0201ea2:	fe87eae3          	bltu	a5,s0,ffffffffc0201e96 <slob_free+0x26>
ffffffffc0201ea6:	fee7ece3          	bltu	a5,a4,ffffffffc0201e9e <slob_free+0x2e>
ffffffffc0201eaa:	fee47ae3          	bgeu	s0,a4,ffffffffc0201e9e <slob_free+0x2e>
ffffffffc0201eae:	400c                	lw	a1,0(s0)
ffffffffc0201eb0:	00459693          	slli	a3,a1,0x4
ffffffffc0201eb4:	96a2                	add	a3,a3,s0
ffffffffc0201eb6:	04d70763          	beq	a4,a3,ffffffffc0201f04 <slob_free+0x94>
ffffffffc0201eba:	e418                	sd	a4,8(s0)
ffffffffc0201ebc:	4394                	lw	a3,0(a5)
ffffffffc0201ebe:	00469713          	slli	a4,a3,0x4
ffffffffc0201ec2:	973e                	add	a4,a4,a5
ffffffffc0201ec4:	02e40a63          	beq	s0,a4,ffffffffc0201ef8 <slob_free+0x88>
ffffffffc0201ec8:	e780                	sd	s0,8(a5)
ffffffffc0201eca:	e21c                	sd	a5,0(a2)
ffffffffc0201ecc:	e10d                	bnez	a0,ffffffffc0201eee <slob_free+0x7e>
ffffffffc0201ece:	60a2                	ld	ra,8(sp)
ffffffffc0201ed0:	6402                	ld	s0,0(sp)
ffffffffc0201ed2:	0141                	addi	sp,sp,16
ffffffffc0201ed4:	8082                	ret
ffffffffc0201ed6:	05bd                	addi	a1,a1,15
ffffffffc0201ed8:	8191                	srli	a1,a1,0x4
ffffffffc0201eda:	c10c                	sw	a1,0(a0)
ffffffffc0201edc:	100027f3          	csrr	a5,sstatus
ffffffffc0201ee0:	8b89                	andi	a5,a5,2
ffffffffc0201ee2:	4501                	li	a0,0
ffffffffc0201ee4:	d3cd                	beqz	a5,ffffffffc0201e86 <slob_free+0x16>
ffffffffc0201ee6:	f52fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0201eea:	4505                	li	a0,1
ffffffffc0201eec:	bf69                	j	ffffffffc0201e86 <slob_free+0x16>
ffffffffc0201eee:	6402                	ld	s0,0(sp)
ffffffffc0201ef0:	60a2                	ld	ra,8(sp)
ffffffffc0201ef2:	0141                	addi	sp,sp,16
ffffffffc0201ef4:	f3efe06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0201ef8:	4018                	lw	a4,0(s0)
ffffffffc0201efa:	640c                	ld	a1,8(s0)
ffffffffc0201efc:	9eb9                	addw	a3,a3,a4
ffffffffc0201efe:	c394                	sw	a3,0(a5)
ffffffffc0201f00:	e78c                	sd	a1,8(a5)
ffffffffc0201f02:	b7e1                	j	ffffffffc0201eca <slob_free+0x5a>
ffffffffc0201f04:	4314                	lw	a3,0(a4)
ffffffffc0201f06:	6718                	ld	a4,8(a4)
ffffffffc0201f08:	9db5                	addw	a1,a1,a3
ffffffffc0201f0a:	c00c                	sw	a1,0(s0)
ffffffffc0201f0c:	e418                	sd	a4,8(s0)
ffffffffc0201f0e:	b77d                	j	ffffffffc0201ebc <slob_free+0x4c>
ffffffffc0201f10:	8082                	ret

ffffffffc0201f12 <__slob_get_free_pages.isra.0>:
ffffffffc0201f12:	4785                	li	a5,1
ffffffffc0201f14:	1141                	addi	sp,sp,-16
ffffffffc0201f16:	00a7953b          	sllw	a0,a5,a0
ffffffffc0201f1a:	e406                	sd	ra,8(sp)
ffffffffc0201f1c:	e2ffe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0201f20:	c91d                	beqz	a0,ffffffffc0201f56 <__slob_get_free_pages.isra.0+0x44>
ffffffffc0201f22:	00017697          	auipc	a3,0x17
ffffffffc0201f26:	62e6b683          	ld	a3,1582(a3) # ffffffffc0219550 <pages>
ffffffffc0201f2a:	8d15                	sub	a0,a0,a3
ffffffffc0201f2c:	8519                	srai	a0,a0,0x6
ffffffffc0201f2e:	00009697          	auipc	a3,0x9
ffffffffc0201f32:	9ca6b683          	ld	a3,-1590(a3) # ffffffffc020a8f8 <nbase>
ffffffffc0201f36:	9536                	add	a0,a0,a3
ffffffffc0201f38:	00c51793          	slli	a5,a0,0xc
ffffffffc0201f3c:	83b1                	srli	a5,a5,0xc
ffffffffc0201f3e:	00017717          	auipc	a4,0x17
ffffffffc0201f42:	59a73703          	ld	a4,1434(a4) # ffffffffc02194d8 <npage>
ffffffffc0201f46:	0532                	slli	a0,a0,0xc
ffffffffc0201f48:	00e7fa63          	bgeu	a5,a4,ffffffffc0201f5c <__slob_get_free_pages.isra.0+0x4a>
ffffffffc0201f4c:	00017697          	auipc	a3,0x17
ffffffffc0201f50:	5f46b683          	ld	a3,1524(a3) # ffffffffc0219540 <va_pa_offset>
ffffffffc0201f54:	9536                	add	a0,a0,a3
ffffffffc0201f56:	60a2                	ld	ra,8(sp)
ffffffffc0201f58:	0141                	addi	sp,sp,16
ffffffffc0201f5a:	8082                	ret
ffffffffc0201f5c:	86aa                	mv	a3,a0
ffffffffc0201f5e:	00007617          	auipc	a2,0x7
ffffffffc0201f62:	bea60613          	addi	a2,a2,-1046 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0201f66:	06900593          	li	a1,105
ffffffffc0201f6a:	00007517          	auipc	a0,0x7
ffffffffc0201f6e:	b3e50513          	addi	a0,a0,-1218 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0201f72:	a96fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>:
ffffffffc0201f76:	1101                	addi	sp,sp,-32
ffffffffc0201f78:	ec06                	sd	ra,24(sp)
ffffffffc0201f7a:	e822                	sd	s0,16(sp)
ffffffffc0201f7c:	e426                	sd	s1,8(sp)
ffffffffc0201f7e:	e04a                	sd	s2,0(sp)
ffffffffc0201f80:	01050713          	addi	a4,a0,16
ffffffffc0201f84:	6785                	lui	a5,0x1
ffffffffc0201f86:	0cf77363          	bgeu	a4,a5,ffffffffc020204c <slob_alloc.isra.0.constprop.0+0xd6>
ffffffffc0201f8a:	00f50493          	addi	s1,a0,15
ffffffffc0201f8e:	8091                	srli	s1,s1,0x4
ffffffffc0201f90:	2481                	sext.w	s1,s1
ffffffffc0201f92:	10002673          	csrr	a2,sstatus
ffffffffc0201f96:	8a09                	andi	a2,a2,2
ffffffffc0201f98:	e25d                	bnez	a2,ffffffffc020203e <slob_alloc.isra.0.constprop.0+0xc8>
ffffffffc0201f9a:	0000c917          	auipc	s2,0xc
ffffffffc0201f9e:	0e690913          	addi	s2,s2,230 # ffffffffc020e080 <slobfree>
ffffffffc0201fa2:	00093683          	ld	a3,0(s2)
ffffffffc0201fa6:	669c                	ld	a5,8(a3)
ffffffffc0201fa8:	4398                	lw	a4,0(a5)
ffffffffc0201faa:	08975e63          	bge	a4,s1,ffffffffc0202046 <slob_alloc.isra.0.constprop.0+0xd0>
ffffffffc0201fae:	00d78b63          	beq	a5,a3,ffffffffc0201fc4 <slob_alloc.isra.0.constprop.0+0x4e>
ffffffffc0201fb2:	6780                	ld	s0,8(a5)
ffffffffc0201fb4:	4018                	lw	a4,0(s0)
ffffffffc0201fb6:	02975a63          	bge	a4,s1,ffffffffc0201fea <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc0201fba:	00093683          	ld	a3,0(s2)
ffffffffc0201fbe:	87a2                	mv	a5,s0
ffffffffc0201fc0:	fed799e3          	bne	a5,a3,ffffffffc0201fb2 <slob_alloc.isra.0.constprop.0+0x3c>
ffffffffc0201fc4:	ee31                	bnez	a2,ffffffffc0202020 <slob_alloc.isra.0.constprop.0+0xaa>
ffffffffc0201fc6:	4501                	li	a0,0
ffffffffc0201fc8:	f4bff0ef          	jal	ra,ffffffffc0201f12 <__slob_get_free_pages.isra.0>
ffffffffc0201fcc:	842a                	mv	s0,a0
ffffffffc0201fce:	cd05                	beqz	a0,ffffffffc0202006 <slob_alloc.isra.0.constprop.0+0x90>
ffffffffc0201fd0:	6585                	lui	a1,0x1
ffffffffc0201fd2:	e9fff0ef          	jal	ra,ffffffffc0201e70 <slob_free>
ffffffffc0201fd6:	10002673          	csrr	a2,sstatus
ffffffffc0201fda:	8a09                	andi	a2,a2,2
ffffffffc0201fdc:	ee05                	bnez	a2,ffffffffc0202014 <slob_alloc.isra.0.constprop.0+0x9e>
ffffffffc0201fde:	00093783          	ld	a5,0(s2)
ffffffffc0201fe2:	6780                	ld	s0,8(a5)
ffffffffc0201fe4:	4018                	lw	a4,0(s0)
ffffffffc0201fe6:	fc974ae3          	blt	a4,s1,ffffffffc0201fba <slob_alloc.isra.0.constprop.0+0x44>
ffffffffc0201fea:	04e48763          	beq	s1,a4,ffffffffc0202038 <slob_alloc.isra.0.constprop.0+0xc2>
ffffffffc0201fee:	00449693          	slli	a3,s1,0x4
ffffffffc0201ff2:	96a2                	add	a3,a3,s0
ffffffffc0201ff4:	e794                	sd	a3,8(a5)
ffffffffc0201ff6:	640c                	ld	a1,8(s0)
ffffffffc0201ff8:	9f05                	subw	a4,a4,s1
ffffffffc0201ffa:	c298                	sw	a4,0(a3)
ffffffffc0201ffc:	e68c                	sd	a1,8(a3)
ffffffffc0201ffe:	c004                	sw	s1,0(s0)
ffffffffc0202000:	00f93023          	sd	a5,0(s2)
ffffffffc0202004:	e20d                	bnez	a2,ffffffffc0202026 <slob_alloc.isra.0.constprop.0+0xb0>
ffffffffc0202006:	60e2                	ld	ra,24(sp)
ffffffffc0202008:	8522                	mv	a0,s0
ffffffffc020200a:	6442                	ld	s0,16(sp)
ffffffffc020200c:	64a2                	ld	s1,8(sp)
ffffffffc020200e:	6902                	ld	s2,0(sp)
ffffffffc0202010:	6105                	addi	sp,sp,32
ffffffffc0202012:	8082                	ret
ffffffffc0202014:	e24fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202018:	00093783          	ld	a5,0(s2)
ffffffffc020201c:	4605                	li	a2,1
ffffffffc020201e:	b7d1                	j	ffffffffc0201fe2 <slob_alloc.isra.0.constprop.0+0x6c>
ffffffffc0202020:	e12fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0202024:	b74d                	j	ffffffffc0201fc6 <slob_alloc.isra.0.constprop.0+0x50>
ffffffffc0202026:	e0cfe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020202a:	60e2                	ld	ra,24(sp)
ffffffffc020202c:	8522                	mv	a0,s0
ffffffffc020202e:	6442                	ld	s0,16(sp)
ffffffffc0202030:	64a2                	ld	s1,8(sp)
ffffffffc0202032:	6902                	ld	s2,0(sp)
ffffffffc0202034:	6105                	addi	sp,sp,32
ffffffffc0202036:	8082                	ret
ffffffffc0202038:	6418                	ld	a4,8(s0)
ffffffffc020203a:	e798                	sd	a4,8(a5)
ffffffffc020203c:	b7d1                	j	ffffffffc0202000 <slob_alloc.isra.0.constprop.0+0x8a>
ffffffffc020203e:	dfafe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0202042:	4605                	li	a2,1
ffffffffc0202044:	bf99                	j	ffffffffc0201f9a <slob_alloc.isra.0.constprop.0+0x24>
ffffffffc0202046:	843e                	mv	s0,a5
ffffffffc0202048:	87b6                	mv	a5,a3
ffffffffc020204a:	b745                	j	ffffffffc0201fea <slob_alloc.isra.0.constprop.0+0x74>
ffffffffc020204c:	00007697          	auipc	a3,0x7
ffffffffc0202050:	ecc68693          	addi	a3,a3,-308 # ffffffffc0208f18 <commands+0xb90>
ffffffffc0202054:	00006617          	auipc	a2,0x6
ffffffffc0202058:	74460613          	addi	a2,a2,1860 # ffffffffc0208798 <commands+0x410>
ffffffffc020205c:	06400593          	li	a1,100
ffffffffc0202060:	00007517          	auipc	a0,0x7
ffffffffc0202064:	ed850513          	addi	a0,a0,-296 # ffffffffc0208f38 <commands+0xbb0>
ffffffffc0202068:	9a0fe0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020206c <kallocated>:
ffffffffc020206c:	4501                	li	a0,0
ffffffffc020206e:	8082                	ret

ffffffffc0202070 <kmalloc>:
ffffffffc0202070:	1101                	addi	sp,sp,-32
ffffffffc0202072:	e04a                	sd	s2,0(sp)
ffffffffc0202074:	6905                	lui	s2,0x1
ffffffffc0202076:	e822                	sd	s0,16(sp)
ffffffffc0202078:	ec06                	sd	ra,24(sp)
ffffffffc020207a:	e426                	sd	s1,8(sp)
ffffffffc020207c:	fef90793          	addi	a5,s2,-17 # fef <kern_entry-0xffffffffc01ff011>
ffffffffc0202080:	842a                	mv	s0,a0
ffffffffc0202082:	04a7f963          	bgeu	a5,a0,ffffffffc02020d4 <kmalloc+0x64>
ffffffffc0202086:	4561                	li	a0,24
ffffffffc0202088:	eefff0ef          	jal	ra,ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>
ffffffffc020208c:	84aa                	mv	s1,a0
ffffffffc020208e:	c929                	beqz	a0,ffffffffc02020e0 <kmalloc+0x70>
ffffffffc0202090:	0004079b          	sext.w	a5,s0
ffffffffc0202094:	4501                	li	a0,0
ffffffffc0202096:	00f95763          	bge	s2,a5,ffffffffc02020a4 <kmalloc+0x34>
ffffffffc020209a:	6705                	lui	a4,0x1
ffffffffc020209c:	8785                	srai	a5,a5,0x1
ffffffffc020209e:	2505                	addiw	a0,a0,1
ffffffffc02020a0:	fef74ee3          	blt	a4,a5,ffffffffc020209c <kmalloc+0x2c>
ffffffffc02020a4:	c088                	sw	a0,0(s1)
ffffffffc02020a6:	e6dff0ef          	jal	ra,ffffffffc0201f12 <__slob_get_free_pages.isra.0>
ffffffffc02020aa:	e488                	sd	a0,8(s1)
ffffffffc02020ac:	842a                	mv	s0,a0
ffffffffc02020ae:	c525                	beqz	a0,ffffffffc0202116 <kmalloc+0xa6>
ffffffffc02020b0:	100027f3          	csrr	a5,sstatus
ffffffffc02020b4:	8b89                	andi	a5,a5,2
ffffffffc02020b6:	ef8d                	bnez	a5,ffffffffc02020f0 <kmalloc+0x80>
ffffffffc02020b8:	00017797          	auipc	a5,0x17
ffffffffc02020bc:	44078793          	addi	a5,a5,1088 # ffffffffc02194f8 <bigblocks>
ffffffffc02020c0:	6398                	ld	a4,0(a5)
ffffffffc02020c2:	e384                	sd	s1,0(a5)
ffffffffc02020c4:	e898                	sd	a4,16(s1)
ffffffffc02020c6:	60e2                	ld	ra,24(sp)
ffffffffc02020c8:	8522                	mv	a0,s0
ffffffffc02020ca:	6442                	ld	s0,16(sp)
ffffffffc02020cc:	64a2                	ld	s1,8(sp)
ffffffffc02020ce:	6902                	ld	s2,0(sp)
ffffffffc02020d0:	6105                	addi	sp,sp,32
ffffffffc02020d2:	8082                	ret
ffffffffc02020d4:	0541                	addi	a0,a0,16
ffffffffc02020d6:	ea1ff0ef          	jal	ra,ffffffffc0201f76 <slob_alloc.isra.0.constprop.0>
ffffffffc02020da:	01050413          	addi	s0,a0,16
ffffffffc02020de:	f565                	bnez	a0,ffffffffc02020c6 <kmalloc+0x56>
ffffffffc02020e0:	4401                	li	s0,0
ffffffffc02020e2:	60e2                	ld	ra,24(sp)
ffffffffc02020e4:	8522                	mv	a0,s0
ffffffffc02020e6:	6442                	ld	s0,16(sp)
ffffffffc02020e8:	64a2                	ld	s1,8(sp)
ffffffffc02020ea:	6902                	ld	s2,0(sp)
ffffffffc02020ec:	6105                	addi	sp,sp,32
ffffffffc02020ee:	8082                	ret
ffffffffc02020f0:	d48fe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02020f4:	00017797          	auipc	a5,0x17
ffffffffc02020f8:	40478793          	addi	a5,a5,1028 # ffffffffc02194f8 <bigblocks>
ffffffffc02020fc:	6398                	ld	a4,0(a5)
ffffffffc02020fe:	e384                	sd	s1,0(a5)
ffffffffc0202100:	e898                	sd	a4,16(s1)
ffffffffc0202102:	d30fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0202106:	6480                	ld	s0,8(s1)
ffffffffc0202108:	60e2                	ld	ra,24(sp)
ffffffffc020210a:	64a2                	ld	s1,8(sp)
ffffffffc020210c:	8522                	mv	a0,s0
ffffffffc020210e:	6442                	ld	s0,16(sp)
ffffffffc0202110:	6902                	ld	s2,0(sp)
ffffffffc0202112:	6105                	addi	sp,sp,32
ffffffffc0202114:	8082                	ret
ffffffffc0202116:	45e1                	li	a1,24
ffffffffc0202118:	8526                	mv	a0,s1
ffffffffc020211a:	d57ff0ef          	jal	ra,ffffffffc0201e70 <slob_free>
ffffffffc020211e:	b765                	j	ffffffffc02020c6 <kmalloc+0x56>

ffffffffc0202120 <kfree>:
ffffffffc0202120:	c169                	beqz	a0,ffffffffc02021e2 <kfree+0xc2>
ffffffffc0202122:	1101                	addi	sp,sp,-32
ffffffffc0202124:	e822                	sd	s0,16(sp)
ffffffffc0202126:	ec06                	sd	ra,24(sp)
ffffffffc0202128:	e426                	sd	s1,8(sp)
ffffffffc020212a:	03451793          	slli	a5,a0,0x34
ffffffffc020212e:	842a                	mv	s0,a0
ffffffffc0202130:	e7c9                	bnez	a5,ffffffffc02021ba <kfree+0x9a>
ffffffffc0202132:	100027f3          	csrr	a5,sstatus
ffffffffc0202136:	8b89                	andi	a5,a5,2
ffffffffc0202138:	ebc9                	bnez	a5,ffffffffc02021ca <kfree+0xaa>
ffffffffc020213a:	00017797          	auipc	a5,0x17
ffffffffc020213e:	3be7b783          	ld	a5,958(a5) # ffffffffc02194f8 <bigblocks>
ffffffffc0202142:	4601                	li	a2,0
ffffffffc0202144:	cbbd                	beqz	a5,ffffffffc02021ba <kfree+0x9a>
ffffffffc0202146:	00017697          	auipc	a3,0x17
ffffffffc020214a:	3b268693          	addi	a3,a3,946 # ffffffffc02194f8 <bigblocks>
ffffffffc020214e:	a021                	j	ffffffffc0202156 <kfree+0x36>
ffffffffc0202150:	01048693          	addi	a3,s1,16
ffffffffc0202154:	c3a5                	beqz	a5,ffffffffc02021b4 <kfree+0x94>
ffffffffc0202156:	6798                	ld	a4,8(a5)
ffffffffc0202158:	84be                	mv	s1,a5
ffffffffc020215a:	6b9c                	ld	a5,16(a5)
ffffffffc020215c:	fe871ae3          	bne	a4,s0,ffffffffc0202150 <kfree+0x30>
ffffffffc0202160:	e29c                	sd	a5,0(a3)
ffffffffc0202162:	ee2d                	bnez	a2,ffffffffc02021dc <kfree+0xbc>
ffffffffc0202164:	c02007b7          	lui	a5,0xc0200
ffffffffc0202168:	4098                	lw	a4,0(s1)
ffffffffc020216a:	08f46963          	bltu	s0,a5,ffffffffc02021fc <kfree+0xdc>
ffffffffc020216e:	00017697          	auipc	a3,0x17
ffffffffc0202172:	3d26b683          	ld	a3,978(a3) # ffffffffc0219540 <va_pa_offset>
ffffffffc0202176:	8c15                	sub	s0,s0,a3
ffffffffc0202178:	8031                	srli	s0,s0,0xc
ffffffffc020217a:	00017797          	auipc	a5,0x17
ffffffffc020217e:	35e7b783          	ld	a5,862(a5) # ffffffffc02194d8 <npage>
ffffffffc0202182:	06f47163          	bgeu	s0,a5,ffffffffc02021e4 <kfree+0xc4>
ffffffffc0202186:	00008517          	auipc	a0,0x8
ffffffffc020218a:	77253503          	ld	a0,1906(a0) # ffffffffc020a8f8 <nbase>
ffffffffc020218e:	8c09                	sub	s0,s0,a0
ffffffffc0202190:	041a                	slli	s0,s0,0x6
ffffffffc0202192:	00017517          	auipc	a0,0x17
ffffffffc0202196:	3be53503          	ld	a0,958(a0) # ffffffffc0219550 <pages>
ffffffffc020219a:	4585                	li	a1,1
ffffffffc020219c:	9522                	add	a0,a0,s0
ffffffffc020219e:	00e595bb          	sllw	a1,a1,a4
ffffffffc02021a2:	c3bfe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02021a6:	6442                	ld	s0,16(sp)
ffffffffc02021a8:	60e2                	ld	ra,24(sp)
ffffffffc02021aa:	8526                	mv	a0,s1
ffffffffc02021ac:	64a2                	ld	s1,8(sp)
ffffffffc02021ae:	45e1                	li	a1,24
ffffffffc02021b0:	6105                	addi	sp,sp,32
ffffffffc02021b2:	b97d                	j	ffffffffc0201e70 <slob_free>
ffffffffc02021b4:	c219                	beqz	a2,ffffffffc02021ba <kfree+0x9a>
ffffffffc02021b6:	c7cfe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02021ba:	ff040513          	addi	a0,s0,-16
ffffffffc02021be:	6442                	ld	s0,16(sp)
ffffffffc02021c0:	60e2                	ld	ra,24(sp)
ffffffffc02021c2:	64a2                	ld	s1,8(sp)
ffffffffc02021c4:	4581                	li	a1,0
ffffffffc02021c6:	6105                	addi	sp,sp,32
ffffffffc02021c8:	b165                	j	ffffffffc0201e70 <slob_free>
ffffffffc02021ca:	c6efe0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02021ce:	00017797          	auipc	a5,0x17
ffffffffc02021d2:	32a7b783          	ld	a5,810(a5) # ffffffffc02194f8 <bigblocks>
ffffffffc02021d6:	4605                	li	a2,1
ffffffffc02021d8:	f7bd                	bnez	a5,ffffffffc0202146 <kfree+0x26>
ffffffffc02021da:	bff1                	j	ffffffffc02021b6 <kfree+0x96>
ffffffffc02021dc:	c56fe0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02021e0:	b751                	j	ffffffffc0202164 <kfree+0x44>
ffffffffc02021e2:	8082                	ret
ffffffffc02021e4:	00007617          	auipc	a2,0x7
ffffffffc02021e8:	8a460613          	addi	a2,a2,-1884 # ffffffffc0208a88 <commands+0x700>
ffffffffc02021ec:	06200593          	li	a1,98
ffffffffc02021f0:	00007517          	auipc	a0,0x7
ffffffffc02021f4:	8b850513          	addi	a0,a0,-1864 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02021f8:	810fe0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02021fc:	86a2                	mv	a3,s0
ffffffffc02021fe:	00007617          	auipc	a2,0x7
ffffffffc0202202:	91260613          	addi	a2,a2,-1774 # ffffffffc0208b10 <commands+0x788>
ffffffffc0202206:	06e00593          	li	a1,110
ffffffffc020220a:	00007517          	auipc	a0,0x7
ffffffffc020220e:	89e50513          	addi	a0,a0,-1890 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0202212:	ff7fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202216 <_fifo_init_mm>:
ffffffffc0202216:	00017797          	auipc	a5,0x17
ffffffffc020221a:	41278793          	addi	a5,a5,1042 # ffffffffc0219628 <pra_list_head>
ffffffffc020221e:	f51c                	sd	a5,40(a0)
ffffffffc0202220:	e79c                	sd	a5,8(a5)
ffffffffc0202222:	e39c                	sd	a5,0(a5)
ffffffffc0202224:	4501                	li	a0,0
ffffffffc0202226:	8082                	ret

ffffffffc0202228 <_fifo_init>:
ffffffffc0202228:	4501                	li	a0,0
ffffffffc020222a:	8082                	ret

ffffffffc020222c <_fifo_set_unswappable>:
ffffffffc020222c:	4501                	li	a0,0
ffffffffc020222e:	8082                	ret

ffffffffc0202230 <_fifo_tick_event>:
ffffffffc0202230:	4501                	li	a0,0
ffffffffc0202232:	8082                	ret

ffffffffc0202234 <_fifo_check_swap>:
ffffffffc0202234:	711d                	addi	sp,sp,-96
ffffffffc0202236:	fc4e                	sd	s3,56(sp)
ffffffffc0202238:	f852                	sd	s4,48(sp)
ffffffffc020223a:	00007517          	auipc	a0,0x7
ffffffffc020223e:	d1650513          	addi	a0,a0,-746 # ffffffffc0208f50 <commands+0xbc8>
ffffffffc0202242:	698d                	lui	s3,0x3
ffffffffc0202244:	4a31                	li	s4,12
ffffffffc0202246:	e0ca                	sd	s2,64(sp)
ffffffffc0202248:	ec86                	sd	ra,88(sp)
ffffffffc020224a:	e8a2                	sd	s0,80(sp)
ffffffffc020224c:	e4a6                	sd	s1,72(sp)
ffffffffc020224e:	f456                	sd	s5,40(sp)
ffffffffc0202250:	f05a                	sd	s6,32(sp)
ffffffffc0202252:	ec5e                	sd	s7,24(sp)
ffffffffc0202254:	e862                	sd	s8,16(sp)
ffffffffc0202256:	e466                	sd	s9,8(sp)
ffffffffc0202258:	e06a                	sd	s10,0(sp)
ffffffffc020225a:	e73fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020225e:	01498023          	sb	s4,0(s3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc0202262:	00017917          	auipc	s2,0x17
ffffffffc0202266:	27e92903          	lw	s2,638(s2) # ffffffffc02194e0 <pgfault_num>
ffffffffc020226a:	4791                	li	a5,4
ffffffffc020226c:	14f91e63          	bne	s2,a5,ffffffffc02023c8 <_fifo_check_swap+0x194>
ffffffffc0202270:	00007517          	auipc	a0,0x7
ffffffffc0202274:	d3050513          	addi	a0,a0,-720 # ffffffffc0208fa0 <commands+0xc18>
ffffffffc0202278:	6a85                	lui	s5,0x1
ffffffffc020227a:	4b29                	li	s6,10
ffffffffc020227c:	e51fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202280:	00017417          	auipc	s0,0x17
ffffffffc0202284:	26040413          	addi	s0,s0,608 # ffffffffc02194e0 <pgfault_num>
ffffffffc0202288:	016a8023          	sb	s6,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc020228c:	4004                	lw	s1,0(s0)
ffffffffc020228e:	2481                	sext.w	s1,s1
ffffffffc0202290:	2b249c63          	bne	s1,s2,ffffffffc0202548 <_fifo_check_swap+0x314>
ffffffffc0202294:	00007517          	auipc	a0,0x7
ffffffffc0202298:	d3450513          	addi	a0,a0,-716 # ffffffffc0208fc8 <commands+0xc40>
ffffffffc020229c:	6b91                	lui	s7,0x4
ffffffffc020229e:	4c35                	li	s8,13
ffffffffc02022a0:	e2dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022a4:	018b8023          	sb	s8,0(s7) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc02022a8:	00042903          	lw	s2,0(s0)
ffffffffc02022ac:	2901                	sext.w	s2,s2
ffffffffc02022ae:	26991d63          	bne	s2,s1,ffffffffc0202528 <_fifo_check_swap+0x2f4>
ffffffffc02022b2:	00007517          	auipc	a0,0x7
ffffffffc02022b6:	d3e50513          	addi	a0,a0,-706 # ffffffffc0208ff0 <commands+0xc68>
ffffffffc02022ba:	6c89                	lui	s9,0x2
ffffffffc02022bc:	4d2d                	li	s10,11
ffffffffc02022be:	e0ffd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022c2:	01ac8023          	sb	s10,0(s9) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc02022c6:	401c                	lw	a5,0(s0)
ffffffffc02022c8:	2781                	sext.w	a5,a5
ffffffffc02022ca:	23279f63          	bne	a5,s2,ffffffffc0202508 <_fifo_check_swap+0x2d4>
ffffffffc02022ce:	00007517          	auipc	a0,0x7
ffffffffc02022d2:	d4a50513          	addi	a0,a0,-694 # ffffffffc0209018 <commands+0xc90>
ffffffffc02022d6:	df7fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022da:	6795                	lui	a5,0x5
ffffffffc02022dc:	4739                	li	a4,14
ffffffffc02022de:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc02022e2:	4004                	lw	s1,0(s0)
ffffffffc02022e4:	4795                	li	a5,5
ffffffffc02022e6:	2481                	sext.w	s1,s1
ffffffffc02022e8:	20f49063          	bne	s1,a5,ffffffffc02024e8 <_fifo_check_swap+0x2b4>
ffffffffc02022ec:	00007517          	auipc	a0,0x7
ffffffffc02022f0:	d0450513          	addi	a0,a0,-764 # ffffffffc0208ff0 <commands+0xc68>
ffffffffc02022f4:	dd9fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02022f8:	01ac8023          	sb	s10,0(s9)
ffffffffc02022fc:	401c                	lw	a5,0(s0)
ffffffffc02022fe:	2781                	sext.w	a5,a5
ffffffffc0202300:	1c979463          	bne	a5,s1,ffffffffc02024c8 <_fifo_check_swap+0x294>
ffffffffc0202304:	00007517          	auipc	a0,0x7
ffffffffc0202308:	c9c50513          	addi	a0,a0,-868 # ffffffffc0208fa0 <commands+0xc18>
ffffffffc020230c:	dc1fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202310:	016a8023          	sb	s6,0(s5)
ffffffffc0202314:	401c                	lw	a5,0(s0)
ffffffffc0202316:	4719                	li	a4,6
ffffffffc0202318:	2781                	sext.w	a5,a5
ffffffffc020231a:	18e79763          	bne	a5,a4,ffffffffc02024a8 <_fifo_check_swap+0x274>
ffffffffc020231e:	00007517          	auipc	a0,0x7
ffffffffc0202322:	cd250513          	addi	a0,a0,-814 # ffffffffc0208ff0 <commands+0xc68>
ffffffffc0202326:	da7fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020232a:	01ac8023          	sb	s10,0(s9)
ffffffffc020232e:	401c                	lw	a5,0(s0)
ffffffffc0202330:	471d                	li	a4,7
ffffffffc0202332:	2781                	sext.w	a5,a5
ffffffffc0202334:	14e79a63          	bne	a5,a4,ffffffffc0202488 <_fifo_check_swap+0x254>
ffffffffc0202338:	00007517          	auipc	a0,0x7
ffffffffc020233c:	c1850513          	addi	a0,a0,-1000 # ffffffffc0208f50 <commands+0xbc8>
ffffffffc0202340:	d8dfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202344:	01498023          	sb	s4,0(s3)
ffffffffc0202348:	401c                	lw	a5,0(s0)
ffffffffc020234a:	4721                	li	a4,8
ffffffffc020234c:	2781                	sext.w	a5,a5
ffffffffc020234e:	10e79d63          	bne	a5,a4,ffffffffc0202468 <_fifo_check_swap+0x234>
ffffffffc0202352:	00007517          	auipc	a0,0x7
ffffffffc0202356:	c7650513          	addi	a0,a0,-906 # ffffffffc0208fc8 <commands+0xc40>
ffffffffc020235a:	d73fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020235e:	018b8023          	sb	s8,0(s7)
ffffffffc0202362:	401c                	lw	a5,0(s0)
ffffffffc0202364:	4725                	li	a4,9
ffffffffc0202366:	2781                	sext.w	a5,a5
ffffffffc0202368:	0ee79063          	bne	a5,a4,ffffffffc0202448 <_fifo_check_swap+0x214>
ffffffffc020236c:	00007517          	auipc	a0,0x7
ffffffffc0202370:	cac50513          	addi	a0,a0,-852 # ffffffffc0209018 <commands+0xc90>
ffffffffc0202374:	d59fd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202378:	6795                	lui	a5,0x5
ffffffffc020237a:	4739                	li	a4,14
ffffffffc020237c:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc0202380:	4004                	lw	s1,0(s0)
ffffffffc0202382:	47a9                	li	a5,10
ffffffffc0202384:	2481                	sext.w	s1,s1
ffffffffc0202386:	0af49163          	bne	s1,a5,ffffffffc0202428 <_fifo_check_swap+0x1f4>
ffffffffc020238a:	00007517          	auipc	a0,0x7
ffffffffc020238e:	c1650513          	addi	a0,a0,-1002 # ffffffffc0208fa0 <commands+0xc18>
ffffffffc0202392:	d3bfd0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0202396:	6785                	lui	a5,0x1
ffffffffc0202398:	0007c783          	lbu	a5,0(a5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc020239c:	06979663          	bne	a5,s1,ffffffffc0202408 <_fifo_check_swap+0x1d4>
ffffffffc02023a0:	401c                	lw	a5,0(s0)
ffffffffc02023a2:	472d                	li	a4,11
ffffffffc02023a4:	2781                	sext.w	a5,a5
ffffffffc02023a6:	04e79163          	bne	a5,a4,ffffffffc02023e8 <_fifo_check_swap+0x1b4>
ffffffffc02023aa:	60e6                	ld	ra,88(sp)
ffffffffc02023ac:	6446                	ld	s0,80(sp)
ffffffffc02023ae:	64a6                	ld	s1,72(sp)
ffffffffc02023b0:	6906                	ld	s2,64(sp)
ffffffffc02023b2:	79e2                	ld	s3,56(sp)
ffffffffc02023b4:	7a42                	ld	s4,48(sp)
ffffffffc02023b6:	7aa2                	ld	s5,40(sp)
ffffffffc02023b8:	7b02                	ld	s6,32(sp)
ffffffffc02023ba:	6be2                	ld	s7,24(sp)
ffffffffc02023bc:	6c42                	ld	s8,16(sp)
ffffffffc02023be:	6ca2                	ld	s9,8(sp)
ffffffffc02023c0:	6d02                	ld	s10,0(sp)
ffffffffc02023c2:	4501                	li	a0,0
ffffffffc02023c4:	6125                	addi	sp,sp,96
ffffffffc02023c6:	8082                	ret
ffffffffc02023c8:	00007697          	auipc	a3,0x7
ffffffffc02023cc:	bb068693          	addi	a3,a3,-1104 # ffffffffc0208f78 <commands+0xbf0>
ffffffffc02023d0:	00006617          	auipc	a2,0x6
ffffffffc02023d4:	3c860613          	addi	a2,a2,968 # ffffffffc0208798 <commands+0x410>
ffffffffc02023d8:	05100593          	li	a1,81
ffffffffc02023dc:	00007517          	auipc	a0,0x7
ffffffffc02023e0:	bac50513          	addi	a0,a0,-1108 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02023e4:	e25fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02023e8:	00007697          	auipc	a3,0x7
ffffffffc02023ec:	ce068693          	addi	a3,a3,-800 # ffffffffc02090c8 <commands+0xd40>
ffffffffc02023f0:	00006617          	auipc	a2,0x6
ffffffffc02023f4:	3a860613          	addi	a2,a2,936 # ffffffffc0208798 <commands+0x410>
ffffffffc02023f8:	07300593          	li	a1,115
ffffffffc02023fc:	00007517          	auipc	a0,0x7
ffffffffc0202400:	b8c50513          	addi	a0,a0,-1140 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202404:	e05fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202408:	00007697          	auipc	a3,0x7
ffffffffc020240c:	c9868693          	addi	a3,a3,-872 # ffffffffc02090a0 <commands+0xd18>
ffffffffc0202410:	00006617          	auipc	a2,0x6
ffffffffc0202414:	38860613          	addi	a2,a2,904 # ffffffffc0208798 <commands+0x410>
ffffffffc0202418:	07100593          	li	a1,113
ffffffffc020241c:	00007517          	auipc	a0,0x7
ffffffffc0202420:	b6c50513          	addi	a0,a0,-1172 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202424:	de5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202428:	00007697          	auipc	a3,0x7
ffffffffc020242c:	c6868693          	addi	a3,a3,-920 # ffffffffc0209090 <commands+0xd08>
ffffffffc0202430:	00006617          	auipc	a2,0x6
ffffffffc0202434:	36860613          	addi	a2,a2,872 # ffffffffc0208798 <commands+0x410>
ffffffffc0202438:	06f00593          	li	a1,111
ffffffffc020243c:	00007517          	auipc	a0,0x7
ffffffffc0202440:	b4c50513          	addi	a0,a0,-1204 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202444:	dc5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202448:	00007697          	auipc	a3,0x7
ffffffffc020244c:	c3868693          	addi	a3,a3,-968 # ffffffffc0209080 <commands+0xcf8>
ffffffffc0202450:	00006617          	auipc	a2,0x6
ffffffffc0202454:	34860613          	addi	a2,a2,840 # ffffffffc0208798 <commands+0x410>
ffffffffc0202458:	06c00593          	li	a1,108
ffffffffc020245c:	00007517          	auipc	a0,0x7
ffffffffc0202460:	b2c50513          	addi	a0,a0,-1236 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202464:	da5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202468:	00007697          	auipc	a3,0x7
ffffffffc020246c:	c0868693          	addi	a3,a3,-1016 # ffffffffc0209070 <commands+0xce8>
ffffffffc0202470:	00006617          	auipc	a2,0x6
ffffffffc0202474:	32860613          	addi	a2,a2,808 # ffffffffc0208798 <commands+0x410>
ffffffffc0202478:	06900593          	li	a1,105
ffffffffc020247c:	00007517          	auipc	a0,0x7
ffffffffc0202480:	b0c50513          	addi	a0,a0,-1268 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202484:	d85fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202488:	00007697          	auipc	a3,0x7
ffffffffc020248c:	bd868693          	addi	a3,a3,-1064 # ffffffffc0209060 <commands+0xcd8>
ffffffffc0202490:	00006617          	auipc	a2,0x6
ffffffffc0202494:	30860613          	addi	a2,a2,776 # ffffffffc0208798 <commands+0x410>
ffffffffc0202498:	06600593          	li	a1,102
ffffffffc020249c:	00007517          	auipc	a0,0x7
ffffffffc02024a0:	aec50513          	addi	a0,a0,-1300 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02024a4:	d65fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024a8:	00007697          	auipc	a3,0x7
ffffffffc02024ac:	ba868693          	addi	a3,a3,-1112 # ffffffffc0209050 <commands+0xcc8>
ffffffffc02024b0:	00006617          	auipc	a2,0x6
ffffffffc02024b4:	2e860613          	addi	a2,a2,744 # ffffffffc0208798 <commands+0x410>
ffffffffc02024b8:	06300593          	li	a1,99
ffffffffc02024bc:	00007517          	auipc	a0,0x7
ffffffffc02024c0:	acc50513          	addi	a0,a0,-1332 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02024c4:	d45fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024c8:	00007697          	auipc	a3,0x7
ffffffffc02024cc:	b7868693          	addi	a3,a3,-1160 # ffffffffc0209040 <commands+0xcb8>
ffffffffc02024d0:	00006617          	auipc	a2,0x6
ffffffffc02024d4:	2c860613          	addi	a2,a2,712 # ffffffffc0208798 <commands+0x410>
ffffffffc02024d8:	06000593          	li	a1,96
ffffffffc02024dc:	00007517          	auipc	a0,0x7
ffffffffc02024e0:	aac50513          	addi	a0,a0,-1364 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02024e4:	d25fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02024e8:	00007697          	auipc	a3,0x7
ffffffffc02024ec:	b5868693          	addi	a3,a3,-1192 # ffffffffc0209040 <commands+0xcb8>
ffffffffc02024f0:	00006617          	auipc	a2,0x6
ffffffffc02024f4:	2a860613          	addi	a2,a2,680 # ffffffffc0208798 <commands+0x410>
ffffffffc02024f8:	05d00593          	li	a1,93
ffffffffc02024fc:	00007517          	auipc	a0,0x7
ffffffffc0202500:	a8c50513          	addi	a0,a0,-1396 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202504:	d05fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202508:	00007697          	auipc	a3,0x7
ffffffffc020250c:	a7068693          	addi	a3,a3,-1424 # ffffffffc0208f78 <commands+0xbf0>
ffffffffc0202510:	00006617          	auipc	a2,0x6
ffffffffc0202514:	28860613          	addi	a2,a2,648 # ffffffffc0208798 <commands+0x410>
ffffffffc0202518:	05a00593          	li	a1,90
ffffffffc020251c:	00007517          	auipc	a0,0x7
ffffffffc0202520:	a6c50513          	addi	a0,a0,-1428 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202524:	ce5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202528:	00007697          	auipc	a3,0x7
ffffffffc020252c:	a5068693          	addi	a3,a3,-1456 # ffffffffc0208f78 <commands+0xbf0>
ffffffffc0202530:	00006617          	auipc	a2,0x6
ffffffffc0202534:	26860613          	addi	a2,a2,616 # ffffffffc0208798 <commands+0x410>
ffffffffc0202538:	05700593          	li	a1,87
ffffffffc020253c:	00007517          	auipc	a0,0x7
ffffffffc0202540:	a4c50513          	addi	a0,a0,-1460 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202544:	cc5fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202548:	00007697          	auipc	a3,0x7
ffffffffc020254c:	a3068693          	addi	a3,a3,-1488 # ffffffffc0208f78 <commands+0xbf0>
ffffffffc0202550:	00006617          	auipc	a2,0x6
ffffffffc0202554:	24860613          	addi	a2,a2,584 # ffffffffc0208798 <commands+0x410>
ffffffffc0202558:	05400593          	li	a1,84
ffffffffc020255c:	00007517          	auipc	a0,0x7
ffffffffc0202560:	a2c50513          	addi	a0,a0,-1492 # ffffffffc0208f88 <commands+0xc00>
ffffffffc0202564:	ca5fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202568 <_fifo_swap_out_victim>:
ffffffffc0202568:	751c                	ld	a5,40(a0)
ffffffffc020256a:	1141                	addi	sp,sp,-16
ffffffffc020256c:	e406                	sd	ra,8(sp)
ffffffffc020256e:	cf91                	beqz	a5,ffffffffc020258a <_fifo_swap_out_victim+0x22>
ffffffffc0202570:	ee0d                	bnez	a2,ffffffffc02025aa <_fifo_swap_out_victim+0x42>
ffffffffc0202572:	679c                	ld	a5,8(a5)
ffffffffc0202574:	60a2                	ld	ra,8(sp)
ffffffffc0202576:	4501                	li	a0,0
ffffffffc0202578:	6394                	ld	a3,0(a5)
ffffffffc020257a:	6798                	ld	a4,8(a5)
ffffffffc020257c:	fd878793          	addi	a5,a5,-40
ffffffffc0202580:	e698                	sd	a4,8(a3)
ffffffffc0202582:	e314                	sd	a3,0(a4)
ffffffffc0202584:	e19c                	sd	a5,0(a1)
ffffffffc0202586:	0141                	addi	sp,sp,16
ffffffffc0202588:	8082                	ret
ffffffffc020258a:	00007697          	auipc	a3,0x7
ffffffffc020258e:	b4e68693          	addi	a3,a3,-1202 # ffffffffc02090d8 <commands+0xd50>
ffffffffc0202592:	00006617          	auipc	a2,0x6
ffffffffc0202596:	20660613          	addi	a2,a2,518 # ffffffffc0208798 <commands+0x410>
ffffffffc020259a:	04100593          	li	a1,65
ffffffffc020259e:	00007517          	auipc	a0,0x7
ffffffffc02025a2:	9ea50513          	addi	a0,a0,-1558 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02025a6:	c63fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02025aa:	00007697          	auipc	a3,0x7
ffffffffc02025ae:	b3e68693          	addi	a3,a3,-1218 # ffffffffc02090e8 <commands+0xd60>
ffffffffc02025b2:	00006617          	auipc	a2,0x6
ffffffffc02025b6:	1e660613          	addi	a2,a2,486 # ffffffffc0208798 <commands+0x410>
ffffffffc02025ba:	04200593          	li	a1,66
ffffffffc02025be:	00007517          	auipc	a0,0x7
ffffffffc02025c2:	9ca50513          	addi	a0,a0,-1590 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02025c6:	c43fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02025ca <_fifo_map_swappable>:
ffffffffc02025ca:	751c                	ld	a5,40(a0)
ffffffffc02025cc:	cb91                	beqz	a5,ffffffffc02025e0 <_fifo_map_swappable+0x16>
ffffffffc02025ce:	6394                	ld	a3,0(a5)
ffffffffc02025d0:	02860713          	addi	a4,a2,40
ffffffffc02025d4:	e398                	sd	a4,0(a5)
ffffffffc02025d6:	e698                	sd	a4,8(a3)
ffffffffc02025d8:	4501                	li	a0,0
ffffffffc02025da:	fa1c                	sd	a5,48(a2)
ffffffffc02025dc:	f614                	sd	a3,40(a2)
ffffffffc02025de:	8082                	ret
ffffffffc02025e0:	1141                	addi	sp,sp,-16
ffffffffc02025e2:	00007697          	auipc	a3,0x7
ffffffffc02025e6:	b1668693          	addi	a3,a3,-1258 # ffffffffc02090f8 <commands+0xd70>
ffffffffc02025ea:	00006617          	auipc	a2,0x6
ffffffffc02025ee:	1ae60613          	addi	a2,a2,430 # ffffffffc0208798 <commands+0x410>
ffffffffc02025f2:	03200593          	li	a1,50
ffffffffc02025f6:	00007517          	auipc	a0,0x7
ffffffffc02025fa:	99250513          	addi	a0,a0,-1646 # ffffffffc0208f88 <commands+0xc00>
ffffffffc02025fe:	e406                	sd	ra,8(sp)
ffffffffc0202600:	c09fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202604 <default_init>:
ffffffffc0202604:	00017797          	auipc	a5,0x17
ffffffffc0202608:	03478793          	addi	a5,a5,52 # ffffffffc0219638 <free_area>
ffffffffc020260c:	e79c                	sd	a5,8(a5)
ffffffffc020260e:	e39c                	sd	a5,0(a5)
ffffffffc0202610:	0007a823          	sw	zero,16(a5)
ffffffffc0202614:	8082                	ret

ffffffffc0202616 <default_nr_free_pages>:
ffffffffc0202616:	00017517          	auipc	a0,0x17
ffffffffc020261a:	03256503          	lwu	a0,50(a0) # ffffffffc0219648 <free_area+0x10>
ffffffffc020261e:	8082                	ret

ffffffffc0202620 <default_check>:
ffffffffc0202620:	715d                	addi	sp,sp,-80
ffffffffc0202622:	e0a2                	sd	s0,64(sp)
ffffffffc0202624:	00017417          	auipc	s0,0x17
ffffffffc0202628:	01440413          	addi	s0,s0,20 # ffffffffc0219638 <free_area>
ffffffffc020262c:	641c                	ld	a5,8(s0)
ffffffffc020262e:	e486                	sd	ra,72(sp)
ffffffffc0202630:	fc26                	sd	s1,56(sp)
ffffffffc0202632:	f84a                	sd	s2,48(sp)
ffffffffc0202634:	f44e                	sd	s3,40(sp)
ffffffffc0202636:	f052                	sd	s4,32(sp)
ffffffffc0202638:	ec56                	sd	s5,24(sp)
ffffffffc020263a:	e85a                	sd	s6,16(sp)
ffffffffc020263c:	e45e                	sd	s7,8(sp)
ffffffffc020263e:	e062                	sd	s8,0(sp)
ffffffffc0202640:	2a878d63          	beq	a5,s0,ffffffffc02028fa <default_check+0x2da>
ffffffffc0202644:	4481                	li	s1,0
ffffffffc0202646:	4901                	li	s2,0
ffffffffc0202648:	ff07b703          	ld	a4,-16(a5)
ffffffffc020264c:	8b09                	andi	a4,a4,2
ffffffffc020264e:	2a070a63          	beqz	a4,ffffffffc0202902 <default_check+0x2e2>
ffffffffc0202652:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202656:	679c                	ld	a5,8(a5)
ffffffffc0202658:	2905                	addiw	s2,s2,1
ffffffffc020265a:	9cb9                	addw	s1,s1,a4
ffffffffc020265c:	fe8796e3          	bne	a5,s0,ffffffffc0202648 <default_check+0x28>
ffffffffc0202660:	89a6                	mv	s3,s1
ffffffffc0202662:	fbcfe0ef          	jal	ra,ffffffffc0200e1e <nr_free_pages>
ffffffffc0202666:	6f351e63          	bne	a0,s3,ffffffffc0202d62 <default_check+0x742>
ffffffffc020266a:	4505                	li	a0,1
ffffffffc020266c:	edefe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202670:	8aaa                	mv	s5,a0
ffffffffc0202672:	42050863          	beqz	a0,ffffffffc0202aa2 <default_check+0x482>
ffffffffc0202676:	4505                	li	a0,1
ffffffffc0202678:	ed2fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020267c:	89aa                	mv	s3,a0
ffffffffc020267e:	70050263          	beqz	a0,ffffffffc0202d82 <default_check+0x762>
ffffffffc0202682:	4505                	li	a0,1
ffffffffc0202684:	ec6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202688:	8a2a                	mv	s4,a0
ffffffffc020268a:	48050c63          	beqz	a0,ffffffffc0202b22 <default_check+0x502>
ffffffffc020268e:	293a8a63          	beq	s5,s3,ffffffffc0202922 <default_check+0x302>
ffffffffc0202692:	28aa8863          	beq	s5,a0,ffffffffc0202922 <default_check+0x302>
ffffffffc0202696:	28a98663          	beq	s3,a0,ffffffffc0202922 <default_check+0x302>
ffffffffc020269a:	000aa783          	lw	a5,0(s5)
ffffffffc020269e:	2a079263          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026a2:	0009a783          	lw	a5,0(s3)
ffffffffc02026a6:	28079e63          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026aa:	411c                	lw	a5,0(a0)
ffffffffc02026ac:	28079b63          	bnez	a5,ffffffffc0202942 <default_check+0x322>
ffffffffc02026b0:	00017797          	auipc	a5,0x17
ffffffffc02026b4:	ea07b783          	ld	a5,-352(a5) # ffffffffc0219550 <pages>
ffffffffc02026b8:	40fa8733          	sub	a4,s5,a5
ffffffffc02026bc:	00008617          	auipc	a2,0x8
ffffffffc02026c0:	23c63603          	ld	a2,572(a2) # ffffffffc020a8f8 <nbase>
ffffffffc02026c4:	8719                	srai	a4,a4,0x6
ffffffffc02026c6:	9732                	add	a4,a4,a2
ffffffffc02026c8:	00017697          	auipc	a3,0x17
ffffffffc02026cc:	e106b683          	ld	a3,-496(a3) # ffffffffc02194d8 <npage>
ffffffffc02026d0:	06b2                	slli	a3,a3,0xc
ffffffffc02026d2:	0732                	slli	a4,a4,0xc
ffffffffc02026d4:	28d77763          	bgeu	a4,a3,ffffffffc0202962 <default_check+0x342>
ffffffffc02026d8:	40f98733          	sub	a4,s3,a5
ffffffffc02026dc:	8719                	srai	a4,a4,0x6
ffffffffc02026de:	9732                	add	a4,a4,a2
ffffffffc02026e0:	0732                	slli	a4,a4,0xc
ffffffffc02026e2:	4cd77063          	bgeu	a4,a3,ffffffffc0202ba2 <default_check+0x582>
ffffffffc02026e6:	40f507b3          	sub	a5,a0,a5
ffffffffc02026ea:	8799                	srai	a5,a5,0x6
ffffffffc02026ec:	97b2                	add	a5,a5,a2
ffffffffc02026ee:	07b2                	slli	a5,a5,0xc
ffffffffc02026f0:	30d7f963          	bgeu	a5,a3,ffffffffc0202a02 <default_check+0x3e2>
ffffffffc02026f4:	4505                	li	a0,1
ffffffffc02026f6:	00043c03          	ld	s8,0(s0)
ffffffffc02026fa:	00843b83          	ld	s7,8(s0)
ffffffffc02026fe:	01042b03          	lw	s6,16(s0)
ffffffffc0202702:	e400                	sd	s0,8(s0)
ffffffffc0202704:	e000                	sd	s0,0(s0)
ffffffffc0202706:	00017797          	auipc	a5,0x17
ffffffffc020270a:	f407a123          	sw	zero,-190(a5) # ffffffffc0219648 <free_area+0x10>
ffffffffc020270e:	e3cfe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202712:	2c051863          	bnez	a0,ffffffffc02029e2 <default_check+0x3c2>
ffffffffc0202716:	4585                	li	a1,1
ffffffffc0202718:	8556                	mv	a0,s5
ffffffffc020271a:	ec2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020271e:	4585                	li	a1,1
ffffffffc0202720:	854e                	mv	a0,s3
ffffffffc0202722:	ebafe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202726:	4585                	li	a1,1
ffffffffc0202728:	8552                	mv	a0,s4
ffffffffc020272a:	eb2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020272e:	4818                	lw	a4,16(s0)
ffffffffc0202730:	478d                	li	a5,3
ffffffffc0202732:	28f71863          	bne	a4,a5,ffffffffc02029c2 <default_check+0x3a2>
ffffffffc0202736:	4505                	li	a0,1
ffffffffc0202738:	e12fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020273c:	89aa                	mv	s3,a0
ffffffffc020273e:	26050263          	beqz	a0,ffffffffc02029a2 <default_check+0x382>
ffffffffc0202742:	4505                	li	a0,1
ffffffffc0202744:	e06fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202748:	8aaa                	mv	s5,a0
ffffffffc020274a:	3a050c63          	beqz	a0,ffffffffc0202b02 <default_check+0x4e2>
ffffffffc020274e:	4505                	li	a0,1
ffffffffc0202750:	dfafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202754:	8a2a                	mv	s4,a0
ffffffffc0202756:	38050663          	beqz	a0,ffffffffc0202ae2 <default_check+0x4c2>
ffffffffc020275a:	4505                	li	a0,1
ffffffffc020275c:	deefe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202760:	36051163          	bnez	a0,ffffffffc0202ac2 <default_check+0x4a2>
ffffffffc0202764:	4585                	li	a1,1
ffffffffc0202766:	854e                	mv	a0,s3
ffffffffc0202768:	e74fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020276c:	641c                	ld	a5,8(s0)
ffffffffc020276e:	20878a63          	beq	a5,s0,ffffffffc0202982 <default_check+0x362>
ffffffffc0202772:	4505                	li	a0,1
ffffffffc0202774:	dd6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202778:	30a99563          	bne	s3,a0,ffffffffc0202a82 <default_check+0x462>
ffffffffc020277c:	4505                	li	a0,1
ffffffffc020277e:	dccfe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202782:	2e051063          	bnez	a0,ffffffffc0202a62 <default_check+0x442>
ffffffffc0202786:	481c                	lw	a5,16(s0)
ffffffffc0202788:	2a079d63          	bnez	a5,ffffffffc0202a42 <default_check+0x422>
ffffffffc020278c:	854e                	mv	a0,s3
ffffffffc020278e:	4585                	li	a1,1
ffffffffc0202790:	01843023          	sd	s8,0(s0)
ffffffffc0202794:	01743423          	sd	s7,8(s0)
ffffffffc0202798:	01642823          	sw	s6,16(s0)
ffffffffc020279c:	e40fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027a0:	4585                	li	a1,1
ffffffffc02027a2:	8556                	mv	a0,s5
ffffffffc02027a4:	e38fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027a8:	4585                	li	a1,1
ffffffffc02027aa:	8552                	mv	a0,s4
ffffffffc02027ac:	e30fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027b0:	4515                	li	a0,5
ffffffffc02027b2:	d98fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027b6:	89aa                	mv	s3,a0
ffffffffc02027b8:	26050563          	beqz	a0,ffffffffc0202a22 <default_check+0x402>
ffffffffc02027bc:	651c                	ld	a5,8(a0)
ffffffffc02027be:	8385                	srli	a5,a5,0x1
ffffffffc02027c0:	8b85                	andi	a5,a5,1
ffffffffc02027c2:	54079063          	bnez	a5,ffffffffc0202d02 <default_check+0x6e2>
ffffffffc02027c6:	4505                	li	a0,1
ffffffffc02027c8:	00043b03          	ld	s6,0(s0)
ffffffffc02027cc:	00843a83          	ld	s5,8(s0)
ffffffffc02027d0:	e000                	sd	s0,0(s0)
ffffffffc02027d2:	e400                	sd	s0,8(s0)
ffffffffc02027d4:	d76fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027d8:	50051563          	bnez	a0,ffffffffc0202ce2 <default_check+0x6c2>
ffffffffc02027dc:	08098a13          	addi	s4,s3,128
ffffffffc02027e0:	8552                	mv	a0,s4
ffffffffc02027e2:	458d                	li	a1,3
ffffffffc02027e4:	01042b83          	lw	s7,16(s0)
ffffffffc02027e8:	00017797          	auipc	a5,0x17
ffffffffc02027ec:	e607a023          	sw	zero,-416(a5) # ffffffffc0219648 <free_area+0x10>
ffffffffc02027f0:	decfe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02027f4:	4511                	li	a0,4
ffffffffc02027f6:	d54fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02027fa:	4c051463          	bnez	a0,ffffffffc0202cc2 <default_check+0x6a2>
ffffffffc02027fe:	0889b783          	ld	a5,136(s3)
ffffffffc0202802:	8385                	srli	a5,a5,0x1
ffffffffc0202804:	8b85                	andi	a5,a5,1
ffffffffc0202806:	48078e63          	beqz	a5,ffffffffc0202ca2 <default_check+0x682>
ffffffffc020280a:	0909a703          	lw	a4,144(s3)
ffffffffc020280e:	478d                	li	a5,3
ffffffffc0202810:	48f71963          	bne	a4,a5,ffffffffc0202ca2 <default_check+0x682>
ffffffffc0202814:	450d                	li	a0,3
ffffffffc0202816:	d34fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020281a:	8c2a                	mv	s8,a0
ffffffffc020281c:	46050363          	beqz	a0,ffffffffc0202c82 <default_check+0x662>
ffffffffc0202820:	4505                	li	a0,1
ffffffffc0202822:	d28fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202826:	42051e63          	bnez	a0,ffffffffc0202c62 <default_check+0x642>
ffffffffc020282a:	418a1c63          	bne	s4,s8,ffffffffc0202c42 <default_check+0x622>
ffffffffc020282e:	4585                	li	a1,1
ffffffffc0202830:	854e                	mv	a0,s3
ffffffffc0202832:	daafe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202836:	458d                	li	a1,3
ffffffffc0202838:	8552                	mv	a0,s4
ffffffffc020283a:	da2fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020283e:	0089b783          	ld	a5,8(s3)
ffffffffc0202842:	04098c13          	addi	s8,s3,64
ffffffffc0202846:	8385                	srli	a5,a5,0x1
ffffffffc0202848:	8b85                	andi	a5,a5,1
ffffffffc020284a:	3c078c63          	beqz	a5,ffffffffc0202c22 <default_check+0x602>
ffffffffc020284e:	0109a703          	lw	a4,16(s3)
ffffffffc0202852:	4785                	li	a5,1
ffffffffc0202854:	3cf71763          	bne	a4,a5,ffffffffc0202c22 <default_check+0x602>
ffffffffc0202858:	008a3783          	ld	a5,8(s4) # 1008 <kern_entry-0xffffffffc01feff8>
ffffffffc020285c:	8385                	srli	a5,a5,0x1
ffffffffc020285e:	8b85                	andi	a5,a5,1
ffffffffc0202860:	3a078163          	beqz	a5,ffffffffc0202c02 <default_check+0x5e2>
ffffffffc0202864:	010a2703          	lw	a4,16(s4)
ffffffffc0202868:	478d                	li	a5,3
ffffffffc020286a:	38f71c63          	bne	a4,a5,ffffffffc0202c02 <default_check+0x5e2>
ffffffffc020286e:	4505                	li	a0,1
ffffffffc0202870:	cdafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202874:	36a99763          	bne	s3,a0,ffffffffc0202be2 <default_check+0x5c2>
ffffffffc0202878:	4585                	li	a1,1
ffffffffc020287a:	d62fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020287e:	4509                	li	a0,2
ffffffffc0202880:	ccafe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0202884:	32aa1f63          	bne	s4,a0,ffffffffc0202bc2 <default_check+0x5a2>
ffffffffc0202888:	4589                	li	a1,2
ffffffffc020288a:	d52fe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc020288e:	4585                	li	a1,1
ffffffffc0202890:	8562                	mv	a0,s8
ffffffffc0202892:	d4afe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0202896:	4515                	li	a0,5
ffffffffc0202898:	cb2fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc020289c:	89aa                	mv	s3,a0
ffffffffc020289e:	48050263          	beqz	a0,ffffffffc0202d22 <default_check+0x702>
ffffffffc02028a2:	4505                	li	a0,1
ffffffffc02028a4:	ca6fe0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc02028a8:	2c051d63          	bnez	a0,ffffffffc0202b82 <default_check+0x562>
ffffffffc02028ac:	481c                	lw	a5,16(s0)
ffffffffc02028ae:	2a079a63          	bnez	a5,ffffffffc0202b62 <default_check+0x542>
ffffffffc02028b2:	4595                	li	a1,5
ffffffffc02028b4:	854e                	mv	a0,s3
ffffffffc02028b6:	01742823          	sw	s7,16(s0)
ffffffffc02028ba:	01643023          	sd	s6,0(s0)
ffffffffc02028be:	01543423          	sd	s5,8(s0)
ffffffffc02028c2:	d1afe0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc02028c6:	641c                	ld	a5,8(s0)
ffffffffc02028c8:	00878963          	beq	a5,s0,ffffffffc02028da <default_check+0x2ba>
ffffffffc02028cc:	ff87a703          	lw	a4,-8(a5)
ffffffffc02028d0:	679c                	ld	a5,8(a5)
ffffffffc02028d2:	397d                	addiw	s2,s2,-1
ffffffffc02028d4:	9c99                	subw	s1,s1,a4
ffffffffc02028d6:	fe879be3          	bne	a5,s0,ffffffffc02028cc <default_check+0x2ac>
ffffffffc02028da:	26091463          	bnez	s2,ffffffffc0202b42 <default_check+0x522>
ffffffffc02028de:	46049263          	bnez	s1,ffffffffc0202d42 <default_check+0x722>
ffffffffc02028e2:	60a6                	ld	ra,72(sp)
ffffffffc02028e4:	6406                	ld	s0,64(sp)
ffffffffc02028e6:	74e2                	ld	s1,56(sp)
ffffffffc02028e8:	7942                	ld	s2,48(sp)
ffffffffc02028ea:	79a2                	ld	s3,40(sp)
ffffffffc02028ec:	7a02                	ld	s4,32(sp)
ffffffffc02028ee:	6ae2                	ld	s5,24(sp)
ffffffffc02028f0:	6b42                	ld	s6,16(sp)
ffffffffc02028f2:	6ba2                	ld	s7,8(sp)
ffffffffc02028f4:	6c02                	ld	s8,0(sp)
ffffffffc02028f6:	6161                	addi	sp,sp,80
ffffffffc02028f8:	8082                	ret
ffffffffc02028fa:	4981                	li	s3,0
ffffffffc02028fc:	4481                	li	s1,0
ffffffffc02028fe:	4901                	li	s2,0
ffffffffc0202900:	b38d                	j	ffffffffc0202662 <default_check+0x42>
ffffffffc0202902:	00007697          	auipc	a3,0x7
ffffffffc0202906:	82e68693          	addi	a3,a3,-2002 # ffffffffc0209130 <commands+0xda8>
ffffffffc020290a:	00006617          	auipc	a2,0x6
ffffffffc020290e:	e8e60613          	addi	a2,a2,-370 # ffffffffc0208798 <commands+0x410>
ffffffffc0202912:	0f000593          	li	a1,240
ffffffffc0202916:	00007517          	auipc	a0,0x7
ffffffffc020291a:	82a50513          	addi	a0,a0,-2006 # ffffffffc0209140 <commands+0xdb8>
ffffffffc020291e:	8ebfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202922:	00007697          	auipc	a3,0x7
ffffffffc0202926:	8b668693          	addi	a3,a3,-1866 # ffffffffc02091d8 <commands+0xe50>
ffffffffc020292a:	00006617          	auipc	a2,0x6
ffffffffc020292e:	e6e60613          	addi	a2,a2,-402 # ffffffffc0208798 <commands+0x410>
ffffffffc0202932:	0bd00593          	li	a1,189
ffffffffc0202936:	00007517          	auipc	a0,0x7
ffffffffc020293a:	80a50513          	addi	a0,a0,-2038 # ffffffffc0209140 <commands+0xdb8>
ffffffffc020293e:	8cbfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202942:	00007697          	auipc	a3,0x7
ffffffffc0202946:	8be68693          	addi	a3,a3,-1858 # ffffffffc0209200 <commands+0xe78>
ffffffffc020294a:	00006617          	auipc	a2,0x6
ffffffffc020294e:	e4e60613          	addi	a2,a2,-434 # ffffffffc0208798 <commands+0x410>
ffffffffc0202952:	0be00593          	li	a1,190
ffffffffc0202956:	00006517          	auipc	a0,0x6
ffffffffc020295a:	7ea50513          	addi	a0,a0,2026 # ffffffffc0209140 <commands+0xdb8>
ffffffffc020295e:	8abfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202962:	00007697          	auipc	a3,0x7
ffffffffc0202966:	8de68693          	addi	a3,a3,-1826 # ffffffffc0209240 <commands+0xeb8>
ffffffffc020296a:	00006617          	auipc	a2,0x6
ffffffffc020296e:	e2e60613          	addi	a2,a2,-466 # ffffffffc0208798 <commands+0x410>
ffffffffc0202972:	0c000593          	li	a1,192
ffffffffc0202976:	00006517          	auipc	a0,0x6
ffffffffc020297a:	7ca50513          	addi	a0,a0,1994 # ffffffffc0209140 <commands+0xdb8>
ffffffffc020297e:	88bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202982:	00007697          	auipc	a3,0x7
ffffffffc0202986:	94668693          	addi	a3,a3,-1722 # ffffffffc02092c8 <commands+0xf40>
ffffffffc020298a:	00006617          	auipc	a2,0x6
ffffffffc020298e:	e0e60613          	addi	a2,a2,-498 # ffffffffc0208798 <commands+0x410>
ffffffffc0202992:	0d900593          	li	a1,217
ffffffffc0202996:	00006517          	auipc	a0,0x6
ffffffffc020299a:	7aa50513          	addi	a0,a0,1962 # ffffffffc0209140 <commands+0xdb8>
ffffffffc020299e:	86bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029a2:	00006697          	auipc	a3,0x6
ffffffffc02029a6:	7d668693          	addi	a3,a3,2006 # ffffffffc0209178 <commands+0xdf0>
ffffffffc02029aa:	00006617          	auipc	a2,0x6
ffffffffc02029ae:	dee60613          	addi	a2,a2,-530 # ffffffffc0208798 <commands+0x410>
ffffffffc02029b2:	0d200593          	li	a1,210
ffffffffc02029b6:	00006517          	auipc	a0,0x6
ffffffffc02029ba:	78a50513          	addi	a0,a0,1930 # ffffffffc0209140 <commands+0xdb8>
ffffffffc02029be:	84bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029c2:	00007697          	auipc	a3,0x7
ffffffffc02029c6:	8f668693          	addi	a3,a3,-1802 # ffffffffc02092b8 <commands+0xf30>
ffffffffc02029ca:	00006617          	auipc	a2,0x6
ffffffffc02029ce:	dce60613          	addi	a2,a2,-562 # ffffffffc0208798 <commands+0x410>
ffffffffc02029d2:	0d000593          	li	a1,208
ffffffffc02029d6:	00006517          	auipc	a0,0x6
ffffffffc02029da:	76a50513          	addi	a0,a0,1898 # ffffffffc0209140 <commands+0xdb8>
ffffffffc02029de:	82bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02029e2:	00007697          	auipc	a3,0x7
ffffffffc02029e6:	8be68693          	addi	a3,a3,-1858 # ffffffffc02092a0 <commands+0xf18>
ffffffffc02029ea:	00006617          	auipc	a2,0x6
ffffffffc02029ee:	dae60613          	addi	a2,a2,-594 # ffffffffc0208798 <commands+0x410>
ffffffffc02029f2:	0cb00593          	li	a1,203
ffffffffc02029f6:	00006517          	auipc	a0,0x6
ffffffffc02029fa:	74a50513          	addi	a0,a0,1866 # ffffffffc0209140 <commands+0xdb8>
ffffffffc02029fe:	80bfd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a02:	00007697          	auipc	a3,0x7
ffffffffc0202a06:	87e68693          	addi	a3,a3,-1922 # ffffffffc0209280 <commands+0xef8>
ffffffffc0202a0a:	00006617          	auipc	a2,0x6
ffffffffc0202a0e:	d8e60613          	addi	a2,a2,-626 # ffffffffc0208798 <commands+0x410>
ffffffffc0202a12:	0c200593          	li	a1,194
ffffffffc0202a16:	00006517          	auipc	a0,0x6
ffffffffc0202a1a:	72a50513          	addi	a0,a0,1834 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202a1e:	feafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a22:	00007697          	auipc	a3,0x7
ffffffffc0202a26:	8ee68693          	addi	a3,a3,-1810 # ffffffffc0209310 <commands+0xf88>
ffffffffc0202a2a:	00006617          	auipc	a2,0x6
ffffffffc0202a2e:	d6e60613          	addi	a2,a2,-658 # ffffffffc0208798 <commands+0x410>
ffffffffc0202a32:	0f800593          	li	a1,248
ffffffffc0202a36:	00006517          	auipc	a0,0x6
ffffffffc0202a3a:	70a50513          	addi	a0,a0,1802 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202a3e:	fcafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a42:	00007697          	auipc	a3,0x7
ffffffffc0202a46:	8be68693          	addi	a3,a3,-1858 # ffffffffc0209300 <commands+0xf78>
ffffffffc0202a4a:	00006617          	auipc	a2,0x6
ffffffffc0202a4e:	d4e60613          	addi	a2,a2,-690 # ffffffffc0208798 <commands+0x410>
ffffffffc0202a52:	0df00593          	li	a1,223
ffffffffc0202a56:	00006517          	auipc	a0,0x6
ffffffffc0202a5a:	6ea50513          	addi	a0,a0,1770 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202a5e:	faafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a62:	00007697          	auipc	a3,0x7
ffffffffc0202a66:	83e68693          	addi	a3,a3,-1986 # ffffffffc02092a0 <commands+0xf18>
ffffffffc0202a6a:	00006617          	auipc	a2,0x6
ffffffffc0202a6e:	d2e60613          	addi	a2,a2,-722 # ffffffffc0208798 <commands+0x410>
ffffffffc0202a72:	0dd00593          	li	a1,221
ffffffffc0202a76:	00006517          	auipc	a0,0x6
ffffffffc0202a7a:	6ca50513          	addi	a0,a0,1738 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202a7e:	f8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202a82:	00007697          	auipc	a3,0x7
ffffffffc0202a86:	85e68693          	addi	a3,a3,-1954 # ffffffffc02092e0 <commands+0xf58>
ffffffffc0202a8a:	00006617          	auipc	a2,0x6
ffffffffc0202a8e:	d0e60613          	addi	a2,a2,-754 # ffffffffc0208798 <commands+0x410>
ffffffffc0202a92:	0dc00593          	li	a1,220
ffffffffc0202a96:	00006517          	auipc	a0,0x6
ffffffffc0202a9a:	6aa50513          	addi	a0,a0,1706 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202a9e:	f6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202aa2:	00006697          	auipc	a3,0x6
ffffffffc0202aa6:	6d668693          	addi	a3,a3,1750 # ffffffffc0209178 <commands+0xdf0>
ffffffffc0202aaa:	00006617          	auipc	a2,0x6
ffffffffc0202aae:	cee60613          	addi	a2,a2,-786 # ffffffffc0208798 <commands+0x410>
ffffffffc0202ab2:	0b900593          	li	a1,185
ffffffffc0202ab6:	00006517          	auipc	a0,0x6
ffffffffc0202aba:	68a50513          	addi	a0,a0,1674 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202abe:	f4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ac2:	00006697          	auipc	a3,0x6
ffffffffc0202ac6:	7de68693          	addi	a3,a3,2014 # ffffffffc02092a0 <commands+0xf18>
ffffffffc0202aca:	00006617          	auipc	a2,0x6
ffffffffc0202ace:	cce60613          	addi	a2,a2,-818 # ffffffffc0208798 <commands+0x410>
ffffffffc0202ad2:	0d600593          	li	a1,214
ffffffffc0202ad6:	00006517          	auipc	a0,0x6
ffffffffc0202ada:	66a50513          	addi	a0,a0,1642 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202ade:	f2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ae2:	00006697          	auipc	a3,0x6
ffffffffc0202ae6:	6d668693          	addi	a3,a3,1750 # ffffffffc02091b8 <commands+0xe30>
ffffffffc0202aea:	00006617          	auipc	a2,0x6
ffffffffc0202aee:	cae60613          	addi	a2,a2,-850 # ffffffffc0208798 <commands+0x410>
ffffffffc0202af2:	0d400593          	li	a1,212
ffffffffc0202af6:	00006517          	auipc	a0,0x6
ffffffffc0202afa:	64a50513          	addi	a0,a0,1610 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202afe:	f0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b02:	00006697          	auipc	a3,0x6
ffffffffc0202b06:	69668693          	addi	a3,a3,1686 # ffffffffc0209198 <commands+0xe10>
ffffffffc0202b0a:	00006617          	auipc	a2,0x6
ffffffffc0202b0e:	c8e60613          	addi	a2,a2,-882 # ffffffffc0208798 <commands+0x410>
ffffffffc0202b12:	0d300593          	li	a1,211
ffffffffc0202b16:	00006517          	auipc	a0,0x6
ffffffffc0202b1a:	62a50513          	addi	a0,a0,1578 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202b1e:	eeafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b22:	00006697          	auipc	a3,0x6
ffffffffc0202b26:	69668693          	addi	a3,a3,1686 # ffffffffc02091b8 <commands+0xe30>
ffffffffc0202b2a:	00006617          	auipc	a2,0x6
ffffffffc0202b2e:	c6e60613          	addi	a2,a2,-914 # ffffffffc0208798 <commands+0x410>
ffffffffc0202b32:	0bb00593          	li	a1,187
ffffffffc0202b36:	00006517          	auipc	a0,0x6
ffffffffc0202b3a:	60a50513          	addi	a0,a0,1546 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202b3e:	ecafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b42:	00007697          	auipc	a3,0x7
ffffffffc0202b46:	91e68693          	addi	a3,a3,-1762 # ffffffffc0209460 <commands+0x10d8>
ffffffffc0202b4a:	00006617          	auipc	a2,0x6
ffffffffc0202b4e:	c4e60613          	addi	a2,a2,-946 # ffffffffc0208798 <commands+0x410>
ffffffffc0202b52:	12500593          	li	a1,293
ffffffffc0202b56:	00006517          	auipc	a0,0x6
ffffffffc0202b5a:	5ea50513          	addi	a0,a0,1514 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202b5e:	eaafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b62:	00006697          	auipc	a3,0x6
ffffffffc0202b66:	79e68693          	addi	a3,a3,1950 # ffffffffc0209300 <commands+0xf78>
ffffffffc0202b6a:	00006617          	auipc	a2,0x6
ffffffffc0202b6e:	c2e60613          	addi	a2,a2,-978 # ffffffffc0208798 <commands+0x410>
ffffffffc0202b72:	11a00593          	li	a1,282
ffffffffc0202b76:	00006517          	auipc	a0,0x6
ffffffffc0202b7a:	5ca50513          	addi	a0,a0,1482 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202b7e:	e8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202b82:	00006697          	auipc	a3,0x6
ffffffffc0202b86:	71e68693          	addi	a3,a3,1822 # ffffffffc02092a0 <commands+0xf18>
ffffffffc0202b8a:	00006617          	auipc	a2,0x6
ffffffffc0202b8e:	c0e60613          	addi	a2,a2,-1010 # ffffffffc0208798 <commands+0x410>
ffffffffc0202b92:	11800593          	li	a1,280
ffffffffc0202b96:	00006517          	auipc	a0,0x6
ffffffffc0202b9a:	5aa50513          	addi	a0,a0,1450 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202b9e:	e6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ba2:	00006697          	auipc	a3,0x6
ffffffffc0202ba6:	6be68693          	addi	a3,a3,1726 # ffffffffc0209260 <commands+0xed8>
ffffffffc0202baa:	00006617          	auipc	a2,0x6
ffffffffc0202bae:	bee60613          	addi	a2,a2,-1042 # ffffffffc0208798 <commands+0x410>
ffffffffc0202bb2:	0c100593          	li	a1,193
ffffffffc0202bb6:	00006517          	auipc	a0,0x6
ffffffffc0202bba:	58a50513          	addi	a0,a0,1418 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202bbe:	e4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202bc2:	00007697          	auipc	a3,0x7
ffffffffc0202bc6:	85e68693          	addi	a3,a3,-1954 # ffffffffc0209420 <commands+0x1098>
ffffffffc0202bca:	00006617          	auipc	a2,0x6
ffffffffc0202bce:	bce60613          	addi	a2,a2,-1074 # ffffffffc0208798 <commands+0x410>
ffffffffc0202bd2:	11200593          	li	a1,274
ffffffffc0202bd6:	00006517          	auipc	a0,0x6
ffffffffc0202bda:	56a50513          	addi	a0,a0,1386 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202bde:	e2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202be2:	00007697          	auipc	a3,0x7
ffffffffc0202be6:	81e68693          	addi	a3,a3,-2018 # ffffffffc0209400 <commands+0x1078>
ffffffffc0202bea:	00006617          	auipc	a2,0x6
ffffffffc0202bee:	bae60613          	addi	a2,a2,-1106 # ffffffffc0208798 <commands+0x410>
ffffffffc0202bf2:	11000593          	li	a1,272
ffffffffc0202bf6:	00006517          	auipc	a0,0x6
ffffffffc0202bfa:	54a50513          	addi	a0,a0,1354 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202bfe:	e0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c02:	00006697          	auipc	a3,0x6
ffffffffc0202c06:	7d668693          	addi	a3,a3,2006 # ffffffffc02093d8 <commands+0x1050>
ffffffffc0202c0a:	00006617          	auipc	a2,0x6
ffffffffc0202c0e:	b8e60613          	addi	a2,a2,-1138 # ffffffffc0208798 <commands+0x410>
ffffffffc0202c12:	10e00593          	li	a1,270
ffffffffc0202c16:	00006517          	auipc	a0,0x6
ffffffffc0202c1a:	52a50513          	addi	a0,a0,1322 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202c1e:	deafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c22:	00006697          	auipc	a3,0x6
ffffffffc0202c26:	78e68693          	addi	a3,a3,1934 # ffffffffc02093b0 <commands+0x1028>
ffffffffc0202c2a:	00006617          	auipc	a2,0x6
ffffffffc0202c2e:	b6e60613          	addi	a2,a2,-1170 # ffffffffc0208798 <commands+0x410>
ffffffffc0202c32:	10d00593          	li	a1,269
ffffffffc0202c36:	00006517          	auipc	a0,0x6
ffffffffc0202c3a:	50a50513          	addi	a0,a0,1290 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202c3e:	dcafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c42:	00006697          	auipc	a3,0x6
ffffffffc0202c46:	75e68693          	addi	a3,a3,1886 # ffffffffc02093a0 <commands+0x1018>
ffffffffc0202c4a:	00006617          	auipc	a2,0x6
ffffffffc0202c4e:	b4e60613          	addi	a2,a2,-1202 # ffffffffc0208798 <commands+0x410>
ffffffffc0202c52:	10800593          	li	a1,264
ffffffffc0202c56:	00006517          	auipc	a0,0x6
ffffffffc0202c5a:	4ea50513          	addi	a0,a0,1258 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202c5e:	daafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c62:	00006697          	auipc	a3,0x6
ffffffffc0202c66:	63e68693          	addi	a3,a3,1598 # ffffffffc02092a0 <commands+0xf18>
ffffffffc0202c6a:	00006617          	auipc	a2,0x6
ffffffffc0202c6e:	b2e60613          	addi	a2,a2,-1234 # ffffffffc0208798 <commands+0x410>
ffffffffc0202c72:	10700593          	li	a1,263
ffffffffc0202c76:	00006517          	auipc	a0,0x6
ffffffffc0202c7a:	4ca50513          	addi	a0,a0,1226 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202c7e:	d8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202c82:	00006697          	auipc	a3,0x6
ffffffffc0202c86:	6fe68693          	addi	a3,a3,1790 # ffffffffc0209380 <commands+0xff8>
ffffffffc0202c8a:	00006617          	auipc	a2,0x6
ffffffffc0202c8e:	b0e60613          	addi	a2,a2,-1266 # ffffffffc0208798 <commands+0x410>
ffffffffc0202c92:	10600593          	li	a1,262
ffffffffc0202c96:	00006517          	auipc	a0,0x6
ffffffffc0202c9a:	4aa50513          	addi	a0,a0,1194 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202c9e:	d6afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ca2:	00006697          	auipc	a3,0x6
ffffffffc0202ca6:	6ae68693          	addi	a3,a3,1710 # ffffffffc0209350 <commands+0xfc8>
ffffffffc0202caa:	00006617          	auipc	a2,0x6
ffffffffc0202cae:	aee60613          	addi	a2,a2,-1298 # ffffffffc0208798 <commands+0x410>
ffffffffc0202cb2:	10500593          	li	a1,261
ffffffffc0202cb6:	00006517          	auipc	a0,0x6
ffffffffc0202cba:	48a50513          	addi	a0,a0,1162 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202cbe:	d4afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202cc2:	00006697          	auipc	a3,0x6
ffffffffc0202cc6:	67668693          	addi	a3,a3,1654 # ffffffffc0209338 <commands+0xfb0>
ffffffffc0202cca:	00006617          	auipc	a2,0x6
ffffffffc0202cce:	ace60613          	addi	a2,a2,-1330 # ffffffffc0208798 <commands+0x410>
ffffffffc0202cd2:	10400593          	li	a1,260
ffffffffc0202cd6:	00006517          	auipc	a0,0x6
ffffffffc0202cda:	46a50513          	addi	a0,a0,1130 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202cde:	d2afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ce2:	00006697          	auipc	a3,0x6
ffffffffc0202ce6:	5be68693          	addi	a3,a3,1470 # ffffffffc02092a0 <commands+0xf18>
ffffffffc0202cea:	00006617          	auipc	a2,0x6
ffffffffc0202cee:	aae60613          	addi	a2,a2,-1362 # ffffffffc0208798 <commands+0x410>
ffffffffc0202cf2:	0fe00593          	li	a1,254
ffffffffc0202cf6:	00006517          	auipc	a0,0x6
ffffffffc0202cfa:	44a50513          	addi	a0,a0,1098 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202cfe:	d0afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d02:	00006697          	auipc	a3,0x6
ffffffffc0202d06:	61e68693          	addi	a3,a3,1566 # ffffffffc0209320 <commands+0xf98>
ffffffffc0202d0a:	00006617          	auipc	a2,0x6
ffffffffc0202d0e:	a8e60613          	addi	a2,a2,-1394 # ffffffffc0208798 <commands+0x410>
ffffffffc0202d12:	0f900593          	li	a1,249
ffffffffc0202d16:	00006517          	auipc	a0,0x6
ffffffffc0202d1a:	42a50513          	addi	a0,a0,1066 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202d1e:	ceafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d22:	00006697          	auipc	a3,0x6
ffffffffc0202d26:	71e68693          	addi	a3,a3,1822 # ffffffffc0209440 <commands+0x10b8>
ffffffffc0202d2a:	00006617          	auipc	a2,0x6
ffffffffc0202d2e:	a6e60613          	addi	a2,a2,-1426 # ffffffffc0208798 <commands+0x410>
ffffffffc0202d32:	11700593          	li	a1,279
ffffffffc0202d36:	00006517          	auipc	a0,0x6
ffffffffc0202d3a:	40a50513          	addi	a0,a0,1034 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202d3e:	ccafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d42:	00006697          	auipc	a3,0x6
ffffffffc0202d46:	72e68693          	addi	a3,a3,1838 # ffffffffc0209470 <commands+0x10e8>
ffffffffc0202d4a:	00006617          	auipc	a2,0x6
ffffffffc0202d4e:	a4e60613          	addi	a2,a2,-1458 # ffffffffc0208798 <commands+0x410>
ffffffffc0202d52:	12600593          	li	a1,294
ffffffffc0202d56:	00006517          	auipc	a0,0x6
ffffffffc0202d5a:	3ea50513          	addi	a0,a0,1002 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202d5e:	caafd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d62:	00006697          	auipc	a3,0x6
ffffffffc0202d66:	3f668693          	addi	a3,a3,1014 # ffffffffc0209158 <commands+0xdd0>
ffffffffc0202d6a:	00006617          	auipc	a2,0x6
ffffffffc0202d6e:	a2e60613          	addi	a2,a2,-1490 # ffffffffc0208798 <commands+0x410>
ffffffffc0202d72:	0f300593          	li	a1,243
ffffffffc0202d76:	00006517          	auipc	a0,0x6
ffffffffc0202d7a:	3ca50513          	addi	a0,a0,970 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202d7e:	c8afd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202d82:	00006697          	auipc	a3,0x6
ffffffffc0202d86:	41668693          	addi	a3,a3,1046 # ffffffffc0209198 <commands+0xe10>
ffffffffc0202d8a:	00006617          	auipc	a2,0x6
ffffffffc0202d8e:	a0e60613          	addi	a2,a2,-1522 # ffffffffc0208798 <commands+0x410>
ffffffffc0202d92:	0ba00593          	li	a1,186
ffffffffc0202d96:	00006517          	auipc	a0,0x6
ffffffffc0202d9a:	3aa50513          	addi	a0,a0,938 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202d9e:	c6afd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202da2 <default_free_pages>:
ffffffffc0202da2:	1141                	addi	sp,sp,-16
ffffffffc0202da4:	e406                	sd	ra,8(sp)
ffffffffc0202da6:	12058f63          	beqz	a1,ffffffffc0202ee4 <default_free_pages+0x142>
ffffffffc0202daa:	00659693          	slli	a3,a1,0x6
ffffffffc0202dae:	96aa                	add	a3,a3,a0
ffffffffc0202db0:	87aa                	mv	a5,a0
ffffffffc0202db2:	02d50263          	beq	a0,a3,ffffffffc0202dd6 <default_free_pages+0x34>
ffffffffc0202db6:	6798                	ld	a4,8(a5)
ffffffffc0202db8:	8b05                	andi	a4,a4,1
ffffffffc0202dba:	10071563          	bnez	a4,ffffffffc0202ec4 <default_free_pages+0x122>
ffffffffc0202dbe:	6798                	ld	a4,8(a5)
ffffffffc0202dc0:	8b09                	andi	a4,a4,2
ffffffffc0202dc2:	10071163          	bnez	a4,ffffffffc0202ec4 <default_free_pages+0x122>
ffffffffc0202dc6:	0007b423          	sd	zero,8(a5)
ffffffffc0202dca:	0007a023          	sw	zero,0(a5)
ffffffffc0202dce:	04078793          	addi	a5,a5,64
ffffffffc0202dd2:	fed792e3          	bne	a5,a3,ffffffffc0202db6 <default_free_pages+0x14>
ffffffffc0202dd6:	2581                	sext.w	a1,a1
ffffffffc0202dd8:	c90c                	sw	a1,16(a0)
ffffffffc0202dda:	00850893          	addi	a7,a0,8
ffffffffc0202dde:	4789                	li	a5,2
ffffffffc0202de0:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc0202de4:	00017697          	auipc	a3,0x17
ffffffffc0202de8:	85468693          	addi	a3,a3,-1964 # ffffffffc0219638 <free_area>
ffffffffc0202dec:	4a98                	lw	a4,16(a3)
ffffffffc0202dee:	669c                	ld	a5,8(a3)
ffffffffc0202df0:	01850613          	addi	a2,a0,24
ffffffffc0202df4:	9db9                	addw	a1,a1,a4
ffffffffc0202df6:	ca8c                	sw	a1,16(a3)
ffffffffc0202df8:	08d78f63          	beq	a5,a3,ffffffffc0202e96 <default_free_pages+0xf4>
ffffffffc0202dfc:	fe878713          	addi	a4,a5,-24
ffffffffc0202e00:	0006b803          	ld	a6,0(a3)
ffffffffc0202e04:	4581                	li	a1,0
ffffffffc0202e06:	00e56a63          	bltu	a0,a4,ffffffffc0202e1a <default_free_pages+0x78>
ffffffffc0202e0a:	6798                	ld	a4,8(a5)
ffffffffc0202e0c:	04d70a63          	beq	a4,a3,ffffffffc0202e60 <default_free_pages+0xbe>
ffffffffc0202e10:	87ba                	mv	a5,a4
ffffffffc0202e12:	fe878713          	addi	a4,a5,-24
ffffffffc0202e16:	fee57ae3          	bgeu	a0,a4,ffffffffc0202e0a <default_free_pages+0x68>
ffffffffc0202e1a:	c199                	beqz	a1,ffffffffc0202e20 <default_free_pages+0x7e>
ffffffffc0202e1c:	0106b023          	sd	a6,0(a3)
ffffffffc0202e20:	6398                	ld	a4,0(a5)
ffffffffc0202e22:	e390                	sd	a2,0(a5)
ffffffffc0202e24:	e710                	sd	a2,8(a4)
ffffffffc0202e26:	f11c                	sd	a5,32(a0)
ffffffffc0202e28:	ed18                	sd	a4,24(a0)
ffffffffc0202e2a:	00d70c63          	beq	a4,a3,ffffffffc0202e42 <default_free_pages+0xa0>
ffffffffc0202e2e:	ff872583          	lw	a1,-8(a4) # ff8 <kern_entry-0xffffffffc01ff008>
ffffffffc0202e32:	fe870613          	addi	a2,a4,-24
ffffffffc0202e36:	02059793          	slli	a5,a1,0x20
ffffffffc0202e3a:	83e9                	srli	a5,a5,0x1a
ffffffffc0202e3c:	97b2                	add	a5,a5,a2
ffffffffc0202e3e:	02f50b63          	beq	a0,a5,ffffffffc0202e74 <default_free_pages+0xd2>
ffffffffc0202e42:	7118                	ld	a4,32(a0)
ffffffffc0202e44:	00d70b63          	beq	a4,a3,ffffffffc0202e5a <default_free_pages+0xb8>
ffffffffc0202e48:	4910                	lw	a2,16(a0)
ffffffffc0202e4a:	fe870693          	addi	a3,a4,-24
ffffffffc0202e4e:	02061793          	slli	a5,a2,0x20
ffffffffc0202e52:	83e9                	srli	a5,a5,0x1a
ffffffffc0202e54:	97aa                	add	a5,a5,a0
ffffffffc0202e56:	04f68763          	beq	a3,a5,ffffffffc0202ea4 <default_free_pages+0x102>
ffffffffc0202e5a:	60a2                	ld	ra,8(sp)
ffffffffc0202e5c:	0141                	addi	sp,sp,16
ffffffffc0202e5e:	8082                	ret
ffffffffc0202e60:	e790                	sd	a2,8(a5)
ffffffffc0202e62:	f114                	sd	a3,32(a0)
ffffffffc0202e64:	6798                	ld	a4,8(a5)
ffffffffc0202e66:	ed1c                	sd	a5,24(a0)
ffffffffc0202e68:	02d70463          	beq	a4,a3,ffffffffc0202e90 <default_free_pages+0xee>
ffffffffc0202e6c:	8832                	mv	a6,a2
ffffffffc0202e6e:	4585                	li	a1,1
ffffffffc0202e70:	87ba                	mv	a5,a4
ffffffffc0202e72:	b745                	j	ffffffffc0202e12 <default_free_pages+0x70>
ffffffffc0202e74:	491c                	lw	a5,16(a0)
ffffffffc0202e76:	9dbd                	addw	a1,a1,a5
ffffffffc0202e78:	feb72c23          	sw	a1,-8(a4)
ffffffffc0202e7c:	57f5                	li	a5,-3
ffffffffc0202e7e:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc0202e82:	6d0c                	ld	a1,24(a0)
ffffffffc0202e84:	711c                	ld	a5,32(a0)
ffffffffc0202e86:	8532                	mv	a0,a2
ffffffffc0202e88:	e59c                	sd	a5,8(a1)
ffffffffc0202e8a:	6718                	ld	a4,8(a4)
ffffffffc0202e8c:	e38c                	sd	a1,0(a5)
ffffffffc0202e8e:	bf5d                	j	ffffffffc0202e44 <default_free_pages+0xa2>
ffffffffc0202e90:	e290                	sd	a2,0(a3)
ffffffffc0202e92:	873e                	mv	a4,a5
ffffffffc0202e94:	bf69                	j	ffffffffc0202e2e <default_free_pages+0x8c>
ffffffffc0202e96:	60a2                	ld	ra,8(sp)
ffffffffc0202e98:	e390                	sd	a2,0(a5)
ffffffffc0202e9a:	e790                	sd	a2,8(a5)
ffffffffc0202e9c:	f11c                	sd	a5,32(a0)
ffffffffc0202e9e:	ed1c                	sd	a5,24(a0)
ffffffffc0202ea0:	0141                	addi	sp,sp,16
ffffffffc0202ea2:	8082                	ret
ffffffffc0202ea4:	ff872783          	lw	a5,-8(a4)
ffffffffc0202ea8:	ff070693          	addi	a3,a4,-16
ffffffffc0202eac:	9e3d                	addw	a2,a2,a5
ffffffffc0202eae:	c910                	sw	a2,16(a0)
ffffffffc0202eb0:	57f5                	li	a5,-3
ffffffffc0202eb2:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc0202eb6:	6314                	ld	a3,0(a4)
ffffffffc0202eb8:	671c                	ld	a5,8(a4)
ffffffffc0202eba:	60a2                	ld	ra,8(sp)
ffffffffc0202ebc:	e69c                	sd	a5,8(a3)
ffffffffc0202ebe:	e394                	sd	a3,0(a5)
ffffffffc0202ec0:	0141                	addi	sp,sp,16
ffffffffc0202ec2:	8082                	ret
ffffffffc0202ec4:	00006697          	auipc	a3,0x6
ffffffffc0202ec8:	5c468693          	addi	a3,a3,1476 # ffffffffc0209488 <commands+0x1100>
ffffffffc0202ecc:	00006617          	auipc	a2,0x6
ffffffffc0202ed0:	8cc60613          	addi	a2,a2,-1844 # ffffffffc0208798 <commands+0x410>
ffffffffc0202ed4:	08300593          	li	a1,131
ffffffffc0202ed8:	00006517          	auipc	a0,0x6
ffffffffc0202edc:	26850513          	addi	a0,a0,616 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202ee0:	b28fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0202ee4:	00006697          	auipc	a3,0x6
ffffffffc0202ee8:	59c68693          	addi	a3,a3,1436 # ffffffffc0209480 <commands+0x10f8>
ffffffffc0202eec:	00006617          	auipc	a2,0x6
ffffffffc0202ef0:	8ac60613          	addi	a2,a2,-1876 # ffffffffc0208798 <commands+0x410>
ffffffffc0202ef4:	08000593          	li	a1,128
ffffffffc0202ef8:	00006517          	auipc	a0,0x6
ffffffffc0202efc:	24850513          	addi	a0,a0,584 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202f00:	b08fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202f04 <default_alloc_pages>:
ffffffffc0202f04:	c941                	beqz	a0,ffffffffc0202f94 <default_alloc_pages+0x90>
ffffffffc0202f06:	00016597          	auipc	a1,0x16
ffffffffc0202f0a:	73258593          	addi	a1,a1,1842 # ffffffffc0219638 <free_area>
ffffffffc0202f0e:	0105a803          	lw	a6,16(a1)
ffffffffc0202f12:	872a                	mv	a4,a0
ffffffffc0202f14:	02081793          	slli	a5,a6,0x20
ffffffffc0202f18:	9381                	srli	a5,a5,0x20
ffffffffc0202f1a:	00a7ee63          	bltu	a5,a0,ffffffffc0202f36 <default_alloc_pages+0x32>
ffffffffc0202f1e:	87ae                	mv	a5,a1
ffffffffc0202f20:	a801                	j	ffffffffc0202f30 <default_alloc_pages+0x2c>
ffffffffc0202f22:	ff87a683          	lw	a3,-8(a5)
ffffffffc0202f26:	02069613          	slli	a2,a3,0x20
ffffffffc0202f2a:	9201                	srli	a2,a2,0x20
ffffffffc0202f2c:	00e67763          	bgeu	a2,a4,ffffffffc0202f3a <default_alloc_pages+0x36>
ffffffffc0202f30:	679c                	ld	a5,8(a5)
ffffffffc0202f32:	feb798e3          	bne	a5,a1,ffffffffc0202f22 <default_alloc_pages+0x1e>
ffffffffc0202f36:	4501                	li	a0,0
ffffffffc0202f38:	8082                	ret
ffffffffc0202f3a:	0007b883          	ld	a7,0(a5)
ffffffffc0202f3e:	0087b303          	ld	t1,8(a5)
ffffffffc0202f42:	fe878513          	addi	a0,a5,-24
ffffffffc0202f46:	00070e1b          	sext.w	t3,a4
ffffffffc0202f4a:	0068b423          	sd	t1,8(a7)
ffffffffc0202f4e:	01133023          	sd	a7,0(t1)
ffffffffc0202f52:	02c77863          	bgeu	a4,a2,ffffffffc0202f82 <default_alloc_pages+0x7e>
ffffffffc0202f56:	071a                	slli	a4,a4,0x6
ffffffffc0202f58:	972a                	add	a4,a4,a0
ffffffffc0202f5a:	41c686bb          	subw	a3,a3,t3
ffffffffc0202f5e:	cb14                	sw	a3,16(a4)
ffffffffc0202f60:	00870613          	addi	a2,a4,8
ffffffffc0202f64:	4689                	li	a3,2
ffffffffc0202f66:	40d6302f          	amoor.d	zero,a3,(a2)
ffffffffc0202f6a:	0088b683          	ld	a3,8(a7)
ffffffffc0202f6e:	01870613          	addi	a2,a4,24
ffffffffc0202f72:	0105a803          	lw	a6,16(a1)
ffffffffc0202f76:	e290                	sd	a2,0(a3)
ffffffffc0202f78:	00c8b423          	sd	a2,8(a7)
ffffffffc0202f7c:	f314                	sd	a3,32(a4)
ffffffffc0202f7e:	01173c23          	sd	a7,24(a4)
ffffffffc0202f82:	41c8083b          	subw	a6,a6,t3
ffffffffc0202f86:	0105a823          	sw	a6,16(a1)
ffffffffc0202f8a:	5775                	li	a4,-3
ffffffffc0202f8c:	17c1                	addi	a5,a5,-16
ffffffffc0202f8e:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0202f92:	8082                	ret
ffffffffc0202f94:	1141                	addi	sp,sp,-16
ffffffffc0202f96:	00006697          	auipc	a3,0x6
ffffffffc0202f9a:	4ea68693          	addi	a3,a3,1258 # ffffffffc0209480 <commands+0x10f8>
ffffffffc0202f9e:	00005617          	auipc	a2,0x5
ffffffffc0202fa2:	7fa60613          	addi	a2,a2,2042 # ffffffffc0208798 <commands+0x410>
ffffffffc0202fa6:	06200593          	li	a1,98
ffffffffc0202faa:	00006517          	auipc	a0,0x6
ffffffffc0202fae:	19650513          	addi	a0,a0,406 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0202fb2:	e406                	sd	ra,8(sp)
ffffffffc0202fb4:	a54fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0202fb8 <default_init_memmap>:
ffffffffc0202fb8:	1141                	addi	sp,sp,-16
ffffffffc0202fba:	e406                	sd	ra,8(sp)
ffffffffc0202fbc:	c5f1                	beqz	a1,ffffffffc0203088 <default_init_memmap+0xd0>
ffffffffc0202fbe:	00659693          	slli	a3,a1,0x6
ffffffffc0202fc2:	96aa                	add	a3,a3,a0
ffffffffc0202fc4:	87aa                	mv	a5,a0
ffffffffc0202fc6:	00d50f63          	beq	a0,a3,ffffffffc0202fe4 <default_init_memmap+0x2c>
ffffffffc0202fca:	6798                	ld	a4,8(a5)
ffffffffc0202fcc:	8b05                	andi	a4,a4,1
ffffffffc0202fce:	cf49                	beqz	a4,ffffffffc0203068 <default_init_memmap+0xb0>
ffffffffc0202fd0:	0007a823          	sw	zero,16(a5)
ffffffffc0202fd4:	0007b423          	sd	zero,8(a5)
ffffffffc0202fd8:	0007a023          	sw	zero,0(a5)
ffffffffc0202fdc:	04078793          	addi	a5,a5,64
ffffffffc0202fe0:	fed795e3          	bne	a5,a3,ffffffffc0202fca <default_init_memmap+0x12>
ffffffffc0202fe4:	2581                	sext.w	a1,a1
ffffffffc0202fe6:	c90c                	sw	a1,16(a0)
ffffffffc0202fe8:	4789                	li	a5,2
ffffffffc0202fea:	00850713          	addi	a4,a0,8
ffffffffc0202fee:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0202ff2:	00016697          	auipc	a3,0x16
ffffffffc0202ff6:	64668693          	addi	a3,a3,1606 # ffffffffc0219638 <free_area>
ffffffffc0202ffa:	4a98                	lw	a4,16(a3)
ffffffffc0202ffc:	669c                	ld	a5,8(a3)
ffffffffc0202ffe:	01850613          	addi	a2,a0,24
ffffffffc0203002:	9db9                	addw	a1,a1,a4
ffffffffc0203004:	ca8c                	sw	a1,16(a3)
ffffffffc0203006:	04d78a63          	beq	a5,a3,ffffffffc020305a <default_init_memmap+0xa2>
ffffffffc020300a:	fe878713          	addi	a4,a5,-24
ffffffffc020300e:	0006b803          	ld	a6,0(a3)
ffffffffc0203012:	4581                	li	a1,0
ffffffffc0203014:	00e56a63          	bltu	a0,a4,ffffffffc0203028 <default_init_memmap+0x70>
ffffffffc0203018:	6798                	ld	a4,8(a5)
ffffffffc020301a:	02d70263          	beq	a4,a3,ffffffffc020303e <default_init_memmap+0x86>
ffffffffc020301e:	87ba                	mv	a5,a4
ffffffffc0203020:	fe878713          	addi	a4,a5,-24
ffffffffc0203024:	fee57ae3          	bgeu	a0,a4,ffffffffc0203018 <default_init_memmap+0x60>
ffffffffc0203028:	c199                	beqz	a1,ffffffffc020302e <default_init_memmap+0x76>
ffffffffc020302a:	0106b023          	sd	a6,0(a3)
ffffffffc020302e:	6398                	ld	a4,0(a5)
ffffffffc0203030:	60a2                	ld	ra,8(sp)
ffffffffc0203032:	e390                	sd	a2,0(a5)
ffffffffc0203034:	e710                	sd	a2,8(a4)
ffffffffc0203036:	f11c                	sd	a5,32(a0)
ffffffffc0203038:	ed18                	sd	a4,24(a0)
ffffffffc020303a:	0141                	addi	sp,sp,16
ffffffffc020303c:	8082                	ret
ffffffffc020303e:	e790                	sd	a2,8(a5)
ffffffffc0203040:	f114                	sd	a3,32(a0)
ffffffffc0203042:	6798                	ld	a4,8(a5)
ffffffffc0203044:	ed1c                	sd	a5,24(a0)
ffffffffc0203046:	00d70663          	beq	a4,a3,ffffffffc0203052 <default_init_memmap+0x9a>
ffffffffc020304a:	8832                	mv	a6,a2
ffffffffc020304c:	4585                	li	a1,1
ffffffffc020304e:	87ba                	mv	a5,a4
ffffffffc0203050:	bfc1                	j	ffffffffc0203020 <default_init_memmap+0x68>
ffffffffc0203052:	60a2                	ld	ra,8(sp)
ffffffffc0203054:	e290                	sd	a2,0(a3)
ffffffffc0203056:	0141                	addi	sp,sp,16
ffffffffc0203058:	8082                	ret
ffffffffc020305a:	60a2                	ld	ra,8(sp)
ffffffffc020305c:	e390                	sd	a2,0(a5)
ffffffffc020305e:	e790                	sd	a2,8(a5)
ffffffffc0203060:	f11c                	sd	a5,32(a0)
ffffffffc0203062:	ed1c                	sd	a5,24(a0)
ffffffffc0203064:	0141                	addi	sp,sp,16
ffffffffc0203066:	8082                	ret
ffffffffc0203068:	00006697          	auipc	a3,0x6
ffffffffc020306c:	44868693          	addi	a3,a3,1096 # ffffffffc02094b0 <commands+0x1128>
ffffffffc0203070:	00005617          	auipc	a2,0x5
ffffffffc0203074:	72860613          	addi	a2,a2,1832 # ffffffffc0208798 <commands+0x410>
ffffffffc0203078:	04900593          	li	a1,73
ffffffffc020307c:	00006517          	auipc	a0,0x6
ffffffffc0203080:	0c450513          	addi	a0,a0,196 # ffffffffc0209140 <commands+0xdb8>
ffffffffc0203084:	984fd0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203088:	00006697          	auipc	a3,0x6
ffffffffc020308c:	3f868693          	addi	a3,a3,1016 # ffffffffc0209480 <commands+0x10f8>
ffffffffc0203090:	00005617          	auipc	a2,0x5
ffffffffc0203094:	70860613          	addi	a2,a2,1800 # ffffffffc0208798 <commands+0x410>
ffffffffc0203098:	04600593          	li	a1,70
ffffffffc020309c:	00006517          	auipc	a0,0x6
ffffffffc02030a0:	0a450513          	addi	a0,a0,164 # ffffffffc0209140 <commands+0xdb8>
ffffffffc02030a4:	964fd0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02030a8 <mom>:
ffffffffc02030a8:	715d                	addi	sp,sp,-80
ffffffffc02030aa:	e0a2                	sd	s0,64(sp)
ffffffffc02030ac:	fc26                	sd	s1,56(sp)
ffffffffc02030ae:	f84a                	sd	s2,48(sp)
ffffffffc02030b0:	f44e                	sd	s3,40(sp)
ffffffffc02030b2:	f052                	sd	s4,32(sp)
ffffffffc02030b4:	ec56                	sd	s5,24(sp)
ffffffffc02030b6:	e85a                	sd	s6,16(sp)
ffffffffc02030b8:	e45e                	sd	s7,8(sp)
ffffffffc02030ba:	e062                	sd	s8,0(sp)
ffffffffc02030bc:	e486                	sd	ra,72(sp)
ffffffffc02030be:	0000b417          	auipc	s0,0xb
ffffffffc02030c2:	fca40413          	addi	s0,s0,-54 # ffffffffc020e088 <milk>
ffffffffc02030c6:	00016497          	auipc	s1,0x16
ffffffffc02030ca:	5ca48493          	addi	s1,s1,1482 # ffffffffc0219690 <mutex>
ffffffffc02030ce:	00006b17          	auipc	s6,0x6
ffffffffc02030d2:	442b0b13          	addi	s6,s6,1090 # ffffffffc0209510 <default_pmm_manager+0x38>
ffffffffc02030d6:	00006997          	auipc	s3,0x6
ffffffffc02030da:	45298993          	addi	s3,s3,1106 # ffffffffc0209528 <default_pmm_manager+0x50>
ffffffffc02030de:	00016917          	auipc	s2,0x16
ffffffffc02030e2:	57a90913          	addi	s2,s2,1402 # ffffffffc0219658 <p1>
ffffffffc02030e6:	00006a97          	auipc	s5,0x6
ffffffffc02030ea:	452a8a93          	addi	s5,s5,1106 # ffffffffc0209538 <default_pmm_manager+0x60>
ffffffffc02030ee:	00006a17          	auipc	s4,0x6
ffffffffc02030f2:	46aa0a13          	addi	s4,s4,1130 # ffffffffc0209558 <default_pmm_manager+0x80>
ffffffffc02030f6:	00006c17          	auipc	s8,0x6
ffffffffc02030fa:	4bac0c13          	addi	s8,s8,1210 # ffffffffc02095b0 <default_pmm_manager+0xd8>
ffffffffc02030fe:	00006b97          	auipc	s7,0x6
ffffffffc0203102:	472b8b93          	addi	s7,s7,1138 # ffffffffc0209570 <default_pmm_manager+0x98>
ffffffffc0203106:	8526                	mv	a0,s1
ffffffffc0203108:	51e000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020310c:	855a                	mv	a0,s6
ffffffffc020310e:	fbffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203112:	401c                	lw	a5,0(s0)
ffffffffc0203114:	00f05c63          	blez	a5,ffffffffc020312c <mom+0x84>
ffffffffc0203118:	854e                	mv	a0,s3
ffffffffc020311a:	fb3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020311e:	85a6                	mv	a1,s1
ffffffffc0203120:	854a                	mv	a0,s2
ffffffffc0203122:	58a000ef          	jal	ra,ffffffffc02036ac <cond_wait>
ffffffffc0203126:	401c                	lw	a5,0(s0)
ffffffffc0203128:	fef048e3          	bgtz	a5,ffffffffc0203118 <mom+0x70>
ffffffffc020312c:	8556                	mv	a0,s5
ffffffffc020312e:	f9ffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203132:	8552                	mv	a0,s4
ffffffffc0203134:	f99fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203138:	401c                	lw	a5,0(s0)
ffffffffc020313a:	00f05d63          	blez	a5,ffffffffc0203154 <mom+0xac>
ffffffffc020313e:	855e                	mv	a0,s7
ffffffffc0203140:	f8dfc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203144:	8526                	mv	a0,s1
ffffffffc0203146:	4de000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc020314a:	06400513          	li	a0,100
ffffffffc020314e:	15d010ef          	jal	ra,ffffffffc0204aaa <do_sleep>
ffffffffc0203152:	bf55                	j	ffffffffc0203106 <mom+0x5e>
ffffffffc0203154:	0647879b          	addiw	a5,a5,100
ffffffffc0203158:	8562                	mv	a0,s8
ffffffffc020315a:	c01c                	sw	a5,0(s0)
ffffffffc020315c:	f71fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203160:	b7d5                	j	ffffffffc0203144 <mom+0x9c>

ffffffffc0203162 <sister>:
ffffffffc0203162:	715d                	addi	sp,sp,-80
ffffffffc0203164:	e0a2                	sd	s0,64(sp)
ffffffffc0203166:	fc26                	sd	s1,56(sp)
ffffffffc0203168:	f84a                	sd	s2,48(sp)
ffffffffc020316a:	f44e                	sd	s3,40(sp)
ffffffffc020316c:	f052                	sd	s4,32(sp)
ffffffffc020316e:	ec56                	sd	s5,24(sp)
ffffffffc0203170:	e85a                	sd	s6,16(sp)
ffffffffc0203172:	e45e                	sd	s7,8(sp)
ffffffffc0203174:	e062                	sd	s8,0(sp)
ffffffffc0203176:	e486                	sd	ra,72(sp)
ffffffffc0203178:	0000b417          	auipc	s0,0xb
ffffffffc020317c:	f1040413          	addi	s0,s0,-240 # ffffffffc020e088 <milk>
ffffffffc0203180:	00016497          	auipc	s1,0x16
ffffffffc0203184:	51048493          	addi	s1,s1,1296 # ffffffffc0219690 <mutex>
ffffffffc0203188:	00006b17          	auipc	s6,0x6
ffffffffc020318c:	450b0b13          	addi	s6,s6,1104 # ffffffffc02095d8 <default_pmm_manager+0x100>
ffffffffc0203190:	00006997          	auipc	s3,0x6
ffffffffc0203194:	46098993          	addi	s3,s3,1120 # ffffffffc02095f0 <default_pmm_manager+0x118>
ffffffffc0203198:	00016917          	auipc	s2,0x16
ffffffffc020319c:	4c090913          	addi	s2,s2,1216 # ffffffffc0219658 <p1>
ffffffffc02031a0:	00006a97          	auipc	s5,0x6
ffffffffc02031a4:	460a8a93          	addi	s5,s5,1120 # ffffffffc0209600 <default_pmm_manager+0x128>
ffffffffc02031a8:	00006a17          	auipc	s4,0x6
ffffffffc02031ac:	478a0a13          	addi	s4,s4,1144 # ffffffffc0209620 <default_pmm_manager+0x148>
ffffffffc02031b0:	00006c17          	auipc	s8,0x6
ffffffffc02031b4:	488c0c13          	addi	s8,s8,1160 # ffffffffc0209638 <default_pmm_manager+0x160>
ffffffffc02031b8:	00006b97          	auipc	s7,0x6
ffffffffc02031bc:	3b8b8b93          	addi	s7,s7,952 # ffffffffc0209570 <default_pmm_manager+0x98>
ffffffffc02031c0:	8526                	mv	a0,s1
ffffffffc02031c2:	464000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc02031c6:	855a                	mv	a0,s6
ffffffffc02031c8:	f05fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031cc:	401c                	lw	a5,0(s0)
ffffffffc02031ce:	00f05c63          	blez	a5,ffffffffc02031e6 <sister+0x84>
ffffffffc02031d2:	854e                	mv	a0,s3
ffffffffc02031d4:	ef9fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031d8:	85a6                	mv	a1,s1
ffffffffc02031da:	854a                	mv	a0,s2
ffffffffc02031dc:	4d0000ef          	jal	ra,ffffffffc02036ac <cond_wait>
ffffffffc02031e0:	401c                	lw	a5,0(s0)
ffffffffc02031e2:	fef048e3          	bgtz	a5,ffffffffc02031d2 <sister+0x70>
ffffffffc02031e6:	8556                	mv	a0,s5
ffffffffc02031e8:	ee5fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031ec:	8552                	mv	a0,s4
ffffffffc02031ee:	edffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031f2:	401c                	lw	a5,0(s0)
ffffffffc02031f4:	00f05d63          	blez	a5,ffffffffc020320e <sister+0xac>
ffffffffc02031f8:	855e                	mv	a0,s7
ffffffffc02031fa:	ed3fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02031fe:	8526                	mv	a0,s1
ffffffffc0203200:	424000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc0203204:	06400513          	li	a0,100
ffffffffc0203208:	0a3010ef          	jal	ra,ffffffffc0204aaa <do_sleep>
ffffffffc020320c:	bf55                	j	ffffffffc02031c0 <sister+0x5e>
ffffffffc020320e:	0647879b          	addiw	a5,a5,100
ffffffffc0203212:	8562                	mv	a0,s8
ffffffffc0203214:	c01c                	sw	a5,0(s0)
ffffffffc0203216:	eb7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020321a:	b7d5                	j	ffffffffc02031fe <sister+0x9c>

ffffffffc020321c <dad>:
ffffffffc020321c:	7139                	addi	sp,sp,-64
ffffffffc020321e:	f822                	sd	s0,48(sp)
ffffffffc0203220:	f426                	sd	s1,40(sp)
ffffffffc0203222:	f04a                	sd	s2,32(sp)
ffffffffc0203224:	ec4e                	sd	s3,24(sp)
ffffffffc0203226:	e852                	sd	s4,16(sp)
ffffffffc0203228:	e456                	sd	s5,8(sp)
ffffffffc020322a:	fc06                	sd	ra,56(sp)
ffffffffc020322c:	0000b497          	auipc	s1,0xb
ffffffffc0203230:	e5c48493          	addi	s1,s1,-420 # ffffffffc020e088 <milk>
ffffffffc0203234:	00016417          	auipc	s0,0x16
ffffffffc0203238:	45c40413          	addi	s0,s0,1116 # ffffffffc0219690 <mutex>
ffffffffc020323c:	00006997          	auipc	s3,0x6
ffffffffc0203240:	42498993          	addi	s3,s3,1060 # ffffffffc0209660 <default_pmm_manager+0x188>
ffffffffc0203244:	00006a97          	auipc	s5,0x6
ffffffffc0203248:	45ca8a93          	addi	s5,s5,1116 # ffffffffc02096a0 <default_pmm_manager+0x1c8>
ffffffffc020324c:	00016917          	auipc	s2,0x16
ffffffffc0203250:	40c90913          	addi	s2,s2,1036 # ffffffffc0219658 <p1>
ffffffffc0203254:	00006a17          	auipc	s4,0x6
ffffffffc0203258:	424a0a13          	addi	s4,s4,1060 # ffffffffc0209678 <default_pmm_manager+0x1a0>
ffffffffc020325c:	a829                	j	ffffffffc0203276 <dad+0x5a>
ffffffffc020325e:	41c000ef          	jal	ra,ffffffffc020367a <cond_signal>
ffffffffc0203262:	8552                	mv	a0,s4
ffffffffc0203264:	e69fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203268:	8522                	mv	a0,s0
ffffffffc020326a:	3ba000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc020326e:	06400513          	li	a0,100
ffffffffc0203272:	039010ef          	jal	ra,ffffffffc0204aaa <do_sleep>
ffffffffc0203276:	8522                	mv	a0,s0
ffffffffc0203278:	3ae000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020327c:	854e                	mv	a0,s3
ffffffffc020327e:	e4ffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203282:	409c                	lw	a5,0(s1)
ffffffffc0203284:	854a                	mv	a0,s2
ffffffffc0203286:	dfe1                	beqz	a5,ffffffffc020325e <dad+0x42>
ffffffffc0203288:	37b1                	addiw	a5,a5,-20
ffffffffc020328a:	8556                	mv	a0,s5
ffffffffc020328c:	c09c                	sw	a5,0(s1)
ffffffffc020328e:	e3ffc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0203292:	bfd9                	j	ffffffffc0203268 <dad+0x4c>

ffffffffc0203294 <you>:
ffffffffc0203294:	7139                	addi	sp,sp,-64
ffffffffc0203296:	f822                	sd	s0,48(sp)
ffffffffc0203298:	f426                	sd	s1,40(sp)
ffffffffc020329a:	f04a                	sd	s2,32(sp)
ffffffffc020329c:	ec4e                	sd	s3,24(sp)
ffffffffc020329e:	e852                	sd	s4,16(sp)
ffffffffc02032a0:	e456                	sd	s5,8(sp)
ffffffffc02032a2:	fc06                	sd	ra,56(sp)
ffffffffc02032a4:	0000b497          	auipc	s1,0xb
ffffffffc02032a8:	de448493          	addi	s1,s1,-540 # ffffffffc020e088 <milk>
ffffffffc02032ac:	00016417          	auipc	s0,0x16
ffffffffc02032b0:	3e440413          	addi	s0,s0,996 # ffffffffc0219690 <mutex>
ffffffffc02032b4:	00006997          	auipc	s3,0x6
ffffffffc02032b8:	40498993          	addi	s3,s3,1028 # ffffffffc02096b8 <default_pmm_manager+0x1e0>
ffffffffc02032bc:	00006a97          	auipc	s5,0x6
ffffffffc02032c0:	43ca8a93          	addi	s5,s5,1084 # ffffffffc02096f8 <default_pmm_manager+0x220>
ffffffffc02032c4:	00016917          	auipc	s2,0x16
ffffffffc02032c8:	39490913          	addi	s2,s2,916 # ffffffffc0219658 <p1>
ffffffffc02032cc:	00006a17          	auipc	s4,0x6
ffffffffc02032d0:	404a0a13          	addi	s4,s4,1028 # ffffffffc02096d0 <default_pmm_manager+0x1f8>
ffffffffc02032d4:	a829                	j	ffffffffc02032ee <you+0x5a>
ffffffffc02032d6:	3a4000ef          	jal	ra,ffffffffc020367a <cond_signal>
ffffffffc02032da:	8552                	mv	a0,s4
ffffffffc02032dc:	df1fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02032e0:	8522                	mv	a0,s0
ffffffffc02032e2:	342000ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02032e6:	06400513          	li	a0,100
ffffffffc02032ea:	7c0010ef          	jal	ra,ffffffffc0204aaa <do_sleep>
ffffffffc02032ee:	8522                	mv	a0,s0
ffffffffc02032f0:	336000ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc02032f4:	854e                	mv	a0,s3
ffffffffc02032f6:	dd7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc02032fa:	409c                	lw	a5,0(s1)
ffffffffc02032fc:	854a                	mv	a0,s2
ffffffffc02032fe:	dfe1                	beqz	a5,ffffffffc02032d6 <you+0x42>
ffffffffc0203300:	37b1                	addiw	a5,a5,-20
ffffffffc0203302:	8556                	mv	a0,s5
ffffffffc0203304:	c09c                	sw	a5,0(s1)
ffffffffc0203306:	dc7fc0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc020330a:	bfd9                	j	ffffffffc02032e0 <you+0x4c>

ffffffffc020330c <check_milk>:
ffffffffc020330c:	7179                	addi	sp,sp,-48
ffffffffc020330e:	4585                	li	a1,1
ffffffffc0203310:	00016517          	auipc	a0,0x16
ffffffffc0203314:	38050513          	addi	a0,a0,896 # ffffffffc0219690 <mutex>
ffffffffc0203318:	f406                	sd	ra,40(sp)
ffffffffc020331a:	f022                	sd	s0,32(sp)
ffffffffc020331c:	ec26                	sd	s1,24(sp)
ffffffffc020331e:	e84a                	sd	s2,16(sp)
ffffffffc0203320:	e44e                	sd	s3,8(sp)
ffffffffc0203322:	2fa000ef          	jal	ra,ffffffffc020361c <sem_init>
ffffffffc0203326:	00016517          	auipc	a0,0x16
ffffffffc020332a:	33250513          	addi	a0,a0,818 # ffffffffc0219658 <p1>
ffffffffc020332e:	32a000ef          	jal	ra,ffffffffc0203658 <cond_init>
ffffffffc0203332:	4601                	li	a2,0
ffffffffc0203334:	4581                	li	a1,0
ffffffffc0203336:	00000517          	auipc	a0,0x0
ffffffffc020333a:	ee650513          	addi	a0,a0,-282 # ffffffffc020321c <dad>
ffffffffc020333e:	32b000ef          	jal	ra,ffffffffc0203e68 <kernel_thread>
ffffffffc0203342:	89aa                	mv	s3,a0
ffffffffc0203344:	4601                	li	a2,0
ffffffffc0203346:	4581                	li	a1,0
ffffffffc0203348:	00000517          	auipc	a0,0x0
ffffffffc020334c:	d6050513          	addi	a0,a0,-672 # ffffffffc02030a8 <mom>
ffffffffc0203350:	319000ef          	jal	ra,ffffffffc0203e68 <kernel_thread>
ffffffffc0203354:	892a                	mv	s2,a0
ffffffffc0203356:	4601                	li	a2,0
ffffffffc0203358:	4581                	li	a1,0
ffffffffc020335a:	00000517          	auipc	a0,0x0
ffffffffc020335e:	e0850513          	addi	a0,a0,-504 # ffffffffc0203162 <sister>
ffffffffc0203362:	307000ef          	jal	ra,ffffffffc0203e68 <kernel_thread>
ffffffffc0203366:	4601                	li	a2,0
ffffffffc0203368:	84aa                	mv	s1,a0
ffffffffc020336a:	4581                	li	a1,0
ffffffffc020336c:	00000517          	auipc	a0,0x0
ffffffffc0203370:	f2850513          	addi	a0,a0,-216 # ffffffffc0203294 <you>
ffffffffc0203374:	2f5000ef          	jal	ra,ffffffffc0203e68 <kernel_thread>
ffffffffc0203378:	842a                	mv	s0,a0
ffffffffc020337a:	854e                	mv	a0,s3
ffffffffc020337c:	6c2000ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc0203380:	00006597          	auipc	a1,0x6
ffffffffc0203384:	39058593          	addi	a1,a1,912 # ffffffffc0209710 <default_pmm_manager+0x238>
ffffffffc0203388:	00016797          	auipc	a5,0x16
ffffffffc020338c:	32a7b823          	sd	a0,816(a5) # ffffffffc02196b8 <pdad>
ffffffffc0203390:	618000ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc0203394:	854a                	mv	a0,s2
ffffffffc0203396:	6a8000ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc020339a:	00006597          	auipc	a1,0x6
ffffffffc020339e:	37e58593          	addi	a1,a1,894 # ffffffffc0209718 <default_pmm_manager+0x240>
ffffffffc02033a2:	00016797          	auipc	a5,0x16
ffffffffc02033a6:	30a7b723          	sd	a0,782(a5) # ffffffffc02196b0 <pmom>
ffffffffc02033aa:	5fe000ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc02033ae:	8526                	mv	a0,s1
ffffffffc02033b0:	68e000ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc02033b4:	00006597          	auipc	a1,0x6
ffffffffc02033b8:	36c58593          	addi	a1,a1,876 # ffffffffc0209720 <default_pmm_manager+0x248>
ffffffffc02033bc:	00016797          	auipc	a5,0x16
ffffffffc02033c0:	28a7ba23          	sd	a0,660(a5) # ffffffffc0219650 <psister>
ffffffffc02033c4:	5e4000ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc02033c8:	8522                	mv	a0,s0
ffffffffc02033ca:	674000ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc02033ce:	7402                	ld	s0,32(sp)
ffffffffc02033d0:	70a2                	ld	ra,40(sp)
ffffffffc02033d2:	64e2                	ld	s1,24(sp)
ffffffffc02033d4:	6942                	ld	s2,16(sp)
ffffffffc02033d6:	69a2                	ld	s3,8(sp)
ffffffffc02033d8:	00016797          	auipc	a5,0x16
ffffffffc02033dc:	2ca7b823          	sd	a0,720(a5) # ffffffffc02196a8 <pyou>
ffffffffc02033e0:	00006597          	auipc	a1,0x6
ffffffffc02033e4:	34858593          	addi	a1,a1,840 # ffffffffc0209728 <default_pmm_manager+0x250>
ffffffffc02033e8:	6145                	addi	sp,sp,48
ffffffffc02033ea:	ab7d                	j	ffffffffc02039a8 <set_proc_name>

ffffffffc02033ec <wait_queue_del.part.0>:
ffffffffc02033ec:	1141                	addi	sp,sp,-16
ffffffffc02033ee:	00006697          	auipc	a3,0x6
ffffffffc02033f2:	34268693          	addi	a3,a3,834 # ffffffffc0209730 <default_pmm_manager+0x258>
ffffffffc02033f6:	00005617          	auipc	a2,0x5
ffffffffc02033fa:	3a260613          	addi	a2,a2,930 # ffffffffc0208798 <commands+0x410>
ffffffffc02033fe:	45f1                	li	a1,28
ffffffffc0203400:	00006517          	auipc	a0,0x6
ffffffffc0203404:	37050513          	addi	a0,a0,880 # ffffffffc0209770 <default_pmm_manager+0x298>
ffffffffc0203408:	e406                	sd	ra,8(sp)
ffffffffc020340a:	dfffc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020340e <wait_queue_init>:
ffffffffc020340e:	e508                	sd	a0,8(a0)
ffffffffc0203410:	e108                	sd	a0,0(a0)
ffffffffc0203412:	8082                	ret

ffffffffc0203414 <wait_queue_del>:
ffffffffc0203414:	7198                	ld	a4,32(a1)
ffffffffc0203416:	01858793          	addi	a5,a1,24
ffffffffc020341a:	00e78b63          	beq	a5,a4,ffffffffc0203430 <wait_queue_del+0x1c>
ffffffffc020341e:	6994                	ld	a3,16(a1)
ffffffffc0203420:	00a69863          	bne	a3,a0,ffffffffc0203430 <wait_queue_del+0x1c>
ffffffffc0203424:	6d94                	ld	a3,24(a1)
ffffffffc0203426:	e698                	sd	a4,8(a3)
ffffffffc0203428:	e314                	sd	a3,0(a4)
ffffffffc020342a:	f19c                	sd	a5,32(a1)
ffffffffc020342c:	ed9c                	sd	a5,24(a1)
ffffffffc020342e:	8082                	ret
ffffffffc0203430:	1141                	addi	sp,sp,-16
ffffffffc0203432:	e406                	sd	ra,8(sp)
ffffffffc0203434:	fb9ff0ef          	jal	ra,ffffffffc02033ec <wait_queue_del.part.0>

ffffffffc0203438 <wait_queue_first>:
ffffffffc0203438:	651c                	ld	a5,8(a0)
ffffffffc020343a:	00f50563          	beq	a0,a5,ffffffffc0203444 <wait_queue_first+0xc>
ffffffffc020343e:	fe878513          	addi	a0,a5,-24
ffffffffc0203442:	8082                	ret
ffffffffc0203444:	4501                	li	a0,0
ffffffffc0203446:	8082                	ret

ffffffffc0203448 <wait_in_queue>:
ffffffffc0203448:	711c                	ld	a5,32(a0)
ffffffffc020344a:	0561                	addi	a0,a0,24
ffffffffc020344c:	40a78533          	sub	a0,a5,a0
ffffffffc0203450:	00a03533          	snez	a0,a0
ffffffffc0203454:	8082                	ret

ffffffffc0203456 <wakeup_wait>:
ffffffffc0203456:	ce91                	beqz	a3,ffffffffc0203472 <wakeup_wait+0x1c>
ffffffffc0203458:	7198                	ld	a4,32(a1)
ffffffffc020345a:	01858793          	addi	a5,a1,24
ffffffffc020345e:	00e78e63          	beq	a5,a4,ffffffffc020347a <wakeup_wait+0x24>
ffffffffc0203462:	6994                	ld	a3,16(a1)
ffffffffc0203464:	00d51b63          	bne	a0,a3,ffffffffc020347a <wakeup_wait+0x24>
ffffffffc0203468:	6d94                	ld	a3,24(a1)
ffffffffc020346a:	e698                	sd	a4,8(a3)
ffffffffc020346c:	e314                	sd	a3,0(a4)
ffffffffc020346e:	f19c                	sd	a5,32(a1)
ffffffffc0203470:	ed9c                	sd	a5,24(a1)
ffffffffc0203472:	6188                	ld	a0,0(a1)
ffffffffc0203474:	c590                	sw	a2,8(a1)
ffffffffc0203476:	70a0106f          	j	ffffffffc0204b80 <wakeup_proc>
ffffffffc020347a:	1141                	addi	sp,sp,-16
ffffffffc020347c:	e406                	sd	ra,8(sp)
ffffffffc020347e:	f6fff0ef          	jal	ra,ffffffffc02033ec <wait_queue_del.part.0>

ffffffffc0203482 <wait_current_set>:
ffffffffc0203482:	00016797          	auipc	a5,0x16
ffffffffc0203486:	07e7b783          	ld	a5,126(a5) # ffffffffc0219500 <current>
ffffffffc020348a:	c39d                	beqz	a5,ffffffffc02034b0 <wait_current_set+0x2e>
ffffffffc020348c:	01858713          	addi	a4,a1,24
ffffffffc0203490:	800006b7          	lui	a3,0x80000
ffffffffc0203494:	ed98                	sd	a4,24(a1)
ffffffffc0203496:	e19c                	sd	a5,0(a1)
ffffffffc0203498:	c594                	sw	a3,8(a1)
ffffffffc020349a:	4685                	li	a3,1
ffffffffc020349c:	c394                	sw	a3,0(a5)
ffffffffc020349e:	0ec7a623          	sw	a2,236(a5)
ffffffffc02034a2:	611c                	ld	a5,0(a0)
ffffffffc02034a4:	e988                	sd	a0,16(a1)
ffffffffc02034a6:	e118                	sd	a4,0(a0)
ffffffffc02034a8:	e798                	sd	a4,8(a5)
ffffffffc02034aa:	f188                	sd	a0,32(a1)
ffffffffc02034ac:	ed9c                	sd	a5,24(a1)
ffffffffc02034ae:	8082                	ret
ffffffffc02034b0:	1141                	addi	sp,sp,-16
ffffffffc02034b2:	00006697          	auipc	a3,0x6
ffffffffc02034b6:	2d668693          	addi	a3,a3,726 # ffffffffc0209788 <default_pmm_manager+0x2b0>
ffffffffc02034ba:	00005617          	auipc	a2,0x5
ffffffffc02034be:	2de60613          	addi	a2,a2,734 # ffffffffc0208798 <commands+0x410>
ffffffffc02034c2:	07400593          	li	a1,116
ffffffffc02034c6:	00006517          	auipc	a0,0x6
ffffffffc02034ca:	2aa50513          	addi	a0,a0,682 # ffffffffc0209770 <default_pmm_manager+0x298>
ffffffffc02034ce:	e406                	sd	ra,8(sp)
ffffffffc02034d0:	d39fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02034d4 <__down.constprop.0>:
ffffffffc02034d4:	715d                	addi	sp,sp,-80
ffffffffc02034d6:	e0a2                	sd	s0,64(sp)
ffffffffc02034d8:	e486                	sd	ra,72(sp)
ffffffffc02034da:	fc26                	sd	s1,56(sp)
ffffffffc02034dc:	842a                	mv	s0,a0
ffffffffc02034de:	100027f3          	csrr	a5,sstatus
ffffffffc02034e2:	8b89                	andi	a5,a5,2
ffffffffc02034e4:	ebb1                	bnez	a5,ffffffffc0203538 <__down.constprop.0+0x64>
ffffffffc02034e6:	411c                	lw	a5,0(a0)
ffffffffc02034e8:	00f05a63          	blez	a5,ffffffffc02034fc <__down.constprop.0+0x28>
ffffffffc02034ec:	37fd                	addiw	a5,a5,-1
ffffffffc02034ee:	c11c                	sw	a5,0(a0)
ffffffffc02034f0:	4501                	li	a0,0
ffffffffc02034f2:	60a6                	ld	ra,72(sp)
ffffffffc02034f4:	6406                	ld	s0,64(sp)
ffffffffc02034f6:	74e2                	ld	s1,56(sp)
ffffffffc02034f8:	6161                	addi	sp,sp,80
ffffffffc02034fa:	8082                	ret
ffffffffc02034fc:	00850413          	addi	s0,a0,8
ffffffffc0203500:	0024                	addi	s1,sp,8
ffffffffc0203502:	10000613          	li	a2,256
ffffffffc0203506:	85a6                	mv	a1,s1
ffffffffc0203508:	8522                	mv	a0,s0
ffffffffc020350a:	f79ff0ef          	jal	ra,ffffffffc0203482 <wait_current_set>
ffffffffc020350e:	724010ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc0203512:	100027f3          	csrr	a5,sstatus
ffffffffc0203516:	8b89                	andi	a5,a5,2
ffffffffc0203518:	efb9                	bnez	a5,ffffffffc0203576 <__down.constprop.0+0xa2>
ffffffffc020351a:	8526                	mv	a0,s1
ffffffffc020351c:	f2dff0ef          	jal	ra,ffffffffc0203448 <wait_in_queue>
ffffffffc0203520:	e531                	bnez	a0,ffffffffc020356c <__down.constprop.0+0x98>
ffffffffc0203522:	4542                	lw	a0,16(sp)
ffffffffc0203524:	10000793          	li	a5,256
ffffffffc0203528:	fcf515e3          	bne	a0,a5,ffffffffc02034f2 <__down.constprop.0+0x1e>
ffffffffc020352c:	60a6                	ld	ra,72(sp)
ffffffffc020352e:	6406                	ld	s0,64(sp)
ffffffffc0203530:	74e2                	ld	s1,56(sp)
ffffffffc0203532:	4501                	li	a0,0
ffffffffc0203534:	6161                	addi	sp,sp,80
ffffffffc0203536:	8082                	ret
ffffffffc0203538:	900fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020353c:	401c                	lw	a5,0(s0)
ffffffffc020353e:	00f05c63          	blez	a5,ffffffffc0203556 <__down.constprop.0+0x82>
ffffffffc0203542:	37fd                	addiw	a5,a5,-1
ffffffffc0203544:	c01c                	sw	a5,0(s0)
ffffffffc0203546:	8ecfd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020354a:	60a6                	ld	ra,72(sp)
ffffffffc020354c:	6406                	ld	s0,64(sp)
ffffffffc020354e:	74e2                	ld	s1,56(sp)
ffffffffc0203550:	4501                	li	a0,0
ffffffffc0203552:	6161                	addi	sp,sp,80
ffffffffc0203554:	8082                	ret
ffffffffc0203556:	0421                	addi	s0,s0,8
ffffffffc0203558:	0024                	addi	s1,sp,8
ffffffffc020355a:	10000613          	li	a2,256
ffffffffc020355e:	85a6                	mv	a1,s1
ffffffffc0203560:	8522                	mv	a0,s0
ffffffffc0203562:	f21ff0ef          	jal	ra,ffffffffc0203482 <wait_current_set>
ffffffffc0203566:	8ccfd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc020356a:	b755                	j	ffffffffc020350e <__down.constprop.0+0x3a>
ffffffffc020356c:	85a6                	mv	a1,s1
ffffffffc020356e:	8522                	mv	a0,s0
ffffffffc0203570:	ea5ff0ef          	jal	ra,ffffffffc0203414 <wait_queue_del>
ffffffffc0203574:	b77d                	j	ffffffffc0203522 <__down.constprop.0+0x4e>
ffffffffc0203576:	8c2fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc020357a:	8526                	mv	a0,s1
ffffffffc020357c:	ecdff0ef          	jal	ra,ffffffffc0203448 <wait_in_queue>
ffffffffc0203580:	e501                	bnez	a0,ffffffffc0203588 <__down.constprop.0+0xb4>
ffffffffc0203582:	8b0fd0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203586:	bf71                	j	ffffffffc0203522 <__down.constprop.0+0x4e>
ffffffffc0203588:	85a6                	mv	a1,s1
ffffffffc020358a:	8522                	mv	a0,s0
ffffffffc020358c:	e89ff0ef          	jal	ra,ffffffffc0203414 <wait_queue_del>
ffffffffc0203590:	bfcd                	j	ffffffffc0203582 <__down.constprop.0+0xae>

ffffffffc0203592 <__up.constprop.0>:
ffffffffc0203592:	1101                	addi	sp,sp,-32
ffffffffc0203594:	e822                	sd	s0,16(sp)
ffffffffc0203596:	ec06                	sd	ra,24(sp)
ffffffffc0203598:	e426                	sd	s1,8(sp)
ffffffffc020359a:	e04a                	sd	s2,0(sp)
ffffffffc020359c:	842a                	mv	s0,a0
ffffffffc020359e:	100027f3          	csrr	a5,sstatus
ffffffffc02035a2:	8b89                	andi	a5,a5,2
ffffffffc02035a4:	4901                	li	s2,0
ffffffffc02035a6:	eba1                	bnez	a5,ffffffffc02035f6 <__up.constprop.0+0x64>
ffffffffc02035a8:	00840493          	addi	s1,s0,8
ffffffffc02035ac:	8526                	mv	a0,s1
ffffffffc02035ae:	e8bff0ef          	jal	ra,ffffffffc0203438 <wait_queue_first>
ffffffffc02035b2:	85aa                	mv	a1,a0
ffffffffc02035b4:	cd0d                	beqz	a0,ffffffffc02035ee <__up.constprop.0+0x5c>
ffffffffc02035b6:	6118                	ld	a4,0(a0)
ffffffffc02035b8:	10000793          	li	a5,256
ffffffffc02035bc:	0ec72703          	lw	a4,236(a4)
ffffffffc02035c0:	02f71f63          	bne	a4,a5,ffffffffc02035fe <__up.constprop.0+0x6c>
ffffffffc02035c4:	4685                	li	a3,1
ffffffffc02035c6:	10000613          	li	a2,256
ffffffffc02035ca:	8526                	mv	a0,s1
ffffffffc02035cc:	e8bff0ef          	jal	ra,ffffffffc0203456 <wakeup_wait>
ffffffffc02035d0:	00091863          	bnez	s2,ffffffffc02035e0 <__up.constprop.0+0x4e>
ffffffffc02035d4:	60e2                	ld	ra,24(sp)
ffffffffc02035d6:	6442                	ld	s0,16(sp)
ffffffffc02035d8:	64a2                	ld	s1,8(sp)
ffffffffc02035da:	6902                	ld	s2,0(sp)
ffffffffc02035dc:	6105                	addi	sp,sp,32
ffffffffc02035de:	8082                	ret
ffffffffc02035e0:	6442                	ld	s0,16(sp)
ffffffffc02035e2:	60e2                	ld	ra,24(sp)
ffffffffc02035e4:	64a2                	ld	s1,8(sp)
ffffffffc02035e6:	6902                	ld	s2,0(sp)
ffffffffc02035e8:	6105                	addi	sp,sp,32
ffffffffc02035ea:	848fd06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc02035ee:	401c                	lw	a5,0(s0)
ffffffffc02035f0:	2785                	addiw	a5,a5,1
ffffffffc02035f2:	c01c                	sw	a5,0(s0)
ffffffffc02035f4:	bff1                	j	ffffffffc02035d0 <__up.constprop.0+0x3e>
ffffffffc02035f6:	842fd0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02035fa:	4905                	li	s2,1
ffffffffc02035fc:	b775                	j	ffffffffc02035a8 <__up.constprop.0+0x16>
ffffffffc02035fe:	00006697          	auipc	a3,0x6
ffffffffc0203602:	19a68693          	addi	a3,a3,410 # ffffffffc0209798 <default_pmm_manager+0x2c0>
ffffffffc0203606:	00005617          	auipc	a2,0x5
ffffffffc020360a:	19260613          	addi	a2,a2,402 # ffffffffc0208798 <commands+0x410>
ffffffffc020360e:	45e5                	li	a1,25
ffffffffc0203610:	00006517          	auipc	a0,0x6
ffffffffc0203614:	1b050513          	addi	a0,a0,432 # ffffffffc02097c0 <default_pmm_manager+0x2e8>
ffffffffc0203618:	bf1fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020361c <sem_init>:
ffffffffc020361c:	c10c                	sw	a1,0(a0)
ffffffffc020361e:	0521                	addi	a0,a0,8
ffffffffc0203620:	defff06f          	j	ffffffffc020340e <wait_queue_init>

ffffffffc0203624 <up>:
ffffffffc0203624:	b7bd                	j	ffffffffc0203592 <__up.constprop.0>

ffffffffc0203626 <down>:
ffffffffc0203626:	1141                	addi	sp,sp,-16
ffffffffc0203628:	e406                	sd	ra,8(sp)
ffffffffc020362a:	eabff0ef          	jal	ra,ffffffffc02034d4 <__down.constprop.0>
ffffffffc020362e:	2501                	sext.w	a0,a0
ffffffffc0203630:	e501                	bnez	a0,ffffffffc0203638 <down+0x12>
ffffffffc0203632:	60a2                	ld	ra,8(sp)
ffffffffc0203634:	0141                	addi	sp,sp,16
ffffffffc0203636:	8082                	ret
ffffffffc0203638:	00006697          	auipc	a3,0x6
ffffffffc020363c:	19868693          	addi	a3,a3,408 # ffffffffc02097d0 <default_pmm_manager+0x2f8>
ffffffffc0203640:	00005617          	auipc	a2,0x5
ffffffffc0203644:	15860613          	addi	a2,a2,344 # ffffffffc0208798 <commands+0x410>
ffffffffc0203648:	04000593          	li	a1,64
ffffffffc020364c:	00006517          	auipc	a0,0x6
ffffffffc0203650:	17450513          	addi	a0,a0,372 # ffffffffc02097c0 <default_pmm_manager+0x2e8>
ffffffffc0203654:	bb5fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203658 <cond_init>:
ffffffffc0203658:	1141                	addi	sp,sp,-16
ffffffffc020365a:	e022                	sd	s0,0(sp)
ffffffffc020365c:	e406                	sd	ra,8(sp)
ffffffffc020365e:	842a                	mv	s0,a0
ffffffffc0203660:	4585                	li	a1,1
ffffffffc0203662:	0521                	addi	a0,a0,8
ffffffffc0203664:	00042023          	sw	zero,0(s0)
ffffffffc0203668:	fb5ff0ef          	jal	ra,ffffffffc020361c <sem_init>
ffffffffc020366c:	02040513          	addi	a0,s0,32
ffffffffc0203670:	6402                	ld	s0,0(sp)
ffffffffc0203672:	60a2                	ld	ra,8(sp)
ffffffffc0203674:	4589                	li	a1,2
ffffffffc0203676:	0141                	addi	sp,sp,16
ffffffffc0203678:	b755                	j	ffffffffc020361c <sem_init>

ffffffffc020367a <cond_signal>:
ffffffffc020367a:	1101                	addi	sp,sp,-32
ffffffffc020367c:	e426                	sd	s1,8(sp)
ffffffffc020367e:	00850493          	addi	s1,a0,8
ffffffffc0203682:	e822                	sd	s0,16(sp)
ffffffffc0203684:	842a                	mv	s0,a0
ffffffffc0203686:	8526                	mv	a0,s1
ffffffffc0203688:	ec06                	sd	ra,24(sp)
ffffffffc020368a:	f9dff0ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc020368e:	401c                	lw	a5,0(s0)
ffffffffc0203690:	00f05863          	blez	a5,ffffffffc02036a0 <cond_signal+0x26>
ffffffffc0203694:	37fd                	addiw	a5,a5,-1
ffffffffc0203696:	c01c                	sw	a5,0(s0)
ffffffffc0203698:	02040513          	addi	a0,s0,32
ffffffffc020369c:	f89ff0ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02036a0:	6442                	ld	s0,16(sp)
ffffffffc02036a2:	60e2                	ld	ra,24(sp)
ffffffffc02036a4:	8526                	mv	a0,s1
ffffffffc02036a6:	64a2                	ld	s1,8(sp)
ffffffffc02036a8:	6105                	addi	sp,sp,32
ffffffffc02036aa:	bfad                	j	ffffffffc0203624 <up>

ffffffffc02036ac <cond_wait>:
ffffffffc02036ac:	1101                	addi	sp,sp,-32
ffffffffc02036ae:	e822                	sd	s0,16(sp)
ffffffffc02036b0:	842a                	mv	s0,a0
ffffffffc02036b2:	852e                	mv	a0,a1
ffffffffc02036b4:	ec06                	sd	ra,24(sp)
ffffffffc02036b6:	e426                	sd	s1,8(sp)
ffffffffc02036b8:	f6dff0ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02036bc:	00840493          	addi	s1,s0,8
ffffffffc02036c0:	8526                	mv	a0,s1
ffffffffc02036c2:	f65ff0ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc02036c6:	401c                	lw	a5,0(s0)
ffffffffc02036c8:	8526                	mv	a0,s1
ffffffffc02036ca:	2785                	addiw	a5,a5,1
ffffffffc02036cc:	c01c                	sw	a5,0(s0)
ffffffffc02036ce:	f57ff0ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc02036d2:	02040513          	addi	a0,s0,32
ffffffffc02036d6:	6442                	ld	s0,16(sp)
ffffffffc02036d8:	60e2                	ld	ra,24(sp)
ffffffffc02036da:	64a2                	ld	s1,8(sp)
ffffffffc02036dc:	6105                	addi	sp,sp,32
ffffffffc02036de:	b7a1                	j	ffffffffc0203626 <down>

ffffffffc02036e0 <swapfs_init>:
ffffffffc02036e0:	1141                	addi	sp,sp,-16
ffffffffc02036e2:	4505                	li	a0,1
ffffffffc02036e4:	e406                	sd	ra,8(sp)
ffffffffc02036e6:	e3dfc0ef          	jal	ra,ffffffffc0200522 <ide_device_valid>
ffffffffc02036ea:	cd01                	beqz	a0,ffffffffc0203702 <swapfs_init+0x22>
ffffffffc02036ec:	4505                	li	a0,1
ffffffffc02036ee:	e3bfc0ef          	jal	ra,ffffffffc0200528 <ide_device_size>
ffffffffc02036f2:	60a2                	ld	ra,8(sp)
ffffffffc02036f4:	810d                	srli	a0,a0,0x3
ffffffffc02036f6:	00016797          	auipc	a5,0x16
ffffffffc02036fa:	eea7b923          	sd	a0,-270(a5) # ffffffffc02195e8 <max_swap_offset>
ffffffffc02036fe:	0141                	addi	sp,sp,16
ffffffffc0203700:	8082                	ret
ffffffffc0203702:	00006617          	auipc	a2,0x6
ffffffffc0203706:	0de60613          	addi	a2,a2,222 # ffffffffc02097e0 <default_pmm_manager+0x308>
ffffffffc020370a:	45b5                	li	a1,13
ffffffffc020370c:	00006517          	auipc	a0,0x6
ffffffffc0203710:	0f450513          	addi	a0,a0,244 # ffffffffc0209800 <default_pmm_manager+0x328>
ffffffffc0203714:	af5fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203718 <swapfs_read>:
ffffffffc0203718:	1141                	addi	sp,sp,-16
ffffffffc020371a:	e406                	sd	ra,8(sp)
ffffffffc020371c:	00855793          	srli	a5,a0,0x8
ffffffffc0203720:	cbb1                	beqz	a5,ffffffffc0203774 <swapfs_read+0x5c>
ffffffffc0203722:	00016717          	auipc	a4,0x16
ffffffffc0203726:	ec673703          	ld	a4,-314(a4) # ffffffffc02195e8 <max_swap_offset>
ffffffffc020372a:	04e7f563          	bgeu	a5,a4,ffffffffc0203774 <swapfs_read+0x5c>
ffffffffc020372e:	00016617          	auipc	a2,0x16
ffffffffc0203732:	e2263603          	ld	a2,-478(a2) # ffffffffc0219550 <pages>
ffffffffc0203736:	8d91                	sub	a1,a1,a2
ffffffffc0203738:	4065d613          	srai	a2,a1,0x6
ffffffffc020373c:	00007717          	auipc	a4,0x7
ffffffffc0203740:	1bc73703          	ld	a4,444(a4) # ffffffffc020a8f8 <nbase>
ffffffffc0203744:	963a                	add	a2,a2,a4
ffffffffc0203746:	00c61713          	slli	a4,a2,0xc
ffffffffc020374a:	8331                	srli	a4,a4,0xc
ffffffffc020374c:	00016697          	auipc	a3,0x16
ffffffffc0203750:	d8c6b683          	ld	a3,-628(a3) # ffffffffc02194d8 <npage>
ffffffffc0203754:	0037959b          	slliw	a1,a5,0x3
ffffffffc0203758:	0632                	slli	a2,a2,0xc
ffffffffc020375a:	02d77963          	bgeu	a4,a3,ffffffffc020378c <swapfs_read+0x74>
ffffffffc020375e:	60a2                	ld	ra,8(sp)
ffffffffc0203760:	00016797          	auipc	a5,0x16
ffffffffc0203764:	de07b783          	ld	a5,-544(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc0203768:	46a1                	li	a3,8
ffffffffc020376a:	963e                	add	a2,a2,a5
ffffffffc020376c:	4505                	li	a0,1
ffffffffc020376e:	0141                	addi	sp,sp,16
ffffffffc0203770:	dbffc06f          	j	ffffffffc020052e <ide_read_secs>
ffffffffc0203774:	86aa                	mv	a3,a0
ffffffffc0203776:	00006617          	auipc	a2,0x6
ffffffffc020377a:	0a260613          	addi	a2,a2,162 # ffffffffc0209818 <default_pmm_manager+0x340>
ffffffffc020377e:	45d1                	li	a1,20
ffffffffc0203780:	00006517          	auipc	a0,0x6
ffffffffc0203784:	08050513          	addi	a0,a0,128 # ffffffffc0209800 <default_pmm_manager+0x328>
ffffffffc0203788:	a81fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020378c:	86b2                	mv	a3,a2
ffffffffc020378e:	06900593          	li	a1,105
ffffffffc0203792:	00005617          	auipc	a2,0x5
ffffffffc0203796:	3b660613          	addi	a2,a2,950 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc020379a:	00005517          	auipc	a0,0x5
ffffffffc020379e:	30e50513          	addi	a0,a0,782 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02037a2:	a67fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02037a6 <swapfs_write>:
ffffffffc02037a6:	1141                	addi	sp,sp,-16
ffffffffc02037a8:	e406                	sd	ra,8(sp)
ffffffffc02037aa:	00855793          	srli	a5,a0,0x8
ffffffffc02037ae:	cbb1                	beqz	a5,ffffffffc0203802 <swapfs_write+0x5c>
ffffffffc02037b0:	00016717          	auipc	a4,0x16
ffffffffc02037b4:	e3873703          	ld	a4,-456(a4) # ffffffffc02195e8 <max_swap_offset>
ffffffffc02037b8:	04e7f563          	bgeu	a5,a4,ffffffffc0203802 <swapfs_write+0x5c>
ffffffffc02037bc:	00016617          	auipc	a2,0x16
ffffffffc02037c0:	d9463603          	ld	a2,-620(a2) # ffffffffc0219550 <pages>
ffffffffc02037c4:	8d91                	sub	a1,a1,a2
ffffffffc02037c6:	4065d613          	srai	a2,a1,0x6
ffffffffc02037ca:	00007717          	auipc	a4,0x7
ffffffffc02037ce:	12e73703          	ld	a4,302(a4) # ffffffffc020a8f8 <nbase>
ffffffffc02037d2:	963a                	add	a2,a2,a4
ffffffffc02037d4:	00c61713          	slli	a4,a2,0xc
ffffffffc02037d8:	8331                	srli	a4,a4,0xc
ffffffffc02037da:	00016697          	auipc	a3,0x16
ffffffffc02037de:	cfe6b683          	ld	a3,-770(a3) # ffffffffc02194d8 <npage>
ffffffffc02037e2:	0037959b          	slliw	a1,a5,0x3
ffffffffc02037e6:	0632                	slli	a2,a2,0xc
ffffffffc02037e8:	02d77963          	bgeu	a4,a3,ffffffffc020381a <swapfs_write+0x74>
ffffffffc02037ec:	60a2                	ld	ra,8(sp)
ffffffffc02037ee:	00016797          	auipc	a5,0x16
ffffffffc02037f2:	d527b783          	ld	a5,-686(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc02037f6:	46a1                	li	a3,8
ffffffffc02037f8:	963e                	add	a2,a2,a5
ffffffffc02037fa:	4505                	li	a0,1
ffffffffc02037fc:	0141                	addi	sp,sp,16
ffffffffc02037fe:	d55fc06f          	j	ffffffffc0200552 <ide_write_secs>
ffffffffc0203802:	86aa                	mv	a3,a0
ffffffffc0203804:	00006617          	auipc	a2,0x6
ffffffffc0203808:	01460613          	addi	a2,a2,20 # ffffffffc0209818 <default_pmm_manager+0x340>
ffffffffc020380c:	45e5                	li	a1,25
ffffffffc020380e:	00006517          	auipc	a0,0x6
ffffffffc0203812:	ff250513          	addi	a0,a0,-14 # ffffffffc0209800 <default_pmm_manager+0x328>
ffffffffc0203816:	9f3fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020381a:	86b2                	mv	a3,a2
ffffffffc020381c:	06900593          	li	a1,105
ffffffffc0203820:	00005617          	auipc	a2,0x5
ffffffffc0203824:	32860613          	addi	a2,a2,808 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0203828:	00005517          	auipc	a0,0x5
ffffffffc020382c:	28050513          	addi	a0,a0,640 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0203830:	9d9fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203834 <kernel_thread_entry>:
ffffffffc0203834:	8526                	mv	a0,s1
ffffffffc0203836:	9402                	jalr	s0
ffffffffc0203838:	680000ef          	jal	ra,ffffffffc0203eb8 <do_exit>

ffffffffc020383c <switch_to>:
ffffffffc020383c:	00153023          	sd	ra,0(a0)
ffffffffc0203840:	00253423          	sd	sp,8(a0)
ffffffffc0203844:	e900                	sd	s0,16(a0)
ffffffffc0203846:	ed04                	sd	s1,24(a0)
ffffffffc0203848:	03253023          	sd	s2,32(a0)
ffffffffc020384c:	03353423          	sd	s3,40(a0)
ffffffffc0203850:	03453823          	sd	s4,48(a0)
ffffffffc0203854:	03553c23          	sd	s5,56(a0)
ffffffffc0203858:	05653023          	sd	s6,64(a0)
ffffffffc020385c:	05753423          	sd	s7,72(a0)
ffffffffc0203860:	05853823          	sd	s8,80(a0)
ffffffffc0203864:	05953c23          	sd	s9,88(a0)
ffffffffc0203868:	07a53023          	sd	s10,96(a0)
ffffffffc020386c:	07b53423          	sd	s11,104(a0)
ffffffffc0203870:	0005b083          	ld	ra,0(a1)
ffffffffc0203874:	0085b103          	ld	sp,8(a1)
ffffffffc0203878:	6980                	ld	s0,16(a1)
ffffffffc020387a:	6d84                	ld	s1,24(a1)
ffffffffc020387c:	0205b903          	ld	s2,32(a1)
ffffffffc0203880:	0285b983          	ld	s3,40(a1)
ffffffffc0203884:	0305ba03          	ld	s4,48(a1)
ffffffffc0203888:	0385ba83          	ld	s5,56(a1)
ffffffffc020388c:	0405bb03          	ld	s6,64(a1)
ffffffffc0203890:	0485bb83          	ld	s7,72(a1)
ffffffffc0203894:	0505bc03          	ld	s8,80(a1)
ffffffffc0203898:	0585bc83          	ld	s9,88(a1)
ffffffffc020389c:	0605bd03          	ld	s10,96(a1)
ffffffffc02038a0:	0685bd83          	ld	s11,104(a1)
ffffffffc02038a4:	8082                	ret

ffffffffc02038a6 <alloc_proc>:
ffffffffc02038a6:	1141                	addi	sp,sp,-16
ffffffffc02038a8:	14800513          	li	a0,328
ffffffffc02038ac:	e022                	sd	s0,0(sp)
ffffffffc02038ae:	e406                	sd	ra,8(sp)
ffffffffc02038b0:	fc0fe0ef          	jal	ra,ffffffffc0202070 <kmalloc>
ffffffffc02038b4:	842a                	mv	s0,a0
ffffffffc02038b6:	cd21                	beqz	a0,ffffffffc020390e <alloc_proc+0x68>
ffffffffc02038b8:	57fd                	li	a5,-1
ffffffffc02038ba:	1782                	slli	a5,a5,0x20
ffffffffc02038bc:	e11c                	sd	a5,0(a0)
ffffffffc02038be:	07000613          	li	a2,112
ffffffffc02038c2:	4581                	li	a1,0
ffffffffc02038c4:	00052423          	sw	zero,8(a0)
ffffffffc02038c8:	00053823          	sd	zero,16(a0)
ffffffffc02038cc:	00053c23          	sd	zero,24(a0)
ffffffffc02038d0:	02053023          	sd	zero,32(a0)
ffffffffc02038d4:	02053423          	sd	zero,40(a0)
ffffffffc02038d8:	03050513          	addi	a0,a0,48
ffffffffc02038dc:	3dc040ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc02038e0:	00016797          	auipc	a5,0x16
ffffffffc02038e4:	c687b783          	ld	a5,-920(a5) # ffffffffc0219548 <boot_cr3>
ffffffffc02038e8:	0a043023          	sd	zero,160(s0)
ffffffffc02038ec:	f45c                	sd	a5,168(s0)
ffffffffc02038ee:	0a042823          	sw	zero,176(s0)
ffffffffc02038f2:	463d                	li	a2,15
ffffffffc02038f4:	4581                	li	a1,0
ffffffffc02038f6:	0b440513          	addi	a0,s0,180
ffffffffc02038fa:	3be040ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc02038fe:	0e042623          	sw	zero,236(s0)
ffffffffc0203902:	0e043c23          	sd	zero,248(s0)
ffffffffc0203906:	10043023          	sd	zero,256(s0)
ffffffffc020390a:	0e043823          	sd	zero,240(s0)
ffffffffc020390e:	60a2                	ld	ra,8(sp)
ffffffffc0203910:	8522                	mv	a0,s0
ffffffffc0203912:	6402                	ld	s0,0(sp)
ffffffffc0203914:	0141                	addi	sp,sp,16
ffffffffc0203916:	8082                	ret

ffffffffc0203918 <forkret>:
ffffffffc0203918:	00016797          	auipc	a5,0x16
ffffffffc020391c:	be87b783          	ld	a5,-1048(a5) # ffffffffc0219500 <current>
ffffffffc0203920:	73c8                	ld	a0,160(a5)
ffffffffc0203922:	c08fd06f          	j	ffffffffc0200d2a <forkrets>

ffffffffc0203926 <setup_pgdir.isra.0>:
ffffffffc0203926:	1101                	addi	sp,sp,-32
ffffffffc0203928:	e426                	sd	s1,8(sp)
ffffffffc020392a:	84aa                	mv	s1,a0
ffffffffc020392c:	4505                	li	a0,1
ffffffffc020392e:	ec06                	sd	ra,24(sp)
ffffffffc0203930:	e822                	sd	s0,16(sp)
ffffffffc0203932:	c18fd0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0203936:	c939                	beqz	a0,ffffffffc020398c <setup_pgdir.isra.0+0x66>
ffffffffc0203938:	00016697          	auipc	a3,0x16
ffffffffc020393c:	c186b683          	ld	a3,-1000(a3) # ffffffffc0219550 <pages>
ffffffffc0203940:	40d506b3          	sub	a3,a0,a3
ffffffffc0203944:	8699                	srai	a3,a3,0x6
ffffffffc0203946:	00007417          	auipc	s0,0x7
ffffffffc020394a:	fb243403          	ld	s0,-78(s0) # ffffffffc020a8f8 <nbase>
ffffffffc020394e:	96a2                	add	a3,a3,s0
ffffffffc0203950:	00c69793          	slli	a5,a3,0xc
ffffffffc0203954:	83b1                	srli	a5,a5,0xc
ffffffffc0203956:	00016717          	auipc	a4,0x16
ffffffffc020395a:	b8273703          	ld	a4,-1150(a4) # ffffffffc02194d8 <npage>
ffffffffc020395e:	06b2                	slli	a3,a3,0xc
ffffffffc0203960:	02e7f863          	bgeu	a5,a4,ffffffffc0203990 <setup_pgdir.isra.0+0x6a>
ffffffffc0203964:	00016417          	auipc	s0,0x16
ffffffffc0203968:	bdc43403          	ld	s0,-1060(s0) # ffffffffc0219540 <va_pa_offset>
ffffffffc020396c:	9436                	add	s0,s0,a3
ffffffffc020396e:	6605                	lui	a2,0x1
ffffffffc0203970:	00016597          	auipc	a1,0x16
ffffffffc0203974:	b605b583          	ld	a1,-1184(a1) # ffffffffc02194d0 <boot_pgdir>
ffffffffc0203978:	8522                	mv	a0,s0
ffffffffc020397a:	350040ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc020397e:	4501                	li	a0,0
ffffffffc0203980:	e080                	sd	s0,0(s1)
ffffffffc0203982:	60e2                	ld	ra,24(sp)
ffffffffc0203984:	6442                	ld	s0,16(sp)
ffffffffc0203986:	64a2                	ld	s1,8(sp)
ffffffffc0203988:	6105                	addi	sp,sp,32
ffffffffc020398a:	8082                	ret
ffffffffc020398c:	5571                	li	a0,-4
ffffffffc020398e:	bfd5                	j	ffffffffc0203982 <setup_pgdir.isra.0+0x5c>
ffffffffc0203990:	00005617          	auipc	a2,0x5
ffffffffc0203994:	1b860613          	addi	a2,a2,440 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0203998:	06900593          	li	a1,105
ffffffffc020399c:	00005517          	auipc	a0,0x5
ffffffffc02039a0:	10c50513          	addi	a0,a0,268 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02039a4:	865fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc02039a8 <set_proc_name>:
ffffffffc02039a8:	1101                	addi	sp,sp,-32
ffffffffc02039aa:	e822                	sd	s0,16(sp)
ffffffffc02039ac:	0b450413          	addi	s0,a0,180
ffffffffc02039b0:	e426                	sd	s1,8(sp)
ffffffffc02039b2:	4641                	li	a2,16
ffffffffc02039b4:	84ae                	mv	s1,a1
ffffffffc02039b6:	8522                	mv	a0,s0
ffffffffc02039b8:	4581                	li	a1,0
ffffffffc02039ba:	ec06                	sd	ra,24(sp)
ffffffffc02039bc:	2fc040ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc02039c0:	8522                	mv	a0,s0
ffffffffc02039c2:	6442                	ld	s0,16(sp)
ffffffffc02039c4:	60e2                	ld	ra,24(sp)
ffffffffc02039c6:	85a6                	mv	a1,s1
ffffffffc02039c8:	64a2                	ld	s1,8(sp)
ffffffffc02039ca:	463d                	li	a2,15
ffffffffc02039cc:	6105                	addi	sp,sp,32
ffffffffc02039ce:	2fc0406f          	j	ffffffffc0207cca <memcpy>

ffffffffc02039d2 <proc_run>:
ffffffffc02039d2:	7179                	addi	sp,sp,-48
ffffffffc02039d4:	ec4a                	sd	s2,24(sp)
ffffffffc02039d6:	00016917          	auipc	s2,0x16
ffffffffc02039da:	b2a90913          	addi	s2,s2,-1238 # ffffffffc0219500 <current>
ffffffffc02039de:	f026                	sd	s1,32(sp)
ffffffffc02039e0:	00093483          	ld	s1,0(s2)
ffffffffc02039e4:	f406                	sd	ra,40(sp)
ffffffffc02039e6:	e84e                	sd	s3,16(sp)
ffffffffc02039e8:	02a48863          	beq	s1,a0,ffffffffc0203a18 <proc_run+0x46>
ffffffffc02039ec:	100027f3          	csrr	a5,sstatus
ffffffffc02039f0:	8b89                	andi	a5,a5,2
ffffffffc02039f2:	4981                	li	s3,0
ffffffffc02039f4:	ef9d                	bnez	a5,ffffffffc0203a32 <proc_run+0x60>
ffffffffc02039f6:	755c                	ld	a5,168(a0)
ffffffffc02039f8:	577d                	li	a4,-1
ffffffffc02039fa:	177e                	slli	a4,a4,0x3f
ffffffffc02039fc:	83b1                	srli	a5,a5,0xc
ffffffffc02039fe:	00a93023          	sd	a0,0(s2)
ffffffffc0203a02:	8fd9                	or	a5,a5,a4
ffffffffc0203a04:	18079073          	csrw	satp,a5
ffffffffc0203a08:	03050593          	addi	a1,a0,48
ffffffffc0203a0c:	03048513          	addi	a0,s1,48
ffffffffc0203a10:	e2dff0ef          	jal	ra,ffffffffc020383c <switch_to>
ffffffffc0203a14:	00099863          	bnez	s3,ffffffffc0203a24 <proc_run+0x52>
ffffffffc0203a18:	70a2                	ld	ra,40(sp)
ffffffffc0203a1a:	7482                	ld	s1,32(sp)
ffffffffc0203a1c:	6962                	ld	s2,24(sp)
ffffffffc0203a1e:	69c2                	ld	s3,16(sp)
ffffffffc0203a20:	6145                	addi	sp,sp,48
ffffffffc0203a22:	8082                	ret
ffffffffc0203a24:	70a2                	ld	ra,40(sp)
ffffffffc0203a26:	7482                	ld	s1,32(sp)
ffffffffc0203a28:	6962                	ld	s2,24(sp)
ffffffffc0203a2a:	69c2                	ld	s3,16(sp)
ffffffffc0203a2c:	6145                	addi	sp,sp,48
ffffffffc0203a2e:	c05fc06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0203a32:	e42a                	sd	a0,8(sp)
ffffffffc0203a34:	c05fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203a38:	6522                	ld	a0,8(sp)
ffffffffc0203a3a:	4985                	li	s3,1
ffffffffc0203a3c:	bf6d                	j	ffffffffc02039f6 <proc_run+0x24>

ffffffffc0203a3e <find_proc>:
ffffffffc0203a3e:	6789                	lui	a5,0x2
ffffffffc0203a40:	fff5071b          	addiw	a4,a0,-1
ffffffffc0203a44:	17f9                	addi	a5,a5,-2
ffffffffc0203a46:	04e7e063          	bltu	a5,a4,ffffffffc0203a86 <find_proc+0x48>
ffffffffc0203a4a:	1141                	addi	sp,sp,-16
ffffffffc0203a4c:	e022                	sd	s0,0(sp)
ffffffffc0203a4e:	45a9                	li	a1,10
ffffffffc0203a50:	842a                	mv	s0,a0
ffffffffc0203a52:	2501                	sext.w	a0,a0
ffffffffc0203a54:	e406                	sd	ra,8(sp)
ffffffffc0203a56:	67a040ef          	jal	ra,ffffffffc02080d0 <hash32>
ffffffffc0203a5a:	02051693          	slli	a3,a0,0x20
ffffffffc0203a5e:	00012797          	auipc	a5,0x12
ffffffffc0203a62:	a3a78793          	addi	a5,a5,-1478 # ffffffffc0215498 <hash_list>
ffffffffc0203a66:	82f1                	srli	a3,a3,0x1c
ffffffffc0203a68:	96be                	add	a3,a3,a5
ffffffffc0203a6a:	87b6                	mv	a5,a3
ffffffffc0203a6c:	a029                	j	ffffffffc0203a76 <find_proc+0x38>
ffffffffc0203a6e:	f2c7a703          	lw	a4,-212(a5)
ffffffffc0203a72:	00870c63          	beq	a4,s0,ffffffffc0203a8a <find_proc+0x4c>
ffffffffc0203a76:	679c                	ld	a5,8(a5)
ffffffffc0203a78:	fef69be3          	bne	a3,a5,ffffffffc0203a6e <find_proc+0x30>
ffffffffc0203a7c:	60a2                	ld	ra,8(sp)
ffffffffc0203a7e:	6402                	ld	s0,0(sp)
ffffffffc0203a80:	4501                	li	a0,0
ffffffffc0203a82:	0141                	addi	sp,sp,16
ffffffffc0203a84:	8082                	ret
ffffffffc0203a86:	4501                	li	a0,0
ffffffffc0203a88:	8082                	ret
ffffffffc0203a8a:	60a2                	ld	ra,8(sp)
ffffffffc0203a8c:	6402                	ld	s0,0(sp)
ffffffffc0203a8e:	f2878513          	addi	a0,a5,-216
ffffffffc0203a92:	0141                	addi	sp,sp,16
ffffffffc0203a94:	8082                	ret

ffffffffc0203a96 <do_fork>:
ffffffffc0203a96:	7159                	addi	sp,sp,-112
ffffffffc0203a98:	e4ce                	sd	s3,72(sp)
ffffffffc0203a9a:	00016997          	auipc	s3,0x16
ffffffffc0203a9e:	a7e98993          	addi	s3,s3,-1410 # ffffffffc0219518 <nr_process>
ffffffffc0203aa2:	0009a703          	lw	a4,0(s3)
ffffffffc0203aa6:	f486                	sd	ra,104(sp)
ffffffffc0203aa8:	f0a2                	sd	s0,96(sp)
ffffffffc0203aaa:	eca6                	sd	s1,88(sp)
ffffffffc0203aac:	e8ca                	sd	s2,80(sp)
ffffffffc0203aae:	e0d2                	sd	s4,64(sp)
ffffffffc0203ab0:	fc56                	sd	s5,56(sp)
ffffffffc0203ab2:	f85a                	sd	s6,48(sp)
ffffffffc0203ab4:	f45e                	sd	s7,40(sp)
ffffffffc0203ab6:	f062                	sd	s8,32(sp)
ffffffffc0203ab8:	ec66                	sd	s9,24(sp)
ffffffffc0203aba:	e86a                	sd	s10,16(sp)
ffffffffc0203abc:	e46e                	sd	s11,8(sp)
ffffffffc0203abe:	6785                	lui	a5,0x1
ffffffffc0203ac0:	30f75f63          	bge	a4,a5,ffffffffc0203dde <do_fork+0x348>
ffffffffc0203ac4:	8a2a                	mv	s4,a0
ffffffffc0203ac6:	892e                	mv	s2,a1
ffffffffc0203ac8:	84b2                	mv	s1,a2
ffffffffc0203aca:	dddff0ef          	jal	ra,ffffffffc02038a6 <alloc_proc>
ffffffffc0203ace:	842a                	mv	s0,a0
ffffffffc0203ad0:	28050263          	beqz	a0,ffffffffc0203d54 <do_fork+0x2be>
ffffffffc0203ad4:	00016b97          	auipc	s7,0x16
ffffffffc0203ad8:	a2cb8b93          	addi	s7,s7,-1492 # ffffffffc0219500 <current>
ffffffffc0203adc:	000bb783          	ld	a5,0(s7)
ffffffffc0203ae0:	0ec7a703          	lw	a4,236(a5) # 10ec <kern_entry-0xffffffffc01fef14>
ffffffffc0203ae4:	f11c                	sd	a5,32(a0)
ffffffffc0203ae6:	30071c63          	bnez	a4,ffffffffc0203dfe <do_fork+0x368>
ffffffffc0203aea:	4509                	li	a0,2
ffffffffc0203aec:	a5efd0ef          	jal	ra,ffffffffc0200d4a <alloc_pages>
ffffffffc0203af0:	24050f63          	beqz	a0,ffffffffc0203d4e <do_fork+0x2b8>
ffffffffc0203af4:	00016c17          	auipc	s8,0x16
ffffffffc0203af8:	a5cc0c13          	addi	s8,s8,-1444 # ffffffffc0219550 <pages>
ffffffffc0203afc:	000c3683          	ld	a3,0(s8)
ffffffffc0203b00:	00007a97          	auipc	s5,0x7
ffffffffc0203b04:	df8aba83          	ld	s5,-520(s5) # ffffffffc020a8f8 <nbase>
ffffffffc0203b08:	00016c97          	auipc	s9,0x16
ffffffffc0203b0c:	9d0c8c93          	addi	s9,s9,-1584 # ffffffffc02194d8 <npage>
ffffffffc0203b10:	40d506b3          	sub	a3,a0,a3
ffffffffc0203b14:	8699                	srai	a3,a3,0x6
ffffffffc0203b16:	96d6                	add	a3,a3,s5
ffffffffc0203b18:	000cb703          	ld	a4,0(s9)
ffffffffc0203b1c:	00c69793          	slli	a5,a3,0xc
ffffffffc0203b20:	83b1                	srli	a5,a5,0xc
ffffffffc0203b22:	06b2                	slli	a3,a3,0xc
ffffffffc0203b24:	2ce7f163          	bgeu	a5,a4,ffffffffc0203de6 <do_fork+0x350>
ffffffffc0203b28:	000bb703          	ld	a4,0(s7)
ffffffffc0203b2c:	00016d17          	auipc	s10,0x16
ffffffffc0203b30:	a14d0d13          	addi	s10,s10,-1516 # ffffffffc0219540 <va_pa_offset>
ffffffffc0203b34:	000d3783          	ld	a5,0(s10)
ffffffffc0203b38:	02873b03          	ld	s6,40(a4)
ffffffffc0203b3c:	96be                	add	a3,a3,a5
ffffffffc0203b3e:	e814                	sd	a3,16(s0)
ffffffffc0203b40:	020b0863          	beqz	s6,ffffffffc0203b70 <do_fork+0xda>
ffffffffc0203b44:	100a7a13          	andi	s4,s4,256
ffffffffc0203b48:	1c0a0163          	beqz	s4,ffffffffc0203d0a <do_fork+0x274>
ffffffffc0203b4c:	030b2703          	lw	a4,48(s6)
ffffffffc0203b50:	018b3783          	ld	a5,24(s6)
ffffffffc0203b54:	c02006b7          	lui	a3,0xc0200
ffffffffc0203b58:	2705                	addiw	a4,a4,1
ffffffffc0203b5a:	02eb2823          	sw	a4,48(s6)
ffffffffc0203b5e:	03643423          	sd	s6,40(s0)
ffffffffc0203b62:	2ad7ee63          	bltu	a5,a3,ffffffffc0203e1e <do_fork+0x388>
ffffffffc0203b66:	000d3703          	ld	a4,0(s10)
ffffffffc0203b6a:	6814                	ld	a3,16(s0)
ffffffffc0203b6c:	8f99                	sub	a5,a5,a4
ffffffffc0203b6e:	f45c                	sd	a5,168(s0)
ffffffffc0203b70:	6789                	lui	a5,0x2
ffffffffc0203b72:	ee078793          	addi	a5,a5,-288 # 1ee0 <kern_entry-0xffffffffc01fe120>
ffffffffc0203b76:	97b6                	add	a5,a5,a3
ffffffffc0203b78:	8626                	mv	a2,s1
ffffffffc0203b7a:	f05c                	sd	a5,160(s0)
ffffffffc0203b7c:	873e                	mv	a4,a5
ffffffffc0203b7e:	12048313          	addi	t1,s1,288
ffffffffc0203b82:	00063883          	ld	a7,0(a2)
ffffffffc0203b86:	00863803          	ld	a6,8(a2)
ffffffffc0203b8a:	6a08                	ld	a0,16(a2)
ffffffffc0203b8c:	6e0c                	ld	a1,24(a2)
ffffffffc0203b8e:	01173023          	sd	a7,0(a4)
ffffffffc0203b92:	01073423          	sd	a6,8(a4)
ffffffffc0203b96:	eb08                	sd	a0,16(a4)
ffffffffc0203b98:	ef0c                	sd	a1,24(a4)
ffffffffc0203b9a:	02060613          	addi	a2,a2,32
ffffffffc0203b9e:	02070713          	addi	a4,a4,32
ffffffffc0203ba2:	fe6610e3          	bne	a2,t1,ffffffffc0203b82 <do_fork+0xec>
ffffffffc0203ba6:	0407b823          	sd	zero,80(a5)
ffffffffc0203baa:	12090a63          	beqz	s2,ffffffffc0203cde <do_fork+0x248>
ffffffffc0203bae:	0127b823          	sd	s2,16(a5)
ffffffffc0203bb2:	00000717          	auipc	a4,0x0
ffffffffc0203bb6:	d6670713          	addi	a4,a4,-666 # ffffffffc0203918 <forkret>
ffffffffc0203bba:	f818                	sd	a4,48(s0)
ffffffffc0203bbc:	fc1c                	sd	a5,56(s0)
ffffffffc0203bbe:	100027f3          	csrr	a5,sstatus
ffffffffc0203bc2:	8b89                	andi	a5,a5,2
ffffffffc0203bc4:	4901                	li	s2,0
ffffffffc0203bc6:	12079e63          	bnez	a5,ffffffffc0203d02 <do_fork+0x26c>
ffffffffc0203bca:	0000a597          	auipc	a1,0xa
ffffffffc0203bce:	4c258593          	addi	a1,a1,1218 # ffffffffc020e08c <last_pid.1812>
ffffffffc0203bd2:	419c                	lw	a5,0(a1)
ffffffffc0203bd4:	6709                	lui	a4,0x2
ffffffffc0203bd6:	0017851b          	addiw	a0,a5,1
ffffffffc0203bda:	c188                	sw	a0,0(a1)
ffffffffc0203bdc:	08e55b63          	bge	a0,a4,ffffffffc0203c72 <do_fork+0x1dc>
ffffffffc0203be0:	0000a897          	auipc	a7,0xa
ffffffffc0203be4:	4b088893          	addi	a7,a7,1200 # ffffffffc020e090 <next_safe.1811>
ffffffffc0203be8:	0008a783          	lw	a5,0(a7)
ffffffffc0203bec:	00016497          	auipc	s1,0x16
ffffffffc0203bf0:	ad448493          	addi	s1,s1,-1324 # ffffffffc02196c0 <proc_list>
ffffffffc0203bf4:	08f55663          	bge	a0,a5,ffffffffc0203c80 <do_fork+0x1ea>
ffffffffc0203bf8:	c048                	sw	a0,4(s0)
ffffffffc0203bfa:	45a9                	li	a1,10
ffffffffc0203bfc:	2501                	sext.w	a0,a0
ffffffffc0203bfe:	4d2040ef          	jal	ra,ffffffffc02080d0 <hash32>
ffffffffc0203c02:	1502                	slli	a0,a0,0x20
ffffffffc0203c04:	00012797          	auipc	a5,0x12
ffffffffc0203c08:	89478793          	addi	a5,a5,-1900 # ffffffffc0215498 <hash_list>
ffffffffc0203c0c:	8171                	srli	a0,a0,0x1c
ffffffffc0203c0e:	953e                	add	a0,a0,a5
ffffffffc0203c10:	650c                	ld	a1,8(a0)
ffffffffc0203c12:	7014                	ld	a3,32(s0)
ffffffffc0203c14:	0d840793          	addi	a5,s0,216
ffffffffc0203c18:	e19c                	sd	a5,0(a1)
ffffffffc0203c1a:	6490                	ld	a2,8(s1)
ffffffffc0203c1c:	e51c                	sd	a5,8(a0)
ffffffffc0203c1e:	7af8                	ld	a4,240(a3)
ffffffffc0203c20:	0c840793          	addi	a5,s0,200
ffffffffc0203c24:	f06c                	sd	a1,224(s0)
ffffffffc0203c26:	ec68                	sd	a0,216(s0)
ffffffffc0203c28:	e21c                	sd	a5,0(a2)
ffffffffc0203c2a:	e49c                	sd	a5,8(s1)
ffffffffc0203c2c:	e870                	sd	a2,208(s0)
ffffffffc0203c2e:	e464                	sd	s1,200(s0)
ffffffffc0203c30:	0e043c23          	sd	zero,248(s0)
ffffffffc0203c34:	10e43023          	sd	a4,256(s0)
ffffffffc0203c38:	c311                	beqz	a4,ffffffffc0203c3c <do_fork+0x1a6>
ffffffffc0203c3a:	ff60                	sd	s0,248(a4)
ffffffffc0203c3c:	0009a783          	lw	a5,0(s3)
ffffffffc0203c40:	fae0                	sd	s0,240(a3)
ffffffffc0203c42:	2785                	addiw	a5,a5,1
ffffffffc0203c44:	00f9a023          	sw	a5,0(s3)
ffffffffc0203c48:	10091863          	bnez	s2,ffffffffc0203d58 <do_fork+0x2c2>
ffffffffc0203c4c:	8522                	mv	a0,s0
ffffffffc0203c4e:	733000ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc0203c52:	4048                	lw	a0,4(s0)
ffffffffc0203c54:	70a6                	ld	ra,104(sp)
ffffffffc0203c56:	7406                	ld	s0,96(sp)
ffffffffc0203c58:	64e6                	ld	s1,88(sp)
ffffffffc0203c5a:	6946                	ld	s2,80(sp)
ffffffffc0203c5c:	69a6                	ld	s3,72(sp)
ffffffffc0203c5e:	6a06                	ld	s4,64(sp)
ffffffffc0203c60:	7ae2                	ld	s5,56(sp)
ffffffffc0203c62:	7b42                	ld	s6,48(sp)
ffffffffc0203c64:	7ba2                	ld	s7,40(sp)
ffffffffc0203c66:	7c02                	ld	s8,32(sp)
ffffffffc0203c68:	6ce2                	ld	s9,24(sp)
ffffffffc0203c6a:	6d42                	ld	s10,16(sp)
ffffffffc0203c6c:	6da2                	ld	s11,8(sp)
ffffffffc0203c6e:	6165                	addi	sp,sp,112
ffffffffc0203c70:	8082                	ret
ffffffffc0203c72:	4785                	li	a5,1
ffffffffc0203c74:	c19c                	sw	a5,0(a1)
ffffffffc0203c76:	4505                	li	a0,1
ffffffffc0203c78:	0000a897          	auipc	a7,0xa
ffffffffc0203c7c:	41888893          	addi	a7,a7,1048 # ffffffffc020e090 <next_safe.1811>
ffffffffc0203c80:	00016497          	auipc	s1,0x16
ffffffffc0203c84:	a4048493          	addi	s1,s1,-1472 # ffffffffc02196c0 <proc_list>
ffffffffc0203c88:	0084b303          	ld	t1,8(s1)
ffffffffc0203c8c:	6789                	lui	a5,0x2
ffffffffc0203c8e:	00f8a023          	sw	a5,0(a7)
ffffffffc0203c92:	4801                	li	a6,0
ffffffffc0203c94:	87aa                	mv	a5,a0
ffffffffc0203c96:	6e89                	lui	t4,0x2
ffffffffc0203c98:	12930e63          	beq	t1,s1,ffffffffc0203dd4 <do_fork+0x33e>
ffffffffc0203c9c:	8e42                	mv	t3,a6
ffffffffc0203c9e:	869a                	mv	a3,t1
ffffffffc0203ca0:	6609                	lui	a2,0x2
ffffffffc0203ca2:	a811                	j	ffffffffc0203cb6 <do_fork+0x220>
ffffffffc0203ca4:	00e7d663          	bge	a5,a4,ffffffffc0203cb0 <do_fork+0x21a>
ffffffffc0203ca8:	00c75463          	bge	a4,a2,ffffffffc0203cb0 <do_fork+0x21a>
ffffffffc0203cac:	863a                	mv	a2,a4
ffffffffc0203cae:	4e05                	li	t3,1
ffffffffc0203cb0:	6694                	ld	a3,8(a3)
ffffffffc0203cb2:	00968d63          	beq	a3,s1,ffffffffc0203ccc <do_fork+0x236>
ffffffffc0203cb6:	f3c6a703          	lw	a4,-196(a3) # ffffffffc01fff3c <kern_entry-0xc4>
ffffffffc0203cba:	fef715e3          	bne	a4,a5,ffffffffc0203ca4 <do_fork+0x20e>
ffffffffc0203cbe:	2785                	addiw	a5,a5,1
ffffffffc0203cc0:	08c7df63          	bge	a5,a2,ffffffffc0203d5e <do_fork+0x2c8>
ffffffffc0203cc4:	6694                	ld	a3,8(a3)
ffffffffc0203cc6:	4805                	li	a6,1
ffffffffc0203cc8:	fe9697e3          	bne	a3,s1,ffffffffc0203cb6 <do_fork+0x220>
ffffffffc0203ccc:	00080463          	beqz	a6,ffffffffc0203cd4 <do_fork+0x23e>
ffffffffc0203cd0:	c19c                	sw	a5,0(a1)
ffffffffc0203cd2:	853e                	mv	a0,a5
ffffffffc0203cd4:	f20e02e3          	beqz	t3,ffffffffc0203bf8 <do_fork+0x162>
ffffffffc0203cd8:	00c8a023          	sw	a2,0(a7)
ffffffffc0203cdc:	bf31                	j	ffffffffc0203bf8 <do_fork+0x162>
ffffffffc0203cde:	6909                	lui	s2,0x2
ffffffffc0203ce0:	edc90913          	addi	s2,s2,-292 # 1edc <kern_entry-0xffffffffc01fe124>
ffffffffc0203ce4:	9936                	add	s2,s2,a3
ffffffffc0203ce6:	0127b823          	sd	s2,16(a5) # 2010 <kern_entry-0xffffffffc01fdff0>
ffffffffc0203cea:	00000717          	auipc	a4,0x0
ffffffffc0203cee:	c2e70713          	addi	a4,a4,-978 # ffffffffc0203918 <forkret>
ffffffffc0203cf2:	f818                	sd	a4,48(s0)
ffffffffc0203cf4:	fc1c                	sd	a5,56(s0)
ffffffffc0203cf6:	100027f3          	csrr	a5,sstatus
ffffffffc0203cfa:	8b89                	andi	a5,a5,2
ffffffffc0203cfc:	4901                	li	s2,0
ffffffffc0203cfe:	ec0786e3          	beqz	a5,ffffffffc0203bca <do_fork+0x134>
ffffffffc0203d02:	937fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0203d06:	4905                	li	s2,1
ffffffffc0203d08:	b5c9                	j	ffffffffc0203bca <do_fork+0x134>
ffffffffc0203d0a:	a2ffd0ef          	jal	ra,ffffffffc0201738 <mm_create>
ffffffffc0203d0e:	8a2a                	mv	s4,a0
ffffffffc0203d10:	c901                	beqz	a0,ffffffffc0203d20 <do_fork+0x28a>
ffffffffc0203d12:	0561                	addi	a0,a0,24
ffffffffc0203d14:	c13ff0ef          	jal	ra,ffffffffc0203926 <setup_pgdir.isra.0>
ffffffffc0203d18:	c921                	beqz	a0,ffffffffc0203d68 <do_fork+0x2d2>
ffffffffc0203d1a:	8552                	mv	a0,s4
ffffffffc0203d1c:	b7bfd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0203d20:	6814                	ld	a3,16(s0)
ffffffffc0203d22:	c02007b7          	lui	a5,0xc0200
ffffffffc0203d26:	12f6e563          	bltu	a3,a5,ffffffffc0203e50 <do_fork+0x3ba>
ffffffffc0203d2a:	000d3783          	ld	a5,0(s10)
ffffffffc0203d2e:	000cb703          	ld	a4,0(s9)
ffffffffc0203d32:	40f687b3          	sub	a5,a3,a5
ffffffffc0203d36:	83b1                	srli	a5,a5,0xc
ffffffffc0203d38:	10e7f063          	bgeu	a5,a4,ffffffffc0203e38 <do_fork+0x3a2>
ffffffffc0203d3c:	000c3503          	ld	a0,0(s8)
ffffffffc0203d40:	415787b3          	sub	a5,a5,s5
ffffffffc0203d44:	079a                	slli	a5,a5,0x6
ffffffffc0203d46:	4589                	li	a1,2
ffffffffc0203d48:	953e                	add	a0,a0,a5
ffffffffc0203d4a:	892fd0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0203d4e:	8522                	mv	a0,s0
ffffffffc0203d50:	bd0fe0ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc0203d54:	5571                	li	a0,-4
ffffffffc0203d56:	bdfd                	j	ffffffffc0203c54 <do_fork+0x1be>
ffffffffc0203d58:	8dbfc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203d5c:	bdc5                	j	ffffffffc0203c4c <do_fork+0x1b6>
ffffffffc0203d5e:	01d7c363          	blt	a5,t4,ffffffffc0203d64 <do_fork+0x2ce>
ffffffffc0203d62:	4785                	li	a5,1
ffffffffc0203d64:	4805                	li	a6,1
ffffffffc0203d66:	bf0d                	j	ffffffffc0203c98 <do_fork+0x202>
ffffffffc0203d68:	038b0d93          	addi	s11,s6,56
ffffffffc0203d6c:	856e                	mv	a0,s11
ffffffffc0203d6e:	8b9ff0ef          	jal	ra,ffffffffc0203626 <down>
ffffffffc0203d72:	000bb783          	ld	a5,0(s7)
ffffffffc0203d76:	c781                	beqz	a5,ffffffffc0203d7e <do_fork+0x2e8>
ffffffffc0203d78:	43dc                	lw	a5,4(a5)
ffffffffc0203d7a:	04fb2823          	sw	a5,80(s6)
ffffffffc0203d7e:	85da                	mv	a1,s6
ffffffffc0203d80:	8552                	mv	a0,s4
ffffffffc0203d82:	c17fd0ef          	jal	ra,ffffffffc0201998 <dup_mmap>
ffffffffc0203d86:	8baa                	mv	s7,a0
ffffffffc0203d88:	856e                	mv	a0,s11
ffffffffc0203d8a:	89bff0ef          	jal	ra,ffffffffc0203624 <up>
ffffffffc0203d8e:	040b2823          	sw	zero,80(s6)
ffffffffc0203d92:	8b52                	mv	s6,s4
ffffffffc0203d94:	da0b8ce3          	beqz	s7,ffffffffc0203b4c <do_fork+0xb6>
ffffffffc0203d98:	8552                	mv	a0,s4
ffffffffc0203d9a:	c99fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0203d9e:	018a3683          	ld	a3,24(s4)
ffffffffc0203da2:	c02007b7          	lui	a5,0xc0200
ffffffffc0203da6:	0af6e563          	bltu	a3,a5,ffffffffc0203e50 <do_fork+0x3ba>
ffffffffc0203daa:	000d3703          	ld	a4,0(s10)
ffffffffc0203dae:	000cb783          	ld	a5,0(s9)
ffffffffc0203db2:	8e99                	sub	a3,a3,a4
ffffffffc0203db4:	82b1                	srli	a3,a3,0xc
ffffffffc0203db6:	08f6f163          	bgeu	a3,a5,ffffffffc0203e38 <do_fork+0x3a2>
ffffffffc0203dba:	000c3503          	ld	a0,0(s8)
ffffffffc0203dbe:	415686b3          	sub	a3,a3,s5
ffffffffc0203dc2:	069a                	slli	a3,a3,0x6
ffffffffc0203dc4:	9536                	add	a0,a0,a3
ffffffffc0203dc6:	4585                	li	a1,1
ffffffffc0203dc8:	814fd0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0203dcc:	8552                	mv	a0,s4
ffffffffc0203dce:	ac9fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0203dd2:	b7b9                	j	ffffffffc0203d20 <do_fork+0x28a>
ffffffffc0203dd4:	00080763          	beqz	a6,ffffffffc0203de2 <do_fork+0x34c>
ffffffffc0203dd8:	c19c                	sw	a5,0(a1)
ffffffffc0203dda:	853e                	mv	a0,a5
ffffffffc0203ddc:	bd31                	j	ffffffffc0203bf8 <do_fork+0x162>
ffffffffc0203dde:	556d                	li	a0,-5
ffffffffc0203de0:	bd95                	j	ffffffffc0203c54 <do_fork+0x1be>
ffffffffc0203de2:	4188                	lw	a0,0(a1)
ffffffffc0203de4:	bd11                	j	ffffffffc0203bf8 <do_fork+0x162>
ffffffffc0203de6:	00005617          	auipc	a2,0x5
ffffffffc0203dea:	d6260613          	addi	a2,a2,-670 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc0203dee:	06900593          	li	a1,105
ffffffffc0203df2:	00005517          	auipc	a0,0x5
ffffffffc0203df6:	cb650513          	addi	a0,a0,-842 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0203dfa:	c0efc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203dfe:	00006697          	auipc	a3,0x6
ffffffffc0203e02:	a3a68693          	addi	a3,a3,-1478 # ffffffffc0209838 <default_pmm_manager+0x360>
ffffffffc0203e06:	00005617          	auipc	a2,0x5
ffffffffc0203e0a:	99260613          	addi	a2,a2,-1646 # ffffffffc0208798 <commands+0x410>
ffffffffc0203e0e:	1a600593          	li	a1,422
ffffffffc0203e12:	00006517          	auipc	a0,0x6
ffffffffc0203e16:	a4650513          	addi	a0,a0,-1466 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0203e1a:	beefc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e1e:	86be                	mv	a3,a5
ffffffffc0203e20:	00005617          	auipc	a2,0x5
ffffffffc0203e24:	cf060613          	addi	a2,a2,-784 # ffffffffc0208b10 <commands+0x788>
ffffffffc0203e28:	15900593          	li	a1,345
ffffffffc0203e2c:	00006517          	auipc	a0,0x6
ffffffffc0203e30:	a2c50513          	addi	a0,a0,-1492 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0203e34:	bd4fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e38:	00005617          	auipc	a2,0x5
ffffffffc0203e3c:	c5060613          	addi	a2,a2,-944 # ffffffffc0208a88 <commands+0x700>
ffffffffc0203e40:	06200593          	li	a1,98
ffffffffc0203e44:	00005517          	auipc	a0,0x5
ffffffffc0203e48:	c6450513          	addi	a0,a0,-924 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0203e4c:	bbcfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203e50:	00005617          	auipc	a2,0x5
ffffffffc0203e54:	cc060613          	addi	a2,a2,-832 # ffffffffc0208b10 <commands+0x788>
ffffffffc0203e58:	06e00593          	li	a1,110
ffffffffc0203e5c:	00005517          	auipc	a0,0x5
ffffffffc0203e60:	c4c50513          	addi	a0,a0,-948 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0203e64:	ba4fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0203e68 <kernel_thread>:
ffffffffc0203e68:	7129                	addi	sp,sp,-320
ffffffffc0203e6a:	fa22                	sd	s0,304(sp)
ffffffffc0203e6c:	f626                	sd	s1,296(sp)
ffffffffc0203e6e:	f24a                	sd	s2,288(sp)
ffffffffc0203e70:	84ae                	mv	s1,a1
ffffffffc0203e72:	892a                	mv	s2,a0
ffffffffc0203e74:	8432                	mv	s0,a2
ffffffffc0203e76:	4581                	li	a1,0
ffffffffc0203e78:	12000613          	li	a2,288
ffffffffc0203e7c:	850a                	mv	a0,sp
ffffffffc0203e7e:	fe06                	sd	ra,312(sp)
ffffffffc0203e80:	639030ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc0203e84:	e0ca                	sd	s2,64(sp)
ffffffffc0203e86:	e4a6                	sd	s1,72(sp)
ffffffffc0203e88:	100027f3          	csrr	a5,sstatus
ffffffffc0203e8c:	edd7f793          	andi	a5,a5,-291
ffffffffc0203e90:	1207e793          	ori	a5,a5,288
ffffffffc0203e94:	e23e                	sd	a5,256(sp)
ffffffffc0203e96:	860a                	mv	a2,sp
ffffffffc0203e98:	10046513          	ori	a0,s0,256
ffffffffc0203e9c:	00000797          	auipc	a5,0x0
ffffffffc0203ea0:	99878793          	addi	a5,a5,-1640 # ffffffffc0203834 <kernel_thread_entry>
ffffffffc0203ea4:	4581                	li	a1,0
ffffffffc0203ea6:	e63e                	sd	a5,264(sp)
ffffffffc0203ea8:	befff0ef          	jal	ra,ffffffffc0203a96 <do_fork>
ffffffffc0203eac:	70f2                	ld	ra,312(sp)
ffffffffc0203eae:	7452                	ld	s0,304(sp)
ffffffffc0203eb0:	74b2                	ld	s1,296(sp)
ffffffffc0203eb2:	7912                	ld	s2,288(sp)
ffffffffc0203eb4:	6131                	addi	sp,sp,320
ffffffffc0203eb6:	8082                	ret

ffffffffc0203eb8 <do_exit>:
ffffffffc0203eb8:	7179                	addi	sp,sp,-48
ffffffffc0203eba:	f022                	sd	s0,32(sp)
ffffffffc0203ebc:	00015417          	auipc	s0,0x15
ffffffffc0203ec0:	64440413          	addi	s0,s0,1604 # ffffffffc0219500 <current>
ffffffffc0203ec4:	601c                	ld	a5,0(s0)
ffffffffc0203ec6:	f406                	sd	ra,40(sp)
ffffffffc0203ec8:	ec26                	sd	s1,24(sp)
ffffffffc0203eca:	e84a                	sd	s2,16(sp)
ffffffffc0203ecc:	e44e                	sd	s3,8(sp)
ffffffffc0203ece:	e052                	sd	s4,0(sp)
ffffffffc0203ed0:	00015717          	auipc	a4,0x15
ffffffffc0203ed4:	63873703          	ld	a4,1592(a4) # ffffffffc0219508 <idleproc>
ffffffffc0203ed8:	0ce78d63          	beq	a5,a4,ffffffffc0203fb2 <do_exit+0xfa>
ffffffffc0203edc:	00015497          	auipc	s1,0x15
ffffffffc0203ee0:	63448493          	addi	s1,s1,1588 # ffffffffc0219510 <initproc>
ffffffffc0203ee4:	6098                	ld	a4,0(s1)
ffffffffc0203ee6:	12e78963          	beq	a5,a4,ffffffffc0204018 <do_exit+0x160>
ffffffffc0203eea:	0287b903          	ld	s2,40(a5)
ffffffffc0203eee:	89aa                	mv	s3,a0
ffffffffc0203ef0:	02090663          	beqz	s2,ffffffffc0203f1c <do_exit+0x64>
ffffffffc0203ef4:	00015797          	auipc	a5,0x15
ffffffffc0203ef8:	6547b783          	ld	a5,1620(a5) # ffffffffc0219548 <boot_cr3>
ffffffffc0203efc:	577d                	li	a4,-1
ffffffffc0203efe:	177e                	slli	a4,a4,0x3f
ffffffffc0203f00:	83b1                	srli	a5,a5,0xc
ffffffffc0203f02:	8fd9                	or	a5,a5,a4
ffffffffc0203f04:	18079073          	csrw	satp,a5
ffffffffc0203f08:	03092783          	lw	a5,48(s2)
ffffffffc0203f0c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0203f10:	02e92823          	sw	a4,48(s2)
ffffffffc0203f14:	cb5d                	beqz	a4,ffffffffc0203fca <do_exit+0x112>
ffffffffc0203f16:	601c                	ld	a5,0(s0)
ffffffffc0203f18:	0207b423          	sd	zero,40(a5)
ffffffffc0203f1c:	601c                	ld	a5,0(s0)
ffffffffc0203f1e:	470d                	li	a4,3
ffffffffc0203f20:	c398                	sw	a4,0(a5)
ffffffffc0203f22:	0f37a423          	sw	s3,232(a5)
ffffffffc0203f26:	100027f3          	csrr	a5,sstatus
ffffffffc0203f2a:	8b89                	andi	a5,a5,2
ffffffffc0203f2c:	4a01                	li	s4,0
ffffffffc0203f2e:	10079163          	bnez	a5,ffffffffc0204030 <do_exit+0x178>
ffffffffc0203f32:	6018                	ld	a4,0(s0)
ffffffffc0203f34:	800007b7          	lui	a5,0x80000
ffffffffc0203f38:	0785                	addi	a5,a5,1
ffffffffc0203f3a:	7308                	ld	a0,32(a4)
ffffffffc0203f3c:	0ec52703          	lw	a4,236(a0)
ffffffffc0203f40:	0ef70c63          	beq	a4,a5,ffffffffc0204038 <do_exit+0x180>
ffffffffc0203f44:	6018                	ld	a4,0(s0)
ffffffffc0203f46:	7b7c                	ld	a5,240(a4)
ffffffffc0203f48:	c3a1                	beqz	a5,ffffffffc0203f88 <do_exit+0xd0>
ffffffffc0203f4a:	800009b7          	lui	s3,0x80000
ffffffffc0203f4e:	490d                	li	s2,3
ffffffffc0203f50:	0985                	addi	s3,s3,1
ffffffffc0203f52:	a021                	j	ffffffffc0203f5a <do_exit+0xa2>
ffffffffc0203f54:	6018                	ld	a4,0(s0)
ffffffffc0203f56:	7b7c                	ld	a5,240(a4)
ffffffffc0203f58:	cb85                	beqz	a5,ffffffffc0203f88 <do_exit+0xd0>
ffffffffc0203f5a:	1007b683          	ld	a3,256(a5) # ffffffff80000100 <kern_entry-0x401fff00>
ffffffffc0203f5e:	6088                	ld	a0,0(s1)
ffffffffc0203f60:	fb74                	sd	a3,240(a4)
ffffffffc0203f62:	7978                	ld	a4,240(a0)
ffffffffc0203f64:	0e07bc23          	sd	zero,248(a5)
ffffffffc0203f68:	10e7b023          	sd	a4,256(a5)
ffffffffc0203f6c:	c311                	beqz	a4,ffffffffc0203f70 <do_exit+0xb8>
ffffffffc0203f6e:	ff7c                	sd	a5,248(a4)
ffffffffc0203f70:	4398                	lw	a4,0(a5)
ffffffffc0203f72:	f388                	sd	a0,32(a5)
ffffffffc0203f74:	f97c                	sd	a5,240(a0)
ffffffffc0203f76:	fd271fe3          	bne	a4,s2,ffffffffc0203f54 <do_exit+0x9c>
ffffffffc0203f7a:	0ec52783          	lw	a5,236(a0)
ffffffffc0203f7e:	fd379be3          	bne	a5,s3,ffffffffc0203f54 <do_exit+0x9c>
ffffffffc0203f82:	3ff000ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc0203f86:	b7f9                	j	ffffffffc0203f54 <do_exit+0x9c>
ffffffffc0203f88:	020a1263          	bnez	s4,ffffffffc0203fac <do_exit+0xf4>
ffffffffc0203f8c:	4a7000ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc0203f90:	601c                	ld	a5,0(s0)
ffffffffc0203f92:	00006617          	auipc	a2,0x6
ffffffffc0203f96:	8fe60613          	addi	a2,a2,-1794 # ffffffffc0209890 <default_pmm_manager+0x3b8>
ffffffffc0203f9a:	1f900593          	li	a1,505
ffffffffc0203f9e:	43d4                	lw	a3,4(a5)
ffffffffc0203fa0:	00006517          	auipc	a0,0x6
ffffffffc0203fa4:	8b850513          	addi	a0,a0,-1864 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0203fa8:	a60fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203fac:	e86fc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0203fb0:	bff1                	j	ffffffffc0203f8c <do_exit+0xd4>
ffffffffc0203fb2:	00006617          	auipc	a2,0x6
ffffffffc0203fb6:	8be60613          	addi	a2,a2,-1858 # ffffffffc0209870 <default_pmm_manager+0x398>
ffffffffc0203fba:	1cd00593          	li	a1,461
ffffffffc0203fbe:	00006517          	auipc	a0,0x6
ffffffffc0203fc2:	89a50513          	addi	a0,a0,-1894 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0203fc6:	a42fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0203fca:	854a                	mv	a0,s2
ffffffffc0203fcc:	a67fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0203fd0:	01893683          	ld	a3,24(s2)
ffffffffc0203fd4:	c02007b7          	lui	a5,0xc0200
ffffffffc0203fd8:	06f6e363          	bltu	a3,a5,ffffffffc020403e <do_exit+0x186>
ffffffffc0203fdc:	00015797          	auipc	a5,0x15
ffffffffc0203fe0:	5647b783          	ld	a5,1380(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc0203fe4:	8e9d                	sub	a3,a3,a5
ffffffffc0203fe6:	82b1                	srli	a3,a3,0xc
ffffffffc0203fe8:	00015797          	auipc	a5,0x15
ffffffffc0203fec:	4f07b783          	ld	a5,1264(a5) # ffffffffc02194d8 <npage>
ffffffffc0203ff0:	06f6f363          	bgeu	a3,a5,ffffffffc0204056 <do_exit+0x19e>
ffffffffc0203ff4:	00007517          	auipc	a0,0x7
ffffffffc0203ff8:	90453503          	ld	a0,-1788(a0) # ffffffffc020a8f8 <nbase>
ffffffffc0203ffc:	8e89                	sub	a3,a3,a0
ffffffffc0203ffe:	069a                	slli	a3,a3,0x6
ffffffffc0204000:	00015517          	auipc	a0,0x15
ffffffffc0204004:	55053503          	ld	a0,1360(a0) # ffffffffc0219550 <pages>
ffffffffc0204008:	9536                	add	a0,a0,a3
ffffffffc020400a:	4585                	li	a1,1
ffffffffc020400c:	dd1fc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0204010:	854a                	mv	a0,s2
ffffffffc0204012:	885fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc0204016:	b701                	j	ffffffffc0203f16 <do_exit+0x5e>
ffffffffc0204018:	00006617          	auipc	a2,0x6
ffffffffc020401c:	86860613          	addi	a2,a2,-1944 # ffffffffc0209880 <default_pmm_manager+0x3a8>
ffffffffc0204020:	1d000593          	li	a1,464
ffffffffc0204024:	00006517          	auipc	a0,0x6
ffffffffc0204028:	83450513          	addi	a0,a0,-1996 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc020402c:	9dcfc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204030:	e08fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204034:	4a05                	li	s4,1
ffffffffc0204036:	bdf5                	j	ffffffffc0203f32 <do_exit+0x7a>
ffffffffc0204038:	349000ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc020403c:	b721                	j	ffffffffc0203f44 <do_exit+0x8c>
ffffffffc020403e:	00005617          	auipc	a2,0x5
ffffffffc0204042:	ad260613          	addi	a2,a2,-1326 # ffffffffc0208b10 <commands+0x788>
ffffffffc0204046:	06e00593          	li	a1,110
ffffffffc020404a:	00005517          	auipc	a0,0x5
ffffffffc020404e:	a5e50513          	addi	a0,a0,-1442 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0204052:	9b6fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204056:	00005617          	auipc	a2,0x5
ffffffffc020405a:	a3260613          	addi	a2,a2,-1486 # ffffffffc0208a88 <commands+0x700>
ffffffffc020405e:	06200593          	li	a1,98
ffffffffc0204062:	00005517          	auipc	a0,0x5
ffffffffc0204066:	a4650513          	addi	a0,a0,-1466 # ffffffffc0208aa8 <commands+0x720>
ffffffffc020406a:	99efc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020406e <do_wait.part.0>:
ffffffffc020406e:	7139                	addi	sp,sp,-64
ffffffffc0204070:	e852                	sd	s4,16(sp)
ffffffffc0204072:	80000a37          	lui	s4,0x80000
ffffffffc0204076:	f426                	sd	s1,40(sp)
ffffffffc0204078:	f04a                	sd	s2,32(sp)
ffffffffc020407a:	ec4e                	sd	s3,24(sp)
ffffffffc020407c:	e456                	sd	s5,8(sp)
ffffffffc020407e:	e05a                	sd	s6,0(sp)
ffffffffc0204080:	fc06                	sd	ra,56(sp)
ffffffffc0204082:	f822                	sd	s0,48(sp)
ffffffffc0204084:	892a                	mv	s2,a0
ffffffffc0204086:	8aae                	mv	s5,a1
ffffffffc0204088:	00015997          	auipc	s3,0x15
ffffffffc020408c:	47898993          	addi	s3,s3,1144 # ffffffffc0219500 <current>
ffffffffc0204090:	448d                	li	s1,3
ffffffffc0204092:	4b05                	li	s6,1
ffffffffc0204094:	2a05                	addiw	s4,s4,1
ffffffffc0204096:	02090f63          	beqz	s2,ffffffffc02040d4 <do_wait.part.0+0x66>
ffffffffc020409a:	854a                	mv	a0,s2
ffffffffc020409c:	9a3ff0ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc02040a0:	842a                	mv	s0,a0
ffffffffc02040a2:	10050763          	beqz	a0,ffffffffc02041b0 <do_wait.part.0+0x142>
ffffffffc02040a6:	0009b703          	ld	a4,0(s3)
ffffffffc02040aa:	711c                	ld	a5,32(a0)
ffffffffc02040ac:	10e79263          	bne	a5,a4,ffffffffc02041b0 <do_wait.part.0+0x142>
ffffffffc02040b0:	411c                	lw	a5,0(a0)
ffffffffc02040b2:	02978c63          	beq	a5,s1,ffffffffc02040ea <do_wait.part.0+0x7c>
ffffffffc02040b6:	01672023          	sw	s6,0(a4)
ffffffffc02040ba:	0f472623          	sw	s4,236(a4)
ffffffffc02040be:	375000ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc02040c2:	0009b783          	ld	a5,0(s3)
ffffffffc02040c6:	0b07a783          	lw	a5,176(a5)
ffffffffc02040ca:	8b85                	andi	a5,a5,1
ffffffffc02040cc:	d7e9                	beqz	a5,ffffffffc0204096 <do_wait.part.0+0x28>
ffffffffc02040ce:	555d                	li	a0,-9
ffffffffc02040d0:	de9ff0ef          	jal	ra,ffffffffc0203eb8 <do_exit>
ffffffffc02040d4:	0009b703          	ld	a4,0(s3)
ffffffffc02040d8:	7b60                	ld	s0,240(a4)
ffffffffc02040da:	e409                	bnez	s0,ffffffffc02040e4 <do_wait.part.0+0x76>
ffffffffc02040dc:	a8d1                	j	ffffffffc02041b0 <do_wait.part.0+0x142>
ffffffffc02040de:	10043403          	ld	s0,256(s0)
ffffffffc02040e2:	d871                	beqz	s0,ffffffffc02040b6 <do_wait.part.0+0x48>
ffffffffc02040e4:	401c                	lw	a5,0(s0)
ffffffffc02040e6:	fe979ce3          	bne	a5,s1,ffffffffc02040de <do_wait.part.0+0x70>
ffffffffc02040ea:	00015797          	auipc	a5,0x15
ffffffffc02040ee:	41e7b783          	ld	a5,1054(a5) # ffffffffc0219508 <idleproc>
ffffffffc02040f2:	0c878563          	beq	a5,s0,ffffffffc02041bc <do_wait.part.0+0x14e>
ffffffffc02040f6:	00015797          	auipc	a5,0x15
ffffffffc02040fa:	41a7b783          	ld	a5,1050(a5) # ffffffffc0219510 <initproc>
ffffffffc02040fe:	0af40f63          	beq	s0,a5,ffffffffc02041bc <do_wait.part.0+0x14e>
ffffffffc0204102:	000a8663          	beqz	s5,ffffffffc020410e <do_wait.part.0+0xa0>
ffffffffc0204106:	0e842783          	lw	a5,232(s0)
ffffffffc020410a:	00faa023          	sw	a5,0(s5)
ffffffffc020410e:	100027f3          	csrr	a5,sstatus
ffffffffc0204112:	8b89                	andi	a5,a5,2
ffffffffc0204114:	4581                	li	a1,0
ffffffffc0204116:	efd9                	bnez	a5,ffffffffc02041b4 <do_wait.part.0+0x146>
ffffffffc0204118:	6c70                	ld	a2,216(s0)
ffffffffc020411a:	7074                	ld	a3,224(s0)
ffffffffc020411c:	10043703          	ld	a4,256(s0)
ffffffffc0204120:	7c7c                	ld	a5,248(s0)
ffffffffc0204122:	e614                	sd	a3,8(a2)
ffffffffc0204124:	e290                	sd	a2,0(a3)
ffffffffc0204126:	6470                	ld	a2,200(s0)
ffffffffc0204128:	6874                	ld	a3,208(s0)
ffffffffc020412a:	e614                	sd	a3,8(a2)
ffffffffc020412c:	e290                	sd	a2,0(a3)
ffffffffc020412e:	c319                	beqz	a4,ffffffffc0204134 <do_wait.part.0+0xc6>
ffffffffc0204130:	ff7c                	sd	a5,248(a4)
ffffffffc0204132:	7c7c                	ld	a5,248(s0)
ffffffffc0204134:	cbbd                	beqz	a5,ffffffffc02041aa <do_wait.part.0+0x13c>
ffffffffc0204136:	10e7b023          	sd	a4,256(a5)
ffffffffc020413a:	00015717          	auipc	a4,0x15
ffffffffc020413e:	3de70713          	addi	a4,a4,990 # ffffffffc0219518 <nr_process>
ffffffffc0204142:	431c                	lw	a5,0(a4)
ffffffffc0204144:	37fd                	addiw	a5,a5,-1
ffffffffc0204146:	c31c                	sw	a5,0(a4)
ffffffffc0204148:	edb1                	bnez	a1,ffffffffc02041a4 <do_wait.part.0+0x136>
ffffffffc020414a:	6814                	ld	a3,16(s0)
ffffffffc020414c:	c02007b7          	lui	a5,0xc0200
ffffffffc0204150:	08f6ee63          	bltu	a3,a5,ffffffffc02041ec <do_wait.part.0+0x17e>
ffffffffc0204154:	00015797          	auipc	a5,0x15
ffffffffc0204158:	3ec7b783          	ld	a5,1004(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc020415c:	8e9d                	sub	a3,a3,a5
ffffffffc020415e:	82b1                	srli	a3,a3,0xc
ffffffffc0204160:	00015797          	auipc	a5,0x15
ffffffffc0204164:	3787b783          	ld	a5,888(a5) # ffffffffc02194d8 <npage>
ffffffffc0204168:	06f6f663          	bgeu	a3,a5,ffffffffc02041d4 <do_wait.part.0+0x166>
ffffffffc020416c:	00006517          	auipc	a0,0x6
ffffffffc0204170:	78c53503          	ld	a0,1932(a0) # ffffffffc020a8f8 <nbase>
ffffffffc0204174:	8e89                	sub	a3,a3,a0
ffffffffc0204176:	069a                	slli	a3,a3,0x6
ffffffffc0204178:	00015517          	auipc	a0,0x15
ffffffffc020417c:	3d853503          	ld	a0,984(a0) # ffffffffc0219550 <pages>
ffffffffc0204180:	9536                	add	a0,a0,a3
ffffffffc0204182:	4589                	li	a1,2
ffffffffc0204184:	c59fc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0204188:	8522                	mv	a0,s0
ffffffffc020418a:	f97fd0ef          	jal	ra,ffffffffc0202120 <kfree>
ffffffffc020418e:	4501                	li	a0,0
ffffffffc0204190:	70e2                	ld	ra,56(sp)
ffffffffc0204192:	7442                	ld	s0,48(sp)
ffffffffc0204194:	74a2                	ld	s1,40(sp)
ffffffffc0204196:	7902                	ld	s2,32(sp)
ffffffffc0204198:	69e2                	ld	s3,24(sp)
ffffffffc020419a:	6a42                	ld	s4,16(sp)
ffffffffc020419c:	6aa2                	ld	s5,8(sp)
ffffffffc020419e:	6b02                	ld	s6,0(sp)
ffffffffc02041a0:	6121                	addi	sp,sp,64
ffffffffc02041a2:	8082                	ret
ffffffffc02041a4:	c8efc0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc02041a8:	b74d                	j	ffffffffc020414a <do_wait.part.0+0xdc>
ffffffffc02041aa:	701c                	ld	a5,32(s0)
ffffffffc02041ac:	fbf8                	sd	a4,240(a5)
ffffffffc02041ae:	b771                	j	ffffffffc020413a <do_wait.part.0+0xcc>
ffffffffc02041b0:	5579                	li	a0,-2
ffffffffc02041b2:	bff9                	j	ffffffffc0204190 <do_wait.part.0+0x122>
ffffffffc02041b4:	c84fc0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc02041b8:	4585                	li	a1,1
ffffffffc02041ba:	bfb9                	j	ffffffffc0204118 <do_wait.part.0+0xaa>
ffffffffc02041bc:	00005617          	auipc	a2,0x5
ffffffffc02041c0:	6f460613          	addi	a2,a2,1780 # ffffffffc02098b0 <default_pmm_manager+0x3d8>
ffffffffc02041c4:	2f600593          	li	a1,758
ffffffffc02041c8:	00005517          	auipc	a0,0x5
ffffffffc02041cc:	69050513          	addi	a0,a0,1680 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc02041d0:	838fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02041d4:	00005617          	auipc	a2,0x5
ffffffffc02041d8:	8b460613          	addi	a2,a2,-1868 # ffffffffc0208a88 <commands+0x700>
ffffffffc02041dc:	06200593          	li	a1,98
ffffffffc02041e0:	00005517          	auipc	a0,0x5
ffffffffc02041e4:	8c850513          	addi	a0,a0,-1848 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02041e8:	820fc0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02041ec:	00005617          	auipc	a2,0x5
ffffffffc02041f0:	92460613          	addi	a2,a2,-1756 # ffffffffc0208b10 <commands+0x788>
ffffffffc02041f4:	06e00593          	li	a1,110
ffffffffc02041f8:	00005517          	auipc	a0,0x5
ffffffffc02041fc:	8b050513          	addi	a0,a0,-1872 # ffffffffc0208aa8 <commands+0x720>
ffffffffc0204200:	808fc0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204204 <init_main>:
ffffffffc0204204:	1141                	addi	sp,sp,-16
ffffffffc0204206:	e406                	sd	ra,8(sp)
ffffffffc0204208:	c17fc0ef          	jal	ra,ffffffffc0200e1e <nr_free_pages>
ffffffffc020420c:	e61fd0ef          	jal	ra,ffffffffc020206c <kallocated>
ffffffffc0204210:	8fcff0ef          	jal	ra,ffffffffc020330c <check_milk>
ffffffffc0204214:	a019                	j	ffffffffc020421a <init_main+0x16>
ffffffffc0204216:	21d000ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc020421a:	4581                	li	a1,0
ffffffffc020421c:	4501                	li	a0,0
ffffffffc020421e:	e51ff0ef          	jal	ra,ffffffffc020406e <do_wait.part.0>
ffffffffc0204222:	d975                	beqz	a0,ffffffffc0204216 <init_main+0x12>
ffffffffc0204224:	00005517          	auipc	a0,0x5
ffffffffc0204228:	6ac50513          	addi	a0,a0,1708 # ffffffffc02098d0 <default_pmm_manager+0x3f8>
ffffffffc020422c:	ea1fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204230:	00015797          	auipc	a5,0x15
ffffffffc0204234:	2e07b783          	ld	a5,736(a5) # ffffffffc0219510 <initproc>
ffffffffc0204238:	7bf8                	ld	a4,240(a5)
ffffffffc020423a:	e339                	bnez	a4,ffffffffc0204280 <init_main+0x7c>
ffffffffc020423c:	7ff8                	ld	a4,248(a5)
ffffffffc020423e:	e329                	bnez	a4,ffffffffc0204280 <init_main+0x7c>
ffffffffc0204240:	1007b703          	ld	a4,256(a5)
ffffffffc0204244:	ef15                	bnez	a4,ffffffffc0204280 <init_main+0x7c>
ffffffffc0204246:	00015697          	auipc	a3,0x15
ffffffffc020424a:	2d26a683          	lw	a3,722(a3) # ffffffffc0219518 <nr_process>
ffffffffc020424e:	4709                	li	a4,2
ffffffffc0204250:	08e69863          	bne	a3,a4,ffffffffc02042e0 <init_main+0xdc>
ffffffffc0204254:	00015717          	auipc	a4,0x15
ffffffffc0204258:	46c70713          	addi	a4,a4,1132 # ffffffffc02196c0 <proc_list>
ffffffffc020425c:	6714                	ld	a3,8(a4)
ffffffffc020425e:	0c878793          	addi	a5,a5,200
ffffffffc0204262:	04d79f63          	bne	a5,a3,ffffffffc02042c0 <init_main+0xbc>
ffffffffc0204266:	6318                	ld	a4,0(a4)
ffffffffc0204268:	02e79c63          	bne	a5,a4,ffffffffc02042a0 <init_main+0x9c>
ffffffffc020426c:	00005517          	auipc	a0,0x5
ffffffffc0204270:	74c50513          	addi	a0,a0,1868 # ffffffffc02099b8 <default_pmm_manager+0x4e0>
ffffffffc0204274:	e59fb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204278:	60a2                	ld	ra,8(sp)
ffffffffc020427a:	4501                	li	a0,0
ffffffffc020427c:	0141                	addi	sp,sp,16
ffffffffc020427e:	8082                	ret
ffffffffc0204280:	00005697          	auipc	a3,0x5
ffffffffc0204284:	67868693          	addi	a3,a3,1656 # ffffffffc02098f8 <default_pmm_manager+0x420>
ffffffffc0204288:	00004617          	auipc	a2,0x4
ffffffffc020428c:	51060613          	addi	a2,a2,1296 # ffffffffc0208798 <commands+0x410>
ffffffffc0204290:	36200593          	li	a1,866
ffffffffc0204294:	00005517          	auipc	a0,0x5
ffffffffc0204298:	5c450513          	addi	a0,a0,1476 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc020429c:	f6dfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02042a0:	00005697          	auipc	a3,0x5
ffffffffc02042a4:	6e868693          	addi	a3,a3,1768 # ffffffffc0209988 <default_pmm_manager+0x4b0>
ffffffffc02042a8:	00004617          	auipc	a2,0x4
ffffffffc02042ac:	4f060613          	addi	a2,a2,1264 # ffffffffc0208798 <commands+0x410>
ffffffffc02042b0:	36500593          	li	a1,869
ffffffffc02042b4:	00005517          	auipc	a0,0x5
ffffffffc02042b8:	5a450513          	addi	a0,a0,1444 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc02042bc:	f4dfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02042c0:	00005697          	auipc	a3,0x5
ffffffffc02042c4:	69868693          	addi	a3,a3,1688 # ffffffffc0209958 <default_pmm_manager+0x480>
ffffffffc02042c8:	00004617          	auipc	a2,0x4
ffffffffc02042cc:	4d060613          	addi	a2,a2,1232 # ffffffffc0208798 <commands+0x410>
ffffffffc02042d0:	36400593          	li	a1,868
ffffffffc02042d4:	00005517          	auipc	a0,0x5
ffffffffc02042d8:	58450513          	addi	a0,a0,1412 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc02042dc:	f2dfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02042e0:	00005697          	auipc	a3,0x5
ffffffffc02042e4:	66868693          	addi	a3,a3,1640 # ffffffffc0209948 <default_pmm_manager+0x470>
ffffffffc02042e8:	00004617          	auipc	a2,0x4
ffffffffc02042ec:	4b060613          	addi	a2,a2,1200 # ffffffffc0208798 <commands+0x410>
ffffffffc02042f0:	36300593          	li	a1,867
ffffffffc02042f4:	00005517          	auipc	a0,0x5
ffffffffc02042f8:	56450513          	addi	a0,a0,1380 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc02042fc:	f0dfb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204300 <do_execve>:
ffffffffc0204300:	7135                	addi	sp,sp,-160
ffffffffc0204302:	f4d6                	sd	s5,104(sp)
ffffffffc0204304:	00015a97          	auipc	s5,0x15
ffffffffc0204308:	1fca8a93          	addi	s5,s5,508 # ffffffffc0219500 <current>
ffffffffc020430c:	000ab783          	ld	a5,0(s5)
ffffffffc0204310:	f8d2                	sd	s4,112(sp)
ffffffffc0204312:	e526                	sd	s1,136(sp)
ffffffffc0204314:	0287ba03          	ld	s4,40(a5)
ffffffffc0204318:	e14a                	sd	s2,128(sp)
ffffffffc020431a:	fcce                	sd	s3,120(sp)
ffffffffc020431c:	892a                	mv	s2,a0
ffffffffc020431e:	84ae                	mv	s1,a1
ffffffffc0204320:	89b2                	mv	s3,a2
ffffffffc0204322:	4681                	li	a3,0
ffffffffc0204324:	862e                	mv	a2,a1
ffffffffc0204326:	85aa                	mv	a1,a0
ffffffffc0204328:	8552                	mv	a0,s4
ffffffffc020432a:	ed06                	sd	ra,152(sp)
ffffffffc020432c:	e922                	sd	s0,144(sp)
ffffffffc020432e:	f0da                	sd	s6,96(sp)
ffffffffc0204330:	ecde                	sd	s7,88(sp)
ffffffffc0204332:	e8e2                	sd	s8,80(sp)
ffffffffc0204334:	e4e6                	sd	s9,72(sp)
ffffffffc0204336:	e0ea                	sd	s10,64(sp)
ffffffffc0204338:	fc6e                	sd	s11,56(sp)
ffffffffc020433a:	873fd0ef          	jal	ra,ffffffffc0201bac <user_mem_check>
ffffffffc020433e:	46050063          	beqz	a0,ffffffffc020479e <do_execve+0x49e>
ffffffffc0204342:	4641                	li	a2,16
ffffffffc0204344:	4581                	li	a1,0
ffffffffc0204346:	1008                	addi	a0,sp,32
ffffffffc0204348:	171030ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc020434c:	47bd                	li	a5,15
ffffffffc020434e:	8626                	mv	a2,s1
ffffffffc0204350:	1897ea63          	bltu	a5,s1,ffffffffc02044e4 <do_execve+0x1e4>
ffffffffc0204354:	85ca                	mv	a1,s2
ffffffffc0204356:	1008                	addi	a0,sp,32
ffffffffc0204358:	173030ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc020435c:	180a0b63          	beqz	s4,ffffffffc02044f2 <do_execve+0x1f2>
ffffffffc0204360:	00005517          	auipc	a0,0x5
ffffffffc0204364:	97050513          	addi	a0,a0,-1680 # ffffffffc0208cd0 <commands+0x948>
ffffffffc0204368:	d9dfb0ef          	jal	ra,ffffffffc0200104 <cputs>
ffffffffc020436c:	00015797          	auipc	a5,0x15
ffffffffc0204370:	1dc7b783          	ld	a5,476(a5) # ffffffffc0219548 <boot_cr3>
ffffffffc0204374:	577d                	li	a4,-1
ffffffffc0204376:	177e                	slli	a4,a4,0x3f
ffffffffc0204378:	83b1                	srli	a5,a5,0xc
ffffffffc020437a:	8fd9                	or	a5,a5,a4
ffffffffc020437c:	18079073          	csrw	satp,a5
ffffffffc0204380:	030a2783          	lw	a5,48(s4) # ffffffff80000030 <kern_entry-0x401fffd0>
ffffffffc0204384:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204388:	02ea2823          	sw	a4,48(s4)
ffffffffc020438c:	2c070163          	beqz	a4,ffffffffc020464e <do_execve+0x34e>
ffffffffc0204390:	000ab783          	ld	a5,0(s5)
ffffffffc0204394:	0207b423          	sd	zero,40(a5)
ffffffffc0204398:	ba0fd0ef          	jal	ra,ffffffffc0201738 <mm_create>
ffffffffc020439c:	84aa                	mv	s1,a0
ffffffffc020439e:	18050263          	beqz	a0,ffffffffc0204522 <do_execve+0x222>
ffffffffc02043a2:	0561                	addi	a0,a0,24
ffffffffc02043a4:	d82ff0ef          	jal	ra,ffffffffc0203926 <setup_pgdir.isra.0>
ffffffffc02043a8:	16051663          	bnez	a0,ffffffffc0204514 <do_execve+0x214>
ffffffffc02043ac:	0009a703          	lw	a4,0(s3)
ffffffffc02043b0:	464c47b7          	lui	a5,0x464c4
ffffffffc02043b4:	57f78793          	addi	a5,a5,1407 # 464c457f <kern_entry-0xffffffff79d3ba81>
ffffffffc02043b8:	24f71763          	bne	a4,a5,ffffffffc0204606 <do_execve+0x306>
ffffffffc02043bc:	0389d703          	lhu	a4,56(s3)
ffffffffc02043c0:	0209b903          	ld	s2,32(s3)
ffffffffc02043c4:	00371793          	slli	a5,a4,0x3
ffffffffc02043c8:	8f99                	sub	a5,a5,a4
ffffffffc02043ca:	994e                	add	s2,s2,s3
ffffffffc02043cc:	078e                	slli	a5,a5,0x3
ffffffffc02043ce:	97ca                	add	a5,a5,s2
ffffffffc02043d0:	ec3e                	sd	a5,24(sp)
ffffffffc02043d2:	02f97c63          	bgeu	s2,a5,ffffffffc020440a <do_execve+0x10a>
ffffffffc02043d6:	5bfd                	li	s7,-1
ffffffffc02043d8:	00cbd793          	srli	a5,s7,0xc
ffffffffc02043dc:	00015d97          	auipc	s11,0x15
ffffffffc02043e0:	174d8d93          	addi	s11,s11,372 # ffffffffc0219550 <pages>
ffffffffc02043e4:	00006d17          	auipc	s10,0x6
ffffffffc02043e8:	514d0d13          	addi	s10,s10,1300 # ffffffffc020a8f8 <nbase>
ffffffffc02043ec:	e43e                	sd	a5,8(sp)
ffffffffc02043ee:	00015c97          	auipc	s9,0x15
ffffffffc02043f2:	0eac8c93          	addi	s9,s9,234 # ffffffffc02194d8 <npage>
ffffffffc02043f6:	00092703          	lw	a4,0(s2)
ffffffffc02043fa:	4785                	li	a5,1
ffffffffc02043fc:	12f70563          	beq	a4,a5,ffffffffc0204526 <do_execve+0x226>
ffffffffc0204400:	67e2                	ld	a5,24(sp)
ffffffffc0204402:	03890913          	addi	s2,s2,56
ffffffffc0204406:	fef968e3          	bltu	s2,a5,ffffffffc02043f6 <do_execve+0xf6>
ffffffffc020440a:	4701                	li	a4,0
ffffffffc020440c:	46ad                	li	a3,11
ffffffffc020440e:	00100637          	lui	a2,0x100
ffffffffc0204412:	7ff005b7          	lui	a1,0x7ff00
ffffffffc0204416:	8526                	mv	a0,s1
ffffffffc0204418:	cd0fd0ef          	jal	ra,ffffffffc02018e8 <mm_map>
ffffffffc020441c:	8a2a                	mv	s4,a0
ffffffffc020441e:	1e051063          	bnez	a0,ffffffffc02045fe <do_execve+0x2fe>
ffffffffc0204422:	6c88                	ld	a0,24(s1)
ffffffffc0204424:	467d                	li	a2,31
ffffffffc0204426:	7ffff5b7          	lui	a1,0x7ffff
ffffffffc020442a:	a5cfd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc020442e:	42050e63          	beqz	a0,ffffffffc020486a <do_execve+0x56a>
ffffffffc0204432:	6c88                	ld	a0,24(s1)
ffffffffc0204434:	467d                	li	a2,31
ffffffffc0204436:	7fffe5b7          	lui	a1,0x7fffe
ffffffffc020443a:	a4cfd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc020443e:	40050663          	beqz	a0,ffffffffc020484a <do_execve+0x54a>
ffffffffc0204442:	6c88                	ld	a0,24(s1)
ffffffffc0204444:	467d                	li	a2,31
ffffffffc0204446:	7fffd5b7          	lui	a1,0x7fffd
ffffffffc020444a:	a3cfd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc020444e:	3c050e63          	beqz	a0,ffffffffc020482a <do_execve+0x52a>
ffffffffc0204452:	6c88                	ld	a0,24(s1)
ffffffffc0204454:	467d                	li	a2,31
ffffffffc0204456:	7fffc5b7          	lui	a1,0x7fffc
ffffffffc020445a:	a2cfd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc020445e:	3a050663          	beqz	a0,ffffffffc020480a <do_execve+0x50a>
ffffffffc0204462:	589c                	lw	a5,48(s1)
ffffffffc0204464:	000ab603          	ld	a2,0(s5)
ffffffffc0204468:	6c94                	ld	a3,24(s1)
ffffffffc020446a:	2785                	addiw	a5,a5,1
ffffffffc020446c:	d89c                	sw	a5,48(s1)
ffffffffc020446e:	f604                	sd	s1,40(a2)
ffffffffc0204470:	c02007b7          	lui	a5,0xc0200
ffffffffc0204474:	36f6ef63          	bltu	a3,a5,ffffffffc02047f2 <do_execve+0x4f2>
ffffffffc0204478:	00015797          	auipc	a5,0x15
ffffffffc020447c:	0c87b783          	ld	a5,200(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc0204480:	8e9d                	sub	a3,a3,a5
ffffffffc0204482:	577d                	li	a4,-1
ffffffffc0204484:	00c6d793          	srli	a5,a3,0xc
ffffffffc0204488:	177e                	slli	a4,a4,0x3f
ffffffffc020448a:	f654                	sd	a3,168(a2)
ffffffffc020448c:	8fd9                	or	a5,a5,a4
ffffffffc020448e:	18079073          	csrw	satp,a5
ffffffffc0204492:	7240                	ld	s0,160(a2)
ffffffffc0204494:	4581                	li	a1,0
ffffffffc0204496:	12000613          	li	a2,288
ffffffffc020449a:	8522                	mv	a0,s0
ffffffffc020449c:	10043483          	ld	s1,256(s0)
ffffffffc02044a0:	019030ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc02044a4:	0189b703          	ld	a4,24(s3)
ffffffffc02044a8:	4785                	li	a5,1
ffffffffc02044aa:	000ab503          	ld	a0,0(s5)
ffffffffc02044ae:	edf4f493          	andi	s1,s1,-289
ffffffffc02044b2:	07fe                	slli	a5,a5,0x1f
ffffffffc02044b4:	e81c                	sd	a5,16(s0)
ffffffffc02044b6:	10e43423          	sd	a4,264(s0)
ffffffffc02044ba:	10943023          	sd	s1,256(s0)
ffffffffc02044be:	100c                	addi	a1,sp,32
ffffffffc02044c0:	ce8ff0ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc02044c4:	60ea                	ld	ra,152(sp)
ffffffffc02044c6:	644a                	ld	s0,144(sp)
ffffffffc02044c8:	64aa                	ld	s1,136(sp)
ffffffffc02044ca:	690a                	ld	s2,128(sp)
ffffffffc02044cc:	79e6                	ld	s3,120(sp)
ffffffffc02044ce:	7aa6                	ld	s5,104(sp)
ffffffffc02044d0:	7b06                	ld	s6,96(sp)
ffffffffc02044d2:	6be6                	ld	s7,88(sp)
ffffffffc02044d4:	6c46                	ld	s8,80(sp)
ffffffffc02044d6:	6ca6                	ld	s9,72(sp)
ffffffffc02044d8:	6d06                	ld	s10,64(sp)
ffffffffc02044da:	7de2                	ld	s11,56(sp)
ffffffffc02044dc:	8552                	mv	a0,s4
ffffffffc02044de:	7a46                	ld	s4,112(sp)
ffffffffc02044e0:	610d                	addi	sp,sp,160
ffffffffc02044e2:	8082                	ret
ffffffffc02044e4:	463d                	li	a2,15
ffffffffc02044e6:	85ca                	mv	a1,s2
ffffffffc02044e8:	1008                	addi	a0,sp,32
ffffffffc02044ea:	7e0030ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc02044ee:	e60a19e3          	bnez	s4,ffffffffc0204360 <do_execve+0x60>
ffffffffc02044f2:	000ab783          	ld	a5,0(s5)
ffffffffc02044f6:	779c                	ld	a5,40(a5)
ffffffffc02044f8:	ea0780e3          	beqz	a5,ffffffffc0204398 <do_execve+0x98>
ffffffffc02044fc:	00005617          	auipc	a2,0x5
ffffffffc0204500:	4dc60613          	addi	a2,a2,1244 # ffffffffc02099d8 <default_pmm_manager+0x500>
ffffffffc0204504:	20300593          	li	a1,515
ffffffffc0204508:	00005517          	auipc	a0,0x5
ffffffffc020450c:	35050513          	addi	a0,a0,848 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204510:	cf9fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204514:	8526                	mv	a0,s1
ffffffffc0204516:	b80fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc020451a:	5a71                	li	s4,-4
ffffffffc020451c:	8552                	mv	a0,s4
ffffffffc020451e:	99bff0ef          	jal	ra,ffffffffc0203eb8 <do_exit>
ffffffffc0204522:	5a71                	li	s4,-4
ffffffffc0204524:	bfe5                	j	ffffffffc020451c <do_execve+0x21c>
ffffffffc0204526:	02893603          	ld	a2,40(s2)
ffffffffc020452a:	02093783          	ld	a5,32(s2)
ffffffffc020452e:	26f66c63          	bltu	a2,a5,ffffffffc02047a6 <do_execve+0x4a6>
ffffffffc0204532:	00492783          	lw	a5,4(s2)
ffffffffc0204536:	0017f693          	andi	a3,a5,1
ffffffffc020453a:	c291                	beqz	a3,ffffffffc020453e <do_execve+0x23e>
ffffffffc020453c:	4691                	li	a3,4
ffffffffc020453e:	0027f713          	andi	a4,a5,2
ffffffffc0204542:	8b91                	andi	a5,a5,4
ffffffffc0204544:	14071c63          	bnez	a4,ffffffffc020469c <do_execve+0x39c>
ffffffffc0204548:	4745                	li	a4,17
ffffffffc020454a:	e03a                	sd	a4,0(sp)
ffffffffc020454c:	c789                	beqz	a5,ffffffffc0204556 <do_execve+0x256>
ffffffffc020454e:	47cd                	li	a5,19
ffffffffc0204550:	0016e693          	ori	a3,a3,1
ffffffffc0204554:	e03e                	sd	a5,0(sp)
ffffffffc0204556:	0026f793          	andi	a5,a3,2
ffffffffc020455a:	14079563          	bnez	a5,ffffffffc02046a4 <do_execve+0x3a4>
ffffffffc020455e:	0046f793          	andi	a5,a3,4
ffffffffc0204562:	c789                	beqz	a5,ffffffffc020456c <do_execve+0x26c>
ffffffffc0204564:	6782                	ld	a5,0(sp)
ffffffffc0204566:	0087e793          	ori	a5,a5,8
ffffffffc020456a:	e03e                	sd	a5,0(sp)
ffffffffc020456c:	01093583          	ld	a1,16(s2)
ffffffffc0204570:	4701                	li	a4,0
ffffffffc0204572:	8526                	mv	a0,s1
ffffffffc0204574:	b74fd0ef          	jal	ra,ffffffffc02018e8 <mm_map>
ffffffffc0204578:	8a2a                	mv	s4,a0
ffffffffc020457a:	e151                	bnez	a0,ffffffffc02045fe <do_execve+0x2fe>
ffffffffc020457c:	01093c03          	ld	s8,16(s2)
ffffffffc0204580:	02093a03          	ld	s4,32(s2)
ffffffffc0204584:	00893b03          	ld	s6,8(s2)
ffffffffc0204588:	77fd                	lui	a5,0xfffff
ffffffffc020458a:	9a62                	add	s4,s4,s8
ffffffffc020458c:	9b4e                	add	s6,s6,s3
ffffffffc020458e:	00fc7bb3          	and	s7,s8,a5
ffffffffc0204592:	054c6e63          	bltu	s8,s4,ffffffffc02045ee <do_execve+0x2ee>
ffffffffc0204596:	a431                	j	ffffffffc02047a2 <do_execve+0x4a2>
ffffffffc0204598:	6785                	lui	a5,0x1
ffffffffc020459a:	417c0533          	sub	a0,s8,s7
ffffffffc020459e:	9bbe                	add	s7,s7,a5
ffffffffc02045a0:	418b8633          	sub	a2,s7,s8
ffffffffc02045a4:	017a7463          	bgeu	s4,s7,ffffffffc02045ac <do_execve+0x2ac>
ffffffffc02045a8:	418a0633          	sub	a2,s4,s8
ffffffffc02045ac:	000db683          	ld	a3,0(s11)
ffffffffc02045b0:	000d3803          	ld	a6,0(s10)
ffffffffc02045b4:	67a2                	ld	a5,8(sp)
ffffffffc02045b6:	40d406b3          	sub	a3,s0,a3
ffffffffc02045ba:	8699                	srai	a3,a3,0x6
ffffffffc02045bc:	000cb583          	ld	a1,0(s9)
ffffffffc02045c0:	96c2                	add	a3,a3,a6
ffffffffc02045c2:	00f6f833          	and	a6,a3,a5
ffffffffc02045c6:	06b2                	slli	a3,a3,0xc
ffffffffc02045c8:	1eb87163          	bgeu	a6,a1,ffffffffc02047aa <do_execve+0x4aa>
ffffffffc02045cc:	00015797          	auipc	a5,0x15
ffffffffc02045d0:	f7478793          	addi	a5,a5,-140 # ffffffffc0219540 <va_pa_offset>
ffffffffc02045d4:	0007b803          	ld	a6,0(a5)
ffffffffc02045d8:	85da                	mv	a1,s6
ffffffffc02045da:	9c32                	add	s8,s8,a2
ffffffffc02045dc:	96c2                	add	a3,a3,a6
ffffffffc02045de:	9536                	add	a0,a0,a3
ffffffffc02045e0:	e832                	sd	a2,16(sp)
ffffffffc02045e2:	6e8030ef          	jal	ra,ffffffffc0207cca <memcpy>
ffffffffc02045e6:	6642                	ld	a2,16(sp)
ffffffffc02045e8:	9b32                	add	s6,s6,a2
ffffffffc02045ea:	0d4c7063          	bgeu	s8,s4,ffffffffc02046aa <do_execve+0x3aa>
ffffffffc02045ee:	6c88                	ld	a0,24(s1)
ffffffffc02045f0:	6602                	ld	a2,0(sp)
ffffffffc02045f2:	85de                	mv	a1,s7
ffffffffc02045f4:	892fd0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc02045f8:	842a                	mv	s0,a0
ffffffffc02045fa:	fd59                	bnez	a0,ffffffffc0204598 <do_execve+0x298>
ffffffffc02045fc:	5a71                	li	s4,-4
ffffffffc02045fe:	8526                	mv	a0,s1
ffffffffc0204600:	c32fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0204604:	a011                	j	ffffffffc0204608 <do_execve+0x308>
ffffffffc0204606:	5a61                	li	s4,-8
ffffffffc0204608:	6c94                	ld	a3,24(s1)
ffffffffc020460a:	c02007b7          	lui	a5,0xc0200
ffffffffc020460e:	1af6ea63          	bltu	a3,a5,ffffffffc02047c2 <do_execve+0x4c2>
ffffffffc0204612:	00015517          	auipc	a0,0x15
ffffffffc0204616:	f2e53503          	ld	a0,-210(a0) # ffffffffc0219540 <va_pa_offset>
ffffffffc020461a:	8e89                	sub	a3,a3,a0
ffffffffc020461c:	82b1                	srli	a3,a3,0xc
ffffffffc020461e:	00015797          	auipc	a5,0x15
ffffffffc0204622:	eba7b783          	ld	a5,-326(a5) # ffffffffc02194d8 <npage>
ffffffffc0204626:	1af6fa63          	bgeu	a3,a5,ffffffffc02047da <do_execve+0x4da>
ffffffffc020462a:	00006517          	auipc	a0,0x6
ffffffffc020462e:	2ce53503          	ld	a0,718(a0) # ffffffffc020a8f8 <nbase>
ffffffffc0204632:	8e89                	sub	a3,a3,a0
ffffffffc0204634:	069a                	slli	a3,a3,0x6
ffffffffc0204636:	00015517          	auipc	a0,0x15
ffffffffc020463a:	f1a53503          	ld	a0,-230(a0) # ffffffffc0219550 <pages>
ffffffffc020463e:	9536                	add	a0,a0,a3
ffffffffc0204640:	4585                	li	a1,1
ffffffffc0204642:	f9afc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0204646:	8526                	mv	a0,s1
ffffffffc0204648:	a4efd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc020464c:	bdc1                	j	ffffffffc020451c <do_execve+0x21c>
ffffffffc020464e:	8552                	mv	a0,s4
ffffffffc0204650:	be2fd0ef          	jal	ra,ffffffffc0201a32 <exit_mmap>
ffffffffc0204654:	018a3683          	ld	a3,24(s4)
ffffffffc0204658:	c02007b7          	lui	a5,0xc0200
ffffffffc020465c:	16f6e363          	bltu	a3,a5,ffffffffc02047c2 <do_execve+0x4c2>
ffffffffc0204660:	00015797          	auipc	a5,0x15
ffffffffc0204664:	ee07b783          	ld	a5,-288(a5) # ffffffffc0219540 <va_pa_offset>
ffffffffc0204668:	8e9d                	sub	a3,a3,a5
ffffffffc020466a:	82b1                	srli	a3,a3,0xc
ffffffffc020466c:	00015797          	auipc	a5,0x15
ffffffffc0204670:	e6c7b783          	ld	a5,-404(a5) # ffffffffc02194d8 <npage>
ffffffffc0204674:	16f6f363          	bgeu	a3,a5,ffffffffc02047da <do_execve+0x4da>
ffffffffc0204678:	00006517          	auipc	a0,0x6
ffffffffc020467c:	28053503          	ld	a0,640(a0) # ffffffffc020a8f8 <nbase>
ffffffffc0204680:	8e89                	sub	a3,a3,a0
ffffffffc0204682:	069a                	slli	a3,a3,0x6
ffffffffc0204684:	00015517          	auipc	a0,0x15
ffffffffc0204688:	ecc53503          	ld	a0,-308(a0) # ffffffffc0219550 <pages>
ffffffffc020468c:	9536                	add	a0,a0,a3
ffffffffc020468e:	4585                	li	a1,1
ffffffffc0204690:	f4cfc0ef          	jal	ra,ffffffffc0200ddc <free_pages>
ffffffffc0204694:	8552                	mv	a0,s4
ffffffffc0204696:	a00fd0ef          	jal	ra,ffffffffc0201896 <mm_destroy>
ffffffffc020469a:	b9dd                	j	ffffffffc0204390 <do_execve+0x90>
ffffffffc020469c:	0026e693          	ori	a3,a3,2
ffffffffc02046a0:	ea0797e3          	bnez	a5,ffffffffc020454e <do_execve+0x24e>
ffffffffc02046a4:	47dd                	li	a5,23
ffffffffc02046a6:	e03e                	sd	a5,0(sp)
ffffffffc02046a8:	bd5d                	j	ffffffffc020455e <do_execve+0x25e>
ffffffffc02046aa:	01093a03          	ld	s4,16(s2)
ffffffffc02046ae:	02893683          	ld	a3,40(s2)
ffffffffc02046b2:	9a36                	add	s4,s4,a3
ffffffffc02046b4:	077c7f63          	bgeu	s8,s7,ffffffffc0204732 <do_execve+0x432>
ffffffffc02046b8:	d58a04e3          	beq	s4,s8,ffffffffc0204400 <do_execve+0x100>
ffffffffc02046bc:	6505                	lui	a0,0x1
ffffffffc02046be:	9562                	add	a0,a0,s8
ffffffffc02046c0:	41750533          	sub	a0,a0,s7
ffffffffc02046c4:	418a0b33          	sub	s6,s4,s8
ffffffffc02046c8:	0d7a7863          	bgeu	s4,s7,ffffffffc0204798 <do_execve+0x498>
ffffffffc02046cc:	000db683          	ld	a3,0(s11)
ffffffffc02046d0:	000d3583          	ld	a1,0(s10)
ffffffffc02046d4:	67a2                	ld	a5,8(sp)
ffffffffc02046d6:	40d406b3          	sub	a3,s0,a3
ffffffffc02046da:	8699                	srai	a3,a3,0x6
ffffffffc02046dc:	000cb603          	ld	a2,0(s9)
ffffffffc02046e0:	96ae                	add	a3,a3,a1
ffffffffc02046e2:	00f6f5b3          	and	a1,a3,a5
ffffffffc02046e6:	06b2                	slli	a3,a3,0xc
ffffffffc02046e8:	0cc5f163          	bgeu	a1,a2,ffffffffc02047aa <do_execve+0x4aa>
ffffffffc02046ec:	00015617          	auipc	a2,0x15
ffffffffc02046f0:	e5463603          	ld	a2,-428(a2) # ffffffffc0219540 <va_pa_offset>
ffffffffc02046f4:	96b2                	add	a3,a3,a2
ffffffffc02046f6:	4581                	li	a1,0
ffffffffc02046f8:	865a                	mv	a2,s6
ffffffffc02046fa:	9536                	add	a0,a0,a3
ffffffffc02046fc:	5bc030ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc0204700:	018b0733          	add	a4,s6,s8
ffffffffc0204704:	037a7463          	bgeu	s4,s7,ffffffffc020472c <do_execve+0x42c>
ffffffffc0204708:	ceea0ce3          	beq	s4,a4,ffffffffc0204400 <do_execve+0x100>
ffffffffc020470c:	00005697          	auipc	a3,0x5
ffffffffc0204710:	2f468693          	addi	a3,a3,756 # ffffffffc0209a00 <default_pmm_manager+0x528>
ffffffffc0204714:	00004617          	auipc	a2,0x4
ffffffffc0204718:	08460613          	addi	a2,a2,132 # ffffffffc0208798 <commands+0x410>
ffffffffc020471c:	25800593          	li	a1,600
ffffffffc0204720:	00005517          	auipc	a0,0x5
ffffffffc0204724:	13850513          	addi	a0,a0,312 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204728:	ae1fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020472c:	ff7710e3          	bne	a4,s7,ffffffffc020470c <do_execve+0x40c>
ffffffffc0204730:	8c5e                	mv	s8,s7
ffffffffc0204732:	00015b17          	auipc	s6,0x15
ffffffffc0204736:	e0eb0b13          	addi	s6,s6,-498 # ffffffffc0219540 <va_pa_offset>
ffffffffc020473a:	054c6763          	bltu	s8,s4,ffffffffc0204788 <do_execve+0x488>
ffffffffc020473e:	b1c9                	j	ffffffffc0204400 <do_execve+0x100>
ffffffffc0204740:	6785                	lui	a5,0x1
ffffffffc0204742:	417c0533          	sub	a0,s8,s7
ffffffffc0204746:	9bbe                	add	s7,s7,a5
ffffffffc0204748:	418b8633          	sub	a2,s7,s8
ffffffffc020474c:	017a7463          	bgeu	s4,s7,ffffffffc0204754 <do_execve+0x454>
ffffffffc0204750:	418a0633          	sub	a2,s4,s8
ffffffffc0204754:	000db683          	ld	a3,0(s11)
ffffffffc0204758:	000d3803          	ld	a6,0(s10)
ffffffffc020475c:	67a2                	ld	a5,8(sp)
ffffffffc020475e:	40d406b3          	sub	a3,s0,a3
ffffffffc0204762:	8699                	srai	a3,a3,0x6
ffffffffc0204764:	000cb583          	ld	a1,0(s9)
ffffffffc0204768:	96c2                	add	a3,a3,a6
ffffffffc020476a:	00f6f833          	and	a6,a3,a5
ffffffffc020476e:	06b2                	slli	a3,a3,0xc
ffffffffc0204770:	02b87d63          	bgeu	a6,a1,ffffffffc02047aa <do_execve+0x4aa>
ffffffffc0204774:	000b3803          	ld	a6,0(s6)
ffffffffc0204778:	9c32                	add	s8,s8,a2
ffffffffc020477a:	4581                	li	a1,0
ffffffffc020477c:	96c2                	add	a3,a3,a6
ffffffffc020477e:	9536                	add	a0,a0,a3
ffffffffc0204780:	538030ef          	jal	ra,ffffffffc0207cb8 <memset>
ffffffffc0204784:	c74c7ee3          	bgeu	s8,s4,ffffffffc0204400 <do_execve+0x100>
ffffffffc0204788:	6c88                	ld	a0,24(s1)
ffffffffc020478a:	6602                	ld	a2,0(sp)
ffffffffc020478c:	85de                	mv	a1,s7
ffffffffc020478e:	ef9fc0ef          	jal	ra,ffffffffc0201686 <pgdir_alloc_page>
ffffffffc0204792:	842a                	mv	s0,a0
ffffffffc0204794:	f555                	bnez	a0,ffffffffc0204740 <do_execve+0x440>
ffffffffc0204796:	b59d                	j	ffffffffc02045fc <do_execve+0x2fc>
ffffffffc0204798:	418b8b33          	sub	s6,s7,s8
ffffffffc020479c:	bf05                	j	ffffffffc02046cc <do_execve+0x3cc>
ffffffffc020479e:	5a75                	li	s4,-3
ffffffffc02047a0:	b315                	j	ffffffffc02044c4 <do_execve+0x1c4>
ffffffffc02047a2:	8a62                	mv	s4,s8
ffffffffc02047a4:	b729                	j	ffffffffc02046ae <do_execve+0x3ae>
ffffffffc02047a6:	5a61                	li	s4,-8
ffffffffc02047a8:	bd99                	j	ffffffffc02045fe <do_execve+0x2fe>
ffffffffc02047aa:	00004617          	auipc	a2,0x4
ffffffffc02047ae:	39e60613          	addi	a2,a2,926 # ffffffffc0208b48 <commands+0x7c0>
ffffffffc02047b2:	06900593          	li	a1,105
ffffffffc02047b6:	00004517          	auipc	a0,0x4
ffffffffc02047ba:	2f250513          	addi	a0,a0,754 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02047be:	a4bfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047c2:	00004617          	auipc	a2,0x4
ffffffffc02047c6:	34e60613          	addi	a2,a2,846 # ffffffffc0208b10 <commands+0x788>
ffffffffc02047ca:	06e00593          	li	a1,110
ffffffffc02047ce:	00004517          	auipc	a0,0x4
ffffffffc02047d2:	2da50513          	addi	a0,a0,730 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02047d6:	a33fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047da:	00004617          	auipc	a2,0x4
ffffffffc02047de:	2ae60613          	addi	a2,a2,686 # ffffffffc0208a88 <commands+0x700>
ffffffffc02047e2:	06200593          	li	a1,98
ffffffffc02047e6:	00004517          	auipc	a0,0x4
ffffffffc02047ea:	2c250513          	addi	a0,a0,706 # ffffffffc0208aa8 <commands+0x720>
ffffffffc02047ee:	a1bfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02047f2:	00004617          	auipc	a2,0x4
ffffffffc02047f6:	31e60613          	addi	a2,a2,798 # ffffffffc0208b10 <commands+0x788>
ffffffffc02047fa:	27300593          	li	a1,627
ffffffffc02047fe:	00005517          	auipc	a0,0x5
ffffffffc0204802:	05a50513          	addi	a0,a0,90 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204806:	a03fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020480a:	00005697          	auipc	a3,0x5
ffffffffc020480e:	30e68693          	addi	a3,a3,782 # ffffffffc0209b18 <default_pmm_manager+0x640>
ffffffffc0204812:	00004617          	auipc	a2,0x4
ffffffffc0204816:	f8660613          	addi	a2,a2,-122 # ffffffffc0208798 <commands+0x410>
ffffffffc020481a:	26e00593          	li	a1,622
ffffffffc020481e:	00005517          	auipc	a0,0x5
ffffffffc0204822:	03a50513          	addi	a0,a0,58 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204826:	9e3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020482a:	00005697          	auipc	a3,0x5
ffffffffc020482e:	2a668693          	addi	a3,a3,678 # ffffffffc0209ad0 <default_pmm_manager+0x5f8>
ffffffffc0204832:	00004617          	auipc	a2,0x4
ffffffffc0204836:	f6660613          	addi	a2,a2,-154 # ffffffffc0208798 <commands+0x410>
ffffffffc020483a:	26d00593          	li	a1,621
ffffffffc020483e:	00005517          	auipc	a0,0x5
ffffffffc0204842:	01a50513          	addi	a0,a0,26 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204846:	9c3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020484a:	00005697          	auipc	a3,0x5
ffffffffc020484e:	23e68693          	addi	a3,a3,574 # ffffffffc0209a88 <default_pmm_manager+0x5b0>
ffffffffc0204852:	00004617          	auipc	a2,0x4
ffffffffc0204856:	f4660613          	addi	a2,a2,-186 # ffffffffc0208798 <commands+0x410>
ffffffffc020485a:	26c00593          	li	a1,620
ffffffffc020485e:	00005517          	auipc	a0,0x5
ffffffffc0204862:	ffa50513          	addi	a0,a0,-6 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204866:	9a3fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020486a:	00005697          	auipc	a3,0x5
ffffffffc020486e:	1d668693          	addi	a3,a3,470 # ffffffffc0209a40 <default_pmm_manager+0x568>
ffffffffc0204872:	00004617          	auipc	a2,0x4
ffffffffc0204876:	f2660613          	addi	a2,a2,-218 # ffffffffc0208798 <commands+0x410>
ffffffffc020487a:	26b00593          	li	a1,619
ffffffffc020487e:	00005517          	auipc	a0,0x5
ffffffffc0204882:	fda50513          	addi	a0,a0,-38 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204886:	983fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc020488a <do_yield>:
ffffffffc020488a:	00015797          	auipc	a5,0x15
ffffffffc020488e:	c767b783          	ld	a5,-906(a5) # ffffffffc0219500 <current>
ffffffffc0204892:	4705                	li	a4,1
ffffffffc0204894:	ef98                	sd	a4,24(a5)
ffffffffc0204896:	4501                	li	a0,0
ffffffffc0204898:	8082                	ret

ffffffffc020489a <do_wait>:
ffffffffc020489a:	1101                	addi	sp,sp,-32
ffffffffc020489c:	e822                	sd	s0,16(sp)
ffffffffc020489e:	e426                	sd	s1,8(sp)
ffffffffc02048a0:	ec06                	sd	ra,24(sp)
ffffffffc02048a2:	842e                	mv	s0,a1
ffffffffc02048a4:	84aa                	mv	s1,a0
ffffffffc02048a6:	c999                	beqz	a1,ffffffffc02048bc <do_wait+0x22>
ffffffffc02048a8:	00015797          	auipc	a5,0x15
ffffffffc02048ac:	c587b783          	ld	a5,-936(a5) # ffffffffc0219500 <current>
ffffffffc02048b0:	7788                	ld	a0,40(a5)
ffffffffc02048b2:	4685                	li	a3,1
ffffffffc02048b4:	4611                	li	a2,4
ffffffffc02048b6:	af6fd0ef          	jal	ra,ffffffffc0201bac <user_mem_check>
ffffffffc02048ba:	c909                	beqz	a0,ffffffffc02048cc <do_wait+0x32>
ffffffffc02048bc:	85a2                	mv	a1,s0
ffffffffc02048be:	6442                	ld	s0,16(sp)
ffffffffc02048c0:	60e2                	ld	ra,24(sp)
ffffffffc02048c2:	8526                	mv	a0,s1
ffffffffc02048c4:	64a2                	ld	s1,8(sp)
ffffffffc02048c6:	6105                	addi	sp,sp,32
ffffffffc02048c8:	fa6ff06f          	j	ffffffffc020406e <do_wait.part.0>
ffffffffc02048cc:	60e2                	ld	ra,24(sp)
ffffffffc02048ce:	6442                	ld	s0,16(sp)
ffffffffc02048d0:	64a2                	ld	s1,8(sp)
ffffffffc02048d2:	5575                	li	a0,-3
ffffffffc02048d4:	6105                	addi	sp,sp,32
ffffffffc02048d6:	8082                	ret

ffffffffc02048d8 <do_kill>:
ffffffffc02048d8:	1141                	addi	sp,sp,-16
ffffffffc02048da:	e406                	sd	ra,8(sp)
ffffffffc02048dc:	e022                	sd	s0,0(sp)
ffffffffc02048de:	960ff0ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc02048e2:	cd0d                	beqz	a0,ffffffffc020491c <do_kill+0x44>
ffffffffc02048e4:	0b052703          	lw	a4,176(a0)
ffffffffc02048e8:	00177693          	andi	a3,a4,1
ffffffffc02048ec:	e695                	bnez	a3,ffffffffc0204918 <do_kill+0x40>
ffffffffc02048ee:	0ec52683          	lw	a3,236(a0)
ffffffffc02048f2:	00176713          	ori	a4,a4,1
ffffffffc02048f6:	0ae52823          	sw	a4,176(a0)
ffffffffc02048fa:	4401                	li	s0,0
ffffffffc02048fc:	0006c763          	bltz	a3,ffffffffc020490a <do_kill+0x32>
ffffffffc0204900:	60a2                	ld	ra,8(sp)
ffffffffc0204902:	8522                	mv	a0,s0
ffffffffc0204904:	6402                	ld	s0,0(sp)
ffffffffc0204906:	0141                	addi	sp,sp,16
ffffffffc0204908:	8082                	ret
ffffffffc020490a:	276000ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc020490e:	60a2                	ld	ra,8(sp)
ffffffffc0204910:	8522                	mv	a0,s0
ffffffffc0204912:	6402                	ld	s0,0(sp)
ffffffffc0204914:	0141                	addi	sp,sp,16
ffffffffc0204916:	8082                	ret
ffffffffc0204918:	545d                	li	s0,-9
ffffffffc020491a:	b7dd                	j	ffffffffc0204900 <do_kill+0x28>
ffffffffc020491c:	5475                	li	s0,-3
ffffffffc020491e:	b7cd                	j	ffffffffc0204900 <do_kill+0x28>

ffffffffc0204920 <proc_init>:
ffffffffc0204920:	1101                	addi	sp,sp,-32
ffffffffc0204922:	00015797          	auipc	a5,0x15
ffffffffc0204926:	d9e78793          	addi	a5,a5,-610 # ffffffffc02196c0 <proc_list>
ffffffffc020492a:	ec06                	sd	ra,24(sp)
ffffffffc020492c:	e822                	sd	s0,16(sp)
ffffffffc020492e:	e426                	sd	s1,8(sp)
ffffffffc0204930:	e04a                	sd	s2,0(sp)
ffffffffc0204932:	e79c                	sd	a5,8(a5)
ffffffffc0204934:	e39c                	sd	a5,0(a5)
ffffffffc0204936:	00015717          	auipc	a4,0x15
ffffffffc020493a:	b6270713          	addi	a4,a4,-1182 # ffffffffc0219498 <__rq>
ffffffffc020493e:	00011797          	auipc	a5,0x11
ffffffffc0204942:	b5a78793          	addi	a5,a5,-1190 # ffffffffc0215498 <hash_list>
ffffffffc0204946:	e79c                	sd	a5,8(a5)
ffffffffc0204948:	e39c                	sd	a5,0(a5)
ffffffffc020494a:	07c1                	addi	a5,a5,16
ffffffffc020494c:	fef71de3          	bne	a4,a5,ffffffffc0204946 <proc_init+0x26>
ffffffffc0204950:	f57fe0ef          	jal	ra,ffffffffc02038a6 <alloc_proc>
ffffffffc0204954:	00015417          	auipc	s0,0x15
ffffffffc0204958:	bb440413          	addi	s0,s0,-1100 # ffffffffc0219508 <idleproc>
ffffffffc020495c:	e008                	sd	a0,0(s0)
ffffffffc020495e:	c541                	beqz	a0,ffffffffc02049e6 <proc_init+0xc6>
ffffffffc0204960:	4709                	li	a4,2
ffffffffc0204962:	e118                	sd	a4,0(a0)
ffffffffc0204964:	4485                	li	s1,1
ffffffffc0204966:	00006717          	auipc	a4,0x6
ffffffffc020496a:	69a70713          	addi	a4,a4,1690 # ffffffffc020b000 <bootstack>
ffffffffc020496e:	00005597          	auipc	a1,0x5
ffffffffc0204972:	20a58593          	addi	a1,a1,522 # ffffffffc0209b78 <default_pmm_manager+0x6a0>
ffffffffc0204976:	e918                	sd	a4,16(a0)
ffffffffc0204978:	ed04                	sd	s1,24(a0)
ffffffffc020497a:	82eff0ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc020497e:	00015717          	auipc	a4,0x15
ffffffffc0204982:	b9a70713          	addi	a4,a4,-1126 # ffffffffc0219518 <nr_process>
ffffffffc0204986:	431c                	lw	a5,0(a4)
ffffffffc0204988:	6014                	ld	a3,0(s0)
ffffffffc020498a:	4601                	li	a2,0
ffffffffc020498c:	2785                	addiw	a5,a5,1
ffffffffc020498e:	4581                	li	a1,0
ffffffffc0204990:	00000517          	auipc	a0,0x0
ffffffffc0204994:	87450513          	addi	a0,a0,-1932 # ffffffffc0204204 <init_main>
ffffffffc0204998:	c31c                	sw	a5,0(a4)
ffffffffc020499a:	00015797          	auipc	a5,0x15
ffffffffc020499e:	b6d7b323          	sd	a3,-1178(a5) # ffffffffc0219500 <current>
ffffffffc02049a2:	cc6ff0ef          	jal	ra,ffffffffc0203e68 <kernel_thread>
ffffffffc02049a6:	08a05c63          	blez	a0,ffffffffc0204a3e <proc_init+0x11e>
ffffffffc02049aa:	894ff0ef          	jal	ra,ffffffffc0203a3e <find_proc>
ffffffffc02049ae:	00015917          	auipc	s2,0x15
ffffffffc02049b2:	b6290913          	addi	s2,s2,-1182 # ffffffffc0219510 <initproc>
ffffffffc02049b6:	00005597          	auipc	a1,0x5
ffffffffc02049ba:	1ea58593          	addi	a1,a1,490 # ffffffffc0209ba0 <default_pmm_manager+0x6c8>
ffffffffc02049be:	00a93023          	sd	a0,0(s2)
ffffffffc02049c2:	fe7fe0ef          	jal	ra,ffffffffc02039a8 <set_proc_name>
ffffffffc02049c6:	601c                	ld	a5,0(s0)
ffffffffc02049c8:	cbb9                	beqz	a5,ffffffffc0204a1e <proc_init+0xfe>
ffffffffc02049ca:	43dc                	lw	a5,4(a5)
ffffffffc02049cc:	eba9                	bnez	a5,ffffffffc0204a1e <proc_init+0xfe>
ffffffffc02049ce:	00093783          	ld	a5,0(s2)
ffffffffc02049d2:	c795                	beqz	a5,ffffffffc02049fe <proc_init+0xde>
ffffffffc02049d4:	43dc                	lw	a5,4(a5)
ffffffffc02049d6:	02979463          	bne	a5,s1,ffffffffc02049fe <proc_init+0xde>
ffffffffc02049da:	60e2                	ld	ra,24(sp)
ffffffffc02049dc:	6442                	ld	s0,16(sp)
ffffffffc02049de:	64a2                	ld	s1,8(sp)
ffffffffc02049e0:	6902                	ld	s2,0(sp)
ffffffffc02049e2:	6105                	addi	sp,sp,32
ffffffffc02049e4:	8082                	ret
ffffffffc02049e6:	00005617          	auipc	a2,0x5
ffffffffc02049ea:	17a60613          	addi	a2,a2,378 # ffffffffc0209b60 <default_pmm_manager+0x688>
ffffffffc02049ee:	37700593          	li	a1,887
ffffffffc02049f2:	00005517          	auipc	a0,0x5
ffffffffc02049f6:	e6650513          	addi	a0,a0,-410 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc02049fa:	80ffb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc02049fe:	00005697          	auipc	a3,0x5
ffffffffc0204a02:	1d268693          	addi	a3,a3,466 # ffffffffc0209bd0 <default_pmm_manager+0x6f8>
ffffffffc0204a06:	00004617          	auipc	a2,0x4
ffffffffc0204a0a:	d9260613          	addi	a2,a2,-622 # ffffffffc0208798 <commands+0x410>
ffffffffc0204a0e:	38c00593          	li	a1,908
ffffffffc0204a12:	00005517          	auipc	a0,0x5
ffffffffc0204a16:	e4650513          	addi	a0,a0,-442 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204a1a:	feefb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204a1e:	00005697          	auipc	a3,0x5
ffffffffc0204a22:	18a68693          	addi	a3,a3,394 # ffffffffc0209ba8 <default_pmm_manager+0x6d0>
ffffffffc0204a26:	00004617          	auipc	a2,0x4
ffffffffc0204a2a:	d7260613          	addi	a2,a2,-654 # ffffffffc0208798 <commands+0x410>
ffffffffc0204a2e:	38b00593          	li	a1,907
ffffffffc0204a32:	00005517          	auipc	a0,0x5
ffffffffc0204a36:	e2650513          	addi	a0,a0,-474 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204a3a:	fcefb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204a3e:	00005617          	auipc	a2,0x5
ffffffffc0204a42:	14260613          	addi	a2,a2,322 # ffffffffc0209b80 <default_pmm_manager+0x6a8>
ffffffffc0204a46:	38500593          	li	a1,901
ffffffffc0204a4a:	00005517          	auipc	a0,0x5
ffffffffc0204a4e:	e0e50513          	addi	a0,a0,-498 # ffffffffc0209858 <default_pmm_manager+0x380>
ffffffffc0204a52:	fb6fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204a56 <cpu_idle>:
ffffffffc0204a56:	1141                	addi	sp,sp,-16
ffffffffc0204a58:	e022                	sd	s0,0(sp)
ffffffffc0204a5a:	e406                	sd	ra,8(sp)
ffffffffc0204a5c:	00015417          	auipc	s0,0x15
ffffffffc0204a60:	aa440413          	addi	s0,s0,-1372 # ffffffffc0219500 <current>
ffffffffc0204a64:	6018                	ld	a4,0(s0)
ffffffffc0204a66:	6f1c                	ld	a5,24(a4)
ffffffffc0204a68:	dffd                	beqz	a5,ffffffffc0204a66 <cpu_idle+0x10>
ffffffffc0204a6a:	1c8000ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc0204a6e:	bfdd                	j	ffffffffc0204a64 <cpu_idle+0xe>

ffffffffc0204a70 <lab6_set_priority>:
ffffffffc0204a70:	1141                	addi	sp,sp,-16
ffffffffc0204a72:	e022                	sd	s0,0(sp)
ffffffffc0204a74:	85aa                	mv	a1,a0
ffffffffc0204a76:	842a                	mv	s0,a0
ffffffffc0204a78:	00005517          	auipc	a0,0x5
ffffffffc0204a7c:	18050513          	addi	a0,a0,384 # ffffffffc0209bf8 <default_pmm_manager+0x720>
ffffffffc0204a80:	e406                	sd	ra,8(sp)
ffffffffc0204a82:	e4afb0ef          	jal	ra,ffffffffc02000cc <cprintf>
ffffffffc0204a86:	00015797          	auipc	a5,0x15
ffffffffc0204a8a:	a7a7b783          	ld	a5,-1414(a5) # ffffffffc0219500 <current>
ffffffffc0204a8e:	e801                	bnez	s0,ffffffffc0204a9e <lab6_set_priority+0x2e>
ffffffffc0204a90:	60a2                	ld	ra,8(sp)
ffffffffc0204a92:	6402                	ld	s0,0(sp)
ffffffffc0204a94:	4705                	li	a4,1
ffffffffc0204a96:	14e7a223          	sw	a4,324(a5)
ffffffffc0204a9a:	0141                	addi	sp,sp,16
ffffffffc0204a9c:	8082                	ret
ffffffffc0204a9e:	60a2                	ld	ra,8(sp)
ffffffffc0204aa0:	1487a223          	sw	s0,324(a5)
ffffffffc0204aa4:	6402                	ld	s0,0(sp)
ffffffffc0204aa6:	0141                	addi	sp,sp,16
ffffffffc0204aa8:	8082                	ret

ffffffffc0204aaa <do_sleep>:
ffffffffc0204aaa:	c539                	beqz	a0,ffffffffc0204af8 <do_sleep+0x4e>
ffffffffc0204aac:	7179                	addi	sp,sp,-48
ffffffffc0204aae:	f022                	sd	s0,32(sp)
ffffffffc0204ab0:	f406                	sd	ra,40(sp)
ffffffffc0204ab2:	842a                	mv	s0,a0
ffffffffc0204ab4:	100027f3          	csrr	a5,sstatus
ffffffffc0204ab8:	8b89                	andi	a5,a5,2
ffffffffc0204aba:	e3a9                	bnez	a5,ffffffffc0204afc <do_sleep+0x52>
ffffffffc0204abc:	00015797          	auipc	a5,0x15
ffffffffc0204ac0:	a447b783          	ld	a5,-1468(a5) # ffffffffc0219500 <current>
ffffffffc0204ac4:	0818                	addi	a4,sp,16
ffffffffc0204ac6:	c02a                	sw	a0,0(sp)
ffffffffc0204ac8:	ec3a                	sd	a4,24(sp)
ffffffffc0204aca:	e83a                	sd	a4,16(sp)
ffffffffc0204acc:	e43e                	sd	a5,8(sp)
ffffffffc0204ace:	4705                	li	a4,1
ffffffffc0204ad0:	c398                	sw	a4,0(a5)
ffffffffc0204ad2:	80000737          	lui	a4,0x80000
ffffffffc0204ad6:	840a                	mv	s0,sp
ffffffffc0204ad8:	2709                	addiw	a4,a4,2
ffffffffc0204ada:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204ade:	8522                	mv	a0,s0
ffffffffc0204ae0:	218000ef          	jal	ra,ffffffffc0204cf8 <add_timer>
ffffffffc0204ae4:	14e000ef          	jal	ra,ffffffffc0204c32 <schedule>
ffffffffc0204ae8:	8522                	mv	a0,s0
ffffffffc0204aea:	2d6000ef          	jal	ra,ffffffffc0204dc0 <del_timer>
ffffffffc0204aee:	70a2                	ld	ra,40(sp)
ffffffffc0204af0:	7402                	ld	s0,32(sp)
ffffffffc0204af2:	4501                	li	a0,0
ffffffffc0204af4:	6145                	addi	sp,sp,48
ffffffffc0204af6:	8082                	ret
ffffffffc0204af8:	4501                	li	a0,0
ffffffffc0204afa:	8082                	ret
ffffffffc0204afc:	b3dfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204b00:	00015797          	auipc	a5,0x15
ffffffffc0204b04:	a007b783          	ld	a5,-1536(a5) # ffffffffc0219500 <current>
ffffffffc0204b08:	0818                	addi	a4,sp,16
ffffffffc0204b0a:	c022                	sw	s0,0(sp)
ffffffffc0204b0c:	e43e                	sd	a5,8(sp)
ffffffffc0204b0e:	ec3a                	sd	a4,24(sp)
ffffffffc0204b10:	e83a                	sd	a4,16(sp)
ffffffffc0204b12:	4705                	li	a4,1
ffffffffc0204b14:	c398                	sw	a4,0(a5)
ffffffffc0204b16:	80000737          	lui	a4,0x80000
ffffffffc0204b1a:	2709                	addiw	a4,a4,2
ffffffffc0204b1c:	840a                	mv	s0,sp
ffffffffc0204b1e:	8522                	mv	a0,s0
ffffffffc0204b20:	0ee7a623          	sw	a4,236(a5)
ffffffffc0204b24:	1d4000ef          	jal	ra,ffffffffc0204cf8 <add_timer>
ffffffffc0204b28:	b0bfb0ef          	jal	ra,ffffffffc0200632 <intr_enable>
ffffffffc0204b2c:	bf65                	j	ffffffffc0204ae4 <do_sleep+0x3a>

ffffffffc0204b2e <sched_init>:
ffffffffc0204b2e:	1141                	addi	sp,sp,-16
ffffffffc0204b30:	00009717          	auipc	a4,0x9
ffffffffc0204b34:	52070713          	addi	a4,a4,1312 # ffffffffc020e050 <default_sched_class>
ffffffffc0204b38:	e022                	sd	s0,0(sp)
ffffffffc0204b3a:	e406                	sd	ra,8(sp)
ffffffffc0204b3c:	00015797          	auipc	a5,0x15
ffffffffc0204b40:	97c78793          	addi	a5,a5,-1668 # ffffffffc02194b8 <timer_list>
ffffffffc0204b44:	6714                	ld	a3,8(a4)
ffffffffc0204b46:	00015517          	auipc	a0,0x15
ffffffffc0204b4a:	95250513          	addi	a0,a0,-1710 # ffffffffc0219498 <__rq>
ffffffffc0204b4e:	e79c                	sd	a5,8(a5)
ffffffffc0204b50:	e39c                	sd	a5,0(a5)
ffffffffc0204b52:	4795                	li	a5,5
ffffffffc0204b54:	c95c                	sw	a5,20(a0)
ffffffffc0204b56:	00015417          	auipc	s0,0x15
ffffffffc0204b5a:	9d240413          	addi	s0,s0,-1582 # ffffffffc0219528 <sched_class>
ffffffffc0204b5e:	00015797          	auipc	a5,0x15
ffffffffc0204b62:	9ca7b123          	sd	a0,-1598(a5) # ffffffffc0219520 <rq>
ffffffffc0204b66:	e018                	sd	a4,0(s0)
ffffffffc0204b68:	9682                	jalr	a3
ffffffffc0204b6a:	601c                	ld	a5,0(s0)
ffffffffc0204b6c:	6402                	ld	s0,0(sp)
ffffffffc0204b6e:	60a2                	ld	ra,8(sp)
ffffffffc0204b70:	638c                	ld	a1,0(a5)
ffffffffc0204b72:	00005517          	auipc	a0,0x5
ffffffffc0204b76:	09e50513          	addi	a0,a0,158 # ffffffffc0209c10 <default_pmm_manager+0x738>
ffffffffc0204b7a:	0141                	addi	sp,sp,16
ffffffffc0204b7c:	d50fb06f          	j	ffffffffc02000cc <cprintf>

ffffffffc0204b80 <wakeup_proc>:
ffffffffc0204b80:	4118                	lw	a4,0(a0)
ffffffffc0204b82:	1101                	addi	sp,sp,-32
ffffffffc0204b84:	ec06                	sd	ra,24(sp)
ffffffffc0204b86:	e822                	sd	s0,16(sp)
ffffffffc0204b88:	e426                	sd	s1,8(sp)
ffffffffc0204b8a:	478d                	li	a5,3
ffffffffc0204b8c:	08f70363          	beq	a4,a5,ffffffffc0204c12 <wakeup_proc+0x92>
ffffffffc0204b90:	842a                	mv	s0,a0
ffffffffc0204b92:	100027f3          	csrr	a5,sstatus
ffffffffc0204b96:	8b89                	andi	a5,a5,2
ffffffffc0204b98:	4481                	li	s1,0
ffffffffc0204b9a:	e7bd                	bnez	a5,ffffffffc0204c08 <wakeup_proc+0x88>
ffffffffc0204b9c:	4789                	li	a5,2
ffffffffc0204b9e:	04f70863          	beq	a4,a5,ffffffffc0204bee <wakeup_proc+0x6e>
ffffffffc0204ba2:	c01c                	sw	a5,0(s0)
ffffffffc0204ba4:	0e042623          	sw	zero,236(s0)
ffffffffc0204ba8:	00015797          	auipc	a5,0x15
ffffffffc0204bac:	9587b783          	ld	a5,-1704(a5) # ffffffffc0219500 <current>
ffffffffc0204bb0:	02878363          	beq	a5,s0,ffffffffc0204bd6 <wakeup_proc+0x56>
ffffffffc0204bb4:	00015797          	auipc	a5,0x15
ffffffffc0204bb8:	9547b783          	ld	a5,-1708(a5) # ffffffffc0219508 <idleproc>
ffffffffc0204bbc:	00f40d63          	beq	s0,a5,ffffffffc0204bd6 <wakeup_proc+0x56>
ffffffffc0204bc0:	00015797          	auipc	a5,0x15
ffffffffc0204bc4:	9687b783          	ld	a5,-1688(a5) # ffffffffc0219528 <sched_class>
ffffffffc0204bc8:	6b9c                	ld	a5,16(a5)
ffffffffc0204bca:	85a2                	mv	a1,s0
ffffffffc0204bcc:	00015517          	auipc	a0,0x15
ffffffffc0204bd0:	95453503          	ld	a0,-1708(a0) # ffffffffc0219520 <rq>
ffffffffc0204bd4:	9782                	jalr	a5
ffffffffc0204bd6:	e491                	bnez	s1,ffffffffc0204be2 <wakeup_proc+0x62>
ffffffffc0204bd8:	60e2                	ld	ra,24(sp)
ffffffffc0204bda:	6442                	ld	s0,16(sp)
ffffffffc0204bdc:	64a2                	ld	s1,8(sp)
ffffffffc0204bde:	6105                	addi	sp,sp,32
ffffffffc0204be0:	8082                	ret
ffffffffc0204be2:	6442                	ld	s0,16(sp)
ffffffffc0204be4:	60e2                	ld	ra,24(sp)
ffffffffc0204be6:	64a2                	ld	s1,8(sp)
ffffffffc0204be8:	6105                	addi	sp,sp,32
ffffffffc0204bea:	a49fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204bee:	00005617          	auipc	a2,0x5
ffffffffc0204bf2:	07260613          	addi	a2,a2,114 # ffffffffc0209c60 <default_pmm_manager+0x788>
ffffffffc0204bf6:	04800593          	li	a1,72
ffffffffc0204bfa:	00005517          	auipc	a0,0x5
ffffffffc0204bfe:	04e50513          	addi	a0,a0,78 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204c02:	e6efb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204c06:	bfc1                	j	ffffffffc0204bd6 <wakeup_proc+0x56>
ffffffffc0204c08:	a31fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204c0c:	4018                	lw	a4,0(s0)
ffffffffc0204c0e:	4485                	li	s1,1
ffffffffc0204c10:	b771                	j	ffffffffc0204b9c <wakeup_proc+0x1c>
ffffffffc0204c12:	00005697          	auipc	a3,0x5
ffffffffc0204c16:	01668693          	addi	a3,a3,22 # ffffffffc0209c28 <default_pmm_manager+0x750>
ffffffffc0204c1a:	00004617          	auipc	a2,0x4
ffffffffc0204c1e:	b7e60613          	addi	a2,a2,-1154 # ffffffffc0208798 <commands+0x410>
ffffffffc0204c22:	03c00593          	li	a1,60
ffffffffc0204c26:	00005517          	auipc	a0,0x5
ffffffffc0204c2a:	02250513          	addi	a0,a0,34 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204c2e:	ddafb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204c32 <schedule>:
ffffffffc0204c32:	7179                	addi	sp,sp,-48
ffffffffc0204c34:	f406                	sd	ra,40(sp)
ffffffffc0204c36:	f022                	sd	s0,32(sp)
ffffffffc0204c38:	ec26                	sd	s1,24(sp)
ffffffffc0204c3a:	e84a                	sd	s2,16(sp)
ffffffffc0204c3c:	e44e                	sd	s3,8(sp)
ffffffffc0204c3e:	e052                	sd	s4,0(sp)
ffffffffc0204c40:	100027f3          	csrr	a5,sstatus
ffffffffc0204c44:	8b89                	andi	a5,a5,2
ffffffffc0204c46:	4a01                	li	s4,0
ffffffffc0204c48:	e7c5                	bnez	a5,ffffffffc0204cf0 <schedule+0xbe>
ffffffffc0204c4a:	00015497          	auipc	s1,0x15
ffffffffc0204c4e:	8b648493          	addi	s1,s1,-1866 # ffffffffc0219500 <current>
ffffffffc0204c52:	608c                	ld	a1,0(s1)
ffffffffc0204c54:	00015997          	auipc	s3,0x15
ffffffffc0204c58:	8d498993          	addi	s3,s3,-1836 # ffffffffc0219528 <sched_class>
ffffffffc0204c5c:	00015917          	auipc	s2,0x15
ffffffffc0204c60:	8c490913          	addi	s2,s2,-1852 # ffffffffc0219520 <rq>
ffffffffc0204c64:	4194                	lw	a3,0(a1)
ffffffffc0204c66:	0005bc23          	sd	zero,24(a1)
ffffffffc0204c6a:	4709                	li	a4,2
ffffffffc0204c6c:	0009b783          	ld	a5,0(s3)
ffffffffc0204c70:	00093503          	ld	a0,0(s2)
ffffffffc0204c74:	04e68063          	beq	a3,a4,ffffffffc0204cb4 <schedule+0x82>
ffffffffc0204c78:	739c                	ld	a5,32(a5)
ffffffffc0204c7a:	9782                	jalr	a5
ffffffffc0204c7c:	842a                	mv	s0,a0
ffffffffc0204c7e:	c939                	beqz	a0,ffffffffc0204cd4 <schedule+0xa2>
ffffffffc0204c80:	0009b783          	ld	a5,0(s3)
ffffffffc0204c84:	00093503          	ld	a0,0(s2)
ffffffffc0204c88:	85a2                	mv	a1,s0
ffffffffc0204c8a:	6f9c                	ld	a5,24(a5)
ffffffffc0204c8c:	9782                	jalr	a5
ffffffffc0204c8e:	441c                	lw	a5,8(s0)
ffffffffc0204c90:	6098                	ld	a4,0(s1)
ffffffffc0204c92:	2785                	addiw	a5,a5,1
ffffffffc0204c94:	c41c                	sw	a5,8(s0)
ffffffffc0204c96:	00870563          	beq	a4,s0,ffffffffc0204ca0 <schedule+0x6e>
ffffffffc0204c9a:	8522                	mv	a0,s0
ffffffffc0204c9c:	d37fe0ef          	jal	ra,ffffffffc02039d2 <proc_run>
ffffffffc0204ca0:	020a1f63          	bnez	s4,ffffffffc0204cde <schedule+0xac>
ffffffffc0204ca4:	70a2                	ld	ra,40(sp)
ffffffffc0204ca6:	7402                	ld	s0,32(sp)
ffffffffc0204ca8:	64e2                	ld	s1,24(sp)
ffffffffc0204caa:	6942                	ld	s2,16(sp)
ffffffffc0204cac:	69a2                	ld	s3,8(sp)
ffffffffc0204cae:	6a02                	ld	s4,0(sp)
ffffffffc0204cb0:	6145                	addi	sp,sp,48
ffffffffc0204cb2:	8082                	ret
ffffffffc0204cb4:	00015717          	auipc	a4,0x15
ffffffffc0204cb8:	85473703          	ld	a4,-1964(a4) # ffffffffc0219508 <idleproc>
ffffffffc0204cbc:	fae58ee3          	beq	a1,a4,ffffffffc0204c78 <schedule+0x46>
ffffffffc0204cc0:	6b9c                	ld	a5,16(a5)
ffffffffc0204cc2:	9782                	jalr	a5
ffffffffc0204cc4:	0009b783          	ld	a5,0(s3)
ffffffffc0204cc8:	00093503          	ld	a0,0(s2)
ffffffffc0204ccc:	739c                	ld	a5,32(a5)
ffffffffc0204cce:	9782                	jalr	a5
ffffffffc0204cd0:	842a                	mv	s0,a0
ffffffffc0204cd2:	f55d                	bnez	a0,ffffffffc0204c80 <schedule+0x4e>
ffffffffc0204cd4:	00015417          	auipc	s0,0x15
ffffffffc0204cd8:	83443403          	ld	s0,-1996(s0) # ffffffffc0219508 <idleproc>
ffffffffc0204cdc:	bf4d                	j	ffffffffc0204c8e <schedule+0x5c>
ffffffffc0204cde:	7402                	ld	s0,32(sp)
ffffffffc0204ce0:	70a2                	ld	ra,40(sp)
ffffffffc0204ce2:	64e2                	ld	s1,24(sp)
ffffffffc0204ce4:	6942                	ld	s2,16(sp)
ffffffffc0204ce6:	69a2                	ld	s3,8(sp)
ffffffffc0204ce8:	6a02                	ld	s4,0(sp)
ffffffffc0204cea:	6145                	addi	sp,sp,48
ffffffffc0204cec:	947fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204cf0:	949fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204cf4:	4a05                	li	s4,1
ffffffffc0204cf6:	bf91                	j	ffffffffc0204c4a <schedule+0x18>

ffffffffc0204cf8 <add_timer>:
ffffffffc0204cf8:	1141                	addi	sp,sp,-16
ffffffffc0204cfa:	e022                	sd	s0,0(sp)
ffffffffc0204cfc:	e406                	sd	ra,8(sp)
ffffffffc0204cfe:	842a                	mv	s0,a0
ffffffffc0204d00:	100027f3          	csrr	a5,sstatus
ffffffffc0204d04:	8b89                	andi	a5,a5,2
ffffffffc0204d06:	4501                	li	a0,0
ffffffffc0204d08:	eba5                	bnez	a5,ffffffffc0204d78 <add_timer+0x80>
ffffffffc0204d0a:	401c                	lw	a5,0(s0)
ffffffffc0204d0c:	cbb5                	beqz	a5,ffffffffc0204d80 <add_timer+0x88>
ffffffffc0204d0e:	6418                	ld	a4,8(s0)
ffffffffc0204d10:	cb25                	beqz	a4,ffffffffc0204d80 <add_timer+0x88>
ffffffffc0204d12:	6c18                	ld	a4,24(s0)
ffffffffc0204d14:	01040593          	addi	a1,s0,16
ffffffffc0204d18:	08e59463          	bne	a1,a4,ffffffffc0204da0 <add_timer+0xa8>
ffffffffc0204d1c:	00014617          	auipc	a2,0x14
ffffffffc0204d20:	79c60613          	addi	a2,a2,1948 # ffffffffc02194b8 <timer_list>
ffffffffc0204d24:	6618                	ld	a4,8(a2)
ffffffffc0204d26:	00c71863          	bne	a4,a2,ffffffffc0204d36 <add_timer+0x3e>
ffffffffc0204d2a:	a80d                	j	ffffffffc0204d5c <add_timer+0x64>
ffffffffc0204d2c:	6718                	ld	a4,8(a4)
ffffffffc0204d2e:	9f95                	subw	a5,a5,a3
ffffffffc0204d30:	c01c                	sw	a5,0(s0)
ffffffffc0204d32:	02c70563          	beq	a4,a2,ffffffffc0204d5c <add_timer+0x64>
ffffffffc0204d36:	ff072683          	lw	a3,-16(a4)
ffffffffc0204d3a:	fed7f9e3          	bgeu	a5,a3,ffffffffc0204d2c <add_timer+0x34>
ffffffffc0204d3e:	40f687bb          	subw	a5,a3,a5
ffffffffc0204d42:	fef72823          	sw	a5,-16(a4)
ffffffffc0204d46:	631c                	ld	a5,0(a4)
ffffffffc0204d48:	e30c                	sd	a1,0(a4)
ffffffffc0204d4a:	e78c                	sd	a1,8(a5)
ffffffffc0204d4c:	ec18                	sd	a4,24(s0)
ffffffffc0204d4e:	e81c                	sd	a5,16(s0)
ffffffffc0204d50:	c105                	beqz	a0,ffffffffc0204d70 <add_timer+0x78>
ffffffffc0204d52:	6402                	ld	s0,0(sp)
ffffffffc0204d54:	60a2                	ld	ra,8(sp)
ffffffffc0204d56:	0141                	addi	sp,sp,16
ffffffffc0204d58:	8dbfb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204d5c:	00014717          	auipc	a4,0x14
ffffffffc0204d60:	75c70713          	addi	a4,a4,1884 # ffffffffc02194b8 <timer_list>
ffffffffc0204d64:	631c                	ld	a5,0(a4)
ffffffffc0204d66:	e30c                	sd	a1,0(a4)
ffffffffc0204d68:	e78c                	sd	a1,8(a5)
ffffffffc0204d6a:	ec18                	sd	a4,24(s0)
ffffffffc0204d6c:	e81c                	sd	a5,16(s0)
ffffffffc0204d6e:	f175                	bnez	a0,ffffffffc0204d52 <add_timer+0x5a>
ffffffffc0204d70:	60a2                	ld	ra,8(sp)
ffffffffc0204d72:	6402                	ld	s0,0(sp)
ffffffffc0204d74:	0141                	addi	sp,sp,16
ffffffffc0204d76:	8082                	ret
ffffffffc0204d78:	8c1fb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204d7c:	4505                	li	a0,1
ffffffffc0204d7e:	b771                	j	ffffffffc0204d0a <add_timer+0x12>
ffffffffc0204d80:	00005697          	auipc	a3,0x5
ffffffffc0204d84:	f0068693          	addi	a3,a3,-256 # ffffffffc0209c80 <default_pmm_manager+0x7a8>
ffffffffc0204d88:	00004617          	auipc	a2,0x4
ffffffffc0204d8c:	a1060613          	addi	a2,a2,-1520 # ffffffffc0208798 <commands+0x410>
ffffffffc0204d90:	06c00593          	li	a1,108
ffffffffc0204d94:	00005517          	auipc	a0,0x5
ffffffffc0204d98:	eb450513          	addi	a0,a0,-332 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204d9c:	c6cfb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204da0:	00005697          	auipc	a3,0x5
ffffffffc0204da4:	f1068693          	addi	a3,a3,-240 # ffffffffc0209cb0 <default_pmm_manager+0x7d8>
ffffffffc0204da8:	00004617          	auipc	a2,0x4
ffffffffc0204dac:	9f060613          	addi	a2,a2,-1552 # ffffffffc0208798 <commands+0x410>
ffffffffc0204db0:	06d00593          	li	a1,109
ffffffffc0204db4:	00005517          	auipc	a0,0x5
ffffffffc0204db8:	e9450513          	addi	a0,a0,-364 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204dbc:	c4cfb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204dc0 <del_timer>:
ffffffffc0204dc0:	1101                	addi	sp,sp,-32
ffffffffc0204dc2:	e822                	sd	s0,16(sp)
ffffffffc0204dc4:	ec06                	sd	ra,24(sp)
ffffffffc0204dc6:	e426                	sd	s1,8(sp)
ffffffffc0204dc8:	842a                	mv	s0,a0
ffffffffc0204dca:	100027f3          	csrr	a5,sstatus
ffffffffc0204dce:	8b89                	andi	a5,a5,2
ffffffffc0204dd0:	01050493          	addi	s1,a0,16
ffffffffc0204dd4:	eb9d                	bnez	a5,ffffffffc0204e0a <del_timer+0x4a>
ffffffffc0204dd6:	6d1c                	ld	a5,24(a0)
ffffffffc0204dd8:	02978463          	beq	a5,s1,ffffffffc0204e00 <del_timer+0x40>
ffffffffc0204ddc:	4114                	lw	a3,0(a0)
ffffffffc0204dde:	6918                	ld	a4,16(a0)
ffffffffc0204de0:	ce81                	beqz	a3,ffffffffc0204df8 <del_timer+0x38>
ffffffffc0204de2:	00014617          	auipc	a2,0x14
ffffffffc0204de6:	6d660613          	addi	a2,a2,1750 # ffffffffc02194b8 <timer_list>
ffffffffc0204dea:	00c78763          	beq	a5,a2,ffffffffc0204df8 <del_timer+0x38>
ffffffffc0204dee:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204df2:	9eb1                	addw	a3,a3,a2
ffffffffc0204df4:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204df8:	e71c                	sd	a5,8(a4)
ffffffffc0204dfa:	e398                	sd	a4,0(a5)
ffffffffc0204dfc:	ec04                	sd	s1,24(s0)
ffffffffc0204dfe:	e804                	sd	s1,16(s0)
ffffffffc0204e00:	60e2                	ld	ra,24(sp)
ffffffffc0204e02:	6442                	ld	s0,16(sp)
ffffffffc0204e04:	64a2                	ld	s1,8(sp)
ffffffffc0204e06:	6105                	addi	sp,sp,32
ffffffffc0204e08:	8082                	ret
ffffffffc0204e0a:	82ffb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204e0e:	6c1c                	ld	a5,24(s0)
ffffffffc0204e10:	02978463          	beq	a5,s1,ffffffffc0204e38 <del_timer+0x78>
ffffffffc0204e14:	4014                	lw	a3,0(s0)
ffffffffc0204e16:	6818                	ld	a4,16(s0)
ffffffffc0204e18:	ce81                	beqz	a3,ffffffffc0204e30 <del_timer+0x70>
ffffffffc0204e1a:	00014617          	auipc	a2,0x14
ffffffffc0204e1e:	69e60613          	addi	a2,a2,1694 # ffffffffc02194b8 <timer_list>
ffffffffc0204e22:	00c78763          	beq	a5,a2,ffffffffc0204e30 <del_timer+0x70>
ffffffffc0204e26:	ff07a603          	lw	a2,-16(a5)
ffffffffc0204e2a:	9eb1                	addw	a3,a3,a2
ffffffffc0204e2c:	fed7a823          	sw	a3,-16(a5)
ffffffffc0204e30:	e71c                	sd	a5,8(a4)
ffffffffc0204e32:	e398                	sd	a4,0(a5)
ffffffffc0204e34:	ec04                	sd	s1,24(s0)
ffffffffc0204e36:	e804                	sd	s1,16(s0)
ffffffffc0204e38:	6442                	ld	s0,16(sp)
ffffffffc0204e3a:	60e2                	ld	ra,24(sp)
ffffffffc0204e3c:	64a2                	ld	s1,8(sp)
ffffffffc0204e3e:	6105                	addi	sp,sp,32
ffffffffc0204e40:	ff2fb06f          	j	ffffffffc0200632 <intr_enable>

ffffffffc0204e44 <run_timer_list>:
ffffffffc0204e44:	7139                	addi	sp,sp,-64
ffffffffc0204e46:	fc06                	sd	ra,56(sp)
ffffffffc0204e48:	f822                	sd	s0,48(sp)
ffffffffc0204e4a:	f426                	sd	s1,40(sp)
ffffffffc0204e4c:	f04a                	sd	s2,32(sp)
ffffffffc0204e4e:	ec4e                	sd	s3,24(sp)
ffffffffc0204e50:	e852                	sd	s4,16(sp)
ffffffffc0204e52:	e456                	sd	s5,8(sp)
ffffffffc0204e54:	e05a                	sd	s6,0(sp)
ffffffffc0204e56:	100027f3          	csrr	a5,sstatus
ffffffffc0204e5a:	8b89                	andi	a5,a5,2
ffffffffc0204e5c:	4b01                	li	s6,0
ffffffffc0204e5e:	eff9                	bnez	a5,ffffffffc0204f3c <run_timer_list+0xf8>
ffffffffc0204e60:	00014997          	auipc	s3,0x14
ffffffffc0204e64:	65898993          	addi	s3,s3,1624 # ffffffffc02194b8 <timer_list>
ffffffffc0204e68:	0089b403          	ld	s0,8(s3)
ffffffffc0204e6c:	07340a63          	beq	s0,s3,ffffffffc0204ee0 <run_timer_list+0x9c>
ffffffffc0204e70:	ff042783          	lw	a5,-16(s0)
ffffffffc0204e74:	ff040913          	addi	s2,s0,-16
ffffffffc0204e78:	0e078663          	beqz	a5,ffffffffc0204f64 <run_timer_list+0x120>
ffffffffc0204e7c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0204e80:	fee42823          	sw	a4,-16(s0)
ffffffffc0204e84:	ef31                	bnez	a4,ffffffffc0204ee0 <run_timer_list+0x9c>
ffffffffc0204e86:	00005a97          	auipc	s5,0x5
ffffffffc0204e8a:	e92a8a93          	addi	s5,s5,-366 # ffffffffc0209d18 <default_pmm_manager+0x840>
ffffffffc0204e8e:	00005a17          	auipc	s4,0x5
ffffffffc0204e92:	dbaa0a13          	addi	s4,s4,-582 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204e96:	a005                	j	ffffffffc0204eb6 <run_timer_list+0x72>
ffffffffc0204e98:	0a07d663          	bgez	a5,ffffffffc0204f44 <run_timer_list+0x100>
ffffffffc0204e9c:	8526                	mv	a0,s1
ffffffffc0204e9e:	ce3ff0ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc0204ea2:	854a                	mv	a0,s2
ffffffffc0204ea4:	f1dff0ef          	jal	ra,ffffffffc0204dc0 <del_timer>
ffffffffc0204ea8:	03340c63          	beq	s0,s3,ffffffffc0204ee0 <run_timer_list+0x9c>
ffffffffc0204eac:	ff042783          	lw	a5,-16(s0)
ffffffffc0204eb0:	ff040913          	addi	s2,s0,-16
ffffffffc0204eb4:	e795                	bnez	a5,ffffffffc0204ee0 <run_timer_list+0x9c>
ffffffffc0204eb6:	00893483          	ld	s1,8(s2)
ffffffffc0204eba:	6400                	ld	s0,8(s0)
ffffffffc0204ebc:	0ec4a783          	lw	a5,236(s1)
ffffffffc0204ec0:	ffe1                	bnez	a5,ffffffffc0204e98 <run_timer_list+0x54>
ffffffffc0204ec2:	40d4                	lw	a3,4(s1)
ffffffffc0204ec4:	8656                	mv	a2,s5
ffffffffc0204ec6:	0a300593          	li	a1,163
ffffffffc0204eca:	8552                	mv	a0,s4
ffffffffc0204ecc:	ba4fb0ef          	jal	ra,ffffffffc0200270 <__warn>
ffffffffc0204ed0:	8526                	mv	a0,s1
ffffffffc0204ed2:	cafff0ef          	jal	ra,ffffffffc0204b80 <wakeup_proc>
ffffffffc0204ed6:	854a                	mv	a0,s2
ffffffffc0204ed8:	ee9ff0ef          	jal	ra,ffffffffc0204dc0 <del_timer>
ffffffffc0204edc:	fd3418e3          	bne	s0,s3,ffffffffc0204eac <run_timer_list+0x68>
ffffffffc0204ee0:	00014597          	auipc	a1,0x14
ffffffffc0204ee4:	6205b583          	ld	a1,1568(a1) # ffffffffc0219500 <current>
ffffffffc0204ee8:	00014797          	auipc	a5,0x14
ffffffffc0204eec:	6207b783          	ld	a5,1568(a5) # ffffffffc0219508 <idleproc>
ffffffffc0204ef0:	04f58363          	beq	a1,a5,ffffffffc0204f36 <run_timer_list+0xf2>
ffffffffc0204ef4:	00014797          	auipc	a5,0x14
ffffffffc0204ef8:	6347b783          	ld	a5,1588(a5) # ffffffffc0219528 <sched_class>
ffffffffc0204efc:	779c                	ld	a5,40(a5)
ffffffffc0204efe:	00014517          	auipc	a0,0x14
ffffffffc0204f02:	62253503          	ld	a0,1570(a0) # ffffffffc0219520 <rq>
ffffffffc0204f06:	9782                	jalr	a5
ffffffffc0204f08:	000b1c63          	bnez	s6,ffffffffc0204f20 <run_timer_list+0xdc>
ffffffffc0204f0c:	70e2                	ld	ra,56(sp)
ffffffffc0204f0e:	7442                	ld	s0,48(sp)
ffffffffc0204f10:	74a2                	ld	s1,40(sp)
ffffffffc0204f12:	7902                	ld	s2,32(sp)
ffffffffc0204f14:	69e2                	ld	s3,24(sp)
ffffffffc0204f16:	6a42                	ld	s4,16(sp)
ffffffffc0204f18:	6aa2                	ld	s5,8(sp)
ffffffffc0204f1a:	6b02                	ld	s6,0(sp)
ffffffffc0204f1c:	6121                	addi	sp,sp,64
ffffffffc0204f1e:	8082                	ret
ffffffffc0204f20:	7442                	ld	s0,48(sp)
ffffffffc0204f22:	70e2                	ld	ra,56(sp)
ffffffffc0204f24:	74a2                	ld	s1,40(sp)
ffffffffc0204f26:	7902                	ld	s2,32(sp)
ffffffffc0204f28:	69e2                	ld	s3,24(sp)
ffffffffc0204f2a:	6a42                	ld	s4,16(sp)
ffffffffc0204f2c:	6aa2                	ld	s5,8(sp)
ffffffffc0204f2e:	6b02                	ld	s6,0(sp)
ffffffffc0204f30:	6121                	addi	sp,sp,64
ffffffffc0204f32:	f00fb06f          	j	ffffffffc0200632 <intr_enable>
ffffffffc0204f36:	4785                	li	a5,1
ffffffffc0204f38:	ed9c                	sd	a5,24(a1)
ffffffffc0204f3a:	b7f9                	j	ffffffffc0204f08 <run_timer_list+0xc4>
ffffffffc0204f3c:	efcfb0ef          	jal	ra,ffffffffc0200638 <intr_disable>
ffffffffc0204f40:	4b05                	li	s6,1
ffffffffc0204f42:	bf39                	j	ffffffffc0204e60 <run_timer_list+0x1c>
ffffffffc0204f44:	00005697          	auipc	a3,0x5
ffffffffc0204f48:	dac68693          	addi	a3,a3,-596 # ffffffffc0209cf0 <default_pmm_manager+0x818>
ffffffffc0204f4c:	00004617          	auipc	a2,0x4
ffffffffc0204f50:	84c60613          	addi	a2,a2,-1972 # ffffffffc0208798 <commands+0x410>
ffffffffc0204f54:	0a000593          	li	a1,160
ffffffffc0204f58:	00005517          	auipc	a0,0x5
ffffffffc0204f5c:	cf050513          	addi	a0,a0,-784 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204f60:	aa8fb0ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc0204f64:	00005697          	auipc	a3,0x5
ffffffffc0204f68:	d7468693          	addi	a3,a3,-652 # ffffffffc0209cd8 <default_pmm_manager+0x800>
ffffffffc0204f6c:	00004617          	auipc	a2,0x4
ffffffffc0204f70:	82c60613          	addi	a2,a2,-2004 # ffffffffc0208798 <commands+0x410>
ffffffffc0204f74:	09a00593          	li	a1,154
ffffffffc0204f78:	00005517          	auipc	a0,0x5
ffffffffc0204f7c:	cd050513          	addi	a0,a0,-816 # ffffffffc0209c48 <default_pmm_manager+0x770>
ffffffffc0204f80:	a88fb0ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0204f84 <proc_stride_comp_f>:
ffffffffc0204f84:	4d08                	lw	a0,24(a0)
ffffffffc0204f86:	4d9c                	lw	a5,24(a1)
ffffffffc0204f88:	9d1d                	subw	a0,a0,a5
ffffffffc0204f8a:	00a04763          	bgtz	a0,ffffffffc0204f98 <proc_stride_comp_f+0x14>
ffffffffc0204f8e:	00a03533          	snez	a0,a0
ffffffffc0204f92:	40a00533          	neg	a0,a0
ffffffffc0204f96:	8082                	ret
ffffffffc0204f98:	4505                	li	a0,1
ffffffffc0204f9a:	8082                	ret

ffffffffc0204f9c <stride_init>:
ffffffffc0204f9c:	e508                	sd	a0,8(a0)
ffffffffc0204f9e:	e108                	sd	a0,0(a0)
ffffffffc0204fa0:	00053c23          	sd	zero,24(a0)
ffffffffc0204fa4:	00052823          	sw	zero,16(a0)
ffffffffc0204fa8:	8082                	ret

ffffffffc0204faa <stride_pick_next>:
ffffffffc0204faa:	6d1c                	ld	a5,24(a0)
ffffffffc0204fac:	cf89                	beqz	a5,ffffffffc0204fc6 <stride_pick_next+0x1c>
ffffffffc0204fae:	4fd0                	lw	a2,28(a5)
ffffffffc0204fb0:	4f98                	lw	a4,24(a5)
ffffffffc0204fb2:	ed878513          	addi	a0,a5,-296
ffffffffc0204fb6:	400006b7          	lui	a3,0x40000
ffffffffc0204fba:	c219                	beqz	a2,ffffffffc0204fc0 <stride_pick_next+0x16>
ffffffffc0204fbc:	02c6d6bb          	divuw	a3,a3,a2
ffffffffc0204fc0:	9f35                	addw	a4,a4,a3
ffffffffc0204fc2:	cf98                	sw	a4,24(a5)
ffffffffc0204fc4:	8082                	ret
ffffffffc0204fc6:	4501                	li	a0,0
ffffffffc0204fc8:	8082                	ret

ffffffffc0204fca <stride_proc_tick>:
ffffffffc0204fca:	1205a783          	lw	a5,288(a1)
ffffffffc0204fce:	00f05563          	blez	a5,ffffffffc0204fd8 <stride_proc_tick+0xe>
ffffffffc0204fd2:	37fd                	addiw	a5,a5,-1
ffffffffc0204fd4:	12f5a023          	sw	a5,288(a1)
ffffffffc0204fd8:	e399                	bnez	a5,ffffffffc0204fde <stride_proc_tick+0x14>
ffffffffc0204fda:	4785                	li	a5,1
ffffffffc0204fdc:	ed9c                	sd	a5,24(a1)
ffffffffc0204fde:	8082                	ret

ffffffffc0204fe0 <skew_heap_merge.constprop.0>:
ffffffffc0204fe0:	1101                	addi	sp,sp,-32
ffffffffc0204fe2:	e822                	sd	s0,16(sp)
ffffffffc0204fe4:	ec06                	sd	ra,24(sp)
ffffffffc0204fe6:	e426                	sd	s1,8(sp)
ffffffffc0204fe8:	e04a                	sd	s2,0(sp)
ffffffffc0204fea:	842e                	mv	s0,a1
ffffffffc0204fec:	c11d                	beqz	a0,ffffffffc0205012 <skew_heap_merge.constprop.0+0x32>
ffffffffc0204fee:	84aa                	mv	s1,a0
ffffffffc0204ff0:	c1b9                	beqz	a1,ffffffffc0205036 <skew_heap_merge.constprop.0+0x56>
ffffffffc0204ff2:	f93ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0204ff6:	57fd                	li	a5,-1
ffffffffc0204ff8:	02f50463          	beq	a0,a5,ffffffffc0205020 <skew_heap_merge.constprop.0+0x40>
ffffffffc0204ffc:	680c                	ld	a1,16(s0)
ffffffffc0204ffe:	00843903          	ld	s2,8(s0)
ffffffffc0205002:	8526                	mv	a0,s1
ffffffffc0205004:	fddff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205008:	e408                	sd	a0,8(s0)
ffffffffc020500a:	01243823          	sd	s2,16(s0)
ffffffffc020500e:	c111                	beqz	a0,ffffffffc0205012 <skew_heap_merge.constprop.0+0x32>
ffffffffc0205010:	e100                	sd	s0,0(a0)
ffffffffc0205012:	60e2                	ld	ra,24(sp)
ffffffffc0205014:	8522                	mv	a0,s0
ffffffffc0205016:	6442                	ld	s0,16(sp)
ffffffffc0205018:	64a2                	ld	s1,8(sp)
ffffffffc020501a:	6902                	ld	s2,0(sp)
ffffffffc020501c:	6105                	addi	sp,sp,32
ffffffffc020501e:	8082                	ret
ffffffffc0205020:	6888                	ld	a0,16(s1)
ffffffffc0205022:	0084b903          	ld	s2,8(s1)
ffffffffc0205026:	85a2                	mv	a1,s0
ffffffffc0205028:	fb9ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020502c:	e488                	sd	a0,8(s1)
ffffffffc020502e:	0124b823          	sd	s2,16(s1)
ffffffffc0205032:	c111                	beqz	a0,ffffffffc0205036 <skew_heap_merge.constprop.0+0x56>
ffffffffc0205034:	e104                	sd	s1,0(a0)
ffffffffc0205036:	60e2                	ld	ra,24(sp)
ffffffffc0205038:	6442                	ld	s0,16(sp)
ffffffffc020503a:	6902                	ld	s2,0(sp)
ffffffffc020503c:	8526                	mv	a0,s1
ffffffffc020503e:	64a2                	ld	s1,8(sp)
ffffffffc0205040:	6105                	addi	sp,sp,32
ffffffffc0205042:	8082                	ret

ffffffffc0205044 <stride_enqueue>:
ffffffffc0205044:	7119                	addi	sp,sp,-128
ffffffffc0205046:	f4a6                	sd	s1,104(sp)
ffffffffc0205048:	6d04                	ld	s1,24(a0)
ffffffffc020504a:	f8a2                	sd	s0,112(sp)
ffffffffc020504c:	f0ca                	sd	s2,96(sp)
ffffffffc020504e:	e8d2                	sd	s4,80(sp)
ffffffffc0205050:	fc86                	sd	ra,120(sp)
ffffffffc0205052:	ecce                	sd	s3,88(sp)
ffffffffc0205054:	e4d6                	sd	s5,72(sp)
ffffffffc0205056:	e0da                	sd	s6,64(sp)
ffffffffc0205058:	fc5e                	sd	s7,56(sp)
ffffffffc020505a:	f862                	sd	s8,48(sp)
ffffffffc020505c:	f466                	sd	s9,40(sp)
ffffffffc020505e:	f06a                	sd	s10,32(sp)
ffffffffc0205060:	ec6e                	sd	s11,24(sp)
ffffffffc0205062:	1205b423          	sd	zero,296(a1)
ffffffffc0205066:	1205bc23          	sd	zero,312(a1)
ffffffffc020506a:	1205b823          	sd	zero,304(a1)
ffffffffc020506e:	8a2a                	mv	s4,a0
ffffffffc0205070:	842e                	mv	s0,a1
ffffffffc0205072:	12858913          	addi	s2,a1,296
ffffffffc0205076:	cc89                	beqz	s1,ffffffffc0205090 <stride_enqueue+0x4c>
ffffffffc0205078:	85ca                	mv	a1,s2
ffffffffc020507a:	8526                	mv	a0,s1
ffffffffc020507c:	f09ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205080:	57fd                	li	a5,-1
ffffffffc0205082:	89aa                	mv	s3,a0
ffffffffc0205084:	04f50763          	beq	a0,a5,ffffffffc02050d2 <stride_enqueue+0x8e>
ffffffffc0205088:	12943823          	sd	s1,304(s0)
ffffffffc020508c:	0124b023          	sd	s2,0(s1)
ffffffffc0205090:	12042783          	lw	a5,288(s0)
ffffffffc0205094:	012a3c23          	sd	s2,24(s4)
ffffffffc0205098:	014a2703          	lw	a4,20(s4)
ffffffffc020509c:	c399                	beqz	a5,ffffffffc02050a2 <stride_enqueue+0x5e>
ffffffffc020509e:	00f75463          	bge	a4,a5,ffffffffc02050a6 <stride_enqueue+0x62>
ffffffffc02050a2:	12e42023          	sw	a4,288(s0)
ffffffffc02050a6:	010a2783          	lw	a5,16(s4)
ffffffffc02050aa:	70e6                	ld	ra,120(sp)
ffffffffc02050ac:	11443423          	sd	s4,264(s0)
ffffffffc02050b0:	7446                	ld	s0,112(sp)
ffffffffc02050b2:	2785                	addiw	a5,a5,1
ffffffffc02050b4:	00fa2823          	sw	a5,16(s4)
ffffffffc02050b8:	74a6                	ld	s1,104(sp)
ffffffffc02050ba:	7906                	ld	s2,96(sp)
ffffffffc02050bc:	69e6                	ld	s3,88(sp)
ffffffffc02050be:	6a46                	ld	s4,80(sp)
ffffffffc02050c0:	6aa6                	ld	s5,72(sp)
ffffffffc02050c2:	6b06                	ld	s6,64(sp)
ffffffffc02050c4:	7be2                	ld	s7,56(sp)
ffffffffc02050c6:	7c42                	ld	s8,48(sp)
ffffffffc02050c8:	7ca2                	ld	s9,40(sp)
ffffffffc02050ca:	7d02                	ld	s10,32(sp)
ffffffffc02050cc:	6de2                	ld	s11,24(sp)
ffffffffc02050ce:	6109                	addi	sp,sp,128
ffffffffc02050d0:	8082                	ret
ffffffffc02050d2:	0104ba83          	ld	s5,16(s1)
ffffffffc02050d6:	0084bb83          	ld	s7,8(s1)
ffffffffc02050da:	000a8d63          	beqz	s5,ffffffffc02050f4 <stride_enqueue+0xb0>
ffffffffc02050de:	85ca                	mv	a1,s2
ffffffffc02050e0:	8556                	mv	a0,s5
ffffffffc02050e2:	ea3ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02050e6:	8b2a                	mv	s6,a0
ffffffffc02050e8:	01350e63          	beq	a0,s3,ffffffffc0205104 <stride_enqueue+0xc0>
ffffffffc02050ec:	13543823          	sd	s5,304(s0)
ffffffffc02050f0:	012ab023          	sd	s2,0(s5)
ffffffffc02050f4:	0124b423          	sd	s2,8(s1)
ffffffffc02050f8:	0174b823          	sd	s7,16(s1)
ffffffffc02050fc:	00993023          	sd	s1,0(s2)
ffffffffc0205100:	8926                	mv	s2,s1
ffffffffc0205102:	b779                	j	ffffffffc0205090 <stride_enqueue+0x4c>
ffffffffc0205104:	010ab983          	ld	s3,16(s5)
ffffffffc0205108:	008abc83          	ld	s9,8(s5)
ffffffffc020510c:	00098d63          	beqz	s3,ffffffffc0205126 <stride_enqueue+0xe2>
ffffffffc0205110:	85ca                	mv	a1,s2
ffffffffc0205112:	854e                	mv	a0,s3
ffffffffc0205114:	e71ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205118:	8c2a                	mv	s8,a0
ffffffffc020511a:	01650e63          	beq	a0,s6,ffffffffc0205136 <stride_enqueue+0xf2>
ffffffffc020511e:	13343823          	sd	s3,304(s0)
ffffffffc0205122:	0129b023          	sd	s2,0(s3)
ffffffffc0205126:	012ab423          	sd	s2,8(s5)
ffffffffc020512a:	019ab823          	sd	s9,16(s5)
ffffffffc020512e:	01593023          	sd	s5,0(s2)
ffffffffc0205132:	8956                	mv	s2,s5
ffffffffc0205134:	b7c1                	j	ffffffffc02050f4 <stride_enqueue+0xb0>
ffffffffc0205136:	0109bb03          	ld	s6,16(s3)
ffffffffc020513a:	0089bd83          	ld	s11,8(s3)
ffffffffc020513e:	000b0d63          	beqz	s6,ffffffffc0205158 <stride_enqueue+0x114>
ffffffffc0205142:	85ca                	mv	a1,s2
ffffffffc0205144:	855a                	mv	a0,s6
ffffffffc0205146:	e3fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020514a:	8d2a                	mv	s10,a0
ffffffffc020514c:	01850e63          	beq	a0,s8,ffffffffc0205168 <stride_enqueue+0x124>
ffffffffc0205150:	13643823          	sd	s6,304(s0)
ffffffffc0205154:	012b3023          	sd	s2,0(s6)
ffffffffc0205158:	0129b423          	sd	s2,8(s3)
ffffffffc020515c:	01b9b823          	sd	s11,16(s3)
ffffffffc0205160:	01393023          	sd	s3,0(s2)
ffffffffc0205164:	894e                	mv	s2,s3
ffffffffc0205166:	b7c1                	j	ffffffffc0205126 <stride_enqueue+0xe2>
ffffffffc0205168:	008b3783          	ld	a5,8(s6)
ffffffffc020516c:	010b3c03          	ld	s8,16(s6)
ffffffffc0205170:	e43e                	sd	a5,8(sp)
ffffffffc0205172:	000c0c63          	beqz	s8,ffffffffc020518a <stride_enqueue+0x146>
ffffffffc0205176:	85ca                	mv	a1,s2
ffffffffc0205178:	8562                	mv	a0,s8
ffffffffc020517a:	e0bff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020517e:	01a50f63          	beq	a0,s10,ffffffffc020519c <stride_enqueue+0x158>
ffffffffc0205182:	13843823          	sd	s8,304(s0)
ffffffffc0205186:	012c3023          	sd	s2,0(s8)
ffffffffc020518a:	67a2                	ld	a5,8(sp)
ffffffffc020518c:	012b3423          	sd	s2,8(s6)
ffffffffc0205190:	00fb3823          	sd	a5,16(s6)
ffffffffc0205194:	01693023          	sd	s6,0(s2)
ffffffffc0205198:	895a                	mv	s2,s6
ffffffffc020519a:	bf7d                	j	ffffffffc0205158 <stride_enqueue+0x114>
ffffffffc020519c:	010c3503          	ld	a0,16(s8)
ffffffffc02051a0:	008c3d03          	ld	s10,8(s8)
ffffffffc02051a4:	85ca                	mv	a1,s2
ffffffffc02051a6:	e3bff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02051aa:	00ac3423          	sd	a0,8(s8)
ffffffffc02051ae:	01ac3823          	sd	s10,16(s8)
ffffffffc02051b2:	c509                	beqz	a0,ffffffffc02051bc <stride_enqueue+0x178>
ffffffffc02051b4:	01853023          	sd	s8,0(a0)
ffffffffc02051b8:	8962                	mv	s2,s8
ffffffffc02051ba:	bfc1                	j	ffffffffc020518a <stride_enqueue+0x146>
ffffffffc02051bc:	8962                	mv	s2,s8
ffffffffc02051be:	b7f1                	j	ffffffffc020518a <stride_enqueue+0x146>

ffffffffc02051c0 <stride_dequeue>:
ffffffffc02051c0:	1085b783          	ld	a5,264(a1)
ffffffffc02051c4:	7171                	addi	sp,sp,-176
ffffffffc02051c6:	f506                	sd	ra,168(sp)
ffffffffc02051c8:	f122                	sd	s0,160(sp)
ffffffffc02051ca:	ed26                	sd	s1,152(sp)
ffffffffc02051cc:	e94a                	sd	s2,144(sp)
ffffffffc02051ce:	e54e                	sd	s3,136(sp)
ffffffffc02051d0:	e152                	sd	s4,128(sp)
ffffffffc02051d2:	fcd6                	sd	s5,120(sp)
ffffffffc02051d4:	f8da                	sd	s6,112(sp)
ffffffffc02051d6:	f4de                	sd	s7,104(sp)
ffffffffc02051d8:	f0e2                	sd	s8,96(sp)
ffffffffc02051da:	ece6                	sd	s9,88(sp)
ffffffffc02051dc:	e8ea                	sd	s10,80(sp)
ffffffffc02051de:	e4ee                	sd	s11,72(sp)
ffffffffc02051e0:	00a78463          	beq	a5,a0,ffffffffc02051e8 <stride_dequeue+0x28>
ffffffffc02051e4:	7870106f          	j	ffffffffc020716a <stride_dequeue+0x1faa>
ffffffffc02051e8:	01052983          	lw	s3,16(a0)
ffffffffc02051ec:	8c2a                	mv	s8,a0
ffffffffc02051ee:	8b4e                	mv	s6,s3
ffffffffc02051f0:	00099463          	bnez	s3,ffffffffc02051f8 <stride_dequeue+0x38>
ffffffffc02051f4:	7770106f          	j	ffffffffc020716a <stride_dequeue+0x1faa>
ffffffffc02051f8:	1305b903          	ld	s2,304(a1)
ffffffffc02051fc:	01853a83          	ld	s5,24(a0)
ffffffffc0205200:	1285bd03          	ld	s10,296(a1)
ffffffffc0205204:	1385b483          	ld	s1,312(a1)
ffffffffc0205208:	842e                	mv	s0,a1
ffffffffc020520a:	2e090263          	beqz	s2,ffffffffc02054ee <stride_dequeue+0x32e>
ffffffffc020520e:	42048263          	beqz	s1,ffffffffc0205632 <stride_dequeue+0x472>
ffffffffc0205212:	85a6                	mv	a1,s1
ffffffffc0205214:	854a                	mv	a0,s2
ffffffffc0205216:	d6fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020521a:	5cfd                	li	s9,-1
ffffffffc020521c:	8a2a                	mv	s4,a0
ffffffffc020521e:	19950163          	beq	a0,s9,ffffffffc02053a0 <stride_dequeue+0x1e0>
ffffffffc0205222:	0104ba03          	ld	s4,16(s1)
ffffffffc0205226:	0084bb83          	ld	s7,8(s1)
ffffffffc020522a:	120a0563          	beqz	s4,ffffffffc0205354 <stride_dequeue+0x194>
ffffffffc020522e:	85d2                	mv	a1,s4
ffffffffc0205230:	854a                	mv	a0,s2
ffffffffc0205232:	d53ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205236:	2d950563          	beq	a0,s9,ffffffffc0205500 <stride_dequeue+0x340>
ffffffffc020523a:	008a3783          	ld	a5,8(s4)
ffffffffc020523e:	010a3d83          	ld	s11,16(s4)
ffffffffc0205242:	e03e                	sd	a5,0(sp)
ffffffffc0205244:	100d8063          	beqz	s11,ffffffffc0205344 <stride_dequeue+0x184>
ffffffffc0205248:	85ee                	mv	a1,s11
ffffffffc020524a:	854a                	mv	a0,s2
ffffffffc020524c:	d39ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205250:	7f950563          	beq	a0,s9,ffffffffc0205a3a <stride_dequeue+0x87a>
ffffffffc0205254:	008db783          	ld	a5,8(s11)
ffffffffc0205258:	010dbc83          	ld	s9,16(s11)
ffffffffc020525c:	e43e                	sd	a5,8(sp)
ffffffffc020525e:	0c0c8b63          	beqz	s9,ffffffffc0205334 <stride_dequeue+0x174>
ffffffffc0205262:	85e6                	mv	a1,s9
ffffffffc0205264:	854a                	mv	a0,s2
ffffffffc0205266:	d1fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020526a:	58fd                	li	a7,-1
ffffffffc020526c:	71150063          	beq	a0,a7,ffffffffc020596c <stride_dequeue+0x7ac>
ffffffffc0205270:	008cb783          	ld	a5,8(s9)
ffffffffc0205274:	010cb803          	ld	a6,16(s9)
ffffffffc0205278:	e83e                	sd	a5,16(sp)
ffffffffc020527a:	0a080563          	beqz	a6,ffffffffc0205324 <stride_dequeue+0x164>
ffffffffc020527e:	85c2                	mv	a1,a6
ffffffffc0205280:	854a                	mv	a0,s2
ffffffffc0205282:	ec42                	sd	a6,24(sp)
ffffffffc0205284:	d01ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205288:	58fd                	li	a7,-1
ffffffffc020528a:	6862                	ld	a6,24(sp)
ffffffffc020528c:	41150be3          	beq	a0,a7,ffffffffc0205ea2 <stride_dequeue+0xce2>
ffffffffc0205290:	00883703          	ld	a4,8(a6) # fffffffffff80008 <end+0x3fd66938>
ffffffffc0205294:	01083783          	ld	a5,16(a6)
ffffffffc0205298:	ec3a                	sd	a4,24(sp)
ffffffffc020529a:	cfad                	beqz	a5,ffffffffc0205314 <stride_dequeue+0x154>
ffffffffc020529c:	85be                	mv	a1,a5
ffffffffc020529e:	854a                	mv	a0,s2
ffffffffc02052a0:	f442                	sd	a6,40(sp)
ffffffffc02052a2:	f03e                	sd	a5,32(sp)
ffffffffc02052a4:	ce1ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02052a8:	58fd                	li	a7,-1
ffffffffc02052aa:	7782                	ld	a5,32(sp)
ffffffffc02052ac:	7822                	ld	a6,40(sp)
ffffffffc02052ae:	01151463          	bne	a0,a7,ffffffffc02052b6 <stride_dequeue+0xf6>
ffffffffc02052b2:	17a0106f          	j	ffffffffc020642c <stride_dequeue+0x126c>
ffffffffc02052b6:	6798                	ld	a4,8(a5)
ffffffffc02052b8:	0107bb03          	ld	s6,16(a5)
ffffffffc02052bc:	f03a                	sd	a4,32(sp)
ffffffffc02052be:	040b0463          	beqz	s6,ffffffffc0205306 <stride_dequeue+0x146>
ffffffffc02052c2:	85da                	mv	a1,s6
ffffffffc02052c4:	854a                	mv	a0,s2
ffffffffc02052c6:	f83e                	sd	a5,48(sp)
ffffffffc02052c8:	f442                	sd	a6,40(sp)
ffffffffc02052ca:	cbbff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02052ce:	58fd                	li	a7,-1
ffffffffc02052d0:	7822                	ld	a6,40(sp)
ffffffffc02052d2:	77c2                	ld	a5,48(sp)
ffffffffc02052d4:	01151463          	bne	a0,a7,ffffffffc02052dc <stride_dequeue+0x11c>
ffffffffc02052d8:	00d0106f          	j	ffffffffc0206ae4 <stride_dequeue+0x1924>
ffffffffc02052dc:	010b3583          	ld	a1,16(s6)
ffffffffc02052e0:	008b3983          	ld	s3,8(s6)
ffffffffc02052e4:	854a                	mv	a0,s2
ffffffffc02052e6:	f83e                	sd	a5,48(sp)
ffffffffc02052e8:	f442                	sd	a6,40(sp)
ffffffffc02052ea:	cf7ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02052ee:	00ab3423          	sd	a0,8(s6)
ffffffffc02052f2:	013b3823          	sd	s3,16(s6)
ffffffffc02052f6:	7822                	ld	a6,40(sp)
ffffffffc02052f8:	77c2                	ld	a5,48(sp)
ffffffffc02052fa:	010c2983          	lw	s3,16(s8)
ffffffffc02052fe:	c119                	beqz	a0,ffffffffc0205304 <stride_dequeue+0x144>
ffffffffc0205300:	01653023          	sd	s6,0(a0)
ffffffffc0205304:	895a                	mv	s2,s6
ffffffffc0205306:	7702                	ld	a4,32(sp)
ffffffffc0205308:	0127b423          	sd	s2,8(a5)
ffffffffc020530c:	eb98                	sd	a4,16(a5)
ffffffffc020530e:	00f93023          	sd	a5,0(s2)
ffffffffc0205312:	893e                	mv	s2,a5
ffffffffc0205314:	67e2                	ld	a5,24(sp)
ffffffffc0205316:	01283423          	sd	s2,8(a6)
ffffffffc020531a:	00f83823          	sd	a5,16(a6)
ffffffffc020531e:	01093023          	sd	a6,0(s2)
ffffffffc0205322:	8942                	mv	s2,a6
ffffffffc0205324:	67c2                	ld	a5,16(sp)
ffffffffc0205326:	012cb423          	sd	s2,8(s9)
ffffffffc020532a:	00fcb823          	sd	a5,16(s9)
ffffffffc020532e:	01993023          	sd	s9,0(s2)
ffffffffc0205332:	8966                	mv	s2,s9
ffffffffc0205334:	67a2                	ld	a5,8(sp)
ffffffffc0205336:	012db423          	sd	s2,8(s11)
ffffffffc020533a:	00fdb823          	sd	a5,16(s11)
ffffffffc020533e:	01b93023          	sd	s11,0(s2)
ffffffffc0205342:	896e                	mv	s2,s11
ffffffffc0205344:	6782                	ld	a5,0(sp)
ffffffffc0205346:	012a3423          	sd	s2,8(s4)
ffffffffc020534a:	00fa3823          	sd	a5,16(s4)
ffffffffc020534e:	01493023          	sd	s4,0(s2)
ffffffffc0205352:	8952                	mv	s2,s4
ffffffffc0205354:	0124b423          	sd	s2,8(s1)
ffffffffc0205358:	0174b823          	sd	s7,16(s1)
ffffffffc020535c:	00993023          	sd	s1,0(s2)
ffffffffc0205360:	01a4b023          	sd	s10,0(s1)
ffffffffc0205364:	180d0963          	beqz	s10,ffffffffc02054f6 <stride_dequeue+0x336>
ffffffffc0205368:	008d3683          	ld	a3,8(s10)
ffffffffc020536c:	12840413          	addi	s0,s0,296
ffffffffc0205370:	18868563          	beq	a3,s0,ffffffffc02054fa <stride_dequeue+0x33a>
ffffffffc0205374:	009d3823          	sd	s1,16(s10)
ffffffffc0205378:	70aa                	ld	ra,168(sp)
ffffffffc020537a:	740a                	ld	s0,160(sp)
ffffffffc020537c:	39fd                	addiw	s3,s3,-1
ffffffffc020537e:	015c3c23          	sd	s5,24(s8)
ffffffffc0205382:	013c2823          	sw	s3,16(s8)
ffffffffc0205386:	64ea                	ld	s1,152(sp)
ffffffffc0205388:	694a                	ld	s2,144(sp)
ffffffffc020538a:	69aa                	ld	s3,136(sp)
ffffffffc020538c:	6a0a                	ld	s4,128(sp)
ffffffffc020538e:	7ae6                	ld	s5,120(sp)
ffffffffc0205390:	7b46                	ld	s6,112(sp)
ffffffffc0205392:	7ba6                	ld	s7,104(sp)
ffffffffc0205394:	7c06                	ld	s8,96(sp)
ffffffffc0205396:	6ce6                	ld	s9,88(sp)
ffffffffc0205398:	6d46                	ld	s10,80(sp)
ffffffffc020539a:	6da6                	ld	s11,72(sp)
ffffffffc020539c:	614d                	addi	sp,sp,176
ffffffffc020539e:	8082                	ret
ffffffffc02053a0:	01093d83          	ld	s11,16(s2)
ffffffffc02053a4:	00893b83          	ld	s7,8(s2)
ffffffffc02053a8:	120d8963          	beqz	s11,ffffffffc02054da <stride_dequeue+0x31a>
ffffffffc02053ac:	85a6                	mv	a1,s1
ffffffffc02053ae:	856e                	mv	a0,s11
ffffffffc02053b0:	bd5ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02053b4:	29450363          	beq	a0,s4,ffffffffc020563a <stride_dequeue+0x47a>
ffffffffc02053b8:	649c                	ld	a5,8(s1)
ffffffffc02053ba:	0104bc83          	ld	s9,16(s1)
ffffffffc02053be:	e03e                	sd	a5,0(sp)
ffffffffc02053c0:	100c8763          	beqz	s9,ffffffffc02054ce <stride_dequeue+0x30e>
ffffffffc02053c4:	85e6                	mv	a1,s9
ffffffffc02053c6:	856e                	mv	a0,s11
ffffffffc02053c8:	bbdff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02053cc:	4b450263          	beq	a0,s4,ffffffffc0205870 <stride_dequeue+0x6b0>
ffffffffc02053d0:	008cb783          	ld	a5,8(s9)
ffffffffc02053d4:	010cba03          	ld	s4,16(s9)
ffffffffc02053d8:	e43e                	sd	a5,8(sp)
ffffffffc02053da:	0e0a0263          	beqz	s4,ffffffffc02054be <stride_dequeue+0x2fe>
ffffffffc02053de:	85d2                	mv	a1,s4
ffffffffc02053e0:	856e                	mv	a0,s11
ffffffffc02053e2:	ba3ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02053e6:	58fd                	li	a7,-1
ffffffffc02053e8:	03150fe3          	beq	a0,a7,ffffffffc0205c26 <stride_dequeue+0xa66>
ffffffffc02053ec:	008a3783          	ld	a5,8(s4)
ffffffffc02053f0:	010a3803          	ld	a6,16(s4)
ffffffffc02053f4:	e83e                	sd	a5,16(sp)
ffffffffc02053f6:	0a080c63          	beqz	a6,ffffffffc02054ae <stride_dequeue+0x2ee>
ffffffffc02053fa:	85c2                	mv	a1,a6
ffffffffc02053fc:	856e                	mv	a0,s11
ffffffffc02053fe:	ec42                	sd	a6,24(sp)
ffffffffc0205400:	b85ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205404:	58fd                	li	a7,-1
ffffffffc0205406:	6862                	ld	a6,24(sp)
ffffffffc0205408:	01151463          	bne	a0,a7,ffffffffc0205410 <stride_dequeue+0x250>
ffffffffc020540c:	6e10006f          	j	ffffffffc02062ec <stride_dequeue+0x112c>
ffffffffc0205410:	00883783          	ld	a5,8(a6)
ffffffffc0205414:	01083303          	ld	t1,16(a6)
ffffffffc0205418:	ec3e                	sd	a5,24(sp)
ffffffffc020541a:	08030263          	beqz	t1,ffffffffc020549e <stride_dequeue+0x2de>
ffffffffc020541e:	859a                	mv	a1,t1
ffffffffc0205420:	856e                	mv	a0,s11
ffffffffc0205422:	f442                	sd	a6,40(sp)
ffffffffc0205424:	f01a                	sd	t1,32(sp)
ffffffffc0205426:	b5fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020542a:	58fd                	li	a7,-1
ffffffffc020542c:	7302                	ld	t1,32(sp)
ffffffffc020542e:	7822                	ld	a6,40(sp)
ffffffffc0205430:	01151463          	bne	a0,a7,ffffffffc0205438 <stride_dequeue+0x278>
ffffffffc0205434:	5ee0106f          	j	ffffffffc0206a22 <stride_dequeue+0x1862>
ffffffffc0205438:	00833783          	ld	a5,8(t1)
ffffffffc020543c:	01033983          	ld	s3,16(t1)
ffffffffc0205440:	f03e                	sd	a5,32(sp)
ffffffffc0205442:	00099463          	bnez	s3,ffffffffc020544a <stride_dequeue+0x28a>
ffffffffc0205446:	26f0106f          	j	ffffffffc0206eb4 <stride_dequeue+0x1cf4>
ffffffffc020544a:	85ce                	mv	a1,s3
ffffffffc020544c:	856e                	mv	a0,s11
ffffffffc020544e:	f842                	sd	a6,48(sp)
ffffffffc0205450:	f41a                	sd	t1,40(sp)
ffffffffc0205452:	b33ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205456:	58fd                	li	a7,-1
ffffffffc0205458:	7322                	ld	t1,40(sp)
ffffffffc020545a:	7842                	ld	a6,48(sp)
ffffffffc020545c:	01151463          	bne	a0,a7,ffffffffc0205464 <stride_dequeue+0x2a4>
ffffffffc0205460:	4d30106f          	j	ffffffffc0207132 <stride_dequeue+0x1f72>
ffffffffc0205464:	0109b583          	ld	a1,16(s3)
ffffffffc0205468:	0089bb03          	ld	s6,8(s3)
ffffffffc020546c:	856e                	mv	a0,s11
ffffffffc020546e:	f842                	sd	a6,48(sp)
ffffffffc0205470:	f41a                	sd	t1,40(sp)
ffffffffc0205472:	b6fff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205476:	00a9b423          	sd	a0,8(s3)
ffffffffc020547a:	0169b823          	sd	s6,16(s3)
ffffffffc020547e:	7322                	ld	t1,40(sp)
ffffffffc0205480:	7842                	ld	a6,48(sp)
ffffffffc0205482:	010c2b03          	lw	s6,16(s8)
ffffffffc0205486:	c119                	beqz	a0,ffffffffc020548c <stride_dequeue+0x2cc>
ffffffffc0205488:	01353023          	sd	s3,0(a0)
ffffffffc020548c:	7782                	ld	a5,32(sp)
ffffffffc020548e:	01333423          	sd	s3,8(t1)
ffffffffc0205492:	8d9a                	mv	s11,t1
ffffffffc0205494:	00f33823          	sd	a5,16(t1)
ffffffffc0205498:	0069b023          	sd	t1,0(s3)
ffffffffc020549c:	89da                	mv	s3,s6
ffffffffc020549e:	67e2                	ld	a5,24(sp)
ffffffffc02054a0:	01b83423          	sd	s11,8(a6)
ffffffffc02054a4:	00f83823          	sd	a5,16(a6)
ffffffffc02054a8:	010db023          	sd	a6,0(s11)
ffffffffc02054ac:	8dc2                	mv	s11,a6
ffffffffc02054ae:	67c2                	ld	a5,16(sp)
ffffffffc02054b0:	01ba3423          	sd	s11,8(s4)
ffffffffc02054b4:	00fa3823          	sd	a5,16(s4)
ffffffffc02054b8:	014db023          	sd	s4,0(s11)
ffffffffc02054bc:	8dd2                	mv	s11,s4
ffffffffc02054be:	67a2                	ld	a5,8(sp)
ffffffffc02054c0:	01bcb423          	sd	s11,8(s9)
ffffffffc02054c4:	00fcb823          	sd	a5,16(s9)
ffffffffc02054c8:	019db023          	sd	s9,0(s11)
ffffffffc02054cc:	8de6                	mv	s11,s9
ffffffffc02054ce:	6782                	ld	a5,0(sp)
ffffffffc02054d0:	01b4b423          	sd	s11,8(s1)
ffffffffc02054d4:	e89c                	sd	a5,16(s1)
ffffffffc02054d6:	009db023          	sd	s1,0(s11)
ffffffffc02054da:	00993423          	sd	s1,8(s2)
ffffffffc02054de:	01793823          	sd	s7,16(s2)
ffffffffc02054e2:	0124b023          	sd	s2,0(s1)
ffffffffc02054e6:	84ca                	mv	s1,s2
ffffffffc02054e8:	01a4b023          	sd	s10,0(s1)
ffffffffc02054ec:	bda5                	j	ffffffffc0205364 <stride_dequeue+0x1a4>
ffffffffc02054ee:	e60499e3          	bnez	s1,ffffffffc0205360 <stride_dequeue+0x1a0>
ffffffffc02054f2:	e60d1be3          	bnez	s10,ffffffffc0205368 <stride_dequeue+0x1a8>
ffffffffc02054f6:	8aa6                	mv	s5,s1
ffffffffc02054f8:	b541                	j	ffffffffc0205378 <stride_dequeue+0x1b8>
ffffffffc02054fa:	009d3423          	sd	s1,8(s10)
ffffffffc02054fe:	bdad                	j	ffffffffc0205378 <stride_dequeue+0x1b8>
ffffffffc0205500:	01093d83          	ld	s11,16(s2)
ffffffffc0205504:	e02a                	sd	a0,0(sp)
ffffffffc0205506:	00893c83          	ld	s9,8(s2)
ffffffffc020550a:	100d8d63          	beqz	s11,ffffffffc0205624 <stride_dequeue+0x464>
ffffffffc020550e:	85d2                	mv	a1,s4
ffffffffc0205510:	856e                	mv	a0,s11
ffffffffc0205512:	a73ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205516:	6782                	ld	a5,0(sp)
ffffffffc0205518:	24f50563          	beq	a0,a5,ffffffffc0205762 <stride_dequeue+0x5a2>
ffffffffc020551c:	008a3783          	ld	a5,8(s4)
ffffffffc0205520:	010a3603          	ld	a2,16(s4)
ffffffffc0205524:	e03e                	sd	a5,0(sp)
ffffffffc0205526:	0e060863          	beqz	a2,ffffffffc0205616 <stride_dequeue+0x456>
ffffffffc020552a:	85b2                	mv	a1,a2
ffffffffc020552c:	856e                	mv	a0,s11
ffffffffc020552e:	e432                	sd	a2,8(sp)
ffffffffc0205530:	a55ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205534:	58fd                	li	a7,-1
ffffffffc0205536:	6622                	ld	a2,8(sp)
ffffffffc0205538:	7b150f63          	beq	a0,a7,ffffffffc0205cf6 <stride_dequeue+0xb36>
ffffffffc020553c:	661c                	ld	a5,8(a2)
ffffffffc020553e:	01063803          	ld	a6,16(a2)
ffffffffc0205542:	e43e                	sd	a5,8(sp)
ffffffffc0205544:	0c080263          	beqz	a6,ffffffffc0205608 <stride_dequeue+0x448>
ffffffffc0205548:	85c2                	mv	a1,a6
ffffffffc020554a:	856e                	mv	a0,s11
ffffffffc020554c:	ec32                	sd	a2,24(sp)
ffffffffc020554e:	e842                	sd	a6,16(sp)
ffffffffc0205550:	a35ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205554:	58fd                	li	a7,-1
ffffffffc0205556:	6842                	ld	a6,16(sp)
ffffffffc0205558:	6662                	ld	a2,24(sp)
ffffffffc020555a:	631507e3          	beq	a0,a7,ffffffffc0206388 <stride_dequeue+0x11c8>
ffffffffc020555e:	00883783          	ld	a5,8(a6)
ffffffffc0205562:	01083303          	ld	t1,16(a6)
ffffffffc0205566:	e83e                	sd	a5,16(sp)
ffffffffc0205568:	08030863          	beqz	t1,ffffffffc02055f8 <stride_dequeue+0x438>
ffffffffc020556c:	859a                	mv	a1,t1
ffffffffc020556e:	856e                	mv	a0,s11
ffffffffc0205570:	f442                	sd	a6,40(sp)
ffffffffc0205572:	f032                	sd	a2,32(sp)
ffffffffc0205574:	ec1a                	sd	t1,24(sp)
ffffffffc0205576:	a0fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020557a:	58fd                	li	a7,-1
ffffffffc020557c:	6362                	ld	t1,24(sp)
ffffffffc020557e:	7602                	ld	a2,32(sp)
ffffffffc0205580:	7822                	ld	a6,40(sp)
ffffffffc0205582:	01151463          	bne	a0,a7,ffffffffc020558a <stride_dequeue+0x3ca>
ffffffffc0205586:	3d00106f          	j	ffffffffc0206956 <stride_dequeue+0x1796>
ffffffffc020558a:	00833783          	ld	a5,8(t1)
ffffffffc020558e:	01033983          	ld	s3,16(t1)
ffffffffc0205592:	ec3e                	sd	a5,24(sp)
ffffffffc0205594:	00099463          	bnez	s3,ffffffffc020559c <stride_dequeue+0x3dc>
ffffffffc0205598:	2af0106f          	j	ffffffffc0207046 <stride_dequeue+0x1e86>
ffffffffc020559c:	85ce                	mv	a1,s3
ffffffffc020559e:	856e                	mv	a0,s11
ffffffffc02055a0:	f81a                	sd	t1,48(sp)
ffffffffc02055a2:	f442                	sd	a6,40(sp)
ffffffffc02055a4:	f032                	sd	a2,32(sp)
ffffffffc02055a6:	9dfff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02055aa:	58fd                	li	a7,-1
ffffffffc02055ac:	7602                	ld	a2,32(sp)
ffffffffc02055ae:	7822                	ld	a6,40(sp)
ffffffffc02055b0:	7342                	ld	t1,48(sp)
ffffffffc02055b2:	01151463          	bne	a0,a7,ffffffffc02055ba <stride_dequeue+0x3fa>
ffffffffc02055b6:	3510106f          	j	ffffffffc0207106 <stride_dequeue+0x1f46>
ffffffffc02055ba:	0109b583          	ld	a1,16(s3)
ffffffffc02055be:	0089bb03          	ld	s6,8(s3)
ffffffffc02055c2:	856e                	mv	a0,s11
ffffffffc02055c4:	f81a                	sd	t1,48(sp)
ffffffffc02055c6:	f442                	sd	a6,40(sp)
ffffffffc02055c8:	f032                	sd	a2,32(sp)
ffffffffc02055ca:	a17ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02055ce:	00a9b423          	sd	a0,8(s3)
ffffffffc02055d2:	0169b823          	sd	s6,16(s3)
ffffffffc02055d6:	7602                	ld	a2,32(sp)
ffffffffc02055d8:	7822                	ld	a6,40(sp)
ffffffffc02055da:	7342                	ld	t1,48(sp)
ffffffffc02055dc:	010c2b03          	lw	s6,16(s8)
ffffffffc02055e0:	c119                	beqz	a0,ffffffffc02055e6 <stride_dequeue+0x426>
ffffffffc02055e2:	01353023          	sd	s3,0(a0)
ffffffffc02055e6:	67e2                	ld	a5,24(sp)
ffffffffc02055e8:	01333423          	sd	s3,8(t1)
ffffffffc02055ec:	8d9a                	mv	s11,t1
ffffffffc02055ee:	00f33823          	sd	a5,16(t1)
ffffffffc02055f2:	0069b023          	sd	t1,0(s3)
ffffffffc02055f6:	89da                	mv	s3,s6
ffffffffc02055f8:	67c2                	ld	a5,16(sp)
ffffffffc02055fa:	01b83423          	sd	s11,8(a6)
ffffffffc02055fe:	00f83823          	sd	a5,16(a6)
ffffffffc0205602:	010db023          	sd	a6,0(s11)
ffffffffc0205606:	8dc2                	mv	s11,a6
ffffffffc0205608:	67a2                	ld	a5,8(sp)
ffffffffc020560a:	01b63423          	sd	s11,8(a2)
ffffffffc020560e:	ea1c                	sd	a5,16(a2)
ffffffffc0205610:	00cdb023          	sd	a2,0(s11)
ffffffffc0205614:	8db2                	mv	s11,a2
ffffffffc0205616:	6782                	ld	a5,0(sp)
ffffffffc0205618:	01ba3423          	sd	s11,8(s4)
ffffffffc020561c:	00fa3823          	sd	a5,16(s4)
ffffffffc0205620:	014db023          	sd	s4,0(s11)
ffffffffc0205624:	01493423          	sd	s4,8(s2)
ffffffffc0205628:	01993823          	sd	s9,16(s2)
ffffffffc020562c:	012a3023          	sd	s2,0(s4)
ffffffffc0205630:	b315                	j	ffffffffc0205354 <stride_dequeue+0x194>
ffffffffc0205632:	84ca                	mv	s1,s2
ffffffffc0205634:	01a4b023          	sd	s10,0(s1)
ffffffffc0205638:	b335                	j	ffffffffc0205364 <stride_dequeue+0x1a4>
ffffffffc020563a:	008db783          	ld	a5,8(s11)
ffffffffc020563e:	010dbc83          	ld	s9,16(s11)
ffffffffc0205642:	e42a                	sd	a0,8(sp)
ffffffffc0205644:	e03e                	sd	a5,0(sp)
ffffffffc0205646:	100c8563          	beqz	s9,ffffffffc0205750 <stride_dequeue+0x590>
ffffffffc020564a:	85a6                	mv	a1,s1
ffffffffc020564c:	8566                	mv	a0,s9
ffffffffc020564e:	937ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205652:	67a2                	ld	a5,8(sp)
ffffffffc0205654:	4cf50e63          	beq	a0,a5,ffffffffc0205b30 <stride_dequeue+0x970>
ffffffffc0205658:	649c                	ld	a5,8(s1)
ffffffffc020565a:	0104ba03          	ld	s4,16(s1)
ffffffffc020565e:	e43e                	sd	a5,8(sp)
ffffffffc0205660:	0e0a0263          	beqz	s4,ffffffffc0205744 <stride_dequeue+0x584>
ffffffffc0205664:	85d2                	mv	a1,s4
ffffffffc0205666:	8566                	mv	a0,s9
ffffffffc0205668:	91dff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020566c:	58fd                	li	a7,-1
ffffffffc020566e:	0d1505e3          	beq	a0,a7,ffffffffc0205f38 <stride_dequeue+0xd78>
ffffffffc0205672:	008a3783          	ld	a5,8(s4)
ffffffffc0205676:	010a3803          	ld	a6,16(s4)
ffffffffc020567a:	e83e                	sd	a5,16(sp)
ffffffffc020567c:	0a080c63          	beqz	a6,ffffffffc0205734 <stride_dequeue+0x574>
ffffffffc0205680:	85c2                	mv	a1,a6
ffffffffc0205682:	8566                	mv	a0,s9
ffffffffc0205684:	ec42                	sd	a6,24(sp)
ffffffffc0205686:	8ffff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020568a:	58fd                	li	a7,-1
ffffffffc020568c:	6862                	ld	a6,24(sp)
ffffffffc020568e:	01151463          	bne	a0,a7,ffffffffc0205696 <stride_dequeue+0x4d6>
ffffffffc0205692:	07c0106f          	j	ffffffffc020670e <stride_dequeue+0x154e>
ffffffffc0205696:	00883783          	ld	a5,8(a6)
ffffffffc020569a:	01083983          	ld	s3,16(a6)
ffffffffc020569e:	ec3e                	sd	a5,24(sp)
ffffffffc02056a0:	00099463          	bnez	s3,ffffffffc02056a8 <stride_dequeue+0x4e8>
ffffffffc02056a4:	2bb0106f          	j	ffffffffc020715e <stride_dequeue+0x1f9e>
ffffffffc02056a8:	85ce                	mv	a1,s3
ffffffffc02056aa:	8566                	mv	a0,s9
ffffffffc02056ac:	f042                	sd	a6,32(sp)
ffffffffc02056ae:	8d7ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02056b2:	58fd                	li	a7,-1
ffffffffc02056b4:	7802                	ld	a6,32(sp)
ffffffffc02056b6:	01151463          	bne	a0,a7,ffffffffc02056be <stride_dequeue+0x4fe>
ffffffffc02056ba:	05f0106f          	j	ffffffffc0206f18 <stride_dequeue+0x1d58>
ffffffffc02056be:	0089b783          	ld	a5,8(s3)
ffffffffc02056c2:	0109be03          	ld	t3,16(s3)
ffffffffc02056c6:	f03e                	sd	a5,32(sp)
ffffffffc02056c8:	040e0663          	beqz	t3,ffffffffc0205714 <stride_dequeue+0x554>
ffffffffc02056cc:	85f2                	mv	a1,t3
ffffffffc02056ce:	8566                	mv	a0,s9
ffffffffc02056d0:	f842                	sd	a6,48(sp)
ffffffffc02056d2:	f472                	sd	t3,40(sp)
ffffffffc02056d4:	8b1ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02056d8:	58fd                	li	a7,-1
ffffffffc02056da:	7e22                	ld	t3,40(sp)
ffffffffc02056dc:	7842                	ld	a6,48(sp)
ffffffffc02056de:	01151463          	bne	a0,a7,ffffffffc02056e6 <stride_dequeue+0x526>
ffffffffc02056e2:	4e70106f          	j	ffffffffc02073c8 <stride_dequeue+0x2208>
ffffffffc02056e6:	010e3583          	ld	a1,16(t3)
ffffffffc02056ea:	8566                	mv	a0,s9
ffffffffc02056ec:	008e3b03          	ld	s6,8(t3)
ffffffffc02056f0:	f842                	sd	a6,48(sp)
ffffffffc02056f2:	f472                	sd	t3,40(sp)
ffffffffc02056f4:	8edff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02056f8:	7e22                	ld	t3,40(sp)
ffffffffc02056fa:	7842                	ld	a6,48(sp)
ffffffffc02056fc:	016e3823          	sd	s6,16(t3)
ffffffffc0205700:	00ae3423          	sd	a0,8(t3)
ffffffffc0205704:	010c2b03          	lw	s6,16(s8)
ffffffffc0205708:	e119                	bnez	a0,ffffffffc020570e <stride_dequeue+0x54e>
ffffffffc020570a:	7bb0106f          	j	ffffffffc02076c4 <stride_dequeue+0x2504>
ffffffffc020570e:	01c53023          	sd	t3,0(a0)
ffffffffc0205712:	8cf2                	mv	s9,t3
ffffffffc0205714:	7782                	ld	a5,32(sp)
ffffffffc0205716:	0199b423          	sd	s9,8(s3)
ffffffffc020571a:	00f9b823          	sd	a5,16(s3)
ffffffffc020571e:	013cb023          	sd	s3,0(s9)
ffffffffc0205722:	67e2                	ld	a5,24(sp)
ffffffffc0205724:	01383423          	sd	s3,8(a6)
ffffffffc0205728:	8cc2                	mv	s9,a6
ffffffffc020572a:	00f83823          	sd	a5,16(a6)
ffffffffc020572e:	0109b023          	sd	a6,0(s3)
ffffffffc0205732:	89da                	mv	s3,s6
ffffffffc0205734:	67c2                	ld	a5,16(sp)
ffffffffc0205736:	019a3423          	sd	s9,8(s4)
ffffffffc020573a:	00fa3823          	sd	a5,16(s4)
ffffffffc020573e:	014cb023          	sd	s4,0(s9)
ffffffffc0205742:	8cd2                	mv	s9,s4
ffffffffc0205744:	67a2                	ld	a5,8(sp)
ffffffffc0205746:	0194b423          	sd	s9,8(s1)
ffffffffc020574a:	e89c                	sd	a5,16(s1)
ffffffffc020574c:	009cb023          	sd	s1,0(s9)
ffffffffc0205750:	6782                	ld	a5,0(sp)
ffffffffc0205752:	009db423          	sd	s1,8(s11)
ffffffffc0205756:	00fdb823          	sd	a5,16(s11)
ffffffffc020575a:	01b4b023          	sd	s11,0(s1)
ffffffffc020575e:	84ee                	mv	s1,s11
ffffffffc0205760:	bbad                	j	ffffffffc02054da <stride_dequeue+0x31a>
ffffffffc0205762:	008db783          	ld	a5,8(s11)
ffffffffc0205766:	010db603          	ld	a2,16(s11)
ffffffffc020576a:	e03e                	sd	a5,0(sp)
ffffffffc020576c:	0e060963          	beqz	a2,ffffffffc020585e <stride_dequeue+0x69e>
ffffffffc0205770:	8532                	mv	a0,a2
ffffffffc0205772:	85d2                	mv	a1,s4
ffffffffc0205774:	e432                	sd	a2,8(sp)
ffffffffc0205776:	80fff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020577a:	58fd                	li	a7,-1
ffffffffc020577c:	6622                	ld	a2,8(sp)
ffffffffc020577e:	091504e3          	beq	a0,a7,ffffffffc0206006 <stride_dequeue+0xe46>
ffffffffc0205782:	008a3783          	ld	a5,8(s4)
ffffffffc0205786:	010a3803          	ld	a6,16(s4)
ffffffffc020578a:	e43e                	sd	a5,8(sp)
ffffffffc020578c:	0c080263          	beqz	a6,ffffffffc0205850 <stride_dequeue+0x690>
ffffffffc0205790:	85c2                	mv	a1,a6
ffffffffc0205792:	8532                	mv	a0,a2
ffffffffc0205794:	ec42                	sd	a6,24(sp)
ffffffffc0205796:	e832                	sd	a2,16(sp)
ffffffffc0205798:	fecff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020579c:	58fd                	li	a7,-1
ffffffffc020579e:	6642                	ld	a2,16(sp)
ffffffffc02057a0:	6862                	ld	a6,24(sp)
ffffffffc02057a2:	01151463          	bne	a0,a7,ffffffffc02057aa <stride_dequeue+0x5ea>
ffffffffc02057a6:	00a0106f          	j	ffffffffc02067b0 <stride_dequeue+0x15f0>
ffffffffc02057aa:	00883783          	ld	a5,8(a6)
ffffffffc02057ae:	01083983          	ld	s3,16(a6)
ffffffffc02057b2:	e83e                	sd	a5,16(sp)
ffffffffc02057b4:	00099463          	bnez	s3,ffffffffc02057bc <stride_dequeue+0x5fc>
ffffffffc02057b8:	1e50106f          	j	ffffffffc020719c <stride_dequeue+0x1fdc>
ffffffffc02057bc:	8532                	mv	a0,a2
ffffffffc02057be:	85ce                	mv	a1,s3
ffffffffc02057c0:	f042                	sd	a6,32(sp)
ffffffffc02057c2:	ec32                	sd	a2,24(sp)
ffffffffc02057c4:	fc0ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02057c8:	58fd                	li	a7,-1
ffffffffc02057ca:	6662                	ld	a2,24(sp)
ffffffffc02057cc:	7802                	ld	a6,32(sp)
ffffffffc02057ce:	01151463          	bne	a0,a7,ffffffffc02057d6 <stride_dequeue+0x616>
ffffffffc02057d2:	4fc0106f          	j	ffffffffc0206cce <stride_dequeue+0x1b0e>
ffffffffc02057d6:	0089b783          	ld	a5,8(s3)
ffffffffc02057da:	0109be03          	ld	t3,16(s3)
ffffffffc02057de:	ec3e                	sd	a5,24(sp)
ffffffffc02057e0:	040e0863          	beqz	t3,ffffffffc0205830 <stride_dequeue+0x670>
ffffffffc02057e4:	85f2                	mv	a1,t3
ffffffffc02057e6:	8532                	mv	a0,a2
ffffffffc02057e8:	f842                	sd	a6,48(sp)
ffffffffc02057ea:	f472                	sd	t3,40(sp)
ffffffffc02057ec:	f032                	sd	a2,32(sp)
ffffffffc02057ee:	f96ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02057f2:	7842                	ld	a6,48(sp)
ffffffffc02057f4:	7e22                	ld	t3,40(sp)
ffffffffc02057f6:	58fd                	li	a7,-1
ffffffffc02057f8:	f442                	sd	a6,40(sp)
ffffffffc02057fa:	7602                	ld	a2,32(sp)
ffffffffc02057fc:	01151463          	bne	a0,a7,ffffffffc0205804 <stride_dequeue+0x644>
ffffffffc0205800:	37b0106f          	j	ffffffffc020737a <stride_dequeue+0x21ba>
ffffffffc0205804:	010e3583          	ld	a1,16(t3)
ffffffffc0205808:	8532                	mv	a0,a2
ffffffffc020580a:	008e3b03          	ld	s6,8(t3)
ffffffffc020580e:	f072                	sd	t3,32(sp)
ffffffffc0205810:	fd0ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205814:	7e02                	ld	t3,32(sp)
ffffffffc0205816:	7822                	ld	a6,40(sp)
ffffffffc0205818:	016e3823          	sd	s6,16(t3)
ffffffffc020581c:	00ae3423          	sd	a0,8(t3)
ffffffffc0205820:	010c2b03          	lw	s6,16(s8)
ffffffffc0205824:	e119                	bnez	a0,ffffffffc020582a <stride_dequeue+0x66a>
ffffffffc0205826:	7090106f          	j	ffffffffc020772e <stride_dequeue+0x256e>
ffffffffc020582a:	01c53023          	sd	t3,0(a0)
ffffffffc020582e:	8672                	mv	a2,t3
ffffffffc0205830:	67e2                	ld	a5,24(sp)
ffffffffc0205832:	00c9b423          	sd	a2,8(s3)
ffffffffc0205836:	00f9b823          	sd	a5,16(s3)
ffffffffc020583a:	01363023          	sd	s3,0(a2)
ffffffffc020583e:	67c2                	ld	a5,16(sp)
ffffffffc0205840:	01383423          	sd	s3,8(a6)
ffffffffc0205844:	8642                	mv	a2,a6
ffffffffc0205846:	00f83823          	sd	a5,16(a6)
ffffffffc020584a:	0109b023          	sd	a6,0(s3)
ffffffffc020584e:	89da                	mv	s3,s6
ffffffffc0205850:	67a2                	ld	a5,8(sp)
ffffffffc0205852:	00ca3423          	sd	a2,8(s4)
ffffffffc0205856:	00fa3823          	sd	a5,16(s4)
ffffffffc020585a:	01463023          	sd	s4,0(a2)
ffffffffc020585e:	6782                	ld	a5,0(sp)
ffffffffc0205860:	014db423          	sd	s4,8(s11)
ffffffffc0205864:	00fdb823          	sd	a5,16(s11)
ffffffffc0205868:	01ba3023          	sd	s11,0(s4)
ffffffffc020586c:	8a6e                	mv	s4,s11
ffffffffc020586e:	bb5d                	j	ffffffffc0205624 <stride_dequeue+0x464>
ffffffffc0205870:	008db783          	ld	a5,8(s11)
ffffffffc0205874:	010dba03          	ld	s4,16(s11)
ffffffffc0205878:	e43e                	sd	a5,8(sp)
ffffffffc020587a:	0e0a0163          	beqz	s4,ffffffffc020595c <stride_dequeue+0x79c>
ffffffffc020587e:	85e6                	mv	a1,s9
ffffffffc0205880:	8552                	mv	a0,s4
ffffffffc0205882:	f02ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205886:	58fd                	li	a7,-1
ffffffffc0205888:	05150de3          	beq	a0,a7,ffffffffc02060e2 <stride_dequeue+0xf22>
ffffffffc020588c:	008cb783          	ld	a5,8(s9)
ffffffffc0205890:	010cb803          	ld	a6,16(s9)
ffffffffc0205894:	e83e                	sd	a5,16(sp)
ffffffffc0205896:	0a080c63          	beqz	a6,ffffffffc020594e <stride_dequeue+0x78e>
ffffffffc020589a:	85c2                	mv	a1,a6
ffffffffc020589c:	8552                	mv	a0,s4
ffffffffc020589e:	ec42                	sd	a6,24(sp)
ffffffffc02058a0:	ee4ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02058a4:	58fd                	li	a7,-1
ffffffffc02058a6:	6862                	ld	a6,24(sp)
ffffffffc02058a8:	01151463          	bne	a0,a7,ffffffffc02058b0 <stride_dequeue+0x6f0>
ffffffffc02058ac:	7ab0006f          	j	ffffffffc0206856 <stride_dequeue+0x1696>
ffffffffc02058b0:	00883783          	ld	a5,8(a6)
ffffffffc02058b4:	01083983          	ld	s3,16(a6)
ffffffffc02058b8:	ec3e                	sd	a5,24(sp)
ffffffffc02058ba:	00099463          	bnez	s3,ffffffffc02058c2 <stride_dequeue+0x702>
ffffffffc02058be:	0cd0106f          	j	ffffffffc020718a <stride_dequeue+0x1fca>
ffffffffc02058c2:	85ce                	mv	a1,s3
ffffffffc02058c4:	8552                	mv	a0,s4
ffffffffc02058c6:	f042                	sd	a6,32(sp)
ffffffffc02058c8:	ebcff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02058cc:	58fd                	li	a7,-1
ffffffffc02058ce:	7802                	ld	a6,32(sp)
ffffffffc02058d0:	01151463          	bne	a0,a7,ffffffffc02058d8 <stride_dequeue+0x718>
ffffffffc02058d4:	39c0106f          	j	ffffffffc0206c70 <stride_dequeue+0x1ab0>
ffffffffc02058d8:	0089b783          	ld	a5,8(s3)
ffffffffc02058dc:	0109be03          	ld	t3,16(s3)
ffffffffc02058e0:	f03e                	sd	a5,32(sp)
ffffffffc02058e2:	040e0663          	beqz	t3,ffffffffc020592e <stride_dequeue+0x76e>
ffffffffc02058e6:	85f2                	mv	a1,t3
ffffffffc02058e8:	8552                	mv	a0,s4
ffffffffc02058ea:	f842                	sd	a6,48(sp)
ffffffffc02058ec:	f472                	sd	t3,40(sp)
ffffffffc02058ee:	e96ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02058f2:	58fd                	li	a7,-1
ffffffffc02058f4:	7e22                	ld	t3,40(sp)
ffffffffc02058f6:	7842                	ld	a6,48(sp)
ffffffffc02058f8:	01151463          	bne	a0,a7,ffffffffc0205900 <stride_dequeue+0x740>
ffffffffc02058fc:	2f90106f          	j	ffffffffc02073f4 <stride_dequeue+0x2234>
ffffffffc0205900:	010e3583          	ld	a1,16(t3)
ffffffffc0205904:	8552                	mv	a0,s4
ffffffffc0205906:	008e3b03          	ld	s6,8(t3)
ffffffffc020590a:	f842                	sd	a6,48(sp)
ffffffffc020590c:	f472                	sd	t3,40(sp)
ffffffffc020590e:	ed2ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205912:	7e22                	ld	t3,40(sp)
ffffffffc0205914:	7842                	ld	a6,48(sp)
ffffffffc0205916:	016e3823          	sd	s6,16(t3)
ffffffffc020591a:	00ae3423          	sd	a0,8(t3)
ffffffffc020591e:	010c2b03          	lw	s6,16(s8)
ffffffffc0205922:	e119                	bnez	a0,ffffffffc0205928 <stride_dequeue+0x768>
ffffffffc0205924:	5a70106f          	j	ffffffffc02076ca <stride_dequeue+0x250a>
ffffffffc0205928:	01c53023          	sd	t3,0(a0)
ffffffffc020592c:	8a72                	mv	s4,t3
ffffffffc020592e:	7782                	ld	a5,32(sp)
ffffffffc0205930:	0149b423          	sd	s4,8(s3)
ffffffffc0205934:	00f9b823          	sd	a5,16(s3)
ffffffffc0205938:	013a3023          	sd	s3,0(s4)
ffffffffc020593c:	67e2                	ld	a5,24(sp)
ffffffffc020593e:	01383423          	sd	s3,8(a6)
ffffffffc0205942:	8a42                	mv	s4,a6
ffffffffc0205944:	00f83823          	sd	a5,16(a6)
ffffffffc0205948:	0109b023          	sd	a6,0(s3)
ffffffffc020594c:	89da                	mv	s3,s6
ffffffffc020594e:	67c2                	ld	a5,16(sp)
ffffffffc0205950:	014cb423          	sd	s4,8(s9)
ffffffffc0205954:	00fcb823          	sd	a5,16(s9)
ffffffffc0205958:	019a3023          	sd	s9,0(s4)
ffffffffc020595c:	67a2                	ld	a5,8(sp)
ffffffffc020595e:	019db423          	sd	s9,8(s11)
ffffffffc0205962:	00fdb823          	sd	a5,16(s11)
ffffffffc0205966:	01bcb023          	sd	s11,0(s9)
ffffffffc020596a:	b695                	j	ffffffffc02054ce <stride_dequeue+0x30e>
ffffffffc020596c:	00893783          	ld	a5,8(s2)
ffffffffc0205970:	01093883          	ld	a7,16(s2)
ffffffffc0205974:	ec2a                	sd	a0,24(sp)
ffffffffc0205976:	e83e                	sd	a5,16(sp)
ffffffffc0205978:	0a088963          	beqz	a7,ffffffffc0205a2a <stride_dequeue+0x86a>
ffffffffc020597c:	8546                	mv	a0,a7
ffffffffc020597e:	85e6                	mv	a1,s9
ffffffffc0205980:	f046                	sd	a7,32(sp)
ffffffffc0205982:	e02ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205986:	6862                	ld	a6,24(sp)
ffffffffc0205988:	7882                	ld	a7,32(sp)
ffffffffc020598a:	030504e3          	beq	a0,a6,ffffffffc02061b2 <stride_dequeue+0xff2>
ffffffffc020598e:	008cb783          	ld	a5,8(s9)
ffffffffc0205992:	010cb303          	ld	t1,16(s9)
ffffffffc0205996:	f042                	sd	a6,32(sp)
ffffffffc0205998:	ec3e                	sd	a5,24(sp)
ffffffffc020599a:	08030163          	beqz	t1,ffffffffc0205a1c <stride_dequeue+0x85c>
ffffffffc020599e:	859a                	mv	a1,t1
ffffffffc02059a0:	8546                	mv	a0,a7
ffffffffc02059a2:	f81a                	sd	t1,48(sp)
ffffffffc02059a4:	f446                	sd	a7,40(sp)
ffffffffc02059a6:	ddeff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02059aa:	7802                	ld	a6,32(sp)
ffffffffc02059ac:	78a2                	ld	a7,40(sp)
ffffffffc02059ae:	7342                	ld	t1,48(sp)
ffffffffc02059b0:	01051463          	bne	a0,a6,ffffffffc02059b8 <stride_dequeue+0x7f8>
ffffffffc02059b4:	0d00106f          	j	ffffffffc0206a84 <stride_dequeue+0x18c4>
ffffffffc02059b8:	00833783          	ld	a5,8(t1)
ffffffffc02059bc:	01033983          	ld	s3,16(t1)
ffffffffc02059c0:	f442                	sd	a6,40(sp)
ffffffffc02059c2:	f03e                	sd	a5,32(sp)
ffffffffc02059c4:	00099463          	bnez	s3,ffffffffc02059cc <stride_dequeue+0x80c>
ffffffffc02059c8:	6720106f          	j	ffffffffc020703a <stride_dequeue+0x1e7a>
ffffffffc02059cc:	8546                	mv	a0,a7
ffffffffc02059ce:	85ce                	mv	a1,s3
ffffffffc02059d0:	fc1a                	sd	t1,56(sp)
ffffffffc02059d2:	f846                	sd	a7,48(sp)
ffffffffc02059d4:	db0ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02059d8:	7822                	ld	a6,40(sp)
ffffffffc02059da:	78c2                	ld	a7,48(sp)
ffffffffc02059dc:	7362                	ld	t1,56(sp)
ffffffffc02059de:	01051463          	bne	a0,a6,ffffffffc02059e6 <stride_dequeue+0x826>
ffffffffc02059e2:	6700106f          	j	ffffffffc0207052 <stride_dequeue+0x1e92>
ffffffffc02059e6:	0109b583          	ld	a1,16(s3)
ffffffffc02059ea:	0089bb03          	ld	s6,8(s3)
ffffffffc02059ee:	8546                	mv	a0,a7
ffffffffc02059f0:	f41a                	sd	t1,40(sp)
ffffffffc02059f2:	deeff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02059f6:	00a9b423          	sd	a0,8(s3)
ffffffffc02059fa:	0169b823          	sd	s6,16(s3)
ffffffffc02059fe:	7322                	ld	t1,40(sp)
ffffffffc0205a00:	010c2b03          	lw	s6,16(s8)
ffffffffc0205a04:	c119                	beqz	a0,ffffffffc0205a0a <stride_dequeue+0x84a>
ffffffffc0205a06:	01353023          	sd	s3,0(a0)
ffffffffc0205a0a:	7782                	ld	a5,32(sp)
ffffffffc0205a0c:	01333423          	sd	s3,8(t1)
ffffffffc0205a10:	889a                	mv	a7,t1
ffffffffc0205a12:	00f33823          	sd	a5,16(t1)
ffffffffc0205a16:	0069b023          	sd	t1,0(s3)
ffffffffc0205a1a:	89da                	mv	s3,s6
ffffffffc0205a1c:	67e2                	ld	a5,24(sp)
ffffffffc0205a1e:	011cb423          	sd	a7,8(s9)
ffffffffc0205a22:	00fcb823          	sd	a5,16(s9)
ffffffffc0205a26:	0198b023          	sd	s9,0(a7)
ffffffffc0205a2a:	67c2                	ld	a5,16(sp)
ffffffffc0205a2c:	01993423          	sd	s9,8(s2)
ffffffffc0205a30:	00f93823          	sd	a5,16(s2)
ffffffffc0205a34:	012cb023          	sd	s2,0(s9)
ffffffffc0205a38:	b8f5                	j	ffffffffc0205334 <stride_dequeue+0x174>
ffffffffc0205a3a:	00893783          	ld	a5,8(s2)
ffffffffc0205a3e:	01093c83          	ld	s9,16(s2)
ffffffffc0205a42:	e43e                	sd	a5,8(sp)
ffffffffc0205a44:	0c0c8d63          	beqz	s9,ffffffffc0205b1e <stride_dequeue+0x95e>
ffffffffc0205a48:	85ee                	mv	a1,s11
ffffffffc0205a4a:	8566                	mv	a0,s9
ffffffffc0205a4c:	d38ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205a50:	58fd                	li	a7,-1
ffffffffc0205a52:	39150063          	beq	a0,a7,ffffffffc0205dd2 <stride_dequeue+0xc12>
ffffffffc0205a56:	008db783          	ld	a5,8(s11)
ffffffffc0205a5a:	010db803          	ld	a6,16(s11)
ffffffffc0205a5e:	e83e                	sd	a5,16(sp)
ffffffffc0205a60:	0a080863          	beqz	a6,ffffffffc0205b10 <stride_dequeue+0x950>
ffffffffc0205a64:	85c2                	mv	a1,a6
ffffffffc0205a66:	8566                	mv	a0,s9
ffffffffc0205a68:	ec42                	sd	a6,24(sp)
ffffffffc0205a6a:	d1aff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205a6e:	58fd                	li	a7,-1
ffffffffc0205a70:	6862                	ld	a6,24(sp)
ffffffffc0205a72:	7d150f63          	beq	a0,a7,ffffffffc0206250 <stride_dequeue+0x1090>
ffffffffc0205a76:	00883783          	ld	a5,8(a6)
ffffffffc0205a7a:	01083303          	ld	t1,16(a6)
ffffffffc0205a7e:	ec3e                	sd	a5,24(sp)
ffffffffc0205a80:	08030063          	beqz	t1,ffffffffc0205b00 <stride_dequeue+0x940>
ffffffffc0205a84:	859a                	mv	a1,t1
ffffffffc0205a86:	8566                	mv	a0,s9
ffffffffc0205a88:	f442                	sd	a6,40(sp)
ffffffffc0205a8a:	f01a                	sd	t1,32(sp)
ffffffffc0205a8c:	cf8ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205a90:	58fd                	li	a7,-1
ffffffffc0205a92:	7302                	ld	t1,32(sp)
ffffffffc0205a94:	7822                	ld	a6,40(sp)
ffffffffc0205a96:	65150fe3          	beq	a0,a7,ffffffffc02068f4 <stride_dequeue+0x1734>
ffffffffc0205a9a:	00833783          	ld	a5,8(t1)
ffffffffc0205a9e:	01033983          	ld	s3,16(t1)
ffffffffc0205aa2:	f03e                	sd	a5,32(sp)
ffffffffc0205aa4:	00099463          	bnez	s3,ffffffffc0205aac <stride_dequeue+0x8ec>
ffffffffc0205aa8:	5980106f          	j	ffffffffc0207040 <stride_dequeue+0x1e80>
ffffffffc0205aac:	85ce                	mv	a1,s3
ffffffffc0205aae:	8566                	mv	a0,s9
ffffffffc0205ab0:	f81a                	sd	t1,48(sp)
ffffffffc0205ab2:	f442                	sd	a6,40(sp)
ffffffffc0205ab4:	cd0ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205ab8:	58fd                	li	a7,-1
ffffffffc0205aba:	7822                	ld	a6,40(sp)
ffffffffc0205abc:	7342                	ld	t1,48(sp)
ffffffffc0205abe:	01151463          	bne	a0,a7,ffffffffc0205ac6 <stride_dequeue+0x906>
ffffffffc0205ac2:	5ea0106f          	j	ffffffffc02070ac <stride_dequeue+0x1eec>
ffffffffc0205ac6:	0109b583          	ld	a1,16(s3)
ffffffffc0205aca:	0089bb03          	ld	s6,8(s3)
ffffffffc0205ace:	8566                	mv	a0,s9
ffffffffc0205ad0:	f81a                	sd	t1,48(sp)
ffffffffc0205ad2:	f442                	sd	a6,40(sp)
ffffffffc0205ad4:	d0cff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205ad8:	00a9b423          	sd	a0,8(s3)
ffffffffc0205adc:	0169b823          	sd	s6,16(s3)
ffffffffc0205ae0:	7822                	ld	a6,40(sp)
ffffffffc0205ae2:	7342                	ld	t1,48(sp)
ffffffffc0205ae4:	010c2b03          	lw	s6,16(s8)
ffffffffc0205ae8:	c119                	beqz	a0,ffffffffc0205aee <stride_dequeue+0x92e>
ffffffffc0205aea:	01353023          	sd	s3,0(a0)
ffffffffc0205aee:	7782                	ld	a5,32(sp)
ffffffffc0205af0:	01333423          	sd	s3,8(t1)
ffffffffc0205af4:	8c9a                	mv	s9,t1
ffffffffc0205af6:	00f33823          	sd	a5,16(t1)
ffffffffc0205afa:	0069b023          	sd	t1,0(s3)
ffffffffc0205afe:	89da                	mv	s3,s6
ffffffffc0205b00:	67e2                	ld	a5,24(sp)
ffffffffc0205b02:	01983423          	sd	s9,8(a6)
ffffffffc0205b06:	00f83823          	sd	a5,16(a6)
ffffffffc0205b0a:	010cb023          	sd	a6,0(s9)
ffffffffc0205b0e:	8cc2                	mv	s9,a6
ffffffffc0205b10:	67c2                	ld	a5,16(sp)
ffffffffc0205b12:	019db423          	sd	s9,8(s11)
ffffffffc0205b16:	00fdb823          	sd	a5,16(s11)
ffffffffc0205b1a:	01bcb023          	sd	s11,0(s9)
ffffffffc0205b1e:	67a2                	ld	a5,8(sp)
ffffffffc0205b20:	01b93423          	sd	s11,8(s2)
ffffffffc0205b24:	00f93823          	sd	a5,16(s2)
ffffffffc0205b28:	012db023          	sd	s2,0(s11)
ffffffffc0205b2c:	819ff06f          	j	ffffffffc0205344 <stride_dequeue+0x184>
ffffffffc0205b30:	008cb783          	ld	a5,8(s9)
ffffffffc0205b34:	010cba03          	ld	s4,16(s9)
ffffffffc0205b38:	e43e                	sd	a5,8(sp)
ffffffffc0205b3a:	0c0a0d63          	beqz	s4,ffffffffc0205c14 <stride_dequeue+0xa54>
ffffffffc0205b3e:	85a6                	mv	a1,s1
ffffffffc0205b40:	8552                	mv	a0,s4
ffffffffc0205b42:	c42ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205b46:	58fd                	li	a7,-1
ffffffffc0205b48:	151500e3          	beq	a0,a7,ffffffffc0206488 <stride_dequeue+0x12c8>
ffffffffc0205b4c:	649c                	ld	a5,8(s1)
ffffffffc0205b4e:	0104b983          	ld	s3,16(s1)
ffffffffc0205b52:	e83e                	sd	a5,16(sp)
ffffffffc0205b54:	00099463          	bnez	s3,ffffffffc0205b5c <stride_dequeue+0x99c>
ffffffffc0205b58:	4f40106f          	j	ffffffffc020704c <stride_dequeue+0x1e8c>
ffffffffc0205b5c:	85ce                	mv	a1,s3
ffffffffc0205b5e:	8552                	mv	a0,s4
ffffffffc0205b60:	c24ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205b64:	58fd                	li	a7,-1
ffffffffc0205b66:	01151463          	bne	a0,a7,ffffffffc0205b6e <stride_dequeue+0x9ae>
ffffffffc0205b6a:	0b00106f          	j	ffffffffc0206c1a <stride_dequeue+0x1a5a>
ffffffffc0205b6e:	0089b783          	ld	a5,8(s3)
ffffffffc0205b72:	0109b303          	ld	t1,16(s3)
ffffffffc0205b76:	ec3e                	sd	a5,24(sp)
ffffffffc0205b78:	08030063          	beqz	t1,ffffffffc0205bf8 <stride_dequeue+0xa38>
ffffffffc0205b7c:	859a                	mv	a1,t1
ffffffffc0205b7e:	8552                	mv	a0,s4
ffffffffc0205b80:	f01a                	sd	t1,32(sp)
ffffffffc0205b82:	c02ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205b86:	58fd                	li	a7,-1
ffffffffc0205b88:	7302                	ld	t1,32(sp)
ffffffffc0205b8a:	01151463          	bne	a0,a7,ffffffffc0205b92 <stride_dequeue+0x9d2>
ffffffffc0205b8e:	0130106f          	j	ffffffffc02073a0 <stride_dequeue+0x21e0>
ffffffffc0205b92:	00833783          	ld	a5,8(t1)
ffffffffc0205b96:	01033e03          	ld	t3,16(t1)
ffffffffc0205b9a:	f03e                	sd	a5,32(sp)
ffffffffc0205b9c:	040e0663          	beqz	t3,ffffffffc0205be8 <stride_dequeue+0xa28>
ffffffffc0205ba0:	85f2                	mv	a1,t3
ffffffffc0205ba2:	8552                	mv	a0,s4
ffffffffc0205ba4:	f81a                	sd	t1,48(sp)
ffffffffc0205ba6:	f472                	sd	t3,40(sp)
ffffffffc0205ba8:	bdcff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205bac:	58fd                	li	a7,-1
ffffffffc0205bae:	7e22                	ld	t3,40(sp)
ffffffffc0205bb0:	7342                	ld	t1,48(sp)
ffffffffc0205bb2:	01151463          	bne	a0,a7,ffffffffc0205bba <stride_dequeue+0x9fa>
ffffffffc0205bb6:	53d0106f          	j	ffffffffc02078f2 <stride_dequeue+0x2732>
ffffffffc0205bba:	010e3583          	ld	a1,16(t3)
ffffffffc0205bbe:	8552                	mv	a0,s4
ffffffffc0205bc0:	008e3b03          	ld	s6,8(t3)
ffffffffc0205bc4:	f81a                	sd	t1,48(sp)
ffffffffc0205bc6:	f472                	sd	t3,40(sp)
ffffffffc0205bc8:	c18ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205bcc:	7e22                	ld	t3,40(sp)
ffffffffc0205bce:	7342                	ld	t1,48(sp)
ffffffffc0205bd0:	016e3823          	sd	s6,16(t3)
ffffffffc0205bd4:	00ae3423          	sd	a0,8(t3)
ffffffffc0205bd8:	010c2b03          	lw	s6,16(s8)
ffffffffc0205bdc:	e119                	bnez	a0,ffffffffc0205be2 <stride_dequeue+0xa22>
ffffffffc0205bde:	76d0106f          	j	ffffffffc0207b4a <stride_dequeue+0x298a>
ffffffffc0205be2:	01c53023          	sd	t3,0(a0)
ffffffffc0205be6:	8a72                	mv	s4,t3
ffffffffc0205be8:	7782                	ld	a5,32(sp)
ffffffffc0205bea:	01433423          	sd	s4,8(t1)
ffffffffc0205bee:	00f33823          	sd	a5,16(t1)
ffffffffc0205bf2:	006a3023          	sd	t1,0(s4)
ffffffffc0205bf6:	8a1a                	mv	s4,t1
ffffffffc0205bf8:	67e2                	ld	a5,24(sp)
ffffffffc0205bfa:	0149b423          	sd	s4,8(s3)
ffffffffc0205bfe:	00f9b823          	sd	a5,16(s3)
ffffffffc0205c02:	013a3023          	sd	s3,0(s4)
ffffffffc0205c06:	67c2                	ld	a5,16(sp)
ffffffffc0205c08:	0134b423          	sd	s3,8(s1)
ffffffffc0205c0c:	e89c                	sd	a5,16(s1)
ffffffffc0205c0e:	0099b023          	sd	s1,0(s3)
ffffffffc0205c12:	89da                	mv	s3,s6
ffffffffc0205c14:	67a2                	ld	a5,8(sp)
ffffffffc0205c16:	009cb423          	sd	s1,8(s9)
ffffffffc0205c1a:	00fcb823          	sd	a5,16(s9)
ffffffffc0205c1e:	0194b023          	sd	s9,0(s1)
ffffffffc0205c22:	84e6                	mv	s1,s9
ffffffffc0205c24:	b635                	j	ffffffffc0205750 <stride_dequeue+0x590>
ffffffffc0205c26:	008db783          	ld	a5,8(s11)
ffffffffc0205c2a:	010db883          	ld	a7,16(s11)
ffffffffc0205c2e:	ec2a                	sd	a0,24(sp)
ffffffffc0205c30:	e83e                	sd	a5,16(sp)
ffffffffc0205c32:	0a088963          	beqz	a7,ffffffffc0205ce4 <stride_dequeue+0xb24>
ffffffffc0205c36:	8546                	mv	a0,a7
ffffffffc0205c38:	85d2                	mv	a1,s4
ffffffffc0205c3a:	f046                	sd	a7,32(sp)
ffffffffc0205c3c:	b48ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205c40:	6862                	ld	a6,24(sp)
ffffffffc0205c42:	7882                	ld	a7,32(sp)
ffffffffc0205c44:	0d050ae3          	beq	a0,a6,ffffffffc0206518 <stride_dequeue+0x1358>
ffffffffc0205c48:	008a3783          	ld	a5,8(s4)
ffffffffc0205c4c:	010a3983          	ld	s3,16(s4)
ffffffffc0205c50:	f042                	sd	a6,32(sp)
ffffffffc0205c52:	ec3e                	sd	a5,24(sp)
ffffffffc0205c54:	00099463          	bnez	s3,ffffffffc0205c5c <stride_dequeue+0xa9c>
ffffffffc0205c58:	53e0106f          	j	ffffffffc0207196 <stride_dequeue+0x1fd6>
ffffffffc0205c5c:	8546                	mv	a0,a7
ffffffffc0205c5e:	85ce                	mv	a1,s3
ffffffffc0205c60:	f446                	sd	a7,40(sp)
ffffffffc0205c62:	b22ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205c66:	7802                	ld	a6,32(sp)
ffffffffc0205c68:	78a2                	ld	a7,40(sp)
ffffffffc0205c6a:	01051463          	bne	a0,a6,ffffffffc0205c72 <stride_dequeue+0xab2>
ffffffffc0205c6e:	1260106f          	j	ffffffffc0206d94 <stride_dequeue+0x1bd4>
ffffffffc0205c72:	0089b783          	ld	a5,8(s3)
ffffffffc0205c76:	0109be03          	ld	t3,16(s3)
ffffffffc0205c7a:	f442                	sd	a6,40(sp)
ffffffffc0205c7c:	f03e                	sd	a5,32(sp)
ffffffffc0205c7e:	040e0463          	beqz	t3,ffffffffc0205cc6 <stride_dequeue+0xb06>
ffffffffc0205c82:	85f2                	mv	a1,t3
ffffffffc0205c84:	8546                	mv	a0,a7
ffffffffc0205c86:	fc72                	sd	t3,56(sp)
ffffffffc0205c88:	f846                	sd	a7,48(sp)
ffffffffc0205c8a:	afaff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205c8e:	7822                	ld	a6,40(sp)
ffffffffc0205c90:	78c2                	ld	a7,48(sp)
ffffffffc0205c92:	7e62                	ld	t3,56(sp)
ffffffffc0205c94:	01051463          	bne	a0,a6,ffffffffc0205c9c <stride_dequeue+0xadc>
ffffffffc0205c98:	0e70106f          	j	ffffffffc020757e <stride_dequeue+0x23be>
ffffffffc0205c9c:	010e3583          	ld	a1,16(t3)
ffffffffc0205ca0:	8546                	mv	a0,a7
ffffffffc0205ca2:	008e3b03          	ld	s6,8(t3)
ffffffffc0205ca6:	f472                	sd	t3,40(sp)
ffffffffc0205ca8:	b38ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205cac:	7e22                	ld	t3,40(sp)
ffffffffc0205cae:	016e3823          	sd	s6,16(t3)
ffffffffc0205cb2:	00ae3423          	sd	a0,8(t3)
ffffffffc0205cb6:	010c2b03          	lw	s6,16(s8)
ffffffffc0205cba:	e119                	bnez	a0,ffffffffc0205cc0 <stride_dequeue+0xb00>
ffffffffc0205cbc:	1c10106f          	j	ffffffffc020767c <stride_dequeue+0x24bc>
ffffffffc0205cc0:	01c53023          	sd	t3,0(a0)
ffffffffc0205cc4:	88f2                	mv	a7,t3
ffffffffc0205cc6:	7782                	ld	a5,32(sp)
ffffffffc0205cc8:	0119b423          	sd	a7,8(s3)
ffffffffc0205ccc:	00f9b823          	sd	a5,16(s3)
ffffffffc0205cd0:	0138b023          	sd	s3,0(a7)
ffffffffc0205cd4:	67e2                	ld	a5,24(sp)
ffffffffc0205cd6:	013a3423          	sd	s3,8(s4)
ffffffffc0205cda:	00fa3823          	sd	a5,16(s4)
ffffffffc0205cde:	0149b023          	sd	s4,0(s3)
ffffffffc0205ce2:	89da                	mv	s3,s6
ffffffffc0205ce4:	67c2                	ld	a5,16(sp)
ffffffffc0205ce6:	014db423          	sd	s4,8(s11)
ffffffffc0205cea:	00fdb823          	sd	a5,16(s11)
ffffffffc0205cee:	01ba3023          	sd	s11,0(s4)
ffffffffc0205cf2:	fccff06f          	j	ffffffffc02054be <stride_dequeue+0x2fe>
ffffffffc0205cf6:	008db783          	ld	a5,8(s11)
ffffffffc0205cfa:	010db883          	ld	a7,16(s11)
ffffffffc0205cfe:	e82a                	sd	a0,16(sp)
ffffffffc0205d00:	e43e                	sd	a5,8(sp)
ffffffffc0205d02:	0a088f63          	beqz	a7,ffffffffc0205dc0 <stride_dequeue+0xc00>
ffffffffc0205d06:	85b2                	mv	a1,a2
ffffffffc0205d08:	8546                	mv	a0,a7
ffffffffc0205d0a:	f032                	sd	a2,32(sp)
ffffffffc0205d0c:	ec46                	sd	a7,24(sp)
ffffffffc0205d0e:	a76ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205d12:	6842                	ld	a6,16(sp)
ffffffffc0205d14:	68e2                	ld	a7,24(sp)
ffffffffc0205d16:	7602                	ld	a2,32(sp)
ffffffffc0205d18:	150506e3          	beq	a0,a6,ffffffffc0206664 <stride_dequeue+0x14a4>
ffffffffc0205d1c:	661c                	ld	a5,8(a2)
ffffffffc0205d1e:	01063983          	ld	s3,16(a2)
ffffffffc0205d22:	ec42                	sd	a6,24(sp)
ffffffffc0205d24:	e83e                	sd	a5,16(sp)
ffffffffc0205d26:	00099463          	bnez	s3,ffffffffc0205d2e <stride_dequeue+0xb6e>
ffffffffc0205d2a:	4660106f          	j	ffffffffc0207190 <stride_dequeue+0x1fd0>
ffffffffc0205d2e:	8546                	mv	a0,a7
ffffffffc0205d30:	85ce                	mv	a1,s3
ffffffffc0205d32:	f432                	sd	a2,40(sp)
ffffffffc0205d34:	f046                	sd	a7,32(sp)
ffffffffc0205d36:	a4eff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205d3a:	6862                	ld	a6,24(sp)
ffffffffc0205d3c:	7882                	ld	a7,32(sp)
ffffffffc0205d3e:	7622                	ld	a2,40(sp)
ffffffffc0205d40:	01051463          	bne	a0,a6,ffffffffc0205d48 <stride_dequeue+0xb88>
ffffffffc0205d44:	0ae0106f          	j	ffffffffc0206df2 <stride_dequeue+0x1c32>
ffffffffc0205d48:	0089b783          	ld	a5,8(s3)
ffffffffc0205d4c:	0109be03          	ld	t3,16(s3)
ffffffffc0205d50:	f042                	sd	a6,32(sp)
ffffffffc0205d52:	ec3e                	sd	a5,24(sp)
ffffffffc0205d54:	040e0863          	beqz	t3,ffffffffc0205da4 <stride_dequeue+0xbe4>
ffffffffc0205d58:	85f2                	mv	a1,t3
ffffffffc0205d5a:	8546                	mv	a0,a7
ffffffffc0205d5c:	fc32                	sd	a2,56(sp)
ffffffffc0205d5e:	f872                	sd	t3,48(sp)
ffffffffc0205d60:	f446                	sd	a7,40(sp)
ffffffffc0205d62:	a22ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205d66:	7662                	ld	a2,56(sp)
ffffffffc0205d68:	7802                	ld	a6,32(sp)
ffffffffc0205d6a:	78a2                	ld	a7,40(sp)
ffffffffc0205d6c:	f432                	sd	a2,40(sp)
ffffffffc0205d6e:	7e42                	ld	t3,48(sp)
ffffffffc0205d70:	01051463          	bne	a0,a6,ffffffffc0205d78 <stride_dequeue+0xbb8>
ffffffffc0205d74:	6ac0106f          	j	ffffffffc0207420 <stride_dequeue+0x2260>
ffffffffc0205d78:	010e3583          	ld	a1,16(t3)
ffffffffc0205d7c:	8546                	mv	a0,a7
ffffffffc0205d7e:	008e3b03          	ld	s6,8(t3)
ffffffffc0205d82:	f072                	sd	t3,32(sp)
ffffffffc0205d84:	a5cff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205d88:	7e02                	ld	t3,32(sp)
ffffffffc0205d8a:	7622                	ld	a2,40(sp)
ffffffffc0205d8c:	016e3823          	sd	s6,16(t3)
ffffffffc0205d90:	00ae3423          	sd	a0,8(t3)
ffffffffc0205d94:	010c2b03          	lw	s6,16(s8)
ffffffffc0205d98:	e119                	bnez	a0,ffffffffc0205d9e <stride_dequeue+0xbde>
ffffffffc0205d9a:	1370106f          	j	ffffffffc02076d0 <stride_dequeue+0x2510>
ffffffffc0205d9e:	01c53023          	sd	t3,0(a0)
ffffffffc0205da2:	88f2                	mv	a7,t3
ffffffffc0205da4:	67e2                	ld	a5,24(sp)
ffffffffc0205da6:	0119b423          	sd	a7,8(s3)
ffffffffc0205daa:	00f9b823          	sd	a5,16(s3)
ffffffffc0205dae:	0138b023          	sd	s3,0(a7)
ffffffffc0205db2:	67c2                	ld	a5,16(sp)
ffffffffc0205db4:	01363423          	sd	s3,8(a2)
ffffffffc0205db8:	ea1c                	sd	a5,16(a2)
ffffffffc0205dba:	00c9b023          	sd	a2,0(s3)
ffffffffc0205dbe:	89da                	mv	s3,s6
ffffffffc0205dc0:	67a2                	ld	a5,8(sp)
ffffffffc0205dc2:	00cdb423          	sd	a2,8(s11)
ffffffffc0205dc6:	00fdb823          	sd	a5,16(s11)
ffffffffc0205dca:	01b63023          	sd	s11,0(a2)
ffffffffc0205dce:	849ff06f          	j	ffffffffc0205616 <stride_dequeue+0x456>
ffffffffc0205dd2:	008cb783          	ld	a5,8(s9)
ffffffffc0205dd6:	010cb883          	ld	a7,16(s9)
ffffffffc0205dda:	ec2a                	sd	a0,24(sp)
ffffffffc0205ddc:	e83e                	sd	a5,16(sp)
ffffffffc0205dde:	0a088963          	beqz	a7,ffffffffc0205e90 <stride_dequeue+0xcd0>
ffffffffc0205de2:	8546                	mv	a0,a7
ffffffffc0205de4:	85ee                	mv	a1,s11
ffffffffc0205de6:	f046                	sd	a7,32(sp)
ffffffffc0205de8:	99cff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205dec:	6862                	ld	a6,24(sp)
ffffffffc0205dee:	7882                	ld	a7,32(sp)
ffffffffc0205df0:	7d050863          	beq	a0,a6,ffffffffc02065c0 <stride_dequeue+0x1400>
ffffffffc0205df4:	008db783          	ld	a5,8(s11)
ffffffffc0205df8:	010db983          	ld	s3,16(s11)
ffffffffc0205dfc:	f042                	sd	a6,32(sp)
ffffffffc0205dfe:	ec3e                	sd	a5,24(sp)
ffffffffc0205e00:	00099463          	bnez	s3,ffffffffc0205e08 <stride_dequeue+0xc48>
ffffffffc0205e04:	3600106f          	j	ffffffffc0207164 <stride_dequeue+0x1fa4>
ffffffffc0205e08:	8546                	mv	a0,a7
ffffffffc0205e0a:	85ce                	mv	a1,s3
ffffffffc0205e0c:	f446                	sd	a7,40(sp)
ffffffffc0205e0e:	976ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205e12:	7802                	ld	a6,32(sp)
ffffffffc0205e14:	78a2                	ld	a7,40(sp)
ffffffffc0205e16:	01051463          	bne	a0,a6,ffffffffc0205e1e <stride_dequeue+0xc5e>
ffffffffc0205e1a:	71d0006f          	j	ffffffffc0206d36 <stride_dequeue+0x1b76>
ffffffffc0205e1e:	0089b783          	ld	a5,8(s3)
ffffffffc0205e22:	0109be03          	ld	t3,16(s3)
ffffffffc0205e26:	f442                	sd	a6,40(sp)
ffffffffc0205e28:	f03e                	sd	a5,32(sp)
ffffffffc0205e2a:	040e0463          	beqz	t3,ffffffffc0205e72 <stride_dequeue+0xcb2>
ffffffffc0205e2e:	85f2                	mv	a1,t3
ffffffffc0205e30:	8546                	mv	a0,a7
ffffffffc0205e32:	fc72                	sd	t3,56(sp)
ffffffffc0205e34:	f846                	sd	a7,48(sp)
ffffffffc0205e36:	94eff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205e3a:	7822                	ld	a6,40(sp)
ffffffffc0205e3c:	78c2                	ld	a7,48(sp)
ffffffffc0205e3e:	7e62                	ld	t3,56(sp)
ffffffffc0205e40:	01051463          	bne	a0,a6,ffffffffc0205e48 <stride_dequeue+0xc88>
ffffffffc0205e44:	60a0106f          	j	ffffffffc020744e <stride_dequeue+0x228e>
ffffffffc0205e48:	010e3583          	ld	a1,16(t3)
ffffffffc0205e4c:	8546                	mv	a0,a7
ffffffffc0205e4e:	008e3b03          	ld	s6,8(t3)
ffffffffc0205e52:	f472                	sd	t3,40(sp)
ffffffffc0205e54:	98cff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205e58:	7e22                	ld	t3,40(sp)
ffffffffc0205e5a:	016e3823          	sd	s6,16(t3)
ffffffffc0205e5e:	00ae3423          	sd	a0,8(t3)
ffffffffc0205e62:	010c2b03          	lw	s6,16(s8)
ffffffffc0205e66:	e119                	bnez	a0,ffffffffc0205e6c <stride_dequeue+0xcac>
ffffffffc0205e68:	0270106f          	j	ffffffffc020768e <stride_dequeue+0x24ce>
ffffffffc0205e6c:	01c53023          	sd	t3,0(a0)
ffffffffc0205e70:	88f2                	mv	a7,t3
ffffffffc0205e72:	7782                	ld	a5,32(sp)
ffffffffc0205e74:	0119b423          	sd	a7,8(s3)
ffffffffc0205e78:	00f9b823          	sd	a5,16(s3)
ffffffffc0205e7c:	0138b023          	sd	s3,0(a7)
ffffffffc0205e80:	67e2                	ld	a5,24(sp)
ffffffffc0205e82:	013db423          	sd	s3,8(s11)
ffffffffc0205e86:	00fdb823          	sd	a5,16(s11)
ffffffffc0205e8a:	01b9b023          	sd	s11,0(s3)
ffffffffc0205e8e:	89da                	mv	s3,s6
ffffffffc0205e90:	67c2                	ld	a5,16(sp)
ffffffffc0205e92:	01bcb423          	sd	s11,8(s9)
ffffffffc0205e96:	00fcb823          	sd	a5,16(s9)
ffffffffc0205e9a:	019db023          	sd	s9,0(s11)
ffffffffc0205e9e:	8de6                	mv	s11,s9
ffffffffc0205ea0:	b9bd                	j	ffffffffc0205b1e <stride_dequeue+0x95e>
ffffffffc0205ea2:	00893783          	ld	a5,8(s2)
ffffffffc0205ea6:	01093883          	ld	a7,16(s2)
ffffffffc0205eaa:	f02a                	sd	a0,32(sp)
ffffffffc0205eac:	ec3e                	sd	a5,24(sp)
ffffffffc0205eae:	06088c63          	beqz	a7,ffffffffc0205f26 <stride_dequeue+0xd66>
ffffffffc0205eb2:	85c2                	mv	a1,a6
ffffffffc0205eb4:	8546                	mv	a0,a7
ffffffffc0205eb6:	f842                	sd	a6,48(sp)
ffffffffc0205eb8:	f446                	sd	a7,40(sp)
ffffffffc0205eba:	8caff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205ebe:	7302                	ld	t1,32(sp)
ffffffffc0205ec0:	78a2                	ld	a7,40(sp)
ffffffffc0205ec2:	7842                	ld	a6,48(sp)
ffffffffc0205ec4:	2e650ee3          	beq	a0,t1,ffffffffc02069c0 <stride_dequeue+0x1800>
ffffffffc0205ec8:	00883783          	ld	a5,8(a6)
ffffffffc0205ecc:	01083983          	ld	s3,16(a6)
ffffffffc0205ed0:	f41a                	sd	t1,40(sp)
ffffffffc0205ed2:	f03e                	sd	a5,32(sp)
ffffffffc0205ed4:	64098ee3          	beqz	s3,ffffffffc0206d30 <stride_dequeue+0x1b70>
ffffffffc0205ed8:	8546                	mv	a0,a7
ffffffffc0205eda:	85ce                	mv	a1,s3
ffffffffc0205edc:	fc42                	sd	a6,56(sp)
ffffffffc0205ede:	f846                	sd	a7,48(sp)
ffffffffc0205ee0:	8a4ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205ee4:	7322                	ld	t1,40(sp)
ffffffffc0205ee6:	78c2                	ld	a7,48(sp)
ffffffffc0205ee8:	7862                	ld	a6,56(sp)
ffffffffc0205eea:	00651463          	bne	a0,t1,ffffffffc0205ef2 <stride_dequeue+0xd32>
ffffffffc0205eee:	1e80106f          	j	ffffffffc02070d6 <stride_dequeue+0x1f16>
ffffffffc0205ef2:	0109b583          	ld	a1,16(s3)
ffffffffc0205ef6:	0089bb03          	ld	s6,8(s3)
ffffffffc0205efa:	8546                	mv	a0,a7
ffffffffc0205efc:	f442                	sd	a6,40(sp)
ffffffffc0205efe:	8e2ff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205f02:	00a9b423          	sd	a0,8(s3)
ffffffffc0205f06:	0169b823          	sd	s6,16(s3)
ffffffffc0205f0a:	7822                	ld	a6,40(sp)
ffffffffc0205f0c:	010c2b03          	lw	s6,16(s8)
ffffffffc0205f10:	c119                	beqz	a0,ffffffffc0205f16 <stride_dequeue+0xd56>
ffffffffc0205f12:	01353023          	sd	s3,0(a0)
ffffffffc0205f16:	7782                	ld	a5,32(sp)
ffffffffc0205f18:	01383423          	sd	s3,8(a6)
ffffffffc0205f1c:	00f83823          	sd	a5,16(a6)
ffffffffc0205f20:	0109b023          	sd	a6,0(s3)
ffffffffc0205f24:	89da                	mv	s3,s6
ffffffffc0205f26:	67e2                	ld	a5,24(sp)
ffffffffc0205f28:	01093423          	sd	a6,8(s2)
ffffffffc0205f2c:	00f93823          	sd	a5,16(s2)
ffffffffc0205f30:	01283023          	sd	s2,0(a6)
ffffffffc0205f34:	bf0ff06f          	j	ffffffffc0205324 <stride_dequeue+0x164>
ffffffffc0205f38:	008cb783          	ld	a5,8(s9)
ffffffffc0205f3c:	010cb983          	ld	s3,16(s9)
ffffffffc0205f40:	ec2a                	sd	a0,24(sp)
ffffffffc0205f42:	e83e                	sd	a5,16(sp)
ffffffffc0205f44:	0a098763          	beqz	s3,ffffffffc0205ff2 <stride_dequeue+0xe32>
ffffffffc0205f48:	85d2                	mv	a1,s4
ffffffffc0205f4a:	854e                	mv	a0,s3
ffffffffc0205f4c:	838ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205f50:	6862                	ld	a6,24(sp)
ffffffffc0205f52:	3b050fe3          	beq	a0,a6,ffffffffc0206b10 <stride_dequeue+0x1950>
ffffffffc0205f56:	008a3783          	ld	a5,8(s4)
ffffffffc0205f5a:	010a3303          	ld	t1,16(s4)
ffffffffc0205f5e:	f042                	sd	a6,32(sp)
ffffffffc0205f60:	ec3e                	sd	a5,24(sp)
ffffffffc0205f62:	08030163          	beqz	t1,ffffffffc0205fe4 <stride_dequeue+0xe24>
ffffffffc0205f66:	859a                	mv	a1,t1
ffffffffc0205f68:	854e                	mv	a0,s3
ffffffffc0205f6a:	f41a                	sd	t1,40(sp)
ffffffffc0205f6c:	818ff0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205f70:	7802                	ld	a6,32(sp)
ffffffffc0205f72:	7322                	ld	t1,40(sp)
ffffffffc0205f74:	01051463          	bne	a0,a6,ffffffffc0205f7c <stride_dequeue+0xdbc>
ffffffffc0205f78:	3da0106f          	j	ffffffffc0207352 <stride_dequeue+0x2192>
ffffffffc0205f7c:	00833783          	ld	a5,8(t1)
ffffffffc0205f80:	01033e03          	ld	t3,16(t1)
ffffffffc0205f84:	fc42                	sd	a6,56(sp)
ffffffffc0205f86:	f03e                	sd	a5,32(sp)
ffffffffc0205f88:	040e0663          	beqz	t3,ffffffffc0205fd4 <stride_dequeue+0xe14>
ffffffffc0205f8c:	85f2                	mv	a1,t3
ffffffffc0205f8e:	854e                	mv	a0,s3
ffffffffc0205f90:	f81a                	sd	t1,48(sp)
ffffffffc0205f92:	f472                	sd	t3,40(sp)
ffffffffc0205f94:	ff1fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0205f98:	7862                	ld	a6,56(sp)
ffffffffc0205f9a:	7e22                	ld	t3,40(sp)
ffffffffc0205f9c:	7342                	ld	t1,48(sp)
ffffffffc0205f9e:	01051463          	bne	a0,a6,ffffffffc0205fa6 <stride_dequeue+0xde6>
ffffffffc0205fa2:	0c90106f          	j	ffffffffc020786a <stride_dequeue+0x26aa>
ffffffffc0205fa6:	010e3583          	ld	a1,16(t3)
ffffffffc0205faa:	854e                	mv	a0,s3
ffffffffc0205fac:	008e3b03          	ld	s6,8(t3)
ffffffffc0205fb0:	f81a                	sd	t1,48(sp)
ffffffffc0205fb2:	f472                	sd	t3,40(sp)
ffffffffc0205fb4:	82cff0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0205fb8:	7e22                	ld	t3,40(sp)
ffffffffc0205fba:	7342                	ld	t1,48(sp)
ffffffffc0205fbc:	016e3823          	sd	s6,16(t3)
ffffffffc0205fc0:	00ae3423          	sd	a0,8(t3)
ffffffffc0205fc4:	010c2b03          	lw	s6,16(s8)
ffffffffc0205fc8:	e119                	bnez	a0,ffffffffc0205fce <stride_dequeue+0xe0e>
ffffffffc0205fca:	32d0106f          	j	ffffffffc0207af6 <stride_dequeue+0x2936>
ffffffffc0205fce:	01c53023          	sd	t3,0(a0)
ffffffffc0205fd2:	89f2                	mv	s3,t3
ffffffffc0205fd4:	7782                	ld	a5,32(sp)
ffffffffc0205fd6:	01333423          	sd	s3,8(t1)
ffffffffc0205fda:	00f33823          	sd	a5,16(t1)
ffffffffc0205fde:	0069b023          	sd	t1,0(s3)
ffffffffc0205fe2:	899a                	mv	s3,t1
ffffffffc0205fe4:	67e2                	ld	a5,24(sp)
ffffffffc0205fe6:	013a3423          	sd	s3,8(s4)
ffffffffc0205fea:	00fa3823          	sd	a5,16(s4)
ffffffffc0205fee:	0149b023          	sd	s4,0(s3)
ffffffffc0205ff2:	67c2                	ld	a5,16(sp)
ffffffffc0205ff4:	014cb423          	sd	s4,8(s9)
ffffffffc0205ff8:	89da                	mv	s3,s6
ffffffffc0205ffa:	00fcb823          	sd	a5,16(s9)
ffffffffc0205ffe:	019a3023          	sd	s9,0(s4)
ffffffffc0206002:	f42ff06f          	j	ffffffffc0205744 <stride_dequeue+0x584>
ffffffffc0206006:	661c                	ld	a5,8(a2)
ffffffffc0206008:	01063983          	ld	s3,16(a2)
ffffffffc020600c:	e82a                	sd	a0,16(sp)
ffffffffc020600e:	e43e                	sd	a5,8(sp)
ffffffffc0206010:	0a098f63          	beqz	s3,ffffffffc02060ce <stride_dequeue+0xf0e>
ffffffffc0206014:	85d2                	mv	a1,s4
ffffffffc0206016:	854e                	mv	a0,s3
ffffffffc0206018:	ec32                	sd	a2,24(sp)
ffffffffc020601a:	f6bfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020601e:	6842                	ld	a6,16(sp)
ffffffffc0206020:	6662                	ld	a2,24(sp)
ffffffffc0206022:	39050de3          	beq	a0,a6,ffffffffc0206bbc <stride_dequeue+0x19fc>
ffffffffc0206026:	008a3783          	ld	a5,8(s4)
ffffffffc020602a:	010a3303          	ld	t1,16(s4)
ffffffffc020602e:	ec42                	sd	a6,24(sp)
ffffffffc0206030:	e83e                	sd	a5,16(sp)
ffffffffc0206032:	08030763          	beqz	t1,ffffffffc02060c0 <stride_dequeue+0xf00>
ffffffffc0206036:	859a                	mv	a1,t1
ffffffffc0206038:	854e                	mv	a0,s3
ffffffffc020603a:	f432                	sd	a2,40(sp)
ffffffffc020603c:	f01a                	sd	t1,32(sp)
ffffffffc020603e:	f47fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206042:	6862                	ld	a6,24(sp)
ffffffffc0206044:	7302                	ld	t1,32(sp)
ffffffffc0206046:	7622                	ld	a2,40(sp)
ffffffffc0206048:	01051463          	bne	a0,a6,ffffffffc0206050 <stride_dequeue+0xe90>
ffffffffc020604c:	5060106f          	j	ffffffffc0207552 <stride_dequeue+0x2392>
ffffffffc0206050:	00833783          	ld	a5,8(t1)
ffffffffc0206054:	01033e03          	ld	t3,16(t1)
ffffffffc0206058:	fc42                	sd	a6,56(sp)
ffffffffc020605a:	ec3e                	sd	a5,24(sp)
ffffffffc020605c:	040e0a63          	beqz	t3,ffffffffc02060b0 <stride_dequeue+0xef0>
ffffffffc0206060:	85f2                	mv	a1,t3
ffffffffc0206062:	854e                	mv	a0,s3
ffffffffc0206064:	f81a                	sd	t1,48(sp)
ffffffffc0206066:	f432                	sd	a2,40(sp)
ffffffffc0206068:	f072                	sd	t3,32(sp)
ffffffffc020606a:	f1bfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020606e:	7862                	ld	a6,56(sp)
ffffffffc0206070:	7e02                	ld	t3,32(sp)
ffffffffc0206072:	7622                	ld	a2,40(sp)
ffffffffc0206074:	7342                	ld	t1,48(sp)
ffffffffc0206076:	01051463          	bne	a0,a6,ffffffffc020607e <stride_dequeue+0xebe>
ffffffffc020607a:	1e10106f          	j	ffffffffc0207a5a <stride_dequeue+0x289a>
ffffffffc020607e:	010e3583          	ld	a1,16(t3)
ffffffffc0206082:	854e                	mv	a0,s3
ffffffffc0206084:	008e3b03          	ld	s6,8(t3)
ffffffffc0206088:	f81a                	sd	t1,48(sp)
ffffffffc020608a:	f432                	sd	a2,40(sp)
ffffffffc020608c:	f072                	sd	t3,32(sp)
ffffffffc020608e:	f53fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206092:	7e02                	ld	t3,32(sp)
ffffffffc0206094:	7622                	ld	a2,40(sp)
ffffffffc0206096:	7342                	ld	t1,48(sp)
ffffffffc0206098:	016e3823          	sd	s6,16(t3)
ffffffffc020609c:	00ae3423          	sd	a0,8(t3)
ffffffffc02060a0:	010c2b03          	lw	s6,16(s8)
ffffffffc02060a4:	e119                	bnez	a0,ffffffffc02060aa <stride_dequeue+0xeea>
ffffffffc02060a6:	22d0106f          	j	ffffffffc0207ad2 <stride_dequeue+0x2912>
ffffffffc02060aa:	01c53023          	sd	t3,0(a0)
ffffffffc02060ae:	89f2                	mv	s3,t3
ffffffffc02060b0:	67e2                	ld	a5,24(sp)
ffffffffc02060b2:	01333423          	sd	s3,8(t1)
ffffffffc02060b6:	00f33823          	sd	a5,16(t1)
ffffffffc02060ba:	0069b023          	sd	t1,0(s3)
ffffffffc02060be:	899a                	mv	s3,t1
ffffffffc02060c0:	67c2                	ld	a5,16(sp)
ffffffffc02060c2:	013a3423          	sd	s3,8(s4)
ffffffffc02060c6:	00fa3823          	sd	a5,16(s4)
ffffffffc02060ca:	0149b023          	sd	s4,0(s3)
ffffffffc02060ce:	67a2                	ld	a5,8(sp)
ffffffffc02060d0:	01463423          	sd	s4,8(a2)
ffffffffc02060d4:	89da                	mv	s3,s6
ffffffffc02060d6:	ea1c                	sd	a5,16(a2)
ffffffffc02060d8:	00ca3023          	sd	a2,0(s4)
ffffffffc02060dc:	8a32                	mv	s4,a2
ffffffffc02060de:	f80ff06f          	j	ffffffffc020585e <stride_dequeue+0x69e>
ffffffffc02060e2:	008a3783          	ld	a5,8(s4)
ffffffffc02060e6:	010a3983          	ld	s3,16(s4)
ffffffffc02060ea:	ec2a                	sd	a0,24(sp)
ffffffffc02060ec:	e83e                	sd	a5,16(sp)
ffffffffc02060ee:	0a098763          	beqz	s3,ffffffffc020619c <stride_dequeue+0xfdc>
ffffffffc02060f2:	85e6                	mv	a1,s9
ffffffffc02060f4:	854e                	mv	a0,s3
ffffffffc02060f6:	e8ffe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02060fa:	6862                	ld	a6,24(sp)
ffffffffc02060fc:	270505e3          	beq	a0,a6,ffffffffc0206b66 <stride_dequeue+0x19a6>
ffffffffc0206100:	008cb783          	ld	a5,8(s9)
ffffffffc0206104:	010cb303          	ld	t1,16(s9)
ffffffffc0206108:	f042                	sd	a6,32(sp)
ffffffffc020610a:	ec3e                	sd	a5,24(sp)
ffffffffc020610c:	08030163          	beqz	t1,ffffffffc020618e <stride_dequeue+0xfce>
ffffffffc0206110:	859a                	mv	a1,t1
ffffffffc0206112:	854e                	mv	a0,s3
ffffffffc0206114:	f41a                	sd	t1,40(sp)
ffffffffc0206116:	e6ffe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020611a:	7802                	ld	a6,32(sp)
ffffffffc020611c:	7322                	ld	t1,40(sp)
ffffffffc020611e:	01051463          	bne	a0,a6,ffffffffc0206126 <stride_dequeue+0xf66>
ffffffffc0206122:	4080106f          	j	ffffffffc020752a <stride_dequeue+0x236a>
ffffffffc0206126:	00833783          	ld	a5,8(t1)
ffffffffc020612a:	01033e03          	ld	t3,16(t1)
ffffffffc020612e:	fc42                	sd	a6,56(sp)
ffffffffc0206130:	f03e                	sd	a5,32(sp)
ffffffffc0206132:	040e0663          	beqz	t3,ffffffffc020617e <stride_dequeue+0xfbe>
ffffffffc0206136:	85f2                	mv	a1,t3
ffffffffc0206138:	854e                	mv	a0,s3
ffffffffc020613a:	f81a                	sd	t1,48(sp)
ffffffffc020613c:	f472                	sd	t3,40(sp)
ffffffffc020613e:	e47fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206142:	7862                	ld	a6,56(sp)
ffffffffc0206144:	7e22                	ld	t3,40(sp)
ffffffffc0206146:	7342                	ld	t1,48(sp)
ffffffffc0206148:	01051463          	bne	a0,a6,ffffffffc0206150 <stride_dequeue+0xf90>
ffffffffc020614c:	6160106f          	j	ffffffffc0207762 <stride_dequeue+0x25a2>
ffffffffc0206150:	010e3583          	ld	a1,16(t3)
ffffffffc0206154:	854e                	mv	a0,s3
ffffffffc0206156:	008e3b03          	ld	s6,8(t3)
ffffffffc020615a:	f81a                	sd	t1,48(sp)
ffffffffc020615c:	f472                	sd	t3,40(sp)
ffffffffc020615e:	e83fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206162:	7e22                	ld	t3,40(sp)
ffffffffc0206164:	7342                	ld	t1,48(sp)
ffffffffc0206166:	016e3823          	sd	s6,16(t3)
ffffffffc020616a:	00ae3423          	sd	a0,8(t3)
ffffffffc020616e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206172:	e119                	bnez	a0,ffffffffc0206178 <stride_dequeue+0xfb8>
ffffffffc0206174:	1b30106f          	j	ffffffffc0207b26 <stride_dequeue+0x2966>
ffffffffc0206178:	01c53023          	sd	t3,0(a0)
ffffffffc020617c:	89f2                	mv	s3,t3
ffffffffc020617e:	7782                	ld	a5,32(sp)
ffffffffc0206180:	01333423          	sd	s3,8(t1)
ffffffffc0206184:	00f33823          	sd	a5,16(t1)
ffffffffc0206188:	0069b023          	sd	t1,0(s3)
ffffffffc020618c:	899a                	mv	s3,t1
ffffffffc020618e:	67e2                	ld	a5,24(sp)
ffffffffc0206190:	013cb423          	sd	s3,8(s9)
ffffffffc0206194:	00fcb823          	sd	a5,16(s9)
ffffffffc0206198:	0199b023          	sd	s9,0(s3)
ffffffffc020619c:	67c2                	ld	a5,16(sp)
ffffffffc020619e:	019a3423          	sd	s9,8(s4)
ffffffffc02061a2:	89da                	mv	s3,s6
ffffffffc02061a4:	00fa3823          	sd	a5,16(s4)
ffffffffc02061a8:	014cb023          	sd	s4,0(s9)
ffffffffc02061ac:	8cd2                	mv	s9,s4
ffffffffc02061ae:	faeff06f          	j	ffffffffc020595c <stride_dequeue+0x79c>
ffffffffc02061b2:	0088b783          	ld	a5,8(a7)
ffffffffc02061b6:	0108b983          	ld	s3,16(a7)
ffffffffc02061ba:	f02a                	sd	a0,32(sp)
ffffffffc02061bc:	ec3e                	sd	a5,24(sp)
ffffffffc02061be:	06098e63          	beqz	s3,ffffffffc020623a <stride_dequeue+0x107a>
ffffffffc02061c2:	85e6                	mv	a1,s9
ffffffffc02061c4:	854e                	mv	a0,s3
ffffffffc02061c6:	f446                	sd	a7,40(sp)
ffffffffc02061c8:	dbdfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02061cc:	7302                	ld	t1,32(sp)
ffffffffc02061ce:	78a2                	ld	a7,40(sp)
ffffffffc02061d0:	486503e3          	beq	a0,t1,ffffffffc0206e56 <stride_dequeue+0x1c96>
ffffffffc02061d4:	008cb783          	ld	a5,8(s9)
ffffffffc02061d8:	010cbe03          	ld	t3,16(s9)
ffffffffc02061dc:	f41a                	sd	t1,40(sp)
ffffffffc02061de:	f03e                	sd	a5,32(sp)
ffffffffc02061e0:	040e0663          	beqz	t3,ffffffffc020622c <stride_dequeue+0x106c>
ffffffffc02061e4:	85f2                	mv	a1,t3
ffffffffc02061e6:	854e                	mv	a0,s3
ffffffffc02061e8:	fc46                	sd	a7,56(sp)
ffffffffc02061ea:	f872                	sd	t3,48(sp)
ffffffffc02061ec:	d99fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02061f0:	7322                	ld	t1,40(sp)
ffffffffc02061f2:	7e42                	ld	t3,48(sp)
ffffffffc02061f4:	78e2                	ld	a7,56(sp)
ffffffffc02061f6:	00651463          	bne	a0,t1,ffffffffc02061fe <stride_dequeue+0x103e>
ffffffffc02061fa:	3040106f          	j	ffffffffc02074fe <stride_dequeue+0x233e>
ffffffffc02061fe:	010e3583          	ld	a1,16(t3)
ffffffffc0206202:	854e                	mv	a0,s3
ffffffffc0206204:	008e3b03          	ld	s6,8(t3)
ffffffffc0206208:	f846                	sd	a7,48(sp)
ffffffffc020620a:	f472                	sd	t3,40(sp)
ffffffffc020620c:	dd5fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206210:	7e22                	ld	t3,40(sp)
ffffffffc0206212:	78c2                	ld	a7,48(sp)
ffffffffc0206214:	016e3823          	sd	s6,16(t3)
ffffffffc0206218:	00ae3423          	sd	a0,8(t3)
ffffffffc020621c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206220:	e119                	bnez	a0,ffffffffc0206226 <stride_dequeue+0x1066>
ffffffffc0206222:	4540106f          	j	ffffffffc0207676 <stride_dequeue+0x24b6>
ffffffffc0206226:	01c53023          	sd	t3,0(a0)
ffffffffc020622a:	89f2                	mv	s3,t3
ffffffffc020622c:	7782                	ld	a5,32(sp)
ffffffffc020622e:	013cb423          	sd	s3,8(s9)
ffffffffc0206232:	00fcb823          	sd	a5,16(s9)
ffffffffc0206236:	0199b023          	sd	s9,0(s3)
ffffffffc020623a:	67e2                	ld	a5,24(sp)
ffffffffc020623c:	0198b423          	sd	s9,8(a7)
ffffffffc0206240:	89da                	mv	s3,s6
ffffffffc0206242:	00f8b823          	sd	a5,16(a7)
ffffffffc0206246:	011cb023          	sd	a7,0(s9)
ffffffffc020624a:	8cc6                	mv	s9,a7
ffffffffc020624c:	fdeff06f          	j	ffffffffc0205a2a <stride_dequeue+0x86a>
ffffffffc0206250:	008cb783          	ld	a5,8(s9)
ffffffffc0206254:	010cb983          	ld	s3,16(s9)
ffffffffc0206258:	f02a                	sd	a0,32(sp)
ffffffffc020625a:	ec3e                	sd	a5,24(sp)
ffffffffc020625c:	06098e63          	beqz	s3,ffffffffc02062d8 <stride_dequeue+0x1118>
ffffffffc0206260:	85c2                	mv	a1,a6
ffffffffc0206262:	854e                	mv	a0,s3
ffffffffc0206264:	f442                	sd	a6,40(sp)
ffffffffc0206266:	d1ffe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020626a:	7302                	ld	t1,32(sp)
ffffffffc020626c:	7822                	ld	a6,40(sp)
ffffffffc020626e:	446506e3          	beq	a0,t1,ffffffffc0206eba <stride_dequeue+0x1cfa>
ffffffffc0206272:	00883783          	ld	a5,8(a6)
ffffffffc0206276:	01083e03          	ld	t3,16(a6)
ffffffffc020627a:	f41a                	sd	t1,40(sp)
ffffffffc020627c:	f03e                	sd	a5,32(sp)
ffffffffc020627e:	040e0663          	beqz	t3,ffffffffc02062ca <stride_dequeue+0x110a>
ffffffffc0206282:	85f2                	mv	a1,t3
ffffffffc0206284:	854e                	mv	a0,s3
ffffffffc0206286:	fc42                	sd	a6,56(sp)
ffffffffc0206288:	f872                	sd	t3,48(sp)
ffffffffc020628a:	cfbfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020628e:	7322                	ld	t1,40(sp)
ffffffffc0206290:	7e42                	ld	t3,48(sp)
ffffffffc0206292:	7862                	ld	a6,56(sp)
ffffffffc0206294:	00651463          	bne	a0,t1,ffffffffc020629c <stride_dequeue+0x10dc>
ffffffffc0206298:	20e0106f          	j	ffffffffc02074a6 <stride_dequeue+0x22e6>
ffffffffc020629c:	010e3583          	ld	a1,16(t3)
ffffffffc02062a0:	854e                	mv	a0,s3
ffffffffc02062a2:	008e3b03          	ld	s6,8(t3)
ffffffffc02062a6:	f842                	sd	a6,48(sp)
ffffffffc02062a8:	f472                	sd	t3,40(sp)
ffffffffc02062aa:	d37fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02062ae:	7e22                	ld	t3,40(sp)
ffffffffc02062b0:	7842                	ld	a6,48(sp)
ffffffffc02062b2:	016e3823          	sd	s6,16(t3)
ffffffffc02062b6:	00ae3423          	sd	a0,8(t3)
ffffffffc02062ba:	010c2b03          	lw	s6,16(s8)
ffffffffc02062be:	e119                	bnez	a0,ffffffffc02062c4 <stride_dequeue+0x1104>
ffffffffc02062c0:	3c80106f          	j	ffffffffc0207688 <stride_dequeue+0x24c8>
ffffffffc02062c4:	01c53023          	sd	t3,0(a0)
ffffffffc02062c8:	89f2                	mv	s3,t3
ffffffffc02062ca:	7782                	ld	a5,32(sp)
ffffffffc02062cc:	01383423          	sd	s3,8(a6)
ffffffffc02062d0:	00f83823          	sd	a5,16(a6)
ffffffffc02062d4:	0109b023          	sd	a6,0(s3)
ffffffffc02062d8:	67e2                	ld	a5,24(sp)
ffffffffc02062da:	010cb423          	sd	a6,8(s9)
ffffffffc02062de:	89da                	mv	s3,s6
ffffffffc02062e0:	00fcb823          	sd	a5,16(s9)
ffffffffc02062e4:	01983023          	sd	s9,0(a6)
ffffffffc02062e8:	829ff06f          	j	ffffffffc0205b10 <stride_dequeue+0x950>
ffffffffc02062ec:	008db783          	ld	a5,8(s11)
ffffffffc02062f0:	010db983          	ld	s3,16(s11)
ffffffffc02062f4:	f02a                	sd	a0,32(sp)
ffffffffc02062f6:	ec3e                	sd	a5,24(sp)
ffffffffc02062f8:	06098e63          	beqz	s3,ffffffffc0206374 <stride_dequeue+0x11b4>
ffffffffc02062fc:	85c2                	mv	a1,a6
ffffffffc02062fe:	854e                	mv	a0,s3
ffffffffc0206300:	f442                	sd	a6,40(sp)
ffffffffc0206302:	c83fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206306:	7302                	ld	t1,32(sp)
ffffffffc0206308:	7822                	ld	a6,40(sp)
ffffffffc020630a:	466506e3          	beq	a0,t1,ffffffffc0206f76 <stride_dequeue+0x1db6>
ffffffffc020630e:	00883783          	ld	a5,8(a6)
ffffffffc0206312:	01083e03          	ld	t3,16(a6)
ffffffffc0206316:	f41a                	sd	t1,40(sp)
ffffffffc0206318:	f03e                	sd	a5,32(sp)
ffffffffc020631a:	040e0663          	beqz	t3,ffffffffc0206366 <stride_dequeue+0x11a6>
ffffffffc020631e:	85f2                	mv	a1,t3
ffffffffc0206320:	854e                	mv	a0,s3
ffffffffc0206322:	fc42                	sd	a6,56(sp)
ffffffffc0206324:	f872                	sd	t3,48(sp)
ffffffffc0206326:	c5ffe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020632a:	7322                	ld	t1,40(sp)
ffffffffc020632c:	7e42                	ld	t3,48(sp)
ffffffffc020632e:	7862                	ld	a6,56(sp)
ffffffffc0206330:	00651463          	bne	a0,t1,ffffffffc0206338 <stride_dequeue+0x1178>
ffffffffc0206334:	7490006f          	j	ffffffffc020727c <stride_dequeue+0x20bc>
ffffffffc0206338:	010e3583          	ld	a1,16(t3)
ffffffffc020633c:	854e                	mv	a0,s3
ffffffffc020633e:	008e3b03          	ld	s6,8(t3)
ffffffffc0206342:	f842                	sd	a6,48(sp)
ffffffffc0206344:	f472                	sd	t3,40(sp)
ffffffffc0206346:	c9bfe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020634a:	7e22                	ld	t3,40(sp)
ffffffffc020634c:	7842                	ld	a6,48(sp)
ffffffffc020634e:	016e3823          	sd	s6,16(t3)
ffffffffc0206352:	00ae3423          	sd	a0,8(t3)
ffffffffc0206356:	010c2b03          	lw	s6,16(s8)
ffffffffc020635a:	e119                	bnez	a0,ffffffffc0206360 <stride_dequeue+0x11a0>
ffffffffc020635c:	3260106f          	j	ffffffffc0207682 <stride_dequeue+0x24c2>
ffffffffc0206360:	01c53023          	sd	t3,0(a0)
ffffffffc0206364:	89f2                	mv	s3,t3
ffffffffc0206366:	7782                	ld	a5,32(sp)
ffffffffc0206368:	01383423          	sd	s3,8(a6)
ffffffffc020636c:	00f83823          	sd	a5,16(a6)
ffffffffc0206370:	0109b023          	sd	a6,0(s3)
ffffffffc0206374:	67e2                	ld	a5,24(sp)
ffffffffc0206376:	010db423          	sd	a6,8(s11)
ffffffffc020637a:	89da                	mv	s3,s6
ffffffffc020637c:	00fdb823          	sd	a5,16(s11)
ffffffffc0206380:	01b83023          	sd	s11,0(a6)
ffffffffc0206384:	92aff06f          	j	ffffffffc02054ae <stride_dequeue+0x2ee>
ffffffffc0206388:	008db783          	ld	a5,8(s11)
ffffffffc020638c:	010db983          	ld	s3,16(s11)
ffffffffc0206390:	ec2a                	sd	a0,24(sp)
ffffffffc0206392:	e83e                	sd	a5,16(sp)
ffffffffc0206394:	08098263          	beqz	s3,ffffffffc0206418 <stride_dequeue+0x1258>
ffffffffc0206398:	85c2                	mv	a1,a6
ffffffffc020639a:	854e                	mv	a0,s3
ffffffffc020639c:	f432                	sd	a2,40(sp)
ffffffffc020639e:	f042                	sd	a6,32(sp)
ffffffffc02063a0:	be5fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02063a4:	6362                	ld	t1,24(sp)
ffffffffc02063a6:	7802                	ld	a6,32(sp)
ffffffffc02063a8:	7622                	ld	a2,40(sp)
ffffffffc02063aa:	426505e3          	beq	a0,t1,ffffffffc0206fd4 <stride_dequeue+0x1e14>
ffffffffc02063ae:	00883783          	ld	a5,8(a6)
ffffffffc02063b2:	01083e03          	ld	t3,16(a6)
ffffffffc02063b6:	f01a                	sd	t1,32(sp)
ffffffffc02063b8:	ec3e                	sd	a5,24(sp)
ffffffffc02063ba:	040e0863          	beqz	t3,ffffffffc020640a <stride_dequeue+0x124a>
ffffffffc02063be:	85f2                	mv	a1,t3
ffffffffc02063c0:	854e                	mv	a0,s3
ffffffffc02063c2:	fc42                	sd	a6,56(sp)
ffffffffc02063c4:	f832                	sd	a2,48(sp)
ffffffffc02063c6:	f472                	sd	t3,40(sp)
ffffffffc02063c8:	bbdfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02063cc:	7302                	ld	t1,32(sp)
ffffffffc02063ce:	7e22                	ld	t3,40(sp)
ffffffffc02063d0:	7642                	ld	a2,48(sp)
ffffffffc02063d2:	7862                	ld	a6,56(sp)
ffffffffc02063d4:	60650fe3          	beq	a0,t1,ffffffffc02071f2 <stride_dequeue+0x2032>
ffffffffc02063d8:	010e3583          	ld	a1,16(t3)
ffffffffc02063dc:	854e                	mv	a0,s3
ffffffffc02063de:	008e3b03          	ld	s6,8(t3)
ffffffffc02063e2:	f842                	sd	a6,48(sp)
ffffffffc02063e4:	f432                	sd	a2,40(sp)
ffffffffc02063e6:	f072                	sd	t3,32(sp)
ffffffffc02063e8:	bf9fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02063ec:	7e02                	ld	t3,32(sp)
ffffffffc02063ee:	7622                	ld	a2,40(sp)
ffffffffc02063f0:	7842                	ld	a6,48(sp)
ffffffffc02063f2:	016e3823          	sd	s6,16(t3)
ffffffffc02063f6:	00ae3423          	sd	a0,8(t3)
ffffffffc02063fa:	010c2b03          	lw	s6,16(s8)
ffffffffc02063fe:	e119                	bnez	a0,ffffffffc0206404 <stride_dequeue+0x1244>
ffffffffc0206400:	2d60106f          	j	ffffffffc02076d6 <stride_dequeue+0x2516>
ffffffffc0206404:	01c53023          	sd	t3,0(a0)
ffffffffc0206408:	89f2                	mv	s3,t3
ffffffffc020640a:	67e2                	ld	a5,24(sp)
ffffffffc020640c:	01383423          	sd	s3,8(a6)
ffffffffc0206410:	00f83823          	sd	a5,16(a6)
ffffffffc0206414:	0109b023          	sd	a6,0(s3)
ffffffffc0206418:	67c2                	ld	a5,16(sp)
ffffffffc020641a:	010db423          	sd	a6,8(s11)
ffffffffc020641e:	89da                	mv	s3,s6
ffffffffc0206420:	00fdb823          	sd	a5,16(s11)
ffffffffc0206424:	01b83023          	sd	s11,0(a6)
ffffffffc0206428:	9e0ff06f          	j	ffffffffc0205608 <stride_dequeue+0x448>
ffffffffc020642c:	00893703          	ld	a4,8(s2)
ffffffffc0206430:	01093983          	ld	s3,16(s2)
ffffffffc0206434:	f42a                	sd	a0,40(sp)
ffffffffc0206436:	f03a                	sd	a4,32(sp)
ffffffffc0206438:	02098e63          	beqz	s3,ffffffffc0206474 <stride_dequeue+0x12b4>
ffffffffc020643c:	85be                	mv	a1,a5
ffffffffc020643e:	854e                	mv	a0,s3
ffffffffc0206440:	fc42                	sd	a6,56(sp)
ffffffffc0206442:	f83e                	sd	a5,48(sp)
ffffffffc0206444:	b41fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206448:	7e22                	ld	t3,40(sp)
ffffffffc020644a:	77c2                	ld	a5,48(sp)
ffffffffc020644c:	7862                	ld	a6,56(sp)
ffffffffc020644e:	43c509e3          	beq	a0,t3,ffffffffc0207080 <stride_dequeue+0x1ec0>
ffffffffc0206452:	6b8c                	ld	a1,16(a5)
ffffffffc0206454:	854e                	mv	a0,s3
ffffffffc0206456:	0087bb03          	ld	s6,8(a5)
ffffffffc020645a:	f842                	sd	a6,48(sp)
ffffffffc020645c:	f43e                	sd	a5,40(sp)
ffffffffc020645e:	b83fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206462:	77a2                	ld	a5,40(sp)
ffffffffc0206464:	7842                	ld	a6,48(sp)
ffffffffc0206466:	0167b823          	sd	s6,16(a5)
ffffffffc020646a:	e788                	sd	a0,8(a5)
ffffffffc020646c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206470:	c111                	beqz	a0,ffffffffc0206474 <stride_dequeue+0x12b4>
ffffffffc0206472:	e11c                	sd	a5,0(a0)
ffffffffc0206474:	7702                	ld	a4,32(sp)
ffffffffc0206476:	00f93423          	sd	a5,8(s2)
ffffffffc020647a:	89da                	mv	s3,s6
ffffffffc020647c:	00e93823          	sd	a4,16(s2)
ffffffffc0206480:	0127b023          	sd	s2,0(a5)
ffffffffc0206484:	e91fe06f          	j	ffffffffc0205314 <stride_dequeue+0x154>
ffffffffc0206488:	008a3783          	ld	a5,8(s4)
ffffffffc020648c:	010a3983          	ld	s3,16(s4)
ffffffffc0206490:	ec2a                	sd	a0,24(sp)
ffffffffc0206492:	e83e                	sd	a5,16(sp)
ffffffffc0206494:	5a098ce3          	beqz	s3,ffffffffc020724c <stride_dequeue+0x208c>
ffffffffc0206498:	85a6                	mv	a1,s1
ffffffffc020649a:	854e                	mv	a0,s3
ffffffffc020649c:	ae9fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02064a0:	67e2                	ld	a5,24(sp)
ffffffffc02064a2:	50f500e3          	beq	a0,a5,ffffffffc02071a2 <stride_dequeue+0x1fe2>
ffffffffc02064a6:	f43e                	sd	a5,40(sp)
ffffffffc02064a8:	649c                	ld	a5,8(s1)
ffffffffc02064aa:	0104b883          	ld	a7,16(s1)
ffffffffc02064ae:	ec3e                	sd	a5,24(sp)
ffffffffc02064b0:	04088263          	beqz	a7,ffffffffc02064f4 <stride_dequeue+0x1334>
ffffffffc02064b4:	85c6                	mv	a1,a7
ffffffffc02064b6:	854e                	mv	a0,s3
ffffffffc02064b8:	f046                	sd	a7,32(sp)
ffffffffc02064ba:	acbfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02064be:	77a2                	ld	a5,40(sp)
ffffffffc02064c0:	7882                	ld	a7,32(sp)
ffffffffc02064c2:	00f51463          	bne	a0,a5,ffffffffc02064ca <stride_dequeue+0x130a>
ffffffffc02064c6:	2160106f          	j	ffffffffc02076dc <stride_dequeue+0x251c>
ffffffffc02064ca:	0108b583          	ld	a1,16(a7)
ffffffffc02064ce:	854e                	mv	a0,s3
ffffffffc02064d0:	0088bb03          	ld	s6,8(a7)
ffffffffc02064d4:	f046                	sd	a7,32(sp)
ffffffffc02064d6:	b0bfe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02064da:	7882                	ld	a7,32(sp)
ffffffffc02064dc:	0168b823          	sd	s6,16(a7)
ffffffffc02064e0:	00a8b423          	sd	a0,8(a7)
ffffffffc02064e4:	010c2b03          	lw	s6,16(s8)
ffffffffc02064e8:	e119                	bnez	a0,ffffffffc02064ee <stride_dequeue+0x132e>
ffffffffc02064ea:	56a0106f          	j	ffffffffc0207a54 <stride_dequeue+0x2894>
ffffffffc02064ee:	01153023          	sd	a7,0(a0)
ffffffffc02064f2:	89c6                	mv	s3,a7
ffffffffc02064f4:	67e2                	ld	a5,24(sp)
ffffffffc02064f6:	0134b423          	sd	s3,8(s1)
ffffffffc02064fa:	e89c                	sd	a5,16(s1)
ffffffffc02064fc:	0099b023          	sd	s1,0(s3)
ffffffffc0206500:	89a6                	mv	s3,s1
ffffffffc0206502:	67c2                	ld	a5,16(sp)
ffffffffc0206504:	013a3423          	sd	s3,8(s4)
ffffffffc0206508:	84d2                	mv	s1,s4
ffffffffc020650a:	00fa3823          	sd	a5,16(s4)
ffffffffc020650e:	0149b023          	sd	s4,0(s3)
ffffffffc0206512:	89da                	mv	s3,s6
ffffffffc0206514:	f00ff06f          	j	ffffffffc0205c14 <stride_dequeue+0xa54>
ffffffffc0206518:	0088b783          	ld	a5,8(a7)
ffffffffc020651c:	0108b983          	ld	s3,16(a7)
ffffffffc0206520:	f02a                	sd	a0,32(sp)
ffffffffc0206522:	ec3e                	sd	a5,24(sp)
ffffffffc0206524:	00099463          	bnez	s3,ffffffffc020652c <stride_dequeue+0x136c>
ffffffffc0206528:	0d40106f          	j	ffffffffc02075fc <stride_dequeue+0x243c>
ffffffffc020652c:	85d2                	mv	a1,s4
ffffffffc020652e:	854e                	mv	a0,s3
ffffffffc0206530:	f446                	sd	a7,40(sp)
ffffffffc0206532:	a53fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206536:	7302                	ld	t1,32(sp)
ffffffffc0206538:	78a2                	ld	a7,40(sp)
ffffffffc020653a:	00651463          	bne	a0,t1,ffffffffc0206542 <stride_dequeue+0x1382>
ffffffffc020653e:	06c0106f          	j	ffffffffc02075aa <stride_dequeue+0x23ea>
ffffffffc0206542:	008a3783          	ld	a5,8(s4)
ffffffffc0206546:	010a3e03          	ld	t3,16(s4)
ffffffffc020654a:	fc1a                	sd	t1,56(sp)
ffffffffc020654c:	f03e                	sd	a5,32(sp)
ffffffffc020654e:	040e0663          	beqz	t3,ffffffffc020659a <stride_dequeue+0x13da>
ffffffffc0206552:	85f2                	mv	a1,t3
ffffffffc0206554:	854e                	mv	a0,s3
ffffffffc0206556:	f846                	sd	a7,48(sp)
ffffffffc0206558:	f472                	sd	t3,40(sp)
ffffffffc020655a:	a2bfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020655e:	7362                	ld	t1,56(sp)
ffffffffc0206560:	7e22                	ld	t3,40(sp)
ffffffffc0206562:	78c2                	ld	a7,48(sp)
ffffffffc0206564:	00651463          	bne	a0,t1,ffffffffc020656c <stride_dequeue+0x13ac>
ffffffffc0206568:	32e0106f          	j	ffffffffc0207896 <stride_dequeue+0x26d6>
ffffffffc020656c:	010e3583          	ld	a1,16(t3)
ffffffffc0206570:	854e                	mv	a0,s3
ffffffffc0206572:	008e3b03          	ld	s6,8(t3)
ffffffffc0206576:	f846                	sd	a7,48(sp)
ffffffffc0206578:	f472                	sd	t3,40(sp)
ffffffffc020657a:	a67fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020657e:	7e22                	ld	t3,40(sp)
ffffffffc0206580:	78c2                	ld	a7,48(sp)
ffffffffc0206582:	016e3823          	sd	s6,16(t3)
ffffffffc0206586:	00ae3423          	sd	a0,8(t3)
ffffffffc020658a:	010c2b03          	lw	s6,16(s8)
ffffffffc020658e:	e119                	bnez	a0,ffffffffc0206594 <stride_dequeue+0x13d4>
ffffffffc0206590:	58a0106f          	j	ffffffffc0207b1a <stride_dequeue+0x295a>
ffffffffc0206594:	01c53023          	sd	t3,0(a0)
ffffffffc0206598:	89f2                	mv	s3,t3
ffffffffc020659a:	7782                	ld	a5,32(sp)
ffffffffc020659c:	013a3423          	sd	s3,8(s4)
ffffffffc02065a0:	00fa3823          	sd	a5,16(s4)
ffffffffc02065a4:	0149b023          	sd	s4,0(s3)
ffffffffc02065a8:	89d2                	mv	s3,s4
ffffffffc02065aa:	67e2                	ld	a5,24(sp)
ffffffffc02065ac:	0138b423          	sd	s3,8(a7)
ffffffffc02065b0:	8a46                	mv	s4,a7
ffffffffc02065b2:	00f8b823          	sd	a5,16(a7)
ffffffffc02065b6:	0119b023          	sd	a7,0(s3)
ffffffffc02065ba:	89da                	mv	s3,s6
ffffffffc02065bc:	f28ff06f          	j	ffffffffc0205ce4 <stride_dequeue+0xb24>
ffffffffc02065c0:	0088b783          	ld	a5,8(a7)
ffffffffc02065c4:	0108b983          	ld	s3,16(a7)
ffffffffc02065c8:	f02a                	sd	a0,32(sp)
ffffffffc02065ca:	ec3e                	sd	a5,24(sp)
ffffffffc02065cc:	00099463          	bnez	s3,ffffffffc02065d4 <stride_dequeue+0x1414>
ffffffffc02065d0:	0320106f          	j	ffffffffc0207602 <stride_dequeue+0x2442>
ffffffffc02065d4:	85ee                	mv	a1,s11
ffffffffc02065d6:	854e                	mv	a0,s3
ffffffffc02065d8:	f446                	sd	a7,40(sp)
ffffffffc02065da:	9abfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02065de:	7302                	ld	t1,32(sp)
ffffffffc02065e0:	78a2                	ld	a7,40(sp)
ffffffffc02065e2:	466508e3          	beq	a0,t1,ffffffffc0207252 <stride_dequeue+0x2092>
ffffffffc02065e6:	008db783          	ld	a5,8(s11)
ffffffffc02065ea:	010dbe03          	ld	t3,16(s11)
ffffffffc02065ee:	fc1a                	sd	t1,56(sp)
ffffffffc02065f0:	f03e                	sd	a5,32(sp)
ffffffffc02065f2:	040e0663          	beqz	t3,ffffffffc020663e <stride_dequeue+0x147e>
ffffffffc02065f6:	85f2                	mv	a1,t3
ffffffffc02065f8:	854e                	mv	a0,s3
ffffffffc02065fa:	f846                	sd	a7,48(sp)
ffffffffc02065fc:	f472                	sd	t3,40(sp)
ffffffffc02065fe:	987fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206602:	7362                	ld	t1,56(sp)
ffffffffc0206604:	7e22                	ld	t3,40(sp)
ffffffffc0206606:	78c2                	ld	a7,48(sp)
ffffffffc0206608:	00651463          	bne	a0,t1,ffffffffc0206610 <stride_dequeue+0x1450>
ffffffffc020660c:	3120106f          	j	ffffffffc020791e <stride_dequeue+0x275e>
ffffffffc0206610:	010e3583          	ld	a1,16(t3)
ffffffffc0206614:	854e                	mv	a0,s3
ffffffffc0206616:	008e3b03          	ld	s6,8(t3)
ffffffffc020661a:	f846                	sd	a7,48(sp)
ffffffffc020661c:	f472                	sd	t3,40(sp)
ffffffffc020661e:	9c3fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206622:	7e22                	ld	t3,40(sp)
ffffffffc0206624:	78c2                	ld	a7,48(sp)
ffffffffc0206626:	016e3823          	sd	s6,16(t3)
ffffffffc020662a:	00ae3423          	sd	a0,8(t3)
ffffffffc020662e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206632:	e119                	bnez	a0,ffffffffc0206638 <stride_dequeue+0x1478>
ffffffffc0206634:	51c0106f          	j	ffffffffc0207b50 <stride_dequeue+0x2990>
ffffffffc0206638:	01c53023          	sd	t3,0(a0)
ffffffffc020663c:	89f2                	mv	s3,t3
ffffffffc020663e:	7782                	ld	a5,32(sp)
ffffffffc0206640:	013db423          	sd	s3,8(s11)
ffffffffc0206644:	00fdb823          	sd	a5,16(s11)
ffffffffc0206648:	01b9b023          	sd	s11,0(s3)
ffffffffc020664c:	89ee                	mv	s3,s11
ffffffffc020664e:	67e2                	ld	a5,24(sp)
ffffffffc0206650:	0138b423          	sd	s3,8(a7)
ffffffffc0206654:	8dc6                	mv	s11,a7
ffffffffc0206656:	00f8b823          	sd	a5,16(a7)
ffffffffc020665a:	0119b023          	sd	a7,0(s3)
ffffffffc020665e:	89da                	mv	s3,s6
ffffffffc0206660:	831ff06f          	j	ffffffffc0205e90 <stride_dequeue+0xcd0>
ffffffffc0206664:	0088b783          	ld	a5,8(a7)
ffffffffc0206668:	0108b983          	ld	s3,16(a7)
ffffffffc020666c:	ec2a                	sd	a0,24(sp)
ffffffffc020666e:	e83e                	sd	a5,16(sp)
ffffffffc0206670:	00099463          	bnez	s3,ffffffffc0206678 <stride_dequeue+0x14b8>
ffffffffc0206674:	7a10006f          	j	ffffffffc0207614 <stride_dequeue+0x2454>
ffffffffc0206678:	85b2                	mv	a1,a2
ffffffffc020667a:	854e                	mv	a0,s3
ffffffffc020667c:	f446                	sd	a7,40(sp)
ffffffffc020667e:	907fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206682:	6362                	ld	t1,24(sp)
ffffffffc0206684:	7602                	ld	a2,32(sp)
ffffffffc0206686:	78a2                	ld	a7,40(sp)
ffffffffc0206688:	426500e3          	beq	a0,t1,ffffffffc02072a8 <stride_dequeue+0x20e8>
ffffffffc020668c:	661c                	ld	a5,8(a2)
ffffffffc020668e:	01063e03          	ld	t3,16(a2)
ffffffffc0206692:	fc1a                	sd	t1,56(sp)
ffffffffc0206694:	ec3e                	sd	a5,24(sp)
ffffffffc0206696:	040e0a63          	beqz	t3,ffffffffc02066ea <stride_dequeue+0x152a>
ffffffffc020669a:	85f2                	mv	a1,t3
ffffffffc020669c:	854e                	mv	a0,s3
ffffffffc020669e:	f846                	sd	a7,48(sp)
ffffffffc02066a0:	f432                	sd	a2,40(sp)
ffffffffc02066a2:	f072                	sd	t3,32(sp)
ffffffffc02066a4:	8e1fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02066a8:	7362                	ld	t1,56(sp)
ffffffffc02066aa:	7e02                	ld	t3,32(sp)
ffffffffc02066ac:	7622                	ld	a2,40(sp)
ffffffffc02066ae:	78c2                	ld	a7,48(sp)
ffffffffc02066b0:	00651463          	bne	a0,t1,ffffffffc02066b8 <stride_dequeue+0x14f8>
ffffffffc02066b4:	20e0106f          	j	ffffffffc02078c2 <stride_dequeue+0x2702>
ffffffffc02066b8:	010e3583          	ld	a1,16(t3)
ffffffffc02066bc:	854e                	mv	a0,s3
ffffffffc02066be:	008e3b03          	ld	s6,8(t3)
ffffffffc02066c2:	f846                	sd	a7,48(sp)
ffffffffc02066c4:	f432                	sd	a2,40(sp)
ffffffffc02066c6:	f072                	sd	t3,32(sp)
ffffffffc02066c8:	919fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02066cc:	7e02                	ld	t3,32(sp)
ffffffffc02066ce:	7622                	ld	a2,40(sp)
ffffffffc02066d0:	78c2                	ld	a7,48(sp)
ffffffffc02066d2:	016e3823          	sd	s6,16(t3)
ffffffffc02066d6:	00ae3423          	sd	a0,8(t3)
ffffffffc02066da:	010c2b03          	lw	s6,16(s8)
ffffffffc02066de:	e119                	bnez	a0,ffffffffc02066e4 <stride_dequeue+0x1524>
ffffffffc02066e0:	4400106f          	j	ffffffffc0207b20 <stride_dequeue+0x2960>
ffffffffc02066e4:	01c53023          	sd	t3,0(a0)
ffffffffc02066e8:	89f2                	mv	s3,t3
ffffffffc02066ea:	67e2                	ld	a5,24(sp)
ffffffffc02066ec:	01363423          	sd	s3,8(a2)
ffffffffc02066f0:	ea1c                	sd	a5,16(a2)
ffffffffc02066f2:	00c9b023          	sd	a2,0(s3)
ffffffffc02066f6:	89b2                	mv	s3,a2
ffffffffc02066f8:	67c2                	ld	a5,16(sp)
ffffffffc02066fa:	0138b423          	sd	s3,8(a7)
ffffffffc02066fe:	8646                	mv	a2,a7
ffffffffc0206700:	00f8b823          	sd	a5,16(a7)
ffffffffc0206704:	0119b023          	sd	a7,0(s3)
ffffffffc0206708:	89da                	mv	s3,s6
ffffffffc020670a:	eb6ff06f          	j	ffffffffc0205dc0 <stride_dequeue+0xc00>
ffffffffc020670e:	008cb783          	ld	a5,8(s9)
ffffffffc0206712:	010cb983          	ld	s3,16(s9)
ffffffffc0206716:	f02a                	sd	a0,32(sp)
ffffffffc0206718:	ec3e                	sd	a5,24(sp)
ffffffffc020671a:	00099463          	bnez	s3,ffffffffc0206722 <stride_dequeue+0x1562>
ffffffffc020671e:	6eb0006f          	j	ffffffffc0207608 <stride_dequeue+0x2448>
ffffffffc0206722:	85c2                	mv	a1,a6
ffffffffc0206724:	854e                	mv	a0,s3
ffffffffc0206726:	f442                	sd	a6,40(sp)
ffffffffc0206728:	85dfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc020672c:	7302                	ld	t1,32(sp)
ffffffffc020672e:	7822                	ld	a6,40(sp)
ffffffffc0206730:	3e650ee3          	beq	a0,t1,ffffffffc020732c <stride_dequeue+0x216c>
ffffffffc0206734:	00883783          	ld	a5,8(a6)
ffffffffc0206738:	01083e03          	ld	t3,16(a6)
ffffffffc020673c:	fc1a                	sd	t1,56(sp)
ffffffffc020673e:	f03e                	sd	a5,32(sp)
ffffffffc0206740:	040e0663          	beqz	t3,ffffffffc020678c <stride_dequeue+0x15cc>
ffffffffc0206744:	85f2                	mv	a1,t3
ffffffffc0206746:	854e                	mv	a0,s3
ffffffffc0206748:	f842                	sd	a6,48(sp)
ffffffffc020674a:	f472                	sd	t3,40(sp)
ffffffffc020674c:	839fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206750:	7362                	ld	t1,56(sp)
ffffffffc0206752:	7e22                	ld	t3,40(sp)
ffffffffc0206754:	7842                	ld	a6,48(sp)
ffffffffc0206756:	00651463          	bne	a0,t1,ffffffffc020675e <stride_dequeue+0x159e>
ffffffffc020675a:	2a20106f          	j	ffffffffc02079fc <stride_dequeue+0x283c>
ffffffffc020675e:	010e3583          	ld	a1,16(t3)
ffffffffc0206762:	854e                	mv	a0,s3
ffffffffc0206764:	008e3b03          	ld	s6,8(t3)
ffffffffc0206768:	f842                	sd	a6,48(sp)
ffffffffc020676a:	f472                	sd	t3,40(sp)
ffffffffc020676c:	875fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206770:	7e22                	ld	t3,40(sp)
ffffffffc0206772:	7842                	ld	a6,48(sp)
ffffffffc0206774:	016e3823          	sd	s6,16(t3)
ffffffffc0206778:	00ae3423          	sd	a0,8(t3)
ffffffffc020677c:	010c2b03          	lw	s6,16(s8)
ffffffffc0206780:	e119                	bnez	a0,ffffffffc0206786 <stride_dequeue+0x15c6>
ffffffffc0206782:	35c0106f          	j	ffffffffc0207ade <stride_dequeue+0x291e>
ffffffffc0206786:	01c53023          	sd	t3,0(a0)
ffffffffc020678a:	89f2                	mv	s3,t3
ffffffffc020678c:	7782                	ld	a5,32(sp)
ffffffffc020678e:	01383423          	sd	s3,8(a6)
ffffffffc0206792:	00f83823          	sd	a5,16(a6)
ffffffffc0206796:	0109b023          	sd	a6,0(s3)
ffffffffc020679a:	89c2                	mv	s3,a6
ffffffffc020679c:	67e2                	ld	a5,24(sp)
ffffffffc020679e:	013cb423          	sd	s3,8(s9)
ffffffffc02067a2:	00fcb823          	sd	a5,16(s9)
ffffffffc02067a6:	0199b023          	sd	s9,0(s3)
ffffffffc02067aa:	89da                	mv	s3,s6
ffffffffc02067ac:	f89fe06f          	j	ffffffffc0205734 <stride_dequeue+0x574>
ffffffffc02067b0:	661c                	ld	a5,8(a2)
ffffffffc02067b2:	01063983          	ld	s3,16(a2)
ffffffffc02067b6:	ec2a                	sd	a0,24(sp)
ffffffffc02067b8:	e83e                	sd	a5,16(sp)
ffffffffc02067ba:	64098ae3          	beqz	s3,ffffffffc020760e <stride_dequeue+0x244e>
ffffffffc02067be:	85c2                	mv	a1,a6
ffffffffc02067c0:	854e                	mv	a0,s3
ffffffffc02067c2:	f432                	sd	a2,40(sp)
ffffffffc02067c4:	f042                	sd	a6,32(sp)
ffffffffc02067c6:	fbefe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02067ca:	6362                	ld	t1,24(sp)
ffffffffc02067cc:	7802                	ld	a6,32(sp)
ffffffffc02067ce:	7622                	ld	a2,40(sp)
ffffffffc02067d0:	326509e3          	beq	a0,t1,ffffffffc0207302 <stride_dequeue+0x2142>
ffffffffc02067d4:	00883783          	ld	a5,8(a6)
ffffffffc02067d8:	01083e03          	ld	t3,16(a6)
ffffffffc02067dc:	fc1a                	sd	t1,56(sp)
ffffffffc02067de:	ec3e                	sd	a5,24(sp)
ffffffffc02067e0:	040e0a63          	beqz	t3,ffffffffc0206834 <stride_dequeue+0x1674>
ffffffffc02067e4:	85f2                	mv	a1,t3
ffffffffc02067e6:	854e                	mv	a0,s3
ffffffffc02067e8:	f842                	sd	a6,48(sp)
ffffffffc02067ea:	f432                	sd	a2,40(sp)
ffffffffc02067ec:	f072                	sd	t3,32(sp)
ffffffffc02067ee:	f96fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02067f2:	7362                	ld	t1,56(sp)
ffffffffc02067f4:	7e02                	ld	t3,32(sp)
ffffffffc02067f6:	7622                	ld	a2,40(sp)
ffffffffc02067f8:	7842                	ld	a6,48(sp)
ffffffffc02067fa:	00651463          	bne	a0,t1,ffffffffc0206802 <stride_dequeue+0x1642>
ffffffffc02067fe:	1760106f          	j	ffffffffc0207974 <stride_dequeue+0x27b4>
ffffffffc0206802:	010e3583          	ld	a1,16(t3)
ffffffffc0206806:	854e                	mv	a0,s3
ffffffffc0206808:	008e3b03          	ld	s6,8(t3)
ffffffffc020680c:	f842                	sd	a6,48(sp)
ffffffffc020680e:	f432                	sd	a2,40(sp)
ffffffffc0206810:	f072                	sd	t3,32(sp)
ffffffffc0206812:	fcefe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206816:	7e02                	ld	t3,32(sp)
ffffffffc0206818:	7622                	ld	a2,40(sp)
ffffffffc020681a:	7842                	ld	a6,48(sp)
ffffffffc020681c:	016e3823          	sd	s6,16(t3)
ffffffffc0206820:	00ae3423          	sd	a0,8(t3)
ffffffffc0206824:	010c2b03          	lw	s6,16(s8)
ffffffffc0206828:	e119                	bnez	a0,ffffffffc020682e <stride_dequeue+0x166e>
ffffffffc020682a:	32c0106f          	j	ffffffffc0207b56 <stride_dequeue+0x2996>
ffffffffc020682e:	01c53023          	sd	t3,0(a0)
ffffffffc0206832:	89f2                	mv	s3,t3
ffffffffc0206834:	67e2                	ld	a5,24(sp)
ffffffffc0206836:	01383423          	sd	s3,8(a6)
ffffffffc020683a:	00f83823          	sd	a5,16(a6)
ffffffffc020683e:	0109b023          	sd	a6,0(s3)
ffffffffc0206842:	89c2                	mv	s3,a6
ffffffffc0206844:	67c2                	ld	a5,16(sp)
ffffffffc0206846:	01363423          	sd	s3,8(a2)
ffffffffc020684a:	ea1c                	sd	a5,16(a2)
ffffffffc020684c:	00c9b023          	sd	a2,0(s3)
ffffffffc0206850:	89da                	mv	s3,s6
ffffffffc0206852:	ffffe06f          	j	ffffffffc0205850 <stride_dequeue+0x690>
ffffffffc0206856:	008a3783          	ld	a5,8(s4)
ffffffffc020685a:	010a3983          	ld	s3,16(s4)
ffffffffc020685e:	f02a                	sd	a0,32(sp)
ffffffffc0206860:	ec3e                	sd	a5,24(sp)
ffffffffc0206862:	5a098ce3          	beqz	s3,ffffffffc020761a <stride_dequeue+0x245a>
ffffffffc0206866:	85c2                	mv	a1,a6
ffffffffc0206868:	854e                	mv	a0,s3
ffffffffc020686a:	f442                	sd	a6,40(sp)
ffffffffc020686c:	f18fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206870:	7302                	ld	t1,32(sp)
ffffffffc0206872:	7822                	ld	a6,40(sp)
ffffffffc0206874:	566501e3          	beq	a0,t1,ffffffffc02075d6 <stride_dequeue+0x2416>
ffffffffc0206878:	00883783          	ld	a5,8(a6)
ffffffffc020687c:	01083e03          	ld	t3,16(a6)
ffffffffc0206880:	fc1a                	sd	t1,56(sp)
ffffffffc0206882:	f03e                	sd	a5,32(sp)
ffffffffc0206884:	040e0663          	beqz	t3,ffffffffc02068d0 <stride_dequeue+0x1710>
ffffffffc0206888:	85f2                	mv	a1,t3
ffffffffc020688a:	854e                	mv	a0,s3
ffffffffc020688c:	f842                	sd	a6,48(sp)
ffffffffc020688e:	f472                	sd	t3,40(sp)
ffffffffc0206890:	ef4fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206894:	7362                	ld	t1,56(sp)
ffffffffc0206896:	7e22                	ld	t3,40(sp)
ffffffffc0206898:	7842                	ld	a6,48(sp)
ffffffffc020689a:	00651463          	bne	a0,t1,ffffffffc02068a2 <stride_dequeue+0x16e2>
ffffffffc020689e:	18a0106f          	j	ffffffffc0207a28 <stride_dequeue+0x2868>
ffffffffc02068a2:	010e3583          	ld	a1,16(t3)
ffffffffc02068a6:	854e                	mv	a0,s3
ffffffffc02068a8:	008e3b03          	ld	s6,8(t3)
ffffffffc02068ac:	f842                	sd	a6,48(sp)
ffffffffc02068ae:	f472                	sd	t3,40(sp)
ffffffffc02068b0:	f30fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02068b4:	7e22                	ld	t3,40(sp)
ffffffffc02068b6:	7842                	ld	a6,48(sp)
ffffffffc02068b8:	016e3823          	sd	s6,16(t3)
ffffffffc02068bc:	00ae3423          	sd	a0,8(t3)
ffffffffc02068c0:	010c2b03          	lw	s6,16(s8)
ffffffffc02068c4:	e119                	bnez	a0,ffffffffc02068ca <stride_dequeue+0x170a>
ffffffffc02068c6:	1ee0106f          	j	ffffffffc0207ab4 <stride_dequeue+0x28f4>
ffffffffc02068ca:	01c53023          	sd	t3,0(a0)
ffffffffc02068ce:	89f2                	mv	s3,t3
ffffffffc02068d0:	7782                	ld	a5,32(sp)
ffffffffc02068d2:	01383423          	sd	s3,8(a6)
ffffffffc02068d6:	00f83823          	sd	a5,16(a6)
ffffffffc02068da:	0109b023          	sd	a6,0(s3)
ffffffffc02068de:	89c2                	mv	s3,a6
ffffffffc02068e0:	67e2                	ld	a5,24(sp)
ffffffffc02068e2:	013a3423          	sd	s3,8(s4)
ffffffffc02068e6:	00fa3823          	sd	a5,16(s4)
ffffffffc02068ea:	0149b023          	sd	s4,0(s3)
ffffffffc02068ee:	89da                	mv	s3,s6
ffffffffc02068f0:	85eff06f          	j	ffffffffc020594e <stride_dequeue+0x78e>
ffffffffc02068f4:	008cb783          	ld	a5,8(s9)
ffffffffc02068f8:	010cb983          	ld	s3,16(s9)
ffffffffc02068fc:	f42a                	sd	a0,40(sp)
ffffffffc02068fe:	f03e                	sd	a5,32(sp)
ffffffffc0206900:	04098163          	beqz	s3,ffffffffc0206942 <stride_dequeue+0x1782>
ffffffffc0206904:	859a                	mv	a1,t1
ffffffffc0206906:	854e                	mv	a0,s3
ffffffffc0206908:	fc42                	sd	a6,56(sp)
ffffffffc020690a:	f81a                	sd	t1,48(sp)
ffffffffc020690c:	e78fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206910:	7e22                	ld	t3,40(sp)
ffffffffc0206912:	7342                	ld	t1,48(sp)
ffffffffc0206914:	7862                	ld	a6,56(sp)
ffffffffc0206916:	11c505e3          	beq	a0,t3,ffffffffc0207220 <stride_dequeue+0x2060>
ffffffffc020691a:	01033583          	ld	a1,16(t1)
ffffffffc020691e:	854e                	mv	a0,s3
ffffffffc0206920:	00833b03          	ld	s6,8(t1)
ffffffffc0206924:	f842                	sd	a6,48(sp)
ffffffffc0206926:	f41a                	sd	t1,40(sp)
ffffffffc0206928:	eb8fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020692c:	7322                	ld	t1,40(sp)
ffffffffc020692e:	7842                	ld	a6,48(sp)
ffffffffc0206930:	01633823          	sd	s6,16(t1)
ffffffffc0206934:	00a33423          	sd	a0,8(t1)
ffffffffc0206938:	010c2b03          	lw	s6,16(s8)
ffffffffc020693c:	c119                	beqz	a0,ffffffffc0206942 <stride_dequeue+0x1782>
ffffffffc020693e:	00653023          	sd	t1,0(a0)
ffffffffc0206942:	7782                	ld	a5,32(sp)
ffffffffc0206944:	006cb423          	sd	t1,8(s9)
ffffffffc0206948:	89da                	mv	s3,s6
ffffffffc020694a:	00fcb823          	sd	a5,16(s9)
ffffffffc020694e:	01933023          	sd	s9,0(t1)
ffffffffc0206952:	9aeff06f          	j	ffffffffc0205b00 <stride_dequeue+0x940>
ffffffffc0206956:	008db783          	ld	a5,8(s11)
ffffffffc020695a:	010db983          	ld	s3,16(s11)
ffffffffc020695e:	f02a                	sd	a0,32(sp)
ffffffffc0206960:	ec3e                	sd	a5,24(sp)
ffffffffc0206962:	04098563          	beqz	s3,ffffffffc02069ac <stride_dequeue+0x17ec>
ffffffffc0206966:	859a                	mv	a1,t1
ffffffffc0206968:	854e                	mv	a0,s3
ffffffffc020696a:	fc42                	sd	a6,56(sp)
ffffffffc020696c:	f832                	sd	a2,48(sp)
ffffffffc020696e:	f41a                	sd	t1,40(sp)
ffffffffc0206970:	e14fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206974:	7e02                	ld	t3,32(sp)
ffffffffc0206976:	7322                	ld	t1,40(sp)
ffffffffc0206978:	7642                	ld	a2,48(sp)
ffffffffc020697a:	7862                	ld	a6,56(sp)
ffffffffc020697c:	15c50be3          	beq	a0,t3,ffffffffc02072d2 <stride_dequeue+0x2112>
ffffffffc0206980:	01033583          	ld	a1,16(t1)
ffffffffc0206984:	854e                	mv	a0,s3
ffffffffc0206986:	00833b03          	ld	s6,8(t1)
ffffffffc020698a:	f842                	sd	a6,48(sp)
ffffffffc020698c:	f432                	sd	a2,40(sp)
ffffffffc020698e:	f01a                	sd	t1,32(sp)
ffffffffc0206990:	e50fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206994:	7302                	ld	t1,32(sp)
ffffffffc0206996:	7622                	ld	a2,40(sp)
ffffffffc0206998:	7842                	ld	a6,48(sp)
ffffffffc020699a:	01633823          	sd	s6,16(t1)
ffffffffc020699e:	00a33423          	sd	a0,8(t1)
ffffffffc02069a2:	010c2b03          	lw	s6,16(s8)
ffffffffc02069a6:	c119                	beqz	a0,ffffffffc02069ac <stride_dequeue+0x17ec>
ffffffffc02069a8:	00653023          	sd	t1,0(a0)
ffffffffc02069ac:	67e2                	ld	a5,24(sp)
ffffffffc02069ae:	006db423          	sd	t1,8(s11)
ffffffffc02069b2:	89da                	mv	s3,s6
ffffffffc02069b4:	00fdb823          	sd	a5,16(s11)
ffffffffc02069b8:	01b33023          	sd	s11,0(t1)
ffffffffc02069bc:	c3dfe06f          	j	ffffffffc02055f8 <stride_dequeue+0x438>
ffffffffc02069c0:	0088b783          	ld	a5,8(a7)
ffffffffc02069c4:	0108b983          	ld	s3,16(a7)
ffffffffc02069c8:	f42a                	sd	a0,40(sp)
ffffffffc02069ca:	f03e                	sd	a5,32(sp)
ffffffffc02069cc:	04098063          	beqz	s3,ffffffffc0206a0c <stride_dequeue+0x184c>
ffffffffc02069d0:	85c2                	mv	a1,a6
ffffffffc02069d2:	854e                	mv	a0,s3
ffffffffc02069d4:	fc46                	sd	a7,56(sp)
ffffffffc02069d6:	daefe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc02069da:	7e22                	ld	t3,40(sp)
ffffffffc02069dc:	7842                	ld	a6,48(sp)
ffffffffc02069de:	78e2                	ld	a7,56(sp)
ffffffffc02069e0:	29c50de3          	beq	a0,t3,ffffffffc020747a <stride_dequeue+0x22ba>
ffffffffc02069e4:	01083583          	ld	a1,16(a6)
ffffffffc02069e8:	854e                	mv	a0,s3
ffffffffc02069ea:	00883b03          	ld	s6,8(a6)
ffffffffc02069ee:	f846                	sd	a7,48(sp)
ffffffffc02069f0:	f442                	sd	a6,40(sp)
ffffffffc02069f2:	deefe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02069f6:	7822                	ld	a6,40(sp)
ffffffffc02069f8:	78c2                	ld	a7,48(sp)
ffffffffc02069fa:	01683823          	sd	s6,16(a6)
ffffffffc02069fe:	00a83423          	sd	a0,8(a6)
ffffffffc0206a02:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a06:	c119                	beqz	a0,ffffffffc0206a0c <stride_dequeue+0x184c>
ffffffffc0206a08:	01053023          	sd	a6,0(a0)
ffffffffc0206a0c:	7782                	ld	a5,32(sp)
ffffffffc0206a0e:	0108b423          	sd	a6,8(a7)
ffffffffc0206a12:	89da                	mv	s3,s6
ffffffffc0206a14:	00f8b823          	sd	a5,16(a7)
ffffffffc0206a18:	01183023          	sd	a7,0(a6)
ffffffffc0206a1c:	8846                	mv	a6,a7
ffffffffc0206a1e:	d08ff06f          	j	ffffffffc0205f26 <stride_dequeue+0xd66>
ffffffffc0206a22:	008db783          	ld	a5,8(s11)
ffffffffc0206a26:	010db983          	ld	s3,16(s11)
ffffffffc0206a2a:	f42a                	sd	a0,40(sp)
ffffffffc0206a2c:	f03e                	sd	a5,32(sp)
ffffffffc0206a2e:	04098163          	beqz	s3,ffffffffc0206a70 <stride_dequeue+0x18b0>
ffffffffc0206a32:	859a                	mv	a1,t1
ffffffffc0206a34:	854e                	mv	a0,s3
ffffffffc0206a36:	fc42                	sd	a6,56(sp)
ffffffffc0206a38:	f81a                	sd	t1,48(sp)
ffffffffc0206a3a:	d4afe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206a3e:	7e22                	ld	t3,40(sp)
ffffffffc0206a40:	7342                	ld	t1,48(sp)
ffffffffc0206a42:	7862                	ld	a6,56(sp)
ffffffffc0206a44:	29c507e3          	beq	a0,t3,ffffffffc02074d2 <stride_dequeue+0x2312>
ffffffffc0206a48:	01033583          	ld	a1,16(t1)
ffffffffc0206a4c:	854e                	mv	a0,s3
ffffffffc0206a4e:	00833b03          	ld	s6,8(t1)
ffffffffc0206a52:	f842                	sd	a6,48(sp)
ffffffffc0206a54:	f41a                	sd	t1,40(sp)
ffffffffc0206a56:	d8afe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206a5a:	7322                	ld	t1,40(sp)
ffffffffc0206a5c:	7842                	ld	a6,48(sp)
ffffffffc0206a5e:	01633823          	sd	s6,16(t1)
ffffffffc0206a62:	00a33423          	sd	a0,8(t1)
ffffffffc0206a66:	010c2b03          	lw	s6,16(s8)
ffffffffc0206a6a:	c119                	beqz	a0,ffffffffc0206a70 <stride_dequeue+0x18b0>
ffffffffc0206a6c:	00653023          	sd	t1,0(a0)
ffffffffc0206a70:	7782                	ld	a5,32(sp)
ffffffffc0206a72:	006db423          	sd	t1,8(s11)
ffffffffc0206a76:	89da                	mv	s3,s6
ffffffffc0206a78:	00fdb823          	sd	a5,16(s11)
ffffffffc0206a7c:	01b33023          	sd	s11,0(t1)
ffffffffc0206a80:	a1ffe06f          	j	ffffffffc020549e <stride_dequeue+0x2de>
ffffffffc0206a84:	0088b783          	ld	a5,8(a7)
ffffffffc0206a88:	0108b983          	ld	s3,16(a7)
ffffffffc0206a8c:	f42a                	sd	a0,40(sp)
ffffffffc0206a8e:	f03e                	sd	a5,32(sp)
ffffffffc0206a90:	04098063          	beqz	s3,ffffffffc0206ad0 <stride_dequeue+0x1910>
ffffffffc0206a94:	859a                	mv	a1,t1
ffffffffc0206a96:	854e                	mv	a0,s3
ffffffffc0206a98:	fc46                	sd	a7,56(sp)
ffffffffc0206a9a:	ceafe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206a9e:	7e22                	ld	t3,40(sp)
ffffffffc0206aa0:	7342                	ld	t1,48(sp)
ffffffffc0206aa2:	78e2                	ld	a7,56(sp)
ffffffffc0206aa4:	73c50263          	beq	a0,t3,ffffffffc02071c8 <stride_dequeue+0x2008>
ffffffffc0206aa8:	01033583          	ld	a1,16(t1)
ffffffffc0206aac:	854e                	mv	a0,s3
ffffffffc0206aae:	00833b03          	ld	s6,8(t1)
ffffffffc0206ab2:	f846                	sd	a7,48(sp)
ffffffffc0206ab4:	f41a                	sd	t1,40(sp)
ffffffffc0206ab6:	d2afe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206aba:	7322                	ld	t1,40(sp)
ffffffffc0206abc:	78c2                	ld	a7,48(sp)
ffffffffc0206abe:	01633823          	sd	s6,16(t1)
ffffffffc0206ac2:	00a33423          	sd	a0,8(t1)
ffffffffc0206ac6:	010c2b03          	lw	s6,16(s8)
ffffffffc0206aca:	c119                	beqz	a0,ffffffffc0206ad0 <stride_dequeue+0x1910>
ffffffffc0206acc:	00653023          	sd	t1,0(a0)
ffffffffc0206ad0:	7782                	ld	a5,32(sp)
ffffffffc0206ad2:	0068b423          	sd	t1,8(a7)
ffffffffc0206ad6:	89da                	mv	s3,s6
ffffffffc0206ad8:	00f8b823          	sd	a5,16(a7)
ffffffffc0206adc:	01133023          	sd	a7,0(t1)
ffffffffc0206ae0:	f3dfe06f          	j	ffffffffc0205a1c <stride_dequeue+0x85c>
ffffffffc0206ae4:	01093503          	ld	a0,16(s2)
ffffffffc0206ae8:	00893983          	ld	s3,8(s2)
ffffffffc0206aec:	85da                	mv	a1,s6
ffffffffc0206aee:	cf2fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206af2:	00a93423          	sd	a0,8(s2)
ffffffffc0206af6:	01393823          	sd	s3,16(s2)
ffffffffc0206afa:	7822                	ld	a6,40(sp)
ffffffffc0206afc:	77c2                	ld	a5,48(sp)
ffffffffc0206afe:	010c2983          	lw	s3,16(s8)
ffffffffc0206b02:	e119                	bnez	a0,ffffffffc0206b08 <stride_dequeue+0x1948>
ffffffffc0206b04:	803fe06f          	j	ffffffffc0205306 <stride_dequeue+0x146>
ffffffffc0206b08:	01253023          	sd	s2,0(a0)
ffffffffc0206b0c:	ffafe06f          	j	ffffffffc0205306 <stride_dequeue+0x146>
ffffffffc0206b10:	0089b783          	ld	a5,8(s3)
ffffffffc0206b14:	0109b803          	ld	a6,16(s3)
ffffffffc0206b18:	f42a                	sd	a0,40(sp)
ffffffffc0206b1a:	ec3e                	sd	a5,24(sp)
ffffffffc0206b1c:	02080b63          	beqz	a6,ffffffffc0206b52 <stride_dequeue+0x1992>
ffffffffc0206b20:	8542                	mv	a0,a6
ffffffffc0206b22:	85d2                	mv	a1,s4
ffffffffc0206b24:	f042                	sd	a6,32(sp)
ffffffffc0206b26:	c5efe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206b2a:	77a2                	ld	a5,40(sp)
ffffffffc0206b2c:	7802                	ld	a6,32(sp)
ffffffffc0206b2e:	3cf50be3          	beq	a0,a5,ffffffffc0207704 <stride_dequeue+0x2544>
ffffffffc0206b32:	010a3583          	ld	a1,16(s4)
ffffffffc0206b36:	008a3b03          	ld	s6,8(s4)
ffffffffc0206b3a:	8542                	mv	a0,a6
ffffffffc0206b3c:	ca4fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206b40:	00aa3423          	sd	a0,8(s4)
ffffffffc0206b44:	016a3823          	sd	s6,16(s4)
ffffffffc0206b48:	010c2b03          	lw	s6,16(s8)
ffffffffc0206b4c:	c119                	beqz	a0,ffffffffc0206b52 <stride_dequeue+0x1992>
ffffffffc0206b4e:	01453023          	sd	s4,0(a0)
ffffffffc0206b52:	67e2                	ld	a5,24(sp)
ffffffffc0206b54:	0149b423          	sd	s4,8(s3)
ffffffffc0206b58:	00f9b823          	sd	a5,16(s3)
ffffffffc0206b5c:	013a3023          	sd	s3,0(s4)
ffffffffc0206b60:	8a4e                	mv	s4,s3
ffffffffc0206b62:	c90ff06f          	j	ffffffffc0205ff2 <stride_dequeue+0xe32>
ffffffffc0206b66:	0089b783          	ld	a5,8(s3)
ffffffffc0206b6a:	0109b803          	ld	a6,16(s3)
ffffffffc0206b6e:	f42a                	sd	a0,40(sp)
ffffffffc0206b70:	ec3e                	sd	a5,24(sp)
ffffffffc0206b72:	02080b63          	beqz	a6,ffffffffc0206ba8 <stride_dequeue+0x19e8>
ffffffffc0206b76:	8542                	mv	a0,a6
ffffffffc0206b78:	85e6                	mv	a1,s9
ffffffffc0206b7a:	f042                	sd	a6,32(sp)
ffffffffc0206b7c:	c08fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206b80:	77a2                	ld	a5,40(sp)
ffffffffc0206b82:	7802                	ld	a6,32(sp)
ffffffffc0206b84:	28f50ee3          	beq	a0,a5,ffffffffc0207620 <stride_dequeue+0x2460>
ffffffffc0206b88:	010cb583          	ld	a1,16(s9)
ffffffffc0206b8c:	008cbb03          	ld	s6,8(s9)
ffffffffc0206b90:	8542                	mv	a0,a6
ffffffffc0206b92:	c4efe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206b96:	00acb423          	sd	a0,8(s9)
ffffffffc0206b9a:	016cb823          	sd	s6,16(s9)
ffffffffc0206b9e:	010c2b03          	lw	s6,16(s8)
ffffffffc0206ba2:	c119                	beqz	a0,ffffffffc0206ba8 <stride_dequeue+0x19e8>
ffffffffc0206ba4:	01953023          	sd	s9,0(a0)
ffffffffc0206ba8:	67e2                	ld	a5,24(sp)
ffffffffc0206baa:	0199b423          	sd	s9,8(s3)
ffffffffc0206bae:	00f9b823          	sd	a5,16(s3)
ffffffffc0206bb2:	013cb023          	sd	s3,0(s9)
ffffffffc0206bb6:	8cce                	mv	s9,s3
ffffffffc0206bb8:	de4ff06f          	j	ffffffffc020619c <stride_dequeue+0xfdc>
ffffffffc0206bbc:	0089b783          	ld	a5,8(s3)
ffffffffc0206bc0:	0109b803          	ld	a6,16(s3)
ffffffffc0206bc4:	f42a                	sd	a0,40(sp)
ffffffffc0206bc6:	e83e                	sd	a5,16(sp)
ffffffffc0206bc8:	02080f63          	beqz	a6,ffffffffc0206c06 <stride_dequeue+0x1a46>
ffffffffc0206bcc:	8542                	mv	a0,a6
ffffffffc0206bce:	85d2                	mv	a1,s4
ffffffffc0206bd0:	f032                	sd	a2,32(sp)
ffffffffc0206bd2:	ec42                	sd	a6,24(sp)
ffffffffc0206bd4:	bb0fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206bd8:	77a2                	ld	a5,40(sp)
ffffffffc0206bda:	6862                	ld	a6,24(sp)
ffffffffc0206bdc:	7602                	ld	a2,32(sp)
ffffffffc0206bde:	26f506e3          	beq	a0,a5,ffffffffc020764a <stride_dequeue+0x248a>
ffffffffc0206be2:	010a3583          	ld	a1,16(s4)
ffffffffc0206be6:	008a3b03          	ld	s6,8(s4)
ffffffffc0206bea:	8542                	mv	a0,a6
ffffffffc0206bec:	ec32                	sd	a2,24(sp)
ffffffffc0206bee:	bf2fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206bf2:	00aa3423          	sd	a0,8(s4)
ffffffffc0206bf6:	016a3823          	sd	s6,16(s4)
ffffffffc0206bfa:	6662                	ld	a2,24(sp)
ffffffffc0206bfc:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c00:	c119                	beqz	a0,ffffffffc0206c06 <stride_dequeue+0x1a46>
ffffffffc0206c02:	01453023          	sd	s4,0(a0)
ffffffffc0206c06:	67c2                	ld	a5,16(sp)
ffffffffc0206c08:	0149b423          	sd	s4,8(s3)
ffffffffc0206c0c:	00f9b823          	sd	a5,16(s3)
ffffffffc0206c10:	013a3023          	sd	s3,0(s4)
ffffffffc0206c14:	8a4e                	mv	s4,s3
ffffffffc0206c16:	cb8ff06f          	j	ffffffffc02060ce <stride_dequeue+0xf0e>
ffffffffc0206c1a:	008a3783          	ld	a5,8(s4)
ffffffffc0206c1e:	010a3883          	ld	a7,16(s4)
ffffffffc0206c22:	f42a                	sd	a0,40(sp)
ffffffffc0206c24:	ec3e                	sd	a5,24(sp)
ffffffffc0206c26:	02088b63          	beqz	a7,ffffffffc0206c5c <stride_dequeue+0x1a9c>
ffffffffc0206c2a:	8546                	mv	a0,a7
ffffffffc0206c2c:	85ce                	mv	a1,s3
ffffffffc0206c2e:	f046                	sd	a7,32(sp)
ffffffffc0206c30:	b54fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206c34:	77a2                	ld	a5,40(sp)
ffffffffc0206c36:	7882                	ld	a7,32(sp)
ffffffffc0206c38:	26f501e3          	beq	a0,a5,ffffffffc020769a <stride_dequeue+0x24da>
ffffffffc0206c3c:	0109b583          	ld	a1,16(s3)
ffffffffc0206c40:	0089bb03          	ld	s6,8(s3)
ffffffffc0206c44:	8546                	mv	a0,a7
ffffffffc0206c46:	b9afe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206c4a:	00a9b423          	sd	a0,8(s3)
ffffffffc0206c4e:	0169b823          	sd	s6,16(s3)
ffffffffc0206c52:	010c2b03          	lw	s6,16(s8)
ffffffffc0206c56:	c119                	beqz	a0,ffffffffc0206c5c <stride_dequeue+0x1a9c>
ffffffffc0206c58:	01353023          	sd	s3,0(a0)
ffffffffc0206c5c:	67e2                	ld	a5,24(sp)
ffffffffc0206c5e:	013a3423          	sd	s3,8(s4)
ffffffffc0206c62:	00fa3823          	sd	a5,16(s4)
ffffffffc0206c66:	0149b023          	sd	s4,0(s3)
ffffffffc0206c6a:	89d2                	mv	s3,s4
ffffffffc0206c6c:	f9bfe06f          	j	ffffffffc0205c06 <stride_dequeue+0xa46>
ffffffffc0206c70:	008a3783          	ld	a5,8(s4)
ffffffffc0206c74:	010a3883          	ld	a7,16(s4)
ffffffffc0206c78:	fc2a                	sd	a0,56(sp)
ffffffffc0206c7a:	f03e                	sd	a5,32(sp)
ffffffffc0206c7c:	02088f63          	beqz	a7,ffffffffc0206cba <stride_dequeue+0x1afa>
ffffffffc0206c80:	8546                	mv	a0,a7
ffffffffc0206c82:	85ce                	mv	a1,s3
ffffffffc0206c84:	f842                	sd	a6,48(sp)
ffffffffc0206c86:	f446                	sd	a7,40(sp)
ffffffffc0206c88:	afcfe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206c8c:	7e62                	ld	t3,56(sp)
ffffffffc0206c8e:	78a2                	ld	a7,40(sp)
ffffffffc0206c90:	7842                	ld	a6,48(sp)
ffffffffc0206c92:	35c509e3          	beq	a0,t3,ffffffffc02077e4 <stride_dequeue+0x2624>
ffffffffc0206c96:	0109b583          	ld	a1,16(s3)
ffffffffc0206c9a:	0089bb03          	ld	s6,8(s3)
ffffffffc0206c9e:	8546                	mv	a0,a7
ffffffffc0206ca0:	f442                	sd	a6,40(sp)
ffffffffc0206ca2:	b3efe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206ca6:	00a9b423          	sd	a0,8(s3)
ffffffffc0206caa:	0169b823          	sd	s6,16(s3)
ffffffffc0206cae:	7822                	ld	a6,40(sp)
ffffffffc0206cb0:	010c2b03          	lw	s6,16(s8)
ffffffffc0206cb4:	c119                	beqz	a0,ffffffffc0206cba <stride_dequeue+0x1afa>
ffffffffc0206cb6:	01353023          	sd	s3,0(a0)
ffffffffc0206cba:	7782                	ld	a5,32(sp)
ffffffffc0206cbc:	013a3423          	sd	s3,8(s4)
ffffffffc0206cc0:	00fa3823          	sd	a5,16(s4)
ffffffffc0206cc4:	0149b023          	sd	s4,0(s3)
ffffffffc0206cc8:	89d2                	mv	s3,s4
ffffffffc0206cca:	c73fe06f          	j	ffffffffc020593c <stride_dequeue+0x77c>
ffffffffc0206cce:	661c                	ld	a5,8(a2)
ffffffffc0206cd0:	01063883          	ld	a7,16(a2)
ffffffffc0206cd4:	fc2a                	sd	a0,56(sp)
ffffffffc0206cd6:	ec3e                	sd	a5,24(sp)
ffffffffc0206cd8:	04088363          	beqz	a7,ffffffffc0206d1e <stride_dequeue+0x1b5e>
ffffffffc0206cdc:	8546                	mv	a0,a7
ffffffffc0206cde:	85ce                	mv	a1,s3
ffffffffc0206ce0:	f842                	sd	a6,48(sp)
ffffffffc0206ce2:	f432                	sd	a2,40(sp)
ffffffffc0206ce4:	f046                	sd	a7,32(sp)
ffffffffc0206ce6:	a9efe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206cea:	7e62                	ld	t3,56(sp)
ffffffffc0206cec:	7882                	ld	a7,32(sp)
ffffffffc0206cee:	7622                	ld	a2,40(sp)
ffffffffc0206cf0:	7842                	ld	a6,48(sp)
ffffffffc0206cf2:	25c501e3          	beq	a0,t3,ffffffffc0207734 <stride_dequeue+0x2574>
ffffffffc0206cf6:	0109b583          	ld	a1,16(s3)
ffffffffc0206cfa:	0089bb03          	ld	s6,8(s3)
ffffffffc0206cfe:	8546                	mv	a0,a7
ffffffffc0206d00:	f442                	sd	a6,40(sp)
ffffffffc0206d02:	f032                	sd	a2,32(sp)
ffffffffc0206d04:	adcfe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206d08:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d0c:	0169b823          	sd	s6,16(s3)
ffffffffc0206d10:	7602                	ld	a2,32(sp)
ffffffffc0206d12:	7822                	ld	a6,40(sp)
ffffffffc0206d14:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d18:	c119                	beqz	a0,ffffffffc0206d1e <stride_dequeue+0x1b5e>
ffffffffc0206d1a:	01353023          	sd	s3,0(a0)
ffffffffc0206d1e:	67e2                	ld	a5,24(sp)
ffffffffc0206d20:	01363423          	sd	s3,8(a2)
ffffffffc0206d24:	ea1c                	sd	a5,16(a2)
ffffffffc0206d26:	00c9b023          	sd	a2,0(s3)
ffffffffc0206d2a:	89b2                	mv	s3,a2
ffffffffc0206d2c:	b13fe06f          	j	ffffffffc020583e <stride_dequeue+0x67e>
ffffffffc0206d30:	89c6                	mv	s3,a7
ffffffffc0206d32:	9e4ff06f          	j	ffffffffc0205f16 <stride_dequeue+0xd56>
ffffffffc0206d36:	0088b783          	ld	a5,8(a7)
ffffffffc0206d3a:	0108b803          	ld	a6,16(a7)
ffffffffc0206d3e:	fc2a                	sd	a0,56(sp)
ffffffffc0206d40:	f03e                	sd	a5,32(sp)
ffffffffc0206d42:	02080f63          	beqz	a6,ffffffffc0206d80 <stride_dequeue+0x1bc0>
ffffffffc0206d46:	8542                	mv	a0,a6
ffffffffc0206d48:	85ce                	mv	a1,s3
ffffffffc0206d4a:	f846                	sd	a7,48(sp)
ffffffffc0206d4c:	f442                	sd	a6,40(sp)
ffffffffc0206d4e:	a36fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206d52:	7e62                	ld	t3,56(sp)
ffffffffc0206d54:	7822                	ld	a6,40(sp)
ffffffffc0206d56:	78c2                	ld	a7,48(sp)
ffffffffc0206d58:	47c50ce3          	beq	a0,t3,ffffffffc02079d0 <stride_dequeue+0x2810>
ffffffffc0206d5c:	0109b583          	ld	a1,16(s3)
ffffffffc0206d60:	0089bb03          	ld	s6,8(s3)
ffffffffc0206d64:	8542                	mv	a0,a6
ffffffffc0206d66:	f446                	sd	a7,40(sp)
ffffffffc0206d68:	a78fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206d6c:	00a9b423          	sd	a0,8(s3)
ffffffffc0206d70:	0169b823          	sd	s6,16(s3)
ffffffffc0206d74:	78a2                	ld	a7,40(sp)
ffffffffc0206d76:	010c2b03          	lw	s6,16(s8)
ffffffffc0206d7a:	c119                	beqz	a0,ffffffffc0206d80 <stride_dequeue+0x1bc0>
ffffffffc0206d7c:	01353023          	sd	s3,0(a0)
ffffffffc0206d80:	7782                	ld	a5,32(sp)
ffffffffc0206d82:	0138b423          	sd	s3,8(a7)
ffffffffc0206d86:	00f8b823          	sd	a5,16(a7)
ffffffffc0206d8a:	0119b023          	sd	a7,0(s3)
ffffffffc0206d8e:	89c6                	mv	s3,a7
ffffffffc0206d90:	8f0ff06f          	j	ffffffffc0205e80 <stride_dequeue+0xcc0>
ffffffffc0206d94:	0088b783          	ld	a5,8(a7)
ffffffffc0206d98:	0108b803          	ld	a6,16(a7)
ffffffffc0206d9c:	fc2a                	sd	a0,56(sp)
ffffffffc0206d9e:	f03e                	sd	a5,32(sp)
ffffffffc0206da0:	02080f63          	beqz	a6,ffffffffc0206dde <stride_dequeue+0x1c1e>
ffffffffc0206da4:	8542                	mv	a0,a6
ffffffffc0206da6:	85ce                	mv	a1,s3
ffffffffc0206da8:	f846                	sd	a7,48(sp)
ffffffffc0206daa:	f442                	sd	a6,40(sp)
ffffffffc0206dac:	9d8fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206db0:	7e62                	ld	t3,56(sp)
ffffffffc0206db2:	7822                	ld	a6,40(sp)
ffffffffc0206db4:	78c2                	ld	a7,48(sp)
ffffffffc0206db6:	25c50de3          	beq	a0,t3,ffffffffc0207810 <stride_dequeue+0x2650>
ffffffffc0206dba:	0109b583          	ld	a1,16(s3)
ffffffffc0206dbe:	0089bb03          	ld	s6,8(s3)
ffffffffc0206dc2:	8542                	mv	a0,a6
ffffffffc0206dc4:	f446                	sd	a7,40(sp)
ffffffffc0206dc6:	a1afe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206dca:	00a9b423          	sd	a0,8(s3)
ffffffffc0206dce:	0169b823          	sd	s6,16(s3)
ffffffffc0206dd2:	78a2                	ld	a7,40(sp)
ffffffffc0206dd4:	010c2b03          	lw	s6,16(s8)
ffffffffc0206dd8:	c119                	beqz	a0,ffffffffc0206dde <stride_dequeue+0x1c1e>
ffffffffc0206dda:	01353023          	sd	s3,0(a0)
ffffffffc0206dde:	7782                	ld	a5,32(sp)
ffffffffc0206de0:	0138b423          	sd	s3,8(a7)
ffffffffc0206de4:	00f8b823          	sd	a5,16(a7)
ffffffffc0206de8:	0119b023          	sd	a7,0(s3)
ffffffffc0206dec:	89c6                	mv	s3,a7
ffffffffc0206dee:	ee7fe06f          	j	ffffffffc0205cd4 <stride_dequeue+0xb14>
ffffffffc0206df2:	0088b783          	ld	a5,8(a7)
ffffffffc0206df6:	0108b803          	ld	a6,16(a7)
ffffffffc0206dfa:	fc2a                	sd	a0,56(sp)
ffffffffc0206dfc:	ec3e                	sd	a5,24(sp)
ffffffffc0206dfe:	04080263          	beqz	a6,ffffffffc0206e42 <stride_dequeue+0x1c82>
ffffffffc0206e02:	8542                	mv	a0,a6
ffffffffc0206e04:	85ce                	mv	a1,s3
ffffffffc0206e06:	f846                	sd	a7,48(sp)
ffffffffc0206e08:	f042                	sd	a6,32(sp)
ffffffffc0206e0a:	97afe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206e0e:	7e62                	ld	t3,56(sp)
ffffffffc0206e10:	7802                	ld	a6,32(sp)
ffffffffc0206e12:	7622                	ld	a2,40(sp)
ffffffffc0206e14:	78c2                	ld	a7,48(sp)
ffffffffc0206e16:	23c503e3          	beq	a0,t3,ffffffffc020783c <stride_dequeue+0x267c>
ffffffffc0206e1a:	0109b583          	ld	a1,16(s3)
ffffffffc0206e1e:	0089bb03          	ld	s6,8(s3)
ffffffffc0206e22:	8542                	mv	a0,a6
ffffffffc0206e24:	f446                	sd	a7,40(sp)
ffffffffc0206e26:	f032                	sd	a2,32(sp)
ffffffffc0206e28:	9b8fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206e2c:	00a9b423          	sd	a0,8(s3)
ffffffffc0206e30:	0169b823          	sd	s6,16(s3)
ffffffffc0206e34:	7602                	ld	a2,32(sp)
ffffffffc0206e36:	78a2                	ld	a7,40(sp)
ffffffffc0206e38:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e3c:	c119                	beqz	a0,ffffffffc0206e42 <stride_dequeue+0x1c82>
ffffffffc0206e3e:	01353023          	sd	s3,0(a0)
ffffffffc0206e42:	67e2                	ld	a5,24(sp)
ffffffffc0206e44:	0138b423          	sd	s3,8(a7)
ffffffffc0206e48:	00f8b823          	sd	a5,16(a7)
ffffffffc0206e4c:	0119b023          	sd	a7,0(s3)
ffffffffc0206e50:	89c6                	mv	s3,a7
ffffffffc0206e52:	f61fe06f          	j	ffffffffc0205db2 <stride_dequeue+0xbf2>
ffffffffc0206e56:	0089b783          	ld	a5,8(s3)
ffffffffc0206e5a:	0109b303          	ld	t1,16(s3)
ffffffffc0206e5e:	fc2a                	sd	a0,56(sp)
ffffffffc0206e60:	f03e                	sd	a5,32(sp)
ffffffffc0206e62:	02030f63          	beqz	t1,ffffffffc0206ea0 <stride_dequeue+0x1ce0>
ffffffffc0206e66:	851a                	mv	a0,t1
ffffffffc0206e68:	85e6                	mv	a1,s9
ffffffffc0206e6a:	f846                	sd	a7,48(sp)
ffffffffc0206e6c:	f41a                	sd	t1,40(sp)
ffffffffc0206e6e:	916fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206e72:	7e62                	ld	t3,56(sp)
ffffffffc0206e74:	7322                	ld	t1,40(sp)
ffffffffc0206e76:	78c2                	ld	a7,48(sp)
ffffffffc0206e78:	11c50be3          	beq	a0,t3,ffffffffc020778e <stride_dequeue+0x25ce>
ffffffffc0206e7c:	010cb583          	ld	a1,16(s9)
ffffffffc0206e80:	008cbb03          	ld	s6,8(s9)
ffffffffc0206e84:	851a                	mv	a0,t1
ffffffffc0206e86:	f446                	sd	a7,40(sp)
ffffffffc0206e88:	958fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206e8c:	00acb423          	sd	a0,8(s9)
ffffffffc0206e90:	016cb823          	sd	s6,16(s9)
ffffffffc0206e94:	78a2                	ld	a7,40(sp)
ffffffffc0206e96:	010c2b03          	lw	s6,16(s8)
ffffffffc0206e9a:	c119                	beqz	a0,ffffffffc0206ea0 <stride_dequeue+0x1ce0>
ffffffffc0206e9c:	01953023          	sd	s9,0(a0)
ffffffffc0206ea0:	7782                	ld	a5,32(sp)
ffffffffc0206ea2:	0199b423          	sd	s9,8(s3)
ffffffffc0206ea6:	00f9b823          	sd	a5,16(s3)
ffffffffc0206eaa:	013cb023          	sd	s3,0(s9)
ffffffffc0206eae:	8cce                	mv	s9,s3
ffffffffc0206eb0:	b8aff06f          	j	ffffffffc020623a <stride_dequeue+0x107a>
ffffffffc0206eb4:	89ee                	mv	s3,s11
ffffffffc0206eb6:	dd6fe06f          	j	ffffffffc020548c <stride_dequeue+0x2cc>
ffffffffc0206eba:	0089b783          	ld	a5,8(s3)
ffffffffc0206ebe:	0109b303          	ld	t1,16(s3)
ffffffffc0206ec2:	fc2a                	sd	a0,56(sp)
ffffffffc0206ec4:	f03e                	sd	a5,32(sp)
ffffffffc0206ec6:	02030f63          	beqz	t1,ffffffffc0206f04 <stride_dequeue+0x1d44>
ffffffffc0206eca:	85c2                	mv	a1,a6
ffffffffc0206ecc:	851a                	mv	a0,t1
ffffffffc0206ece:	f842                	sd	a6,48(sp)
ffffffffc0206ed0:	f41a                	sd	t1,40(sp)
ffffffffc0206ed2:	8b2fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206ed6:	7e62                	ld	t3,56(sp)
ffffffffc0206ed8:	7322                	ld	t1,40(sp)
ffffffffc0206eda:	7842                	ld	a6,48(sp)
ffffffffc0206edc:	0dc50fe3          	beq	a0,t3,ffffffffc02077ba <stride_dequeue+0x25fa>
ffffffffc0206ee0:	01083583          	ld	a1,16(a6)
ffffffffc0206ee4:	851a                	mv	a0,t1
ffffffffc0206ee6:	00883b03          	ld	s6,8(a6)
ffffffffc0206eea:	f442                	sd	a6,40(sp)
ffffffffc0206eec:	8f4fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206ef0:	7822                	ld	a6,40(sp)
ffffffffc0206ef2:	01683823          	sd	s6,16(a6)
ffffffffc0206ef6:	00a83423          	sd	a0,8(a6)
ffffffffc0206efa:	010c2b03          	lw	s6,16(s8)
ffffffffc0206efe:	c119                	beqz	a0,ffffffffc0206f04 <stride_dequeue+0x1d44>
ffffffffc0206f00:	01053023          	sd	a6,0(a0)
ffffffffc0206f04:	7782                	ld	a5,32(sp)
ffffffffc0206f06:	0109b423          	sd	a6,8(s3)
ffffffffc0206f0a:	00f9b823          	sd	a5,16(s3)
ffffffffc0206f0e:	01383023          	sd	s3,0(a6)
ffffffffc0206f12:	884e                	mv	a6,s3
ffffffffc0206f14:	bc4ff06f          	j	ffffffffc02062d8 <stride_dequeue+0x1118>
ffffffffc0206f18:	008cb783          	ld	a5,8(s9)
ffffffffc0206f1c:	010cb883          	ld	a7,16(s9)
ffffffffc0206f20:	fc2a                	sd	a0,56(sp)
ffffffffc0206f22:	f03e                	sd	a5,32(sp)
ffffffffc0206f24:	02088f63          	beqz	a7,ffffffffc0206f62 <stride_dequeue+0x1da2>
ffffffffc0206f28:	8546                	mv	a0,a7
ffffffffc0206f2a:	85ce                	mv	a1,s3
ffffffffc0206f2c:	f842                	sd	a6,48(sp)
ffffffffc0206f2e:	f446                	sd	a7,40(sp)
ffffffffc0206f30:	854fe0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206f34:	7e62                	ld	t3,56(sp)
ffffffffc0206f36:	78a2                	ld	a7,40(sp)
ffffffffc0206f38:	7842                	ld	a6,48(sp)
ffffffffc0206f3a:	27c505e3          	beq	a0,t3,ffffffffc02079a4 <stride_dequeue+0x27e4>
ffffffffc0206f3e:	0109b583          	ld	a1,16(s3)
ffffffffc0206f42:	0089bb03          	ld	s6,8(s3)
ffffffffc0206f46:	8546                	mv	a0,a7
ffffffffc0206f48:	f442                	sd	a6,40(sp)
ffffffffc0206f4a:	896fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206f4e:	00a9b423          	sd	a0,8(s3)
ffffffffc0206f52:	0169b823          	sd	s6,16(s3)
ffffffffc0206f56:	7822                	ld	a6,40(sp)
ffffffffc0206f58:	010c2b03          	lw	s6,16(s8)
ffffffffc0206f5c:	c119                	beqz	a0,ffffffffc0206f62 <stride_dequeue+0x1da2>
ffffffffc0206f5e:	01353023          	sd	s3,0(a0)
ffffffffc0206f62:	7782                	ld	a5,32(sp)
ffffffffc0206f64:	013cb423          	sd	s3,8(s9)
ffffffffc0206f68:	00fcb823          	sd	a5,16(s9)
ffffffffc0206f6c:	0199b023          	sd	s9,0(s3)
ffffffffc0206f70:	89e6                	mv	s3,s9
ffffffffc0206f72:	fb0fe06f          	j	ffffffffc0205722 <stride_dequeue+0x562>
ffffffffc0206f76:	0089b783          	ld	a5,8(s3)
ffffffffc0206f7a:	0109b303          	ld	t1,16(s3)
ffffffffc0206f7e:	fc2a                	sd	a0,56(sp)
ffffffffc0206f80:	f03e                	sd	a5,32(sp)
ffffffffc0206f82:	02030f63          	beqz	t1,ffffffffc0206fc0 <stride_dequeue+0x1e00>
ffffffffc0206f86:	85c2                	mv	a1,a6
ffffffffc0206f88:	851a                	mv	a0,t1
ffffffffc0206f8a:	f842                	sd	a6,48(sp)
ffffffffc0206f8c:	f41a                	sd	t1,40(sp)
ffffffffc0206f8e:	ff7fd0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206f92:	7e62                	ld	t3,56(sp)
ffffffffc0206f94:	7322                	ld	t1,40(sp)
ffffffffc0206f96:	7842                	ld	a6,48(sp)
ffffffffc0206f98:	1bc509e3          	beq	a0,t3,ffffffffc020794a <stride_dequeue+0x278a>
ffffffffc0206f9c:	01083583          	ld	a1,16(a6)
ffffffffc0206fa0:	851a                	mv	a0,t1
ffffffffc0206fa2:	00883b03          	ld	s6,8(a6)
ffffffffc0206fa6:	f442                	sd	a6,40(sp)
ffffffffc0206fa8:	838fe0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0206fac:	7822                	ld	a6,40(sp)
ffffffffc0206fae:	01683823          	sd	s6,16(a6)
ffffffffc0206fb2:	00a83423          	sd	a0,8(a6)
ffffffffc0206fb6:	010c2b03          	lw	s6,16(s8)
ffffffffc0206fba:	c119                	beqz	a0,ffffffffc0206fc0 <stride_dequeue+0x1e00>
ffffffffc0206fbc:	01053023          	sd	a6,0(a0)
ffffffffc0206fc0:	7782                	ld	a5,32(sp)
ffffffffc0206fc2:	0109b423          	sd	a6,8(s3)
ffffffffc0206fc6:	00f9b823          	sd	a5,16(s3)
ffffffffc0206fca:	01383023          	sd	s3,0(a6)
ffffffffc0206fce:	884e                	mv	a6,s3
ffffffffc0206fd0:	ba4ff06f          	j	ffffffffc0206374 <stride_dequeue+0x11b4>
ffffffffc0206fd4:	0089b783          	ld	a5,8(s3)
ffffffffc0206fd8:	0109b303          	ld	t1,16(s3)
ffffffffc0206fdc:	fc2a                	sd	a0,56(sp)
ffffffffc0206fde:	ec3e                	sd	a5,24(sp)
ffffffffc0206fe0:	04030363          	beqz	t1,ffffffffc0207026 <stride_dequeue+0x1e66>
ffffffffc0206fe4:	85c2                	mv	a1,a6
ffffffffc0206fe6:	851a                	mv	a0,t1
ffffffffc0206fe8:	f832                	sd	a2,48(sp)
ffffffffc0206fea:	f442                	sd	a6,40(sp)
ffffffffc0206fec:	f01a                	sd	t1,32(sp)
ffffffffc0206fee:	f97fd0ef          	jal	ra,ffffffffc0204f84 <proc_stride_comp_f>
ffffffffc0206ff2:	7642                	ld	a2,48(sp)
ffffffffc0206ff4:	7e62                	ld	t3,56(sp)
ffffffffc0206ff6:	7822                	ld	a6,40(sp)
ffffffffc0206ff8:	f432                	sd	a2,40(sp)
ffffffffc0206ffa:	7302                	ld	t1,32(sp)
ffffffffc0206ffc:	29c507e3          	beq	a0,t3,ffffffffc0207a8a <stride_dequeue+0x28ca>
ffffffffc0207000:	01083583          	ld	a1,16(a6)
ffffffffc0207004:	851a                	mv	a0,t1
ffffffffc0207006:	00883b03          	ld	s6,8(a6)
ffffffffc020700a:	f042                	sd	a6,32(sp)
ffffffffc020700c:	fd5fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207010:	7802                	ld	a6,32(sp)
ffffffffc0207012:	7622                	ld	a2,40(sp)
ffffffffc0207014:	01683823          	sd	s6,16(a6)
ffffffffc0207018:	00a83423          	sd	a0,8(a6)
ffffffffc020701c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207020:	c119                	beqz	a0,ffffffffc0207026 <stride_dequeue+0x1e66>
ffffffffc0207022:	01053023          	sd	a6,0(a0)
ffffffffc0207026:	67e2                	ld	a5,24(sp)
ffffffffc0207028:	0109b423          	sd	a6,8(s3)
ffffffffc020702c:	00f9b823          	sd	a5,16(s3)
ffffffffc0207030:	01383023          	sd	s3,0(a6)
ffffffffc0207034:	884e                	mv	a6,s3
ffffffffc0207036:	be2ff06f          	j	ffffffffc0206418 <stride_dequeue+0x1258>
ffffffffc020703a:	89c6                	mv	s3,a7
ffffffffc020703c:	9cffe06f          	j	ffffffffc0205a0a <stride_dequeue+0x84a>
ffffffffc0207040:	89e6                	mv	s3,s9
ffffffffc0207042:	aadfe06f          	j	ffffffffc0205aee <stride_dequeue+0x92e>
ffffffffc0207046:	89ee                	mv	s3,s11
ffffffffc0207048:	d9efe06f          	j	ffffffffc02055e6 <stride_dequeue+0x426>
ffffffffc020704c:	89d2                	mv	s3,s4
ffffffffc020704e:	bb9fe06f          	j	ffffffffc0205c06 <stride_dequeue+0xa46>
ffffffffc0207052:	0108b503          	ld	a0,16(a7)
ffffffffc0207056:	85ce                	mv	a1,s3
ffffffffc0207058:	0088bb03          	ld	s6,8(a7)
ffffffffc020705c:	f81a                	sd	t1,48(sp)
ffffffffc020705e:	f446                	sd	a7,40(sp)
ffffffffc0207060:	f81fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207064:	78a2                	ld	a7,40(sp)
ffffffffc0207066:	7342                	ld	t1,48(sp)
ffffffffc0207068:	0168b823          	sd	s6,16(a7)
ffffffffc020706c:	00a8b423          	sd	a0,8(a7)
ffffffffc0207070:	010c2b03          	lw	s6,16(s8)
ffffffffc0207074:	d179                	beqz	a0,ffffffffc020703a <stride_dequeue+0x1e7a>
ffffffffc0207076:	01153023          	sd	a7,0(a0)
ffffffffc020707a:	89c6                	mv	s3,a7
ffffffffc020707c:	98ffe06f          	j	ffffffffc0205a0a <stride_dequeue+0x84a>
ffffffffc0207080:	0109b503          	ld	a0,16(s3)
ffffffffc0207084:	0089bb03          	ld	s6,8(s3)
ffffffffc0207088:	85be                	mv	a1,a5
ffffffffc020708a:	f442                	sd	a6,40(sp)
ffffffffc020708c:	f55fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207090:	00a9b423          	sd	a0,8(s3)
ffffffffc0207094:	0169b823          	sd	s6,16(s3)
ffffffffc0207098:	7822                	ld	a6,40(sp)
ffffffffc020709a:	010c2b03          	lw	s6,16(s8)
ffffffffc020709e:	5e050b63          	beqz	a0,ffffffffc0207694 <stride_dequeue+0x24d4>
ffffffffc02070a2:	01353023          	sd	s3,0(a0)
ffffffffc02070a6:	87ce                	mv	a5,s3
ffffffffc02070a8:	bccff06f          	j	ffffffffc0206474 <stride_dequeue+0x12b4>
ffffffffc02070ac:	010cb503          	ld	a0,16(s9)
ffffffffc02070b0:	008cbb03          	ld	s6,8(s9)
ffffffffc02070b4:	85ce                	mv	a1,s3
ffffffffc02070b6:	f2bfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02070ba:	00acb423          	sd	a0,8(s9)
ffffffffc02070be:	016cb823          	sd	s6,16(s9)
ffffffffc02070c2:	7822                	ld	a6,40(sp)
ffffffffc02070c4:	7342                	ld	t1,48(sp)
ffffffffc02070c6:	010c2b03          	lw	s6,16(s8)
ffffffffc02070ca:	d93d                	beqz	a0,ffffffffc0207040 <stride_dequeue+0x1e80>
ffffffffc02070cc:	01953023          	sd	s9,0(a0)
ffffffffc02070d0:	89e6                	mv	s3,s9
ffffffffc02070d2:	a1dfe06f          	j	ffffffffc0205aee <stride_dequeue+0x92e>
ffffffffc02070d6:	0108b503          	ld	a0,16(a7)
ffffffffc02070da:	85ce                	mv	a1,s3
ffffffffc02070dc:	0088bb03          	ld	s6,8(a7)
ffffffffc02070e0:	f842                	sd	a6,48(sp)
ffffffffc02070e2:	f446                	sd	a7,40(sp)
ffffffffc02070e4:	efdfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02070e8:	78a2                	ld	a7,40(sp)
ffffffffc02070ea:	7842                	ld	a6,48(sp)
ffffffffc02070ec:	0168b823          	sd	s6,16(a7)
ffffffffc02070f0:	00a8b423          	sd	a0,8(a7)
ffffffffc02070f4:	010c2b03          	lw	s6,16(s8)
ffffffffc02070f8:	c2050ce3          	beqz	a0,ffffffffc0206d30 <stride_dequeue+0x1b70>
ffffffffc02070fc:	01153023          	sd	a7,0(a0)
ffffffffc0207100:	89c6                	mv	s3,a7
ffffffffc0207102:	e15fe06f          	j	ffffffffc0205f16 <stride_dequeue+0xd56>
ffffffffc0207106:	010db503          	ld	a0,16(s11)
ffffffffc020710a:	008dbb03          	ld	s6,8(s11)
ffffffffc020710e:	85ce                	mv	a1,s3
ffffffffc0207110:	ed1fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207114:	00adb423          	sd	a0,8(s11)
ffffffffc0207118:	016db823          	sd	s6,16(s11)
ffffffffc020711c:	7602                	ld	a2,32(sp)
ffffffffc020711e:	7822                	ld	a6,40(sp)
ffffffffc0207120:	7342                	ld	t1,48(sp)
ffffffffc0207122:	010c2b03          	lw	s6,16(s8)
ffffffffc0207126:	d105                	beqz	a0,ffffffffc0207046 <stride_dequeue+0x1e86>
ffffffffc0207128:	01b53023          	sd	s11,0(a0)
ffffffffc020712c:	89ee                	mv	s3,s11
ffffffffc020712e:	cb8fe06f          	j	ffffffffc02055e6 <stride_dequeue+0x426>
ffffffffc0207132:	010db503          	ld	a0,16(s11)
ffffffffc0207136:	008dbb03          	ld	s6,8(s11)
ffffffffc020713a:	85ce                	mv	a1,s3
ffffffffc020713c:	ea5fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207140:	00adb423          	sd	a0,8(s11)
ffffffffc0207144:	016db823          	sd	s6,16(s11)
ffffffffc0207148:	7322                	ld	t1,40(sp)
ffffffffc020714a:	7842                	ld	a6,48(sp)
ffffffffc020714c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207150:	d60502e3          	beqz	a0,ffffffffc0206eb4 <stride_dequeue+0x1cf4>
ffffffffc0207154:	01b53023          	sd	s11,0(a0)
ffffffffc0207158:	89ee                	mv	s3,s11
ffffffffc020715a:	b32fe06f          	j	ffffffffc020548c <stride_dequeue+0x2cc>
ffffffffc020715e:	89e6                	mv	s3,s9
ffffffffc0207160:	dc2fe06f          	j	ffffffffc0205722 <stride_dequeue+0x562>
ffffffffc0207164:	89c6                	mv	s3,a7
ffffffffc0207166:	d1bfe06f          	j	ffffffffc0205e80 <stride_dequeue+0xcc0>
ffffffffc020716a:	00003697          	auipc	a3,0x3
ffffffffc020716e:	bce68693          	addi	a3,a3,-1074 # ffffffffc0209d38 <default_pmm_manager+0x860>
ffffffffc0207172:	00001617          	auipc	a2,0x1
ffffffffc0207176:	62660613          	addi	a2,a2,1574 # ffffffffc0208798 <commands+0x410>
ffffffffc020717a:	06300593          	li	a1,99
ffffffffc020717e:	00003517          	auipc	a0,0x3
ffffffffc0207182:	be250513          	addi	a0,a0,-1054 # ffffffffc0209d60 <default_pmm_manager+0x888>
ffffffffc0207186:	882f90ef          	jal	ra,ffffffffc0200208 <__panic>
ffffffffc020718a:	89d2                	mv	s3,s4
ffffffffc020718c:	fb0fe06f          	j	ffffffffc020593c <stride_dequeue+0x77c>
ffffffffc0207190:	89c6                	mv	s3,a7
ffffffffc0207192:	c21fe06f          	j	ffffffffc0205db2 <stride_dequeue+0xbf2>
ffffffffc0207196:	89c6                	mv	s3,a7
ffffffffc0207198:	b3dfe06f          	j	ffffffffc0205cd4 <stride_dequeue+0xb14>
ffffffffc020719c:	89b2                	mv	s3,a2
ffffffffc020719e:	ea0fe06f          	j	ffffffffc020583e <stride_dequeue+0x67e>
ffffffffc02071a2:	0109b503          	ld	a0,16(s3)
ffffffffc02071a6:	0089bb03          	ld	s6,8(s3)
ffffffffc02071aa:	85a6                	mv	a1,s1
ffffffffc02071ac:	e35fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02071b0:	00a9b423          	sd	a0,8(s3)
ffffffffc02071b4:	0169b823          	sd	s6,16(s3)
ffffffffc02071b8:	010c2b03          	lw	s6,16(s8)
ffffffffc02071bc:	b4050363          	beqz	a0,ffffffffc0206502 <stride_dequeue+0x1342>
ffffffffc02071c0:	01353023          	sd	s3,0(a0)
ffffffffc02071c4:	b3eff06f          	j	ffffffffc0206502 <stride_dequeue+0x1342>
ffffffffc02071c8:	0109b503          	ld	a0,16(s3)
ffffffffc02071cc:	0089bb03          	ld	s6,8(s3)
ffffffffc02071d0:	859a                	mv	a1,t1
ffffffffc02071d2:	f446                	sd	a7,40(sp)
ffffffffc02071d4:	e0dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02071d8:	00a9b423          	sd	a0,8(s3)
ffffffffc02071dc:	0169b823          	sd	s6,16(s3)
ffffffffc02071e0:	78a2                	ld	a7,40(sp)
ffffffffc02071e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02071e6:	100505e3          	beqz	a0,ffffffffc0207af0 <stride_dequeue+0x2930>
ffffffffc02071ea:	01353023          	sd	s3,0(a0)
ffffffffc02071ee:	834e                	mv	t1,s3
ffffffffc02071f0:	b0c5                	j	ffffffffc0206ad0 <stride_dequeue+0x1910>
ffffffffc02071f2:	0109b503          	ld	a0,16(s3)
ffffffffc02071f6:	0089bb03          	ld	s6,8(s3)
ffffffffc02071fa:	85f2                	mv	a1,t3
ffffffffc02071fc:	f442                	sd	a6,40(sp)
ffffffffc02071fe:	f032                	sd	a2,32(sp)
ffffffffc0207200:	de1fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207204:	00a9b423          	sd	a0,8(s3)
ffffffffc0207208:	0169b823          	sd	s6,16(s3)
ffffffffc020720c:	7602                	ld	a2,32(sp)
ffffffffc020720e:	7822                	ld	a6,40(sp)
ffffffffc0207210:	010c2b03          	lw	s6,16(s8)
ffffffffc0207214:	9e050b63          	beqz	a0,ffffffffc020640a <stride_dequeue+0x124a>
ffffffffc0207218:	01353023          	sd	s3,0(a0)
ffffffffc020721c:	9eeff06f          	j	ffffffffc020640a <stride_dequeue+0x124a>
ffffffffc0207220:	0109b503          	ld	a0,16(s3)
ffffffffc0207224:	0089bb03          	ld	s6,8(s3)
ffffffffc0207228:	859a                	mv	a1,t1
ffffffffc020722a:	f442                	sd	a6,40(sp)
ffffffffc020722c:	db5fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207230:	00a9b423          	sd	a0,8(s3)
ffffffffc0207234:	0169b823          	sd	s6,16(s3)
ffffffffc0207238:	7822                	ld	a6,40(sp)
ffffffffc020723a:	010c2b03          	lw	s6,16(s8)
ffffffffc020723e:	08050de3          	beqz	a0,ffffffffc0207ad8 <stride_dequeue+0x2918>
ffffffffc0207242:	01353023          	sd	s3,0(a0)
ffffffffc0207246:	834e                	mv	t1,s3
ffffffffc0207248:	efaff06f          	j	ffffffffc0206942 <stride_dequeue+0x1782>
ffffffffc020724c:	89a6                	mv	s3,s1
ffffffffc020724e:	ab4ff06f          	j	ffffffffc0206502 <stride_dequeue+0x1342>
ffffffffc0207252:	0109b503          	ld	a0,16(s3)
ffffffffc0207256:	0089bb03          	ld	s6,8(s3)
ffffffffc020725a:	85ee                	mv	a1,s11
ffffffffc020725c:	f046                	sd	a7,32(sp)
ffffffffc020725e:	d83fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207262:	00a9b423          	sd	a0,8(s3)
ffffffffc0207266:	0169b823          	sd	s6,16(s3)
ffffffffc020726a:	7882                	ld	a7,32(sp)
ffffffffc020726c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207270:	bc050f63          	beqz	a0,ffffffffc020664e <stride_dequeue+0x148e>
ffffffffc0207274:	01353023          	sd	s3,0(a0)
ffffffffc0207278:	bd6ff06f          	j	ffffffffc020664e <stride_dequeue+0x148e>
ffffffffc020727c:	0109b503          	ld	a0,16(s3)
ffffffffc0207280:	0089bb03          	ld	s6,8(s3)
ffffffffc0207284:	85f2                	mv	a1,t3
ffffffffc0207286:	f442                	sd	a6,40(sp)
ffffffffc0207288:	d59fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020728c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207290:	0169b823          	sd	s6,16(s3)
ffffffffc0207294:	7822                	ld	a6,40(sp)
ffffffffc0207296:	010c2b03          	lw	s6,16(s8)
ffffffffc020729a:	e119                	bnez	a0,ffffffffc02072a0 <stride_dequeue+0x20e0>
ffffffffc020729c:	8caff06f          	j	ffffffffc0206366 <stride_dequeue+0x11a6>
ffffffffc02072a0:	01353023          	sd	s3,0(a0)
ffffffffc02072a4:	8c2ff06f          	j	ffffffffc0206366 <stride_dequeue+0x11a6>
ffffffffc02072a8:	0109b503          	ld	a0,16(s3)
ffffffffc02072ac:	0089bb03          	ld	s6,8(s3)
ffffffffc02072b0:	85b2                	mv	a1,a2
ffffffffc02072b2:	ec46                	sd	a7,24(sp)
ffffffffc02072b4:	d2dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02072b8:	00a9b423          	sd	a0,8(s3)
ffffffffc02072bc:	0169b823          	sd	s6,16(s3)
ffffffffc02072c0:	68e2                	ld	a7,24(sp)
ffffffffc02072c2:	010c2b03          	lw	s6,16(s8)
ffffffffc02072c6:	c2050963          	beqz	a0,ffffffffc02066f8 <stride_dequeue+0x1538>
ffffffffc02072ca:	01353023          	sd	s3,0(a0)
ffffffffc02072ce:	c2aff06f          	j	ffffffffc02066f8 <stride_dequeue+0x1538>
ffffffffc02072d2:	0109b503          	ld	a0,16(s3)
ffffffffc02072d6:	0089bb03          	ld	s6,8(s3)
ffffffffc02072da:	859a                	mv	a1,t1
ffffffffc02072dc:	f442                	sd	a6,40(sp)
ffffffffc02072de:	f032                	sd	a2,32(sp)
ffffffffc02072e0:	d01fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02072e4:	00a9b423          	sd	a0,8(s3)
ffffffffc02072e8:	0169b823          	sd	s6,16(s3)
ffffffffc02072ec:	7602                	ld	a2,32(sp)
ffffffffc02072ee:	7822                	ld	a6,40(sp)
ffffffffc02072f0:	010c2b03          	lw	s6,16(s8)
ffffffffc02072f4:	7c050363          	beqz	a0,ffffffffc0207aba <stride_dequeue+0x28fa>
ffffffffc02072f8:	01353023          	sd	s3,0(a0)
ffffffffc02072fc:	834e                	mv	t1,s3
ffffffffc02072fe:	eaeff06f          	j	ffffffffc02069ac <stride_dequeue+0x17ec>
ffffffffc0207302:	0109b503          	ld	a0,16(s3)
ffffffffc0207306:	0089bb03          	ld	s6,8(s3)
ffffffffc020730a:	85c2                	mv	a1,a6
ffffffffc020730c:	ec32                	sd	a2,24(sp)
ffffffffc020730e:	cd3fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207312:	00a9b423          	sd	a0,8(s3)
ffffffffc0207316:	0169b823          	sd	s6,16(s3)
ffffffffc020731a:	6662                	ld	a2,24(sp)
ffffffffc020731c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207320:	d2050263          	beqz	a0,ffffffffc0206844 <stride_dequeue+0x1684>
ffffffffc0207324:	01353023          	sd	s3,0(a0)
ffffffffc0207328:	d1cff06f          	j	ffffffffc0206844 <stride_dequeue+0x1684>
ffffffffc020732c:	0109b503          	ld	a0,16(s3)
ffffffffc0207330:	0089bb03          	ld	s6,8(s3)
ffffffffc0207334:	85c2                	mv	a1,a6
ffffffffc0207336:	cabfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020733a:	00a9b423          	sd	a0,8(s3)
ffffffffc020733e:	0169b823          	sd	s6,16(s3)
ffffffffc0207342:	010c2b03          	lw	s6,16(s8)
ffffffffc0207346:	c4050b63          	beqz	a0,ffffffffc020679c <stride_dequeue+0x15dc>
ffffffffc020734a:	01353023          	sd	s3,0(a0)
ffffffffc020734e:	c4eff06f          	j	ffffffffc020679c <stride_dequeue+0x15dc>
ffffffffc0207352:	0109b503          	ld	a0,16(s3)
ffffffffc0207356:	0089bb03          	ld	s6,8(s3)
ffffffffc020735a:	859a                	mv	a1,t1
ffffffffc020735c:	c85fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207360:	00a9b423          	sd	a0,8(s3)
ffffffffc0207364:	0169b823          	sd	s6,16(s3)
ffffffffc0207368:	010c2b03          	lw	s6,16(s8)
ffffffffc020736c:	e119                	bnez	a0,ffffffffc0207372 <stride_dequeue+0x21b2>
ffffffffc020736e:	c77fe06f          	j	ffffffffc0205fe4 <stride_dequeue+0xe24>
ffffffffc0207372:	01353023          	sd	s3,0(a0)
ffffffffc0207376:	c6ffe06f          	j	ffffffffc0205fe4 <stride_dequeue+0xe24>
ffffffffc020737a:	6a08                	ld	a0,16(a2)
ffffffffc020737c:	85f2                	mv	a1,t3
ffffffffc020737e:	00863b03          	ld	s6,8(a2)
ffffffffc0207382:	c5ffd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207386:	7602                	ld	a2,32(sp)
ffffffffc0207388:	7822                	ld	a6,40(sp)
ffffffffc020738a:	01663823          	sd	s6,16(a2)
ffffffffc020738e:	e608                	sd	a0,8(a2)
ffffffffc0207390:	010c2b03          	lw	s6,16(s8)
ffffffffc0207394:	e119                	bnez	a0,ffffffffc020739a <stride_dequeue+0x21da>
ffffffffc0207396:	c9afe06f          	j	ffffffffc0205830 <stride_dequeue+0x670>
ffffffffc020739a:	e110                	sd	a2,0(a0)
ffffffffc020739c:	c94fe06f          	j	ffffffffc0205830 <stride_dequeue+0x670>
ffffffffc02073a0:	010a3503          	ld	a0,16(s4)
ffffffffc02073a4:	008a3b03          	ld	s6,8(s4)
ffffffffc02073a8:	859a                	mv	a1,t1
ffffffffc02073aa:	c37fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02073ae:	00aa3423          	sd	a0,8(s4)
ffffffffc02073b2:	016a3823          	sd	s6,16(s4)
ffffffffc02073b6:	010c2b03          	lw	s6,16(s8)
ffffffffc02073ba:	e119                	bnez	a0,ffffffffc02073c0 <stride_dequeue+0x2200>
ffffffffc02073bc:	83dfe06f          	j	ffffffffc0205bf8 <stride_dequeue+0xa38>
ffffffffc02073c0:	01453023          	sd	s4,0(a0)
ffffffffc02073c4:	835fe06f          	j	ffffffffc0205bf8 <stride_dequeue+0xa38>
ffffffffc02073c8:	010cb503          	ld	a0,16(s9)
ffffffffc02073cc:	008cbb03          	ld	s6,8(s9)
ffffffffc02073d0:	85f2                	mv	a1,t3
ffffffffc02073d2:	f442                	sd	a6,40(sp)
ffffffffc02073d4:	c0dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02073d8:	00acb423          	sd	a0,8(s9)
ffffffffc02073dc:	016cb823          	sd	s6,16(s9)
ffffffffc02073e0:	7822                	ld	a6,40(sp)
ffffffffc02073e2:	010c2b03          	lw	s6,16(s8)
ffffffffc02073e6:	e119                	bnez	a0,ffffffffc02073ec <stride_dequeue+0x222c>
ffffffffc02073e8:	b2cfe06f          	j	ffffffffc0205714 <stride_dequeue+0x554>
ffffffffc02073ec:	01953023          	sd	s9,0(a0)
ffffffffc02073f0:	b24fe06f          	j	ffffffffc0205714 <stride_dequeue+0x554>
ffffffffc02073f4:	010a3503          	ld	a0,16(s4)
ffffffffc02073f8:	008a3b03          	ld	s6,8(s4)
ffffffffc02073fc:	85f2                	mv	a1,t3
ffffffffc02073fe:	f442                	sd	a6,40(sp)
ffffffffc0207400:	be1fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207404:	00aa3423          	sd	a0,8(s4)
ffffffffc0207408:	016a3823          	sd	s6,16(s4)
ffffffffc020740c:	7822                	ld	a6,40(sp)
ffffffffc020740e:	010c2b03          	lw	s6,16(s8)
ffffffffc0207412:	e119                	bnez	a0,ffffffffc0207418 <stride_dequeue+0x2258>
ffffffffc0207414:	d1afe06f          	j	ffffffffc020592e <stride_dequeue+0x76e>
ffffffffc0207418:	01453023          	sd	s4,0(a0)
ffffffffc020741c:	d12fe06f          	j	ffffffffc020592e <stride_dequeue+0x76e>
ffffffffc0207420:	0108b503          	ld	a0,16(a7)
ffffffffc0207424:	85f2                	mv	a1,t3
ffffffffc0207426:	0088bb03          	ld	s6,8(a7)
ffffffffc020742a:	f046                	sd	a7,32(sp)
ffffffffc020742c:	bb5fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207430:	7882                	ld	a7,32(sp)
ffffffffc0207432:	7622                	ld	a2,40(sp)
ffffffffc0207434:	0168b823          	sd	s6,16(a7)
ffffffffc0207438:	00a8b423          	sd	a0,8(a7)
ffffffffc020743c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207440:	e119                	bnez	a0,ffffffffc0207446 <stride_dequeue+0x2286>
ffffffffc0207442:	963fe06f          	j	ffffffffc0205da4 <stride_dequeue+0xbe4>
ffffffffc0207446:	01153023          	sd	a7,0(a0)
ffffffffc020744a:	95bfe06f          	j	ffffffffc0205da4 <stride_dequeue+0xbe4>
ffffffffc020744e:	0108b503          	ld	a0,16(a7)
ffffffffc0207452:	85f2                	mv	a1,t3
ffffffffc0207454:	0088bb03          	ld	s6,8(a7)
ffffffffc0207458:	f446                	sd	a7,40(sp)
ffffffffc020745a:	b87fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020745e:	78a2                	ld	a7,40(sp)
ffffffffc0207460:	0168b823          	sd	s6,16(a7)
ffffffffc0207464:	00a8b423          	sd	a0,8(a7)
ffffffffc0207468:	010c2b03          	lw	s6,16(s8)
ffffffffc020746c:	e119                	bnez	a0,ffffffffc0207472 <stride_dequeue+0x22b2>
ffffffffc020746e:	a05fe06f          	j	ffffffffc0205e72 <stride_dequeue+0xcb2>
ffffffffc0207472:	01153023          	sd	a7,0(a0)
ffffffffc0207476:	9fdfe06f          	j	ffffffffc0205e72 <stride_dequeue+0xcb2>
ffffffffc020747a:	0109b503          	ld	a0,16(s3)
ffffffffc020747e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207482:	85c2                	mv	a1,a6
ffffffffc0207484:	f446                	sd	a7,40(sp)
ffffffffc0207486:	b5bfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020748a:	00a9b423          	sd	a0,8(s3)
ffffffffc020748e:	0169b823          	sd	s6,16(s3)
ffffffffc0207492:	78a2                	ld	a7,40(sp)
ffffffffc0207494:	010c2b03          	lw	s6,16(s8)
ffffffffc0207498:	66050563          	beqz	a0,ffffffffc0207b02 <stride_dequeue+0x2942>
ffffffffc020749c:	01353023          	sd	s3,0(a0)
ffffffffc02074a0:	884e                	mv	a6,s3
ffffffffc02074a2:	d6aff06f          	j	ffffffffc0206a0c <stride_dequeue+0x184c>
ffffffffc02074a6:	0109b503          	ld	a0,16(s3)
ffffffffc02074aa:	0089bb03          	ld	s6,8(s3)
ffffffffc02074ae:	85f2                	mv	a1,t3
ffffffffc02074b0:	f442                	sd	a6,40(sp)
ffffffffc02074b2:	b2ffd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02074b6:	00a9b423          	sd	a0,8(s3)
ffffffffc02074ba:	0169b823          	sd	s6,16(s3)
ffffffffc02074be:	7822                	ld	a6,40(sp)
ffffffffc02074c0:	010c2b03          	lw	s6,16(s8)
ffffffffc02074c4:	e119                	bnez	a0,ffffffffc02074ca <stride_dequeue+0x230a>
ffffffffc02074c6:	e05fe06f          	j	ffffffffc02062ca <stride_dequeue+0x110a>
ffffffffc02074ca:	01353023          	sd	s3,0(a0)
ffffffffc02074ce:	dfdfe06f          	j	ffffffffc02062ca <stride_dequeue+0x110a>
ffffffffc02074d2:	0109b503          	ld	a0,16(s3)
ffffffffc02074d6:	0089bb03          	ld	s6,8(s3)
ffffffffc02074da:	859a                	mv	a1,t1
ffffffffc02074dc:	f442                	sd	a6,40(sp)
ffffffffc02074de:	b03fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02074e2:	00a9b423          	sd	a0,8(s3)
ffffffffc02074e6:	0169b823          	sd	s6,16(s3)
ffffffffc02074ea:	7822                	ld	a6,40(sp)
ffffffffc02074ec:	010c2b03          	lw	s6,16(s8)
ffffffffc02074f0:	64050163          	beqz	a0,ffffffffc0207b32 <stride_dequeue+0x2972>
ffffffffc02074f4:	01353023          	sd	s3,0(a0)
ffffffffc02074f8:	834e                	mv	t1,s3
ffffffffc02074fa:	d76ff06f          	j	ffffffffc0206a70 <stride_dequeue+0x18b0>
ffffffffc02074fe:	0109b503          	ld	a0,16(s3)
ffffffffc0207502:	0089bb03          	ld	s6,8(s3)
ffffffffc0207506:	85f2                	mv	a1,t3
ffffffffc0207508:	f446                	sd	a7,40(sp)
ffffffffc020750a:	ad7fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020750e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207512:	0169b823          	sd	s6,16(s3)
ffffffffc0207516:	78a2                	ld	a7,40(sp)
ffffffffc0207518:	010c2b03          	lw	s6,16(s8)
ffffffffc020751c:	e119                	bnez	a0,ffffffffc0207522 <stride_dequeue+0x2362>
ffffffffc020751e:	d0ffe06f          	j	ffffffffc020622c <stride_dequeue+0x106c>
ffffffffc0207522:	01353023          	sd	s3,0(a0)
ffffffffc0207526:	d07fe06f          	j	ffffffffc020622c <stride_dequeue+0x106c>
ffffffffc020752a:	0109b503          	ld	a0,16(s3)
ffffffffc020752e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207532:	859a                	mv	a1,t1
ffffffffc0207534:	aadfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207538:	00a9b423          	sd	a0,8(s3)
ffffffffc020753c:	0169b823          	sd	s6,16(s3)
ffffffffc0207540:	010c2b03          	lw	s6,16(s8)
ffffffffc0207544:	e119                	bnez	a0,ffffffffc020754a <stride_dequeue+0x238a>
ffffffffc0207546:	c49fe06f          	j	ffffffffc020618e <stride_dequeue+0xfce>
ffffffffc020754a:	01353023          	sd	s3,0(a0)
ffffffffc020754e:	c41fe06f          	j	ffffffffc020618e <stride_dequeue+0xfce>
ffffffffc0207552:	0109b503          	ld	a0,16(s3)
ffffffffc0207556:	0089bb03          	ld	s6,8(s3)
ffffffffc020755a:	859a                	mv	a1,t1
ffffffffc020755c:	ec32                	sd	a2,24(sp)
ffffffffc020755e:	a83fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207562:	00a9b423          	sd	a0,8(s3)
ffffffffc0207566:	0169b823          	sd	s6,16(s3)
ffffffffc020756a:	6662                	ld	a2,24(sp)
ffffffffc020756c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207570:	e119                	bnez	a0,ffffffffc0207576 <stride_dequeue+0x23b6>
ffffffffc0207572:	b4ffe06f          	j	ffffffffc02060c0 <stride_dequeue+0xf00>
ffffffffc0207576:	01353023          	sd	s3,0(a0)
ffffffffc020757a:	b47fe06f          	j	ffffffffc02060c0 <stride_dequeue+0xf00>
ffffffffc020757e:	0108b503          	ld	a0,16(a7)
ffffffffc0207582:	85f2                	mv	a1,t3
ffffffffc0207584:	0088bb03          	ld	s6,8(a7)
ffffffffc0207588:	f446                	sd	a7,40(sp)
ffffffffc020758a:	a57fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020758e:	78a2                	ld	a7,40(sp)
ffffffffc0207590:	0168b823          	sd	s6,16(a7)
ffffffffc0207594:	00a8b423          	sd	a0,8(a7)
ffffffffc0207598:	010c2b03          	lw	s6,16(s8)
ffffffffc020759c:	e119                	bnez	a0,ffffffffc02075a2 <stride_dequeue+0x23e2>
ffffffffc020759e:	f28fe06f          	j	ffffffffc0205cc6 <stride_dequeue+0xb06>
ffffffffc02075a2:	01153023          	sd	a7,0(a0)
ffffffffc02075a6:	f20fe06f          	j	ffffffffc0205cc6 <stride_dequeue+0xb06>
ffffffffc02075aa:	0109b503          	ld	a0,16(s3)
ffffffffc02075ae:	0089bb03          	ld	s6,8(s3)
ffffffffc02075b2:	85d2                	mv	a1,s4
ffffffffc02075b4:	f046                	sd	a7,32(sp)
ffffffffc02075b6:	a2bfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02075ba:	00a9b423          	sd	a0,8(s3)
ffffffffc02075be:	0169b823          	sd	s6,16(s3)
ffffffffc02075c2:	7882                	ld	a7,32(sp)
ffffffffc02075c4:	010c2b03          	lw	s6,16(s8)
ffffffffc02075c8:	e119                	bnez	a0,ffffffffc02075ce <stride_dequeue+0x240e>
ffffffffc02075ca:	fe1fe06f          	j	ffffffffc02065aa <stride_dequeue+0x13ea>
ffffffffc02075ce:	01353023          	sd	s3,0(a0)
ffffffffc02075d2:	fd9fe06f          	j	ffffffffc02065aa <stride_dequeue+0x13ea>
ffffffffc02075d6:	0109b503          	ld	a0,16(s3)
ffffffffc02075da:	0089bb03          	ld	s6,8(s3)
ffffffffc02075de:	85c2                	mv	a1,a6
ffffffffc02075e0:	a01fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02075e4:	00a9b423          	sd	a0,8(s3)
ffffffffc02075e8:	0169b823          	sd	s6,16(s3)
ffffffffc02075ec:	010c2b03          	lw	s6,16(s8)
ffffffffc02075f0:	ae050863          	beqz	a0,ffffffffc02068e0 <stride_dequeue+0x1720>
ffffffffc02075f4:	01353023          	sd	s3,0(a0)
ffffffffc02075f8:	ae8ff06f          	j	ffffffffc02068e0 <stride_dequeue+0x1720>
ffffffffc02075fc:	89d2                	mv	s3,s4
ffffffffc02075fe:	fadfe06f          	j	ffffffffc02065aa <stride_dequeue+0x13ea>
ffffffffc0207602:	89ee                	mv	s3,s11
ffffffffc0207604:	84aff06f          	j	ffffffffc020664e <stride_dequeue+0x148e>
ffffffffc0207608:	89c2                	mv	s3,a6
ffffffffc020760a:	992ff06f          	j	ffffffffc020679c <stride_dequeue+0x15dc>
ffffffffc020760e:	89c2                	mv	s3,a6
ffffffffc0207610:	a34ff06f          	j	ffffffffc0206844 <stride_dequeue+0x1684>
ffffffffc0207614:	89b2                	mv	s3,a2
ffffffffc0207616:	8e2ff06f          	j	ffffffffc02066f8 <stride_dequeue+0x1538>
ffffffffc020761a:	89c2                	mv	s3,a6
ffffffffc020761c:	ac4ff06f          	j	ffffffffc02068e0 <stride_dequeue+0x1720>
ffffffffc0207620:	01083503          	ld	a0,16(a6)
ffffffffc0207624:	85e6                	mv	a1,s9
ffffffffc0207626:	00883b03          	ld	s6,8(a6)
ffffffffc020762a:	9b7fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020762e:	7802                	ld	a6,32(sp)
ffffffffc0207630:	01683823          	sd	s6,16(a6)
ffffffffc0207634:	00a83423          	sd	a0,8(a6)
ffffffffc0207638:	010c2b03          	lw	s6,16(s8)
ffffffffc020763c:	50050163          	beqz	a0,ffffffffc0207b3e <stride_dequeue+0x297e>
ffffffffc0207640:	01053023          	sd	a6,0(a0)
ffffffffc0207644:	8cc2                	mv	s9,a6
ffffffffc0207646:	d62ff06f          	j	ffffffffc0206ba8 <stride_dequeue+0x19e8>
ffffffffc020764a:	01083503          	ld	a0,16(a6)
ffffffffc020764e:	85d2                	mv	a1,s4
ffffffffc0207650:	00883b03          	ld	s6,8(a6)
ffffffffc0207654:	98dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207658:	6862                	ld	a6,24(sp)
ffffffffc020765a:	7602                	ld	a2,32(sp)
ffffffffc020765c:	01683823          	sd	s6,16(a6)
ffffffffc0207660:	00a83423          	sd	a0,8(a6)
ffffffffc0207664:	010c2b03          	lw	s6,16(s8)
ffffffffc0207668:	4c050863          	beqz	a0,ffffffffc0207b38 <stride_dequeue+0x2978>
ffffffffc020766c:	01053023          	sd	a6,0(a0)
ffffffffc0207670:	8a42                	mv	s4,a6
ffffffffc0207672:	d94ff06f          	j	ffffffffc0206c06 <stride_dequeue+0x1a46>
ffffffffc0207676:	89f2                	mv	s3,t3
ffffffffc0207678:	bb5fe06f          	j	ffffffffc020622c <stride_dequeue+0x106c>
ffffffffc020767c:	88f2                	mv	a7,t3
ffffffffc020767e:	e48fe06f          	j	ffffffffc0205cc6 <stride_dequeue+0xb06>
ffffffffc0207682:	89f2                	mv	s3,t3
ffffffffc0207684:	ce3fe06f          	j	ffffffffc0206366 <stride_dequeue+0x11a6>
ffffffffc0207688:	89f2                	mv	s3,t3
ffffffffc020768a:	c41fe06f          	j	ffffffffc02062ca <stride_dequeue+0x110a>
ffffffffc020768e:	88f2                	mv	a7,t3
ffffffffc0207690:	fe2fe06f          	j	ffffffffc0205e72 <stride_dequeue+0xcb2>
ffffffffc0207694:	87ce                	mv	a5,s3
ffffffffc0207696:	ddffe06f          	j	ffffffffc0206474 <stride_dequeue+0x12b4>
ffffffffc020769a:	0108b503          	ld	a0,16(a7)
ffffffffc020769e:	85ce                	mv	a1,s3
ffffffffc02076a0:	0088bb03          	ld	s6,8(a7)
ffffffffc02076a4:	93dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02076a8:	7882                	ld	a7,32(sp)
ffffffffc02076aa:	0168b823          	sd	s6,16(a7)
ffffffffc02076ae:	00a8b423          	sd	a0,8(a7)
ffffffffc02076b2:	010c2b03          	lw	s6,16(s8)
ffffffffc02076b6:	42050a63          	beqz	a0,ffffffffc0207aea <stride_dequeue+0x292a>
ffffffffc02076ba:	01153023          	sd	a7,0(a0)
ffffffffc02076be:	89c6                	mv	s3,a7
ffffffffc02076c0:	d9cff06f          	j	ffffffffc0206c5c <stride_dequeue+0x1a9c>
ffffffffc02076c4:	8cf2                	mv	s9,t3
ffffffffc02076c6:	84efe06f          	j	ffffffffc0205714 <stride_dequeue+0x554>
ffffffffc02076ca:	8a72                	mv	s4,t3
ffffffffc02076cc:	a62fe06f          	j	ffffffffc020592e <stride_dequeue+0x76e>
ffffffffc02076d0:	88f2                	mv	a7,t3
ffffffffc02076d2:	ed2fe06f          	j	ffffffffc0205da4 <stride_dequeue+0xbe4>
ffffffffc02076d6:	89f2                	mv	s3,t3
ffffffffc02076d8:	d33fe06f          	j	ffffffffc020640a <stride_dequeue+0x124a>
ffffffffc02076dc:	0109b503          	ld	a0,16(s3)
ffffffffc02076e0:	0089bb03          	ld	s6,8(s3)
ffffffffc02076e4:	85c6                	mv	a1,a7
ffffffffc02076e6:	8fbfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02076ea:	00a9b423          	sd	a0,8(s3)
ffffffffc02076ee:	0169b823          	sd	s6,16(s3)
ffffffffc02076f2:	010c2b03          	lw	s6,16(s8)
ffffffffc02076f6:	e119                	bnez	a0,ffffffffc02076fc <stride_dequeue+0x253c>
ffffffffc02076f8:	dfdfe06f          	j	ffffffffc02064f4 <stride_dequeue+0x1334>
ffffffffc02076fc:	01353023          	sd	s3,0(a0)
ffffffffc0207700:	df5fe06f          	j	ffffffffc02064f4 <stride_dequeue+0x1334>
ffffffffc0207704:	01083503          	ld	a0,16(a6)
ffffffffc0207708:	85d2                	mv	a1,s4
ffffffffc020770a:	00883b03          	ld	s6,8(a6)
ffffffffc020770e:	8d3fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207712:	7802                	ld	a6,32(sp)
ffffffffc0207714:	01683823          	sd	s6,16(a6)
ffffffffc0207718:	00a83423          	sd	a0,8(a6)
ffffffffc020771c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207720:	3a050363          	beqz	a0,ffffffffc0207ac6 <stride_dequeue+0x2906>
ffffffffc0207724:	01053023          	sd	a6,0(a0)
ffffffffc0207728:	8a42                	mv	s4,a6
ffffffffc020772a:	c28ff06f          	j	ffffffffc0206b52 <stride_dequeue+0x1992>
ffffffffc020772e:	8672                	mv	a2,t3
ffffffffc0207730:	900fe06f          	j	ffffffffc0205830 <stride_dequeue+0x670>
ffffffffc0207734:	0108b503          	ld	a0,16(a7)
ffffffffc0207738:	85ce                	mv	a1,s3
ffffffffc020773a:	0088bb03          	ld	s6,8(a7)
ffffffffc020773e:	8a3fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207742:	7882                	ld	a7,32(sp)
ffffffffc0207744:	7622                	ld	a2,40(sp)
ffffffffc0207746:	7842                	ld	a6,48(sp)
ffffffffc0207748:	0168b823          	sd	s6,16(a7)
ffffffffc020774c:	00a8b423          	sd	a0,8(a7)
ffffffffc0207750:	010c2b03          	lw	s6,16(s8)
ffffffffc0207754:	3c050c63          	beqz	a0,ffffffffc0207b2c <stride_dequeue+0x296c>
ffffffffc0207758:	01153023          	sd	a7,0(a0)
ffffffffc020775c:	89c6                	mv	s3,a7
ffffffffc020775e:	dc0ff06f          	j	ffffffffc0206d1e <stride_dequeue+0x1b5e>
ffffffffc0207762:	0109b503          	ld	a0,16(s3)
ffffffffc0207766:	0089bb03          	ld	s6,8(s3)
ffffffffc020776a:	85f2                	mv	a1,t3
ffffffffc020776c:	f41a                	sd	t1,40(sp)
ffffffffc020776e:	873fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207772:	00a9b423          	sd	a0,8(s3)
ffffffffc0207776:	0169b823          	sd	s6,16(s3)
ffffffffc020777a:	7322                	ld	t1,40(sp)
ffffffffc020777c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207780:	e119                	bnez	a0,ffffffffc0207786 <stride_dequeue+0x25c6>
ffffffffc0207782:	9fdfe06f          	j	ffffffffc020617e <stride_dequeue+0xfbe>
ffffffffc0207786:	01353023          	sd	s3,0(a0)
ffffffffc020778a:	9f5fe06f          	j	ffffffffc020617e <stride_dequeue+0xfbe>
ffffffffc020778e:	01033503          	ld	a0,16(t1)
ffffffffc0207792:	85e6                	mv	a1,s9
ffffffffc0207794:	00833b03          	ld	s6,8(t1)
ffffffffc0207798:	849fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020779c:	7322                	ld	t1,40(sp)
ffffffffc020779e:	78c2                	ld	a7,48(sp)
ffffffffc02077a0:	01633823          	sd	s6,16(t1)
ffffffffc02077a4:	00a33423          	sd	a0,8(t1)
ffffffffc02077a8:	010c2b03          	lw	s6,16(s8)
ffffffffc02077ac:	34050e63          	beqz	a0,ffffffffc0207b08 <stride_dequeue+0x2948>
ffffffffc02077b0:	00653023          	sd	t1,0(a0)
ffffffffc02077b4:	8c9a                	mv	s9,t1
ffffffffc02077b6:	eeaff06f          	j	ffffffffc0206ea0 <stride_dequeue+0x1ce0>
ffffffffc02077ba:	01033503          	ld	a0,16(t1)
ffffffffc02077be:	85c2                	mv	a1,a6
ffffffffc02077c0:	00833b03          	ld	s6,8(t1)
ffffffffc02077c4:	81dfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02077c8:	7322                	ld	t1,40(sp)
ffffffffc02077ca:	01633823          	sd	s6,16(t1)
ffffffffc02077ce:	00a33423          	sd	a0,8(t1)
ffffffffc02077d2:	010c2b03          	lw	s6,16(s8)
ffffffffc02077d6:	32050c63          	beqz	a0,ffffffffc0207b0e <stride_dequeue+0x294e>
ffffffffc02077da:	00653023          	sd	t1,0(a0)
ffffffffc02077de:	881a                	mv	a6,t1
ffffffffc02077e0:	f24ff06f          	j	ffffffffc0206f04 <stride_dequeue+0x1d44>
ffffffffc02077e4:	0108b503          	ld	a0,16(a7)
ffffffffc02077e8:	85ce                	mv	a1,s3
ffffffffc02077ea:	0088bb03          	ld	s6,8(a7)
ffffffffc02077ee:	ff2fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02077f2:	78a2                	ld	a7,40(sp)
ffffffffc02077f4:	7842                	ld	a6,48(sp)
ffffffffc02077f6:	0168b823          	sd	s6,16(a7)
ffffffffc02077fa:	00a8b423          	sd	a0,8(a7)
ffffffffc02077fe:	010c2b03          	lw	s6,16(s8)
ffffffffc0207802:	30050963          	beqz	a0,ffffffffc0207b14 <stride_dequeue+0x2954>
ffffffffc0207806:	01153023          	sd	a7,0(a0)
ffffffffc020780a:	89c6                	mv	s3,a7
ffffffffc020780c:	caeff06f          	j	ffffffffc0206cba <stride_dequeue+0x1afa>
ffffffffc0207810:	01083503          	ld	a0,16(a6)
ffffffffc0207814:	85ce                	mv	a1,s3
ffffffffc0207816:	00883b03          	ld	s6,8(a6)
ffffffffc020781a:	fc6fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020781e:	7822                	ld	a6,40(sp)
ffffffffc0207820:	78c2                	ld	a7,48(sp)
ffffffffc0207822:	01683823          	sd	s6,16(a6)
ffffffffc0207826:	00a83423          	sd	a0,8(a6)
ffffffffc020782a:	010c2b03          	lw	s6,16(s8)
ffffffffc020782e:	30050b63          	beqz	a0,ffffffffc0207b44 <stride_dequeue+0x2984>
ffffffffc0207832:	01053023          	sd	a6,0(a0)
ffffffffc0207836:	89c2                	mv	s3,a6
ffffffffc0207838:	da6ff06f          	j	ffffffffc0206dde <stride_dequeue+0x1c1e>
ffffffffc020783c:	01083503          	ld	a0,16(a6)
ffffffffc0207840:	85ce                	mv	a1,s3
ffffffffc0207842:	00883b03          	ld	s6,8(a6)
ffffffffc0207846:	f9afd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020784a:	7802                	ld	a6,32(sp)
ffffffffc020784c:	7622                	ld	a2,40(sp)
ffffffffc020784e:	78c2                	ld	a7,48(sp)
ffffffffc0207850:	01683823          	sd	s6,16(a6)
ffffffffc0207854:	00a83423          	sd	a0,8(a6)
ffffffffc0207858:	010c2b03          	lw	s6,16(s8)
ffffffffc020785c:	2a050063          	beqz	a0,ffffffffc0207afc <stride_dequeue+0x293c>
ffffffffc0207860:	01053023          	sd	a6,0(a0)
ffffffffc0207864:	89c2                	mv	s3,a6
ffffffffc0207866:	ddcff06f          	j	ffffffffc0206e42 <stride_dequeue+0x1c82>
ffffffffc020786a:	0109b503          	ld	a0,16(s3)
ffffffffc020786e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207872:	85f2                	mv	a1,t3
ffffffffc0207874:	f41a                	sd	t1,40(sp)
ffffffffc0207876:	f6afd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020787a:	00a9b423          	sd	a0,8(s3)
ffffffffc020787e:	0169b823          	sd	s6,16(s3)
ffffffffc0207882:	7322                	ld	t1,40(sp)
ffffffffc0207884:	010c2b03          	lw	s6,16(s8)
ffffffffc0207888:	e119                	bnez	a0,ffffffffc020788e <stride_dequeue+0x26ce>
ffffffffc020788a:	f4afe06f          	j	ffffffffc0205fd4 <stride_dequeue+0xe14>
ffffffffc020788e:	01353023          	sd	s3,0(a0)
ffffffffc0207892:	f42fe06f          	j	ffffffffc0205fd4 <stride_dequeue+0xe14>
ffffffffc0207896:	0109b503          	ld	a0,16(s3)
ffffffffc020789a:	0089bb03          	ld	s6,8(s3)
ffffffffc020789e:	85f2                	mv	a1,t3
ffffffffc02078a0:	f446                	sd	a7,40(sp)
ffffffffc02078a2:	f3efd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02078a6:	00a9b423          	sd	a0,8(s3)
ffffffffc02078aa:	0169b823          	sd	s6,16(s3)
ffffffffc02078ae:	78a2                	ld	a7,40(sp)
ffffffffc02078b0:	010c2b03          	lw	s6,16(s8)
ffffffffc02078b4:	e119                	bnez	a0,ffffffffc02078ba <stride_dequeue+0x26fa>
ffffffffc02078b6:	ce5fe06f          	j	ffffffffc020659a <stride_dequeue+0x13da>
ffffffffc02078ba:	01353023          	sd	s3,0(a0)
ffffffffc02078be:	cddfe06f          	j	ffffffffc020659a <stride_dequeue+0x13da>
ffffffffc02078c2:	0109b503          	ld	a0,16(s3)
ffffffffc02078c6:	0089bb03          	ld	s6,8(s3)
ffffffffc02078ca:	85f2                	mv	a1,t3
ffffffffc02078cc:	f446                	sd	a7,40(sp)
ffffffffc02078ce:	f032                	sd	a2,32(sp)
ffffffffc02078d0:	f10fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02078d4:	00a9b423          	sd	a0,8(s3)
ffffffffc02078d8:	0169b823          	sd	s6,16(s3)
ffffffffc02078dc:	7602                	ld	a2,32(sp)
ffffffffc02078de:	78a2                	ld	a7,40(sp)
ffffffffc02078e0:	010c2b03          	lw	s6,16(s8)
ffffffffc02078e4:	e119                	bnez	a0,ffffffffc02078ea <stride_dequeue+0x272a>
ffffffffc02078e6:	e05fe06f          	j	ffffffffc02066ea <stride_dequeue+0x152a>
ffffffffc02078ea:	01353023          	sd	s3,0(a0)
ffffffffc02078ee:	dfdfe06f          	j	ffffffffc02066ea <stride_dequeue+0x152a>
ffffffffc02078f2:	010a3503          	ld	a0,16(s4)
ffffffffc02078f6:	008a3b03          	ld	s6,8(s4)
ffffffffc02078fa:	85f2                	mv	a1,t3
ffffffffc02078fc:	f41a                	sd	t1,40(sp)
ffffffffc02078fe:	ee2fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207902:	00aa3423          	sd	a0,8(s4)
ffffffffc0207906:	016a3823          	sd	s6,16(s4)
ffffffffc020790a:	7322                	ld	t1,40(sp)
ffffffffc020790c:	010c2b03          	lw	s6,16(s8)
ffffffffc0207910:	e119                	bnez	a0,ffffffffc0207916 <stride_dequeue+0x2756>
ffffffffc0207912:	ad6fe06f          	j	ffffffffc0205be8 <stride_dequeue+0xa28>
ffffffffc0207916:	01453023          	sd	s4,0(a0)
ffffffffc020791a:	acefe06f          	j	ffffffffc0205be8 <stride_dequeue+0xa28>
ffffffffc020791e:	0109b503          	ld	a0,16(s3)
ffffffffc0207922:	0089bb03          	ld	s6,8(s3)
ffffffffc0207926:	85f2                	mv	a1,t3
ffffffffc0207928:	f446                	sd	a7,40(sp)
ffffffffc020792a:	eb6fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc020792e:	00a9b423          	sd	a0,8(s3)
ffffffffc0207932:	0169b823          	sd	s6,16(s3)
ffffffffc0207936:	78a2                	ld	a7,40(sp)
ffffffffc0207938:	010c2b03          	lw	s6,16(s8)
ffffffffc020793c:	e119                	bnez	a0,ffffffffc0207942 <stride_dequeue+0x2782>
ffffffffc020793e:	d01fe06f          	j	ffffffffc020663e <stride_dequeue+0x147e>
ffffffffc0207942:	01353023          	sd	s3,0(a0)
ffffffffc0207946:	cf9fe06f          	j	ffffffffc020663e <stride_dequeue+0x147e>
ffffffffc020794a:	01033503          	ld	a0,16(t1)
ffffffffc020794e:	85c2                	mv	a1,a6
ffffffffc0207950:	00833b03          	ld	s6,8(t1)
ffffffffc0207954:	e8cfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207958:	7322                	ld	t1,40(sp)
ffffffffc020795a:	01633823          	sd	s6,16(t1)
ffffffffc020795e:	00a33423          	sd	a0,8(t1)
ffffffffc0207962:	010c2b03          	lw	s6,16(s8)
ffffffffc0207966:	1e050b63          	beqz	a0,ffffffffc0207b5c <stride_dequeue+0x299c>
ffffffffc020796a:	00653023          	sd	t1,0(a0)
ffffffffc020796e:	881a                	mv	a6,t1
ffffffffc0207970:	e50ff06f          	j	ffffffffc0206fc0 <stride_dequeue+0x1e00>
ffffffffc0207974:	0109b503          	ld	a0,16(s3)
ffffffffc0207978:	0089bb03          	ld	s6,8(s3)
ffffffffc020797c:	85f2                	mv	a1,t3
ffffffffc020797e:	f442                	sd	a6,40(sp)
ffffffffc0207980:	f032                	sd	a2,32(sp)
ffffffffc0207982:	e5efd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207986:	00a9b423          	sd	a0,8(s3)
ffffffffc020798a:	0169b823          	sd	s6,16(s3)
ffffffffc020798e:	7602                	ld	a2,32(sp)
ffffffffc0207990:	7822                	ld	a6,40(sp)
ffffffffc0207992:	010c2b03          	lw	s6,16(s8)
ffffffffc0207996:	e119                	bnez	a0,ffffffffc020799c <stride_dequeue+0x27dc>
ffffffffc0207998:	e9dfe06f          	j	ffffffffc0206834 <stride_dequeue+0x1674>
ffffffffc020799c:	01353023          	sd	s3,0(a0)
ffffffffc02079a0:	e95fe06f          	j	ffffffffc0206834 <stride_dequeue+0x1674>
ffffffffc02079a4:	0108b503          	ld	a0,16(a7)
ffffffffc02079a8:	85ce                	mv	a1,s3
ffffffffc02079aa:	0088bb03          	ld	s6,8(a7)
ffffffffc02079ae:	e32fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02079b2:	78a2                	ld	a7,40(sp)
ffffffffc02079b4:	7842                	ld	a6,48(sp)
ffffffffc02079b6:	0168b823          	sd	s6,16(a7)
ffffffffc02079ba:	00a8b423          	sd	a0,8(a7)
ffffffffc02079be:	010c2b03          	lw	s6,16(s8)
ffffffffc02079c2:	0e050f63          	beqz	a0,ffffffffc0207ac0 <stride_dequeue+0x2900>
ffffffffc02079c6:	01153023          	sd	a7,0(a0)
ffffffffc02079ca:	89c6                	mv	s3,a7
ffffffffc02079cc:	d96ff06f          	j	ffffffffc0206f62 <stride_dequeue+0x1da2>
ffffffffc02079d0:	01083503          	ld	a0,16(a6)
ffffffffc02079d4:	85ce                	mv	a1,s3
ffffffffc02079d6:	00883b03          	ld	s6,8(a6)
ffffffffc02079da:	e06fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc02079de:	7822                	ld	a6,40(sp)
ffffffffc02079e0:	78c2                	ld	a7,48(sp)
ffffffffc02079e2:	01683823          	sd	s6,16(a6)
ffffffffc02079e6:	00a83423          	sd	a0,8(a6)
ffffffffc02079ea:	010c2b03          	lw	s6,16(s8)
ffffffffc02079ee:	0e050b63          	beqz	a0,ffffffffc0207ae4 <stride_dequeue+0x2924>
ffffffffc02079f2:	01053023          	sd	a6,0(a0)
ffffffffc02079f6:	89c2                	mv	s3,a6
ffffffffc02079f8:	b88ff06f          	j	ffffffffc0206d80 <stride_dequeue+0x1bc0>
ffffffffc02079fc:	0109b503          	ld	a0,16(s3)
ffffffffc0207a00:	0089bb03          	ld	s6,8(s3)
ffffffffc0207a04:	85f2                	mv	a1,t3
ffffffffc0207a06:	f442                	sd	a6,40(sp)
ffffffffc0207a08:	dd8fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207a0c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207a10:	0169b823          	sd	s6,16(s3)
ffffffffc0207a14:	7822                	ld	a6,40(sp)
ffffffffc0207a16:	010c2b03          	lw	s6,16(s8)
ffffffffc0207a1a:	e119                	bnez	a0,ffffffffc0207a20 <stride_dequeue+0x2860>
ffffffffc0207a1c:	d71fe06f          	j	ffffffffc020678c <stride_dequeue+0x15cc>
ffffffffc0207a20:	01353023          	sd	s3,0(a0)
ffffffffc0207a24:	d69fe06f          	j	ffffffffc020678c <stride_dequeue+0x15cc>
ffffffffc0207a28:	0109b503          	ld	a0,16(s3)
ffffffffc0207a2c:	0089bb03          	ld	s6,8(s3)
ffffffffc0207a30:	85f2                	mv	a1,t3
ffffffffc0207a32:	f442                	sd	a6,40(sp)
ffffffffc0207a34:	dacfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207a38:	00a9b423          	sd	a0,8(s3)
ffffffffc0207a3c:	0169b823          	sd	s6,16(s3)
ffffffffc0207a40:	7822                	ld	a6,40(sp)
ffffffffc0207a42:	010c2b03          	lw	s6,16(s8)
ffffffffc0207a46:	e119                	bnez	a0,ffffffffc0207a4c <stride_dequeue+0x288c>
ffffffffc0207a48:	e89fe06f          	j	ffffffffc02068d0 <stride_dequeue+0x1710>
ffffffffc0207a4c:	01353023          	sd	s3,0(a0)
ffffffffc0207a50:	e81fe06f          	j	ffffffffc02068d0 <stride_dequeue+0x1710>
ffffffffc0207a54:	89c6                	mv	s3,a7
ffffffffc0207a56:	a9ffe06f          	j	ffffffffc02064f4 <stride_dequeue+0x1334>
ffffffffc0207a5a:	0109b503          	ld	a0,16(s3)
ffffffffc0207a5e:	0089bb03          	ld	s6,8(s3)
ffffffffc0207a62:	85f2                	mv	a1,t3
ffffffffc0207a64:	f41a                	sd	t1,40(sp)
ffffffffc0207a66:	f032                	sd	a2,32(sp)
ffffffffc0207a68:	d78fd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207a6c:	00a9b423          	sd	a0,8(s3)
ffffffffc0207a70:	0169b823          	sd	s6,16(s3)
ffffffffc0207a74:	7602                	ld	a2,32(sp)
ffffffffc0207a76:	7322                	ld	t1,40(sp)
ffffffffc0207a78:	010c2b03          	lw	s6,16(s8)
ffffffffc0207a7c:	e119                	bnez	a0,ffffffffc0207a82 <stride_dequeue+0x28c2>
ffffffffc0207a7e:	e32fe06f          	j	ffffffffc02060b0 <stride_dequeue+0xef0>
ffffffffc0207a82:	01353023          	sd	s3,0(a0)
ffffffffc0207a86:	e2afe06f          	j	ffffffffc02060b0 <stride_dequeue+0xef0>
ffffffffc0207a8a:	01033503          	ld	a0,16(t1)
ffffffffc0207a8e:	85c2                	mv	a1,a6
ffffffffc0207a90:	00833b03          	ld	s6,8(t1)
ffffffffc0207a94:	d4cfd0ef          	jal	ra,ffffffffc0204fe0 <skew_heap_merge.constprop.0>
ffffffffc0207a98:	7302                	ld	t1,32(sp)
ffffffffc0207a9a:	7622                	ld	a2,40(sp)
ffffffffc0207a9c:	01633823          	sd	s6,16(t1)
ffffffffc0207aa0:	00a33423          	sd	a0,8(t1)
ffffffffc0207aa4:	010c2b03          	lw	s6,16(s8)
ffffffffc0207aa8:	c115                	beqz	a0,ffffffffc0207acc <stride_dequeue+0x290c>
ffffffffc0207aaa:	00653023          	sd	t1,0(a0)
ffffffffc0207aae:	881a                	mv	a6,t1
ffffffffc0207ab0:	d76ff06f          	j	ffffffffc0207026 <stride_dequeue+0x1e66>
ffffffffc0207ab4:	89f2                	mv	s3,t3
ffffffffc0207ab6:	e1bfe06f          	j	ffffffffc02068d0 <stride_dequeue+0x1710>
ffffffffc0207aba:	834e                	mv	t1,s3
ffffffffc0207abc:	ef1fe06f          	j	ffffffffc02069ac <stride_dequeue+0x17ec>
ffffffffc0207ac0:	89c6                	mv	s3,a7
ffffffffc0207ac2:	ca0ff06f          	j	ffffffffc0206f62 <stride_dequeue+0x1da2>
ffffffffc0207ac6:	8a42                	mv	s4,a6
ffffffffc0207ac8:	88aff06f          	j	ffffffffc0206b52 <stride_dequeue+0x1992>
ffffffffc0207acc:	881a                	mv	a6,t1
ffffffffc0207ace:	d58ff06f          	j	ffffffffc0207026 <stride_dequeue+0x1e66>
ffffffffc0207ad2:	89f2                	mv	s3,t3
ffffffffc0207ad4:	ddcfe06f          	j	ffffffffc02060b0 <stride_dequeue+0xef0>
ffffffffc0207ad8:	834e                	mv	t1,s3
ffffffffc0207ada:	e69fe06f          	j	ffffffffc0206942 <stride_dequeue+0x1782>
ffffffffc0207ade:	89f2                	mv	s3,t3
ffffffffc0207ae0:	cadfe06f          	j	ffffffffc020678c <stride_dequeue+0x15cc>
ffffffffc0207ae4:	89c2                	mv	s3,a6
ffffffffc0207ae6:	a9aff06f          	j	ffffffffc0206d80 <stride_dequeue+0x1bc0>
ffffffffc0207aea:	89c6                	mv	s3,a7
ffffffffc0207aec:	970ff06f          	j	ffffffffc0206c5c <stride_dequeue+0x1a9c>
ffffffffc0207af0:	834e                	mv	t1,s3
ffffffffc0207af2:	fdffe06f          	j	ffffffffc0206ad0 <stride_dequeue+0x1910>
ffffffffc0207af6:	89f2                	mv	s3,t3
ffffffffc0207af8:	cdcfe06f          	j	ffffffffc0205fd4 <stride_dequeue+0xe14>
ffffffffc0207afc:	89c2                	mv	s3,a6
ffffffffc0207afe:	b44ff06f          	j	ffffffffc0206e42 <stride_dequeue+0x1c82>
ffffffffc0207b02:	884e                	mv	a6,s3
ffffffffc0207b04:	f09fe06f          	j	ffffffffc0206a0c <stride_dequeue+0x184c>
ffffffffc0207b08:	8c9a                	mv	s9,t1
ffffffffc0207b0a:	b96ff06f          	j	ffffffffc0206ea0 <stride_dequeue+0x1ce0>
ffffffffc0207b0e:	881a                	mv	a6,t1
ffffffffc0207b10:	bf4ff06f          	j	ffffffffc0206f04 <stride_dequeue+0x1d44>
ffffffffc0207b14:	89c6                	mv	s3,a7
ffffffffc0207b16:	9a4ff06f          	j	ffffffffc0206cba <stride_dequeue+0x1afa>
ffffffffc0207b1a:	89f2                	mv	s3,t3
ffffffffc0207b1c:	a7ffe06f          	j	ffffffffc020659a <stride_dequeue+0x13da>
ffffffffc0207b20:	89f2                	mv	s3,t3
ffffffffc0207b22:	bc9fe06f          	j	ffffffffc02066ea <stride_dequeue+0x152a>
ffffffffc0207b26:	89f2                	mv	s3,t3
ffffffffc0207b28:	e56fe06f          	j	ffffffffc020617e <stride_dequeue+0xfbe>
ffffffffc0207b2c:	89c6                	mv	s3,a7
ffffffffc0207b2e:	9f0ff06f          	j	ffffffffc0206d1e <stride_dequeue+0x1b5e>
ffffffffc0207b32:	834e                	mv	t1,s3
ffffffffc0207b34:	f3dfe06f          	j	ffffffffc0206a70 <stride_dequeue+0x18b0>
ffffffffc0207b38:	8a42                	mv	s4,a6
ffffffffc0207b3a:	8ccff06f          	j	ffffffffc0206c06 <stride_dequeue+0x1a46>
ffffffffc0207b3e:	8cc2                	mv	s9,a6
ffffffffc0207b40:	868ff06f          	j	ffffffffc0206ba8 <stride_dequeue+0x19e8>
ffffffffc0207b44:	89c2                	mv	s3,a6
ffffffffc0207b46:	a98ff06f          	j	ffffffffc0206dde <stride_dequeue+0x1c1e>
ffffffffc0207b4a:	8a72                	mv	s4,t3
ffffffffc0207b4c:	89cfe06f          	j	ffffffffc0205be8 <stride_dequeue+0xa28>
ffffffffc0207b50:	89f2                	mv	s3,t3
ffffffffc0207b52:	aedfe06f          	j	ffffffffc020663e <stride_dequeue+0x147e>
ffffffffc0207b56:	89f2                	mv	s3,t3
ffffffffc0207b58:	cddfe06f          	j	ffffffffc0206834 <stride_dequeue+0x1674>
ffffffffc0207b5c:	881a                	mv	a6,t1
ffffffffc0207b5e:	c62ff06f          	j	ffffffffc0206fc0 <stride_dequeue+0x1e00>

ffffffffc0207b62 <sys_getpid>:
ffffffffc0207b62:	00012797          	auipc	a5,0x12
ffffffffc0207b66:	99e7b783          	ld	a5,-1634(a5) # ffffffffc0219500 <current>
ffffffffc0207b6a:	43c8                	lw	a0,4(a5)
ffffffffc0207b6c:	8082                	ret

ffffffffc0207b6e <sys_pgdir>:
ffffffffc0207b6e:	4501                	li	a0,0
ffffffffc0207b70:	8082                	ret

ffffffffc0207b72 <sys_gettime>:
ffffffffc0207b72:	00012797          	auipc	a5,0x12
ffffffffc0207b76:	9be7b783          	ld	a5,-1602(a5) # ffffffffc0219530 <ticks>
ffffffffc0207b7a:	0027951b          	slliw	a0,a5,0x2
ffffffffc0207b7e:	9d3d                	addw	a0,a0,a5
ffffffffc0207b80:	0015151b          	slliw	a0,a0,0x1
ffffffffc0207b84:	8082                	ret

ffffffffc0207b86 <sys_lab6_set_priority>:
ffffffffc0207b86:	4108                	lw	a0,0(a0)
ffffffffc0207b88:	1141                	addi	sp,sp,-16
ffffffffc0207b8a:	e406                	sd	ra,8(sp)
ffffffffc0207b8c:	ee5fc0ef          	jal	ra,ffffffffc0204a70 <lab6_set_priority>
ffffffffc0207b90:	60a2                	ld	ra,8(sp)
ffffffffc0207b92:	4501                	li	a0,0
ffffffffc0207b94:	0141                	addi	sp,sp,16
ffffffffc0207b96:	8082                	ret

ffffffffc0207b98 <sys_putc>:
ffffffffc0207b98:	4108                	lw	a0,0(a0)
ffffffffc0207b9a:	1141                	addi	sp,sp,-16
ffffffffc0207b9c:	e406                	sd	ra,8(sp)
ffffffffc0207b9e:	d64f80ef          	jal	ra,ffffffffc0200102 <cputchar>
ffffffffc0207ba2:	60a2                	ld	ra,8(sp)
ffffffffc0207ba4:	4501                	li	a0,0
ffffffffc0207ba6:	0141                	addi	sp,sp,16
ffffffffc0207ba8:	8082                	ret

ffffffffc0207baa <sys_kill>:
ffffffffc0207baa:	4108                	lw	a0,0(a0)
ffffffffc0207bac:	d2dfc06f          	j	ffffffffc02048d8 <do_kill>

ffffffffc0207bb0 <sys_sleep>:
ffffffffc0207bb0:	4108                	lw	a0,0(a0)
ffffffffc0207bb2:	ef9fc06f          	j	ffffffffc0204aaa <do_sleep>

ffffffffc0207bb6 <sys_yield>:
ffffffffc0207bb6:	cd5fc06f          	j	ffffffffc020488a <do_yield>

ffffffffc0207bba <sys_exec>:
ffffffffc0207bba:	6d14                	ld	a3,24(a0)
ffffffffc0207bbc:	6910                	ld	a2,16(a0)
ffffffffc0207bbe:	650c                	ld	a1,8(a0)
ffffffffc0207bc0:	6108                	ld	a0,0(a0)
ffffffffc0207bc2:	f3efc06f          	j	ffffffffc0204300 <do_execve>

ffffffffc0207bc6 <sys_wait>:
ffffffffc0207bc6:	650c                	ld	a1,8(a0)
ffffffffc0207bc8:	4108                	lw	a0,0(a0)
ffffffffc0207bca:	cd1fc06f          	j	ffffffffc020489a <do_wait>

ffffffffc0207bce <sys_fork>:
ffffffffc0207bce:	00012797          	auipc	a5,0x12
ffffffffc0207bd2:	9327b783          	ld	a5,-1742(a5) # ffffffffc0219500 <current>
ffffffffc0207bd6:	73d0                	ld	a2,160(a5)
ffffffffc0207bd8:	4501                	li	a0,0
ffffffffc0207bda:	6a0c                	ld	a1,16(a2)
ffffffffc0207bdc:	ebbfb06f          	j	ffffffffc0203a96 <do_fork>

ffffffffc0207be0 <sys_exit>:
ffffffffc0207be0:	4108                	lw	a0,0(a0)
ffffffffc0207be2:	ad6fc06f          	j	ffffffffc0203eb8 <do_exit>

ffffffffc0207be6 <syscall>:
ffffffffc0207be6:	715d                	addi	sp,sp,-80
ffffffffc0207be8:	fc26                	sd	s1,56(sp)
ffffffffc0207bea:	00012497          	auipc	s1,0x12
ffffffffc0207bee:	91648493          	addi	s1,s1,-1770 # ffffffffc0219500 <current>
ffffffffc0207bf2:	6098                	ld	a4,0(s1)
ffffffffc0207bf4:	e0a2                	sd	s0,64(sp)
ffffffffc0207bf6:	f84a                	sd	s2,48(sp)
ffffffffc0207bf8:	7340                	ld	s0,160(a4)
ffffffffc0207bfa:	e486                	sd	ra,72(sp)
ffffffffc0207bfc:	0ff00793          	li	a5,255
ffffffffc0207c00:	05042903          	lw	s2,80(s0)
ffffffffc0207c04:	0327ee63          	bltu	a5,s2,ffffffffc0207c40 <syscall+0x5a>
ffffffffc0207c08:	00391713          	slli	a4,s2,0x3
ffffffffc0207c0c:	00002797          	auipc	a5,0x2
ffffffffc0207c10:	1dc78793          	addi	a5,a5,476 # ffffffffc0209de8 <syscalls>
ffffffffc0207c14:	97ba                	add	a5,a5,a4
ffffffffc0207c16:	639c                	ld	a5,0(a5)
ffffffffc0207c18:	c785                	beqz	a5,ffffffffc0207c40 <syscall+0x5a>
ffffffffc0207c1a:	6c28                	ld	a0,88(s0)
ffffffffc0207c1c:	702c                	ld	a1,96(s0)
ffffffffc0207c1e:	7430                	ld	a2,104(s0)
ffffffffc0207c20:	7834                	ld	a3,112(s0)
ffffffffc0207c22:	7c38                	ld	a4,120(s0)
ffffffffc0207c24:	e42a                	sd	a0,8(sp)
ffffffffc0207c26:	e82e                	sd	a1,16(sp)
ffffffffc0207c28:	ec32                	sd	a2,24(sp)
ffffffffc0207c2a:	f036                	sd	a3,32(sp)
ffffffffc0207c2c:	f43a                	sd	a4,40(sp)
ffffffffc0207c2e:	0028                	addi	a0,sp,8
ffffffffc0207c30:	9782                	jalr	a5
ffffffffc0207c32:	60a6                	ld	ra,72(sp)
ffffffffc0207c34:	e828                	sd	a0,80(s0)
ffffffffc0207c36:	6406                	ld	s0,64(sp)
ffffffffc0207c38:	74e2                	ld	s1,56(sp)
ffffffffc0207c3a:	7942                	ld	s2,48(sp)
ffffffffc0207c3c:	6161                	addi	sp,sp,80
ffffffffc0207c3e:	8082                	ret
ffffffffc0207c40:	8522                	mv	a0,s0
ffffffffc0207c42:	be5f80ef          	jal	ra,ffffffffc0200826 <print_trapframe>
ffffffffc0207c46:	609c                	ld	a5,0(s1)
ffffffffc0207c48:	86ca                	mv	a3,s2
ffffffffc0207c4a:	00002617          	auipc	a2,0x2
ffffffffc0207c4e:	15660613          	addi	a2,a2,342 # ffffffffc0209da0 <default_pmm_manager+0x8c8>
ffffffffc0207c52:	43d8                	lw	a4,4(a5)
ffffffffc0207c54:	07300593          	li	a1,115
ffffffffc0207c58:	0b478793          	addi	a5,a5,180
ffffffffc0207c5c:	00002517          	auipc	a0,0x2
ffffffffc0207c60:	17450513          	addi	a0,a0,372 # ffffffffc0209dd0 <default_pmm_manager+0x8f8>
ffffffffc0207c64:	da4f80ef          	jal	ra,ffffffffc0200208 <__panic>

ffffffffc0207c68 <strnlen>:
ffffffffc0207c68:	872a                	mv	a4,a0
ffffffffc0207c6a:	4501                	li	a0,0
ffffffffc0207c6c:	e589                	bnez	a1,ffffffffc0207c76 <strnlen+0xe>
ffffffffc0207c6e:	a811                	j	ffffffffc0207c82 <strnlen+0x1a>
ffffffffc0207c70:	0505                	addi	a0,a0,1
ffffffffc0207c72:	00a58763          	beq	a1,a0,ffffffffc0207c80 <strnlen+0x18>
ffffffffc0207c76:	00a707b3          	add	a5,a4,a0
ffffffffc0207c7a:	0007c783          	lbu	a5,0(a5)
ffffffffc0207c7e:	fbed                	bnez	a5,ffffffffc0207c70 <strnlen+0x8>
ffffffffc0207c80:	8082                	ret
ffffffffc0207c82:	8082                	ret

ffffffffc0207c84 <strcmp>:
ffffffffc0207c84:	00054783          	lbu	a5,0(a0)
ffffffffc0207c88:	0005c703          	lbu	a4,0(a1)
ffffffffc0207c8c:	cb89                	beqz	a5,ffffffffc0207c9e <strcmp+0x1a>
ffffffffc0207c8e:	0505                	addi	a0,a0,1
ffffffffc0207c90:	0585                	addi	a1,a1,1
ffffffffc0207c92:	fee789e3          	beq	a5,a4,ffffffffc0207c84 <strcmp>
ffffffffc0207c96:	0007851b          	sext.w	a0,a5
ffffffffc0207c9a:	9d19                	subw	a0,a0,a4
ffffffffc0207c9c:	8082                	ret
ffffffffc0207c9e:	4501                	li	a0,0
ffffffffc0207ca0:	bfed                	j	ffffffffc0207c9a <strcmp+0x16>

ffffffffc0207ca2 <strchr>:
ffffffffc0207ca2:	00054783          	lbu	a5,0(a0)
ffffffffc0207ca6:	c799                	beqz	a5,ffffffffc0207cb4 <strchr+0x12>
ffffffffc0207ca8:	00f58763          	beq	a1,a5,ffffffffc0207cb6 <strchr+0x14>
ffffffffc0207cac:	00154783          	lbu	a5,1(a0)
ffffffffc0207cb0:	0505                	addi	a0,a0,1
ffffffffc0207cb2:	fbfd                	bnez	a5,ffffffffc0207ca8 <strchr+0x6>
ffffffffc0207cb4:	4501                	li	a0,0
ffffffffc0207cb6:	8082                	ret

ffffffffc0207cb8 <memset>:
ffffffffc0207cb8:	ca01                	beqz	a2,ffffffffc0207cc8 <memset+0x10>
ffffffffc0207cba:	962a                	add	a2,a2,a0
ffffffffc0207cbc:	87aa                	mv	a5,a0
ffffffffc0207cbe:	0785                	addi	a5,a5,1
ffffffffc0207cc0:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0207cc4:	fec79de3          	bne	a5,a2,ffffffffc0207cbe <memset+0x6>
ffffffffc0207cc8:	8082                	ret

ffffffffc0207cca <memcpy>:
ffffffffc0207cca:	ca19                	beqz	a2,ffffffffc0207ce0 <memcpy+0x16>
ffffffffc0207ccc:	962e                	add	a2,a2,a1
ffffffffc0207cce:	87aa                	mv	a5,a0
ffffffffc0207cd0:	0005c703          	lbu	a4,0(a1)
ffffffffc0207cd4:	0585                	addi	a1,a1,1
ffffffffc0207cd6:	0785                	addi	a5,a5,1
ffffffffc0207cd8:	fee78fa3          	sb	a4,-1(a5)
ffffffffc0207cdc:	fec59ae3          	bne	a1,a2,ffffffffc0207cd0 <memcpy+0x6>
ffffffffc0207ce0:	8082                	ret

ffffffffc0207ce2 <printnum>:
ffffffffc0207ce2:	02069813          	slli	a6,a3,0x20
ffffffffc0207ce6:	7179                	addi	sp,sp,-48
ffffffffc0207ce8:	02085813          	srli	a6,a6,0x20
ffffffffc0207cec:	e052                	sd	s4,0(sp)
ffffffffc0207cee:	03067a33          	remu	s4,a2,a6
ffffffffc0207cf2:	f022                	sd	s0,32(sp)
ffffffffc0207cf4:	ec26                	sd	s1,24(sp)
ffffffffc0207cf6:	e84a                	sd	s2,16(sp)
ffffffffc0207cf8:	f406                	sd	ra,40(sp)
ffffffffc0207cfa:	e44e                	sd	s3,8(sp)
ffffffffc0207cfc:	84aa                	mv	s1,a0
ffffffffc0207cfe:	892e                	mv	s2,a1
ffffffffc0207d00:	fff7041b          	addiw	s0,a4,-1
ffffffffc0207d04:	2a01                	sext.w	s4,s4
ffffffffc0207d06:	03067e63          	bgeu	a2,a6,ffffffffc0207d42 <printnum+0x60>
ffffffffc0207d0a:	89be                	mv	s3,a5
ffffffffc0207d0c:	00805763          	blez	s0,ffffffffc0207d1a <printnum+0x38>
ffffffffc0207d10:	347d                	addiw	s0,s0,-1
ffffffffc0207d12:	85ca                	mv	a1,s2
ffffffffc0207d14:	854e                	mv	a0,s3
ffffffffc0207d16:	9482                	jalr	s1
ffffffffc0207d18:	fc65                	bnez	s0,ffffffffc0207d10 <printnum+0x2e>
ffffffffc0207d1a:	1a02                	slli	s4,s4,0x20
ffffffffc0207d1c:	020a5a13          	srli	s4,s4,0x20
ffffffffc0207d20:	00003797          	auipc	a5,0x3
ffffffffc0207d24:	8c878793          	addi	a5,a5,-1848 # ffffffffc020a5e8 <syscalls+0x800>
ffffffffc0207d28:	7402                	ld	s0,32(sp)
ffffffffc0207d2a:	9a3e                	add	s4,s4,a5
ffffffffc0207d2c:	000a4503          	lbu	a0,0(s4)
ffffffffc0207d30:	70a2                	ld	ra,40(sp)
ffffffffc0207d32:	69a2                	ld	s3,8(sp)
ffffffffc0207d34:	6a02                	ld	s4,0(sp)
ffffffffc0207d36:	85ca                	mv	a1,s2
ffffffffc0207d38:	8326                	mv	t1,s1
ffffffffc0207d3a:	6942                	ld	s2,16(sp)
ffffffffc0207d3c:	64e2                	ld	s1,24(sp)
ffffffffc0207d3e:	6145                	addi	sp,sp,48
ffffffffc0207d40:	8302                	jr	t1
ffffffffc0207d42:	03065633          	divu	a2,a2,a6
ffffffffc0207d46:	8722                	mv	a4,s0
ffffffffc0207d48:	f9bff0ef          	jal	ra,ffffffffc0207ce2 <printnum>
ffffffffc0207d4c:	b7f9                	j	ffffffffc0207d1a <printnum+0x38>

ffffffffc0207d4e <vprintfmt>:
ffffffffc0207d4e:	7119                	addi	sp,sp,-128
ffffffffc0207d50:	f4a6                	sd	s1,104(sp)
ffffffffc0207d52:	f0ca                	sd	s2,96(sp)
ffffffffc0207d54:	ecce                	sd	s3,88(sp)
ffffffffc0207d56:	e8d2                	sd	s4,80(sp)
ffffffffc0207d58:	e4d6                	sd	s5,72(sp)
ffffffffc0207d5a:	e0da                	sd	s6,64(sp)
ffffffffc0207d5c:	fc5e                	sd	s7,56(sp)
ffffffffc0207d5e:	f06a                	sd	s10,32(sp)
ffffffffc0207d60:	fc86                	sd	ra,120(sp)
ffffffffc0207d62:	f8a2                	sd	s0,112(sp)
ffffffffc0207d64:	f862                	sd	s8,48(sp)
ffffffffc0207d66:	f466                	sd	s9,40(sp)
ffffffffc0207d68:	ec6e                	sd	s11,24(sp)
ffffffffc0207d6a:	892a                	mv	s2,a0
ffffffffc0207d6c:	84ae                	mv	s1,a1
ffffffffc0207d6e:	8d32                	mv	s10,a2
ffffffffc0207d70:	8a36                	mv	s4,a3
ffffffffc0207d72:	02500993          	li	s3,37
ffffffffc0207d76:	5b7d                	li	s6,-1
ffffffffc0207d78:	00003a97          	auipc	s5,0x3
ffffffffc0207d7c:	89ca8a93          	addi	s5,s5,-1892 # ffffffffc020a614 <syscalls+0x82c>
ffffffffc0207d80:	00003b97          	auipc	s7,0x3
ffffffffc0207d84:	ab0b8b93          	addi	s7,s7,-1360 # ffffffffc020a830 <error_string>
ffffffffc0207d88:	000d4503          	lbu	a0,0(s10)
ffffffffc0207d8c:	001d0413          	addi	s0,s10,1
ffffffffc0207d90:	01350a63          	beq	a0,s3,ffffffffc0207da4 <vprintfmt+0x56>
ffffffffc0207d94:	c121                	beqz	a0,ffffffffc0207dd4 <vprintfmt+0x86>
ffffffffc0207d96:	85a6                	mv	a1,s1
ffffffffc0207d98:	0405                	addi	s0,s0,1
ffffffffc0207d9a:	9902                	jalr	s2
ffffffffc0207d9c:	fff44503          	lbu	a0,-1(s0)
ffffffffc0207da0:	ff351ae3          	bne	a0,s3,ffffffffc0207d94 <vprintfmt+0x46>
ffffffffc0207da4:	00044603          	lbu	a2,0(s0)
ffffffffc0207da8:	02000793          	li	a5,32
ffffffffc0207dac:	4c81                	li	s9,0
ffffffffc0207dae:	4881                	li	a7,0
ffffffffc0207db0:	5c7d                	li	s8,-1
ffffffffc0207db2:	5dfd                	li	s11,-1
ffffffffc0207db4:	05500513          	li	a0,85
ffffffffc0207db8:	4825                	li	a6,9
ffffffffc0207dba:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207dbe:	0ff5f593          	andi	a1,a1,255
ffffffffc0207dc2:	00140d13          	addi	s10,s0,1
ffffffffc0207dc6:	04b56263          	bltu	a0,a1,ffffffffc0207e0a <vprintfmt+0xbc>
ffffffffc0207dca:	058a                	slli	a1,a1,0x2
ffffffffc0207dcc:	95d6                	add	a1,a1,s5
ffffffffc0207dce:	4194                	lw	a3,0(a1)
ffffffffc0207dd0:	96d6                	add	a3,a3,s5
ffffffffc0207dd2:	8682                	jr	a3
ffffffffc0207dd4:	70e6                	ld	ra,120(sp)
ffffffffc0207dd6:	7446                	ld	s0,112(sp)
ffffffffc0207dd8:	74a6                	ld	s1,104(sp)
ffffffffc0207dda:	7906                	ld	s2,96(sp)
ffffffffc0207ddc:	69e6                	ld	s3,88(sp)
ffffffffc0207dde:	6a46                	ld	s4,80(sp)
ffffffffc0207de0:	6aa6                	ld	s5,72(sp)
ffffffffc0207de2:	6b06                	ld	s6,64(sp)
ffffffffc0207de4:	7be2                	ld	s7,56(sp)
ffffffffc0207de6:	7c42                	ld	s8,48(sp)
ffffffffc0207de8:	7ca2                	ld	s9,40(sp)
ffffffffc0207dea:	7d02                	ld	s10,32(sp)
ffffffffc0207dec:	6de2                	ld	s11,24(sp)
ffffffffc0207dee:	6109                	addi	sp,sp,128
ffffffffc0207df0:	8082                	ret
ffffffffc0207df2:	87b2                	mv	a5,a2
ffffffffc0207df4:	00144603          	lbu	a2,1(s0)
ffffffffc0207df8:	846a                	mv	s0,s10
ffffffffc0207dfa:	00140d13          	addi	s10,s0,1
ffffffffc0207dfe:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0207e02:	0ff5f593          	andi	a1,a1,255
ffffffffc0207e06:	fcb572e3          	bgeu	a0,a1,ffffffffc0207dca <vprintfmt+0x7c>
ffffffffc0207e0a:	85a6                	mv	a1,s1
ffffffffc0207e0c:	02500513          	li	a0,37
ffffffffc0207e10:	9902                	jalr	s2
ffffffffc0207e12:	fff44783          	lbu	a5,-1(s0)
ffffffffc0207e16:	8d22                	mv	s10,s0
ffffffffc0207e18:	f73788e3          	beq	a5,s3,ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207e1c:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0207e20:	1d7d                	addi	s10,s10,-1
ffffffffc0207e22:	ff379de3          	bne	a5,s3,ffffffffc0207e1c <vprintfmt+0xce>
ffffffffc0207e26:	b78d                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207e28:	fd060c1b          	addiw	s8,a2,-48
ffffffffc0207e2c:	00144603          	lbu	a2,1(s0)
ffffffffc0207e30:	846a                	mv	s0,s10
ffffffffc0207e32:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207e36:	0006059b          	sext.w	a1,a2
ffffffffc0207e3a:	02d86463          	bltu	a6,a3,ffffffffc0207e62 <vprintfmt+0x114>
ffffffffc0207e3e:	00144603          	lbu	a2,1(s0)
ffffffffc0207e42:	002c169b          	slliw	a3,s8,0x2
ffffffffc0207e46:	0186873b          	addw	a4,a3,s8
ffffffffc0207e4a:	0017171b          	slliw	a4,a4,0x1
ffffffffc0207e4e:	9f2d                	addw	a4,a4,a1
ffffffffc0207e50:	fd06069b          	addiw	a3,a2,-48
ffffffffc0207e54:	0405                	addi	s0,s0,1
ffffffffc0207e56:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0207e5a:	0006059b          	sext.w	a1,a2
ffffffffc0207e5e:	fed870e3          	bgeu	a6,a3,ffffffffc0207e3e <vprintfmt+0xf0>
ffffffffc0207e62:	f40ddce3          	bgez	s11,ffffffffc0207dba <vprintfmt+0x6c>
ffffffffc0207e66:	8de2                	mv	s11,s8
ffffffffc0207e68:	5c7d                	li	s8,-1
ffffffffc0207e6a:	bf81                	j	ffffffffc0207dba <vprintfmt+0x6c>
ffffffffc0207e6c:	fffdc693          	not	a3,s11
ffffffffc0207e70:	96fd                	srai	a3,a3,0x3f
ffffffffc0207e72:	00ddfdb3          	and	s11,s11,a3
ffffffffc0207e76:	00144603          	lbu	a2,1(s0)
ffffffffc0207e7a:	2d81                	sext.w	s11,s11
ffffffffc0207e7c:	846a                	mv	s0,s10
ffffffffc0207e7e:	bf35                	j	ffffffffc0207dba <vprintfmt+0x6c>
ffffffffc0207e80:	000a2c03          	lw	s8,0(s4)
ffffffffc0207e84:	00144603          	lbu	a2,1(s0)
ffffffffc0207e88:	0a21                	addi	s4,s4,8
ffffffffc0207e8a:	846a                	mv	s0,s10
ffffffffc0207e8c:	bfd9                	j	ffffffffc0207e62 <vprintfmt+0x114>
ffffffffc0207e8e:	4705                	li	a4,1
ffffffffc0207e90:	008a0593          	addi	a1,s4,8
ffffffffc0207e94:	01174463          	blt	a4,a7,ffffffffc0207e9c <vprintfmt+0x14e>
ffffffffc0207e98:	1a088e63          	beqz	a7,ffffffffc0208054 <vprintfmt+0x306>
ffffffffc0207e9c:	000a3603          	ld	a2,0(s4)
ffffffffc0207ea0:	46c1                	li	a3,16
ffffffffc0207ea2:	8a2e                	mv	s4,a1
ffffffffc0207ea4:	2781                	sext.w	a5,a5
ffffffffc0207ea6:	876e                	mv	a4,s11
ffffffffc0207ea8:	85a6                	mv	a1,s1
ffffffffc0207eaa:	854a                	mv	a0,s2
ffffffffc0207eac:	e37ff0ef          	jal	ra,ffffffffc0207ce2 <printnum>
ffffffffc0207eb0:	bde1                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207eb2:	000a2503          	lw	a0,0(s4)
ffffffffc0207eb6:	85a6                	mv	a1,s1
ffffffffc0207eb8:	0a21                	addi	s4,s4,8
ffffffffc0207eba:	9902                	jalr	s2
ffffffffc0207ebc:	b5f1                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207ebe:	4705                	li	a4,1
ffffffffc0207ec0:	008a0593          	addi	a1,s4,8
ffffffffc0207ec4:	01174463          	blt	a4,a7,ffffffffc0207ecc <vprintfmt+0x17e>
ffffffffc0207ec8:	18088163          	beqz	a7,ffffffffc020804a <vprintfmt+0x2fc>
ffffffffc0207ecc:	000a3603          	ld	a2,0(s4)
ffffffffc0207ed0:	46a9                	li	a3,10
ffffffffc0207ed2:	8a2e                	mv	s4,a1
ffffffffc0207ed4:	bfc1                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0207ed6:	00144603          	lbu	a2,1(s0)
ffffffffc0207eda:	4c85                	li	s9,1
ffffffffc0207edc:	846a                	mv	s0,s10
ffffffffc0207ede:	bdf1                	j	ffffffffc0207dba <vprintfmt+0x6c>
ffffffffc0207ee0:	85a6                	mv	a1,s1
ffffffffc0207ee2:	02500513          	li	a0,37
ffffffffc0207ee6:	9902                	jalr	s2
ffffffffc0207ee8:	b545                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207eea:	00144603          	lbu	a2,1(s0)
ffffffffc0207eee:	2885                	addiw	a7,a7,1
ffffffffc0207ef0:	846a                	mv	s0,s10
ffffffffc0207ef2:	b5e1                	j	ffffffffc0207dba <vprintfmt+0x6c>
ffffffffc0207ef4:	4705                	li	a4,1
ffffffffc0207ef6:	008a0593          	addi	a1,s4,8
ffffffffc0207efa:	01174463          	blt	a4,a7,ffffffffc0207f02 <vprintfmt+0x1b4>
ffffffffc0207efe:	14088163          	beqz	a7,ffffffffc0208040 <vprintfmt+0x2f2>
ffffffffc0207f02:	000a3603          	ld	a2,0(s4)
ffffffffc0207f06:	46a1                	li	a3,8
ffffffffc0207f08:	8a2e                	mv	s4,a1
ffffffffc0207f0a:	bf69                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0207f0c:	03000513          	li	a0,48
ffffffffc0207f10:	85a6                	mv	a1,s1
ffffffffc0207f12:	e03e                	sd	a5,0(sp)
ffffffffc0207f14:	9902                	jalr	s2
ffffffffc0207f16:	85a6                	mv	a1,s1
ffffffffc0207f18:	07800513          	li	a0,120
ffffffffc0207f1c:	9902                	jalr	s2
ffffffffc0207f1e:	0a21                	addi	s4,s4,8
ffffffffc0207f20:	6782                	ld	a5,0(sp)
ffffffffc0207f22:	46c1                	li	a3,16
ffffffffc0207f24:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0207f28:	bfb5                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0207f2a:	000a3403          	ld	s0,0(s4)
ffffffffc0207f2e:	008a0713          	addi	a4,s4,8
ffffffffc0207f32:	e03a                	sd	a4,0(sp)
ffffffffc0207f34:	14040263          	beqz	s0,ffffffffc0208078 <vprintfmt+0x32a>
ffffffffc0207f38:	0fb05763          	blez	s11,ffffffffc0208026 <vprintfmt+0x2d8>
ffffffffc0207f3c:	02d00693          	li	a3,45
ffffffffc0207f40:	0cd79163          	bne	a5,a3,ffffffffc0208002 <vprintfmt+0x2b4>
ffffffffc0207f44:	00044783          	lbu	a5,0(s0)
ffffffffc0207f48:	0007851b          	sext.w	a0,a5
ffffffffc0207f4c:	cf85                	beqz	a5,ffffffffc0207f84 <vprintfmt+0x236>
ffffffffc0207f4e:	00140a13          	addi	s4,s0,1
ffffffffc0207f52:	05e00413          	li	s0,94
ffffffffc0207f56:	000c4563          	bltz	s8,ffffffffc0207f60 <vprintfmt+0x212>
ffffffffc0207f5a:	3c7d                	addiw	s8,s8,-1
ffffffffc0207f5c:	036c0263          	beq	s8,s6,ffffffffc0207f80 <vprintfmt+0x232>
ffffffffc0207f60:	85a6                	mv	a1,s1
ffffffffc0207f62:	0e0c8e63          	beqz	s9,ffffffffc020805e <vprintfmt+0x310>
ffffffffc0207f66:	3781                	addiw	a5,a5,-32
ffffffffc0207f68:	0ef47b63          	bgeu	s0,a5,ffffffffc020805e <vprintfmt+0x310>
ffffffffc0207f6c:	03f00513          	li	a0,63
ffffffffc0207f70:	9902                	jalr	s2
ffffffffc0207f72:	000a4783          	lbu	a5,0(s4)
ffffffffc0207f76:	3dfd                	addiw	s11,s11,-1
ffffffffc0207f78:	0a05                	addi	s4,s4,1
ffffffffc0207f7a:	0007851b          	sext.w	a0,a5
ffffffffc0207f7e:	ffe1                	bnez	a5,ffffffffc0207f56 <vprintfmt+0x208>
ffffffffc0207f80:	01b05963          	blez	s11,ffffffffc0207f92 <vprintfmt+0x244>
ffffffffc0207f84:	3dfd                	addiw	s11,s11,-1
ffffffffc0207f86:	85a6                	mv	a1,s1
ffffffffc0207f88:	02000513          	li	a0,32
ffffffffc0207f8c:	9902                	jalr	s2
ffffffffc0207f8e:	fe0d9be3          	bnez	s11,ffffffffc0207f84 <vprintfmt+0x236>
ffffffffc0207f92:	6a02                	ld	s4,0(sp)
ffffffffc0207f94:	bbd5                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207f96:	4705                	li	a4,1
ffffffffc0207f98:	008a0c93          	addi	s9,s4,8
ffffffffc0207f9c:	01174463          	blt	a4,a7,ffffffffc0207fa4 <vprintfmt+0x256>
ffffffffc0207fa0:	08088d63          	beqz	a7,ffffffffc020803a <vprintfmt+0x2ec>
ffffffffc0207fa4:	000a3403          	ld	s0,0(s4)
ffffffffc0207fa8:	0a044d63          	bltz	s0,ffffffffc0208062 <vprintfmt+0x314>
ffffffffc0207fac:	8622                	mv	a2,s0
ffffffffc0207fae:	8a66                	mv	s4,s9
ffffffffc0207fb0:	46a9                	li	a3,10
ffffffffc0207fb2:	bdcd                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0207fb4:	000a2783          	lw	a5,0(s4)
ffffffffc0207fb8:	4761                	li	a4,24
ffffffffc0207fba:	0a21                	addi	s4,s4,8
ffffffffc0207fbc:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0207fc0:	8fb5                	xor	a5,a5,a3
ffffffffc0207fc2:	40d786bb          	subw	a3,a5,a3
ffffffffc0207fc6:	02d74163          	blt	a4,a3,ffffffffc0207fe8 <vprintfmt+0x29a>
ffffffffc0207fca:	00369793          	slli	a5,a3,0x3
ffffffffc0207fce:	97de                	add	a5,a5,s7
ffffffffc0207fd0:	639c                	ld	a5,0(a5)
ffffffffc0207fd2:	cb99                	beqz	a5,ffffffffc0207fe8 <vprintfmt+0x29a>
ffffffffc0207fd4:	86be                	mv	a3,a5
ffffffffc0207fd6:	00000617          	auipc	a2,0x0
ffffffffc0207fda:	13260613          	addi	a2,a2,306 # ffffffffc0208108 <etext+0x22>
ffffffffc0207fde:	85a6                	mv	a1,s1
ffffffffc0207fe0:	854a                	mv	a0,s2
ffffffffc0207fe2:	0ce000ef          	jal	ra,ffffffffc02080b0 <printfmt>
ffffffffc0207fe6:	b34d                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207fe8:	00002617          	auipc	a2,0x2
ffffffffc0207fec:	62060613          	addi	a2,a2,1568 # ffffffffc020a608 <syscalls+0x820>
ffffffffc0207ff0:	85a6                	mv	a1,s1
ffffffffc0207ff2:	854a                	mv	a0,s2
ffffffffc0207ff4:	0bc000ef          	jal	ra,ffffffffc02080b0 <printfmt>
ffffffffc0207ff8:	bb41                	j	ffffffffc0207d88 <vprintfmt+0x3a>
ffffffffc0207ffa:	00002417          	auipc	s0,0x2
ffffffffc0207ffe:	60640413          	addi	s0,s0,1542 # ffffffffc020a600 <syscalls+0x818>
ffffffffc0208002:	85e2                	mv	a1,s8
ffffffffc0208004:	8522                	mv	a0,s0
ffffffffc0208006:	e43e                	sd	a5,8(sp)
ffffffffc0208008:	c61ff0ef          	jal	ra,ffffffffc0207c68 <strnlen>
ffffffffc020800c:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0208010:	01b05b63          	blez	s11,ffffffffc0208026 <vprintfmt+0x2d8>
ffffffffc0208014:	67a2                	ld	a5,8(sp)
ffffffffc0208016:	00078a1b          	sext.w	s4,a5
ffffffffc020801a:	3dfd                	addiw	s11,s11,-1
ffffffffc020801c:	85a6                	mv	a1,s1
ffffffffc020801e:	8552                	mv	a0,s4
ffffffffc0208020:	9902                	jalr	s2
ffffffffc0208022:	fe0d9ce3          	bnez	s11,ffffffffc020801a <vprintfmt+0x2cc>
ffffffffc0208026:	00044783          	lbu	a5,0(s0)
ffffffffc020802a:	00140a13          	addi	s4,s0,1
ffffffffc020802e:	0007851b          	sext.w	a0,a5
ffffffffc0208032:	d3a5                	beqz	a5,ffffffffc0207f92 <vprintfmt+0x244>
ffffffffc0208034:	05e00413          	li	s0,94
ffffffffc0208038:	bf39                	j	ffffffffc0207f56 <vprintfmt+0x208>
ffffffffc020803a:	000a2403          	lw	s0,0(s4)
ffffffffc020803e:	b7ad                	j	ffffffffc0207fa8 <vprintfmt+0x25a>
ffffffffc0208040:	000a6603          	lwu	a2,0(s4)
ffffffffc0208044:	46a1                	li	a3,8
ffffffffc0208046:	8a2e                	mv	s4,a1
ffffffffc0208048:	bdb1                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc020804a:	000a6603          	lwu	a2,0(s4)
ffffffffc020804e:	46a9                	li	a3,10
ffffffffc0208050:	8a2e                	mv	s4,a1
ffffffffc0208052:	bd89                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0208054:	000a6603          	lwu	a2,0(s4)
ffffffffc0208058:	46c1                	li	a3,16
ffffffffc020805a:	8a2e                	mv	s4,a1
ffffffffc020805c:	b5a1                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc020805e:	9902                	jalr	s2
ffffffffc0208060:	bf09                	j	ffffffffc0207f72 <vprintfmt+0x224>
ffffffffc0208062:	85a6                	mv	a1,s1
ffffffffc0208064:	02d00513          	li	a0,45
ffffffffc0208068:	e03e                	sd	a5,0(sp)
ffffffffc020806a:	9902                	jalr	s2
ffffffffc020806c:	6782                	ld	a5,0(sp)
ffffffffc020806e:	8a66                	mv	s4,s9
ffffffffc0208070:	40800633          	neg	a2,s0
ffffffffc0208074:	46a9                	li	a3,10
ffffffffc0208076:	b53d                	j	ffffffffc0207ea4 <vprintfmt+0x156>
ffffffffc0208078:	03b05163          	blez	s11,ffffffffc020809a <vprintfmt+0x34c>
ffffffffc020807c:	02d00693          	li	a3,45
ffffffffc0208080:	f6d79de3          	bne	a5,a3,ffffffffc0207ffa <vprintfmt+0x2ac>
ffffffffc0208084:	00002417          	auipc	s0,0x2
ffffffffc0208088:	57c40413          	addi	s0,s0,1404 # ffffffffc020a600 <syscalls+0x818>
ffffffffc020808c:	02800793          	li	a5,40
ffffffffc0208090:	02800513          	li	a0,40
ffffffffc0208094:	00140a13          	addi	s4,s0,1
ffffffffc0208098:	bd6d                	j	ffffffffc0207f52 <vprintfmt+0x204>
ffffffffc020809a:	00002a17          	auipc	s4,0x2
ffffffffc020809e:	567a0a13          	addi	s4,s4,1383 # ffffffffc020a601 <syscalls+0x819>
ffffffffc02080a2:	02800513          	li	a0,40
ffffffffc02080a6:	02800793          	li	a5,40
ffffffffc02080aa:	05e00413          	li	s0,94
ffffffffc02080ae:	b565                	j	ffffffffc0207f56 <vprintfmt+0x208>

ffffffffc02080b0 <printfmt>:
ffffffffc02080b0:	715d                	addi	sp,sp,-80
ffffffffc02080b2:	02810313          	addi	t1,sp,40
ffffffffc02080b6:	f436                	sd	a3,40(sp)
ffffffffc02080b8:	869a                	mv	a3,t1
ffffffffc02080ba:	ec06                	sd	ra,24(sp)
ffffffffc02080bc:	f83a                	sd	a4,48(sp)
ffffffffc02080be:	fc3e                	sd	a5,56(sp)
ffffffffc02080c0:	e0c2                	sd	a6,64(sp)
ffffffffc02080c2:	e4c6                	sd	a7,72(sp)
ffffffffc02080c4:	e41a                	sd	t1,8(sp)
ffffffffc02080c6:	c89ff0ef          	jal	ra,ffffffffc0207d4e <vprintfmt>
ffffffffc02080ca:	60e2                	ld	ra,24(sp)
ffffffffc02080cc:	6161                	addi	sp,sp,80
ffffffffc02080ce:	8082                	ret

ffffffffc02080d0 <hash32>:
ffffffffc02080d0:	9e3707b7          	lui	a5,0x9e370
ffffffffc02080d4:	2785                	addiw	a5,a5,1
ffffffffc02080d6:	02a7853b          	mulw	a0,a5,a0
ffffffffc02080da:	02000793          	li	a5,32
ffffffffc02080de:	9f8d                	subw	a5,a5,a1
ffffffffc02080e0:	00f5553b          	srlw	a0,a0,a5
ffffffffc02080e4:	8082                	ret
