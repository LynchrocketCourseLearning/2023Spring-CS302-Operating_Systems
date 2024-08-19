
bin/kernel:     file format elf64-littleriscv


Disassembly of section .text:

ffffffffc0200000 <kern_entry>:
ffffffffc0200000:	c02082b7          	lui	t0,0xc0208
ffffffffc0200004:	ffd0031b          	addiw	t1,zero,-3
ffffffffc0200008:	037a                	slli	t1,t1,0x1e
ffffffffc020000a:	406282b3          	sub	t0,t0,t1
ffffffffc020000e:	00c2d293          	srli	t0,t0,0xc
ffffffffc0200012:	fff0031b          	addiw	t1,zero,-1
ffffffffc0200016:	137e                	slli	t1,t1,0x3f
ffffffffc0200018:	0062e2b3          	or	t0,t0,t1
ffffffffc020001c:	18029073          	csrw	satp,t0
ffffffffc0200020:	12000073          	sfence.vma
ffffffffc0200024:	c0208137          	lui	sp,0xc0208
ffffffffc0200028:	c02002b7          	lui	t0,0xc0200
ffffffffc020002c:	03228293          	addi	t0,t0,50 # ffffffffc0200032 <kern_init>
ffffffffc0200030:	8282                	jr	t0

ffffffffc0200032 <kern_init>:
ffffffffc0200032:	00009517          	auipc	a0,0x9
ffffffffc0200036:	00e50513          	addi	a0,a0,14 # ffffffffc0209040 <ide>
ffffffffc020003a:	00010617          	auipc	a2,0x10
ffffffffc020003e:	16660613          	addi	a2,a2,358 # ffffffffc02101a0 <end>
ffffffffc0200042:	1141                	addi	sp,sp,-16
ffffffffc0200044:	8e09                	sub	a2,a2,a0
ffffffffc0200046:	4581                	li	a1,0
ffffffffc0200048:	e406                	sd	ra,8(sp)
ffffffffc020004a:	0bf030ef          	jal	ra,ffffffffc0203908 <memset>
ffffffffc020004e:	00004597          	auipc	a1,0x4
ffffffffc0200052:	cd258593          	addi	a1,a1,-814 # ffffffffc0203d20 <etext>
ffffffffc0200056:	00004517          	auipc	a0,0x4
ffffffffc020005a:	ce250513          	addi	a0,a0,-798 # ffffffffc0203d38 <etext+0x18>
ffffffffc020005e:	058000ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200062:	3f5000ef          	jal	ra,ffffffffc0200c56 <pmm_init>
ffffffffc0200066:	204000ef          	jal	ra,ffffffffc020026a <idt_init>
ffffffffc020006a:	14d010ef          	jal	ra,ffffffffc02019b6 <vmm_init>
ffffffffc020006e:	0dc000ef          	jal	ra,ffffffffc020014a <ide_init>
ffffffffc0200072:	17c000ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc0200076:	747010ef          	jal	ra,ffffffffc0201fbc <swap_init>
ffffffffc020007a:	a001                	j	ffffffffc020007a <kern_init+0x48>

ffffffffc020007c <cputch>:
ffffffffc020007c:	1141                	addi	sp,sp,-16
ffffffffc020007e:	e022                	sd	s0,0(sp)
ffffffffc0200080:	e406                	sd	ra,8(sp)
ffffffffc0200082:	842e                	mv	s0,a1
ffffffffc0200084:	136000ef          	jal	ra,ffffffffc02001ba <cons_putc>
ffffffffc0200088:	401c                	lw	a5,0(s0)
ffffffffc020008a:	60a2                	ld	ra,8(sp)
ffffffffc020008c:	2785                	addiw	a5,a5,1
ffffffffc020008e:	c01c                	sw	a5,0(s0)
ffffffffc0200090:	6402                	ld	s0,0(sp)
ffffffffc0200092:	0141                	addi	sp,sp,16
ffffffffc0200094:	8082                	ret

ffffffffc0200096 <vcprintf>:
ffffffffc0200096:	1101                	addi	sp,sp,-32
ffffffffc0200098:	862a                	mv	a2,a0
ffffffffc020009a:	86ae                	mv	a3,a1
ffffffffc020009c:	00000517          	auipc	a0,0x0
ffffffffc02000a0:	fe050513          	addi	a0,a0,-32 # ffffffffc020007c <cputch>
ffffffffc02000a4:	006c                	addi	a1,sp,12
ffffffffc02000a6:	ec06                	sd	ra,24(sp)
ffffffffc02000a8:	c602                	sw	zero,12(sp)
ffffffffc02000aa:	0f5030ef          	jal	ra,ffffffffc020399e <vprintfmt>
ffffffffc02000ae:	60e2                	ld	ra,24(sp)
ffffffffc02000b0:	4532                	lw	a0,12(sp)
ffffffffc02000b2:	6105                	addi	sp,sp,32
ffffffffc02000b4:	8082                	ret

ffffffffc02000b6 <cprintf>:
ffffffffc02000b6:	711d                	addi	sp,sp,-96
ffffffffc02000b8:	02810313          	addi	t1,sp,40 # ffffffffc0208028 <boot_page_table_sv39+0x28>
ffffffffc02000bc:	8e2a                	mv	t3,a0
ffffffffc02000be:	f42e                	sd	a1,40(sp)
ffffffffc02000c0:	f832                	sd	a2,48(sp)
ffffffffc02000c2:	fc36                	sd	a3,56(sp)
ffffffffc02000c4:	00000517          	auipc	a0,0x0
ffffffffc02000c8:	fb850513          	addi	a0,a0,-72 # ffffffffc020007c <cputch>
ffffffffc02000cc:	004c                	addi	a1,sp,4
ffffffffc02000ce:	869a                	mv	a3,t1
ffffffffc02000d0:	8672                	mv	a2,t3
ffffffffc02000d2:	ec06                	sd	ra,24(sp)
ffffffffc02000d4:	e0ba                	sd	a4,64(sp)
ffffffffc02000d6:	e4be                	sd	a5,72(sp)
ffffffffc02000d8:	e8c2                	sd	a6,80(sp)
ffffffffc02000da:	ecc6                	sd	a7,88(sp)
ffffffffc02000dc:	e41a                	sd	t1,8(sp)
ffffffffc02000de:	c202                	sw	zero,4(sp)
ffffffffc02000e0:	0bf030ef          	jal	ra,ffffffffc020399e <vprintfmt>
ffffffffc02000e4:	60e2                	ld	ra,24(sp)
ffffffffc02000e6:	4512                	lw	a0,4(sp)
ffffffffc02000e8:	6125                	addi	sp,sp,96
ffffffffc02000ea:	8082                	ret

ffffffffc02000ec <__panic>:
ffffffffc02000ec:	00010317          	auipc	t1,0x10
ffffffffc02000f0:	f5430313          	addi	t1,t1,-172 # ffffffffc0210040 <is_panic>
ffffffffc02000f4:	00032e03          	lw	t3,0(t1)
ffffffffc02000f8:	715d                	addi	sp,sp,-80
ffffffffc02000fa:	ec06                	sd	ra,24(sp)
ffffffffc02000fc:	e822                	sd	s0,16(sp)
ffffffffc02000fe:	f436                	sd	a3,40(sp)
ffffffffc0200100:	f83a                	sd	a4,48(sp)
ffffffffc0200102:	fc3e                	sd	a5,56(sp)
ffffffffc0200104:	e0c2                	sd	a6,64(sp)
ffffffffc0200106:	e4c6                	sd	a7,72(sp)
ffffffffc0200108:	020e1a63          	bnez	t3,ffffffffc020013c <__panic+0x50>
ffffffffc020010c:	4785                	li	a5,1
ffffffffc020010e:	00f32023          	sw	a5,0(t1)
ffffffffc0200112:	8432                	mv	s0,a2
ffffffffc0200114:	103c                	addi	a5,sp,40
ffffffffc0200116:	862e                	mv	a2,a1
ffffffffc0200118:	85aa                	mv	a1,a0
ffffffffc020011a:	00004517          	auipc	a0,0x4
ffffffffc020011e:	c2650513          	addi	a0,a0,-986 # ffffffffc0203d40 <etext+0x20>
ffffffffc0200122:	e43e                	sd	a5,8(sp)
ffffffffc0200124:	f93ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200128:	65a2                	ld	a1,8(sp)
ffffffffc020012a:	8522                	mv	a0,s0
ffffffffc020012c:	f6bff0ef          	jal	ra,ffffffffc0200096 <vcprintf>
ffffffffc0200130:	00004517          	auipc	a0,0x4
ffffffffc0200134:	70850513          	addi	a0,a0,1800 # ffffffffc0204838 <etext+0xb18>
ffffffffc0200138:	f7fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020013c:	0b8000ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0200140:	4501                	li	a0,0
ffffffffc0200142:	006000ef          	jal	ra,ffffffffc0200148 <kmonitor>
ffffffffc0200146:	bfed                	j	ffffffffc0200140 <__panic+0x54>

ffffffffc0200148 <kmonitor>:
ffffffffc0200148:	a001                	j	ffffffffc0200148 <kmonitor>

ffffffffc020014a <ide_init>:
ffffffffc020014a:	8082                	ret

ffffffffc020014c <ide_device_valid>:
ffffffffc020014c:	00253513          	sltiu	a0,a0,2
ffffffffc0200150:	8082                	ret

ffffffffc0200152 <ide_device_size>:
ffffffffc0200152:	03800513          	li	a0,56
ffffffffc0200156:	8082                	ret

ffffffffc0200158 <ide_read_secs>:
ffffffffc0200158:	00009797          	auipc	a5,0x9
ffffffffc020015c:	ee878793          	addi	a5,a5,-280 # ffffffffc0209040 <ide>
ffffffffc0200160:	0095959b          	slliw	a1,a1,0x9
ffffffffc0200164:	1141                	addi	sp,sp,-16
ffffffffc0200166:	8532                	mv	a0,a2
ffffffffc0200168:	95be                	add	a1,a1,a5
ffffffffc020016a:	00969613          	slli	a2,a3,0x9
ffffffffc020016e:	e406                	sd	ra,8(sp)
ffffffffc0200170:	7aa030ef          	jal	ra,ffffffffc020391a <memcpy>
ffffffffc0200174:	60a2                	ld	ra,8(sp)
ffffffffc0200176:	4501                	li	a0,0
ffffffffc0200178:	0141                	addi	sp,sp,16
ffffffffc020017a:	8082                	ret

ffffffffc020017c <ide_write_secs>:
ffffffffc020017c:	0095979b          	slliw	a5,a1,0x9
ffffffffc0200180:	00009517          	auipc	a0,0x9
ffffffffc0200184:	ec050513          	addi	a0,a0,-320 # ffffffffc0209040 <ide>
ffffffffc0200188:	1141                	addi	sp,sp,-16
ffffffffc020018a:	85b2                	mv	a1,a2
ffffffffc020018c:	953e                	add	a0,a0,a5
ffffffffc020018e:	00969613          	slli	a2,a3,0x9
ffffffffc0200192:	e406                	sd	ra,8(sp)
ffffffffc0200194:	786030ef          	jal	ra,ffffffffc020391a <memcpy>
ffffffffc0200198:	60a2                	ld	ra,8(sp)
ffffffffc020019a:	4501                	li	a0,0
ffffffffc020019c:	0141                	addi	sp,sp,16
ffffffffc020019e:	8082                	ret

ffffffffc02001a0 <clock_set_next_event>:
ffffffffc02001a0:	c0102573          	rdtime	a0
ffffffffc02001a4:	00010797          	auipc	a5,0x10
ffffffffc02001a8:	ea47b783          	ld	a5,-348(a5) # ffffffffc0210048 <timebase>
ffffffffc02001ac:	953e                	add	a0,a0,a5
ffffffffc02001ae:	4581                	li	a1,0
ffffffffc02001b0:	4601                	li	a2,0
ffffffffc02001b2:	4881                	li	a7,0
ffffffffc02001b4:	00000073          	ecall
ffffffffc02001b8:	8082                	ret

ffffffffc02001ba <cons_putc>:
ffffffffc02001ba:	100027f3          	csrr	a5,sstatus
ffffffffc02001be:	8b89                	andi	a5,a5,2
ffffffffc02001c0:	0ff57513          	andi	a0,a0,255
ffffffffc02001c4:	e799                	bnez	a5,ffffffffc02001d2 <cons_putc+0x18>
ffffffffc02001c6:	4581                	li	a1,0
ffffffffc02001c8:	4601                	li	a2,0
ffffffffc02001ca:	4885                	li	a7,1
ffffffffc02001cc:	00000073          	ecall
ffffffffc02001d0:	8082                	ret
ffffffffc02001d2:	1101                	addi	sp,sp,-32
ffffffffc02001d4:	ec06                	sd	ra,24(sp)
ffffffffc02001d6:	e42a                	sd	a0,8(sp)
ffffffffc02001d8:	01c000ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc02001dc:	6522                	ld	a0,8(sp)
ffffffffc02001de:	4581                	li	a1,0
ffffffffc02001e0:	4601                	li	a2,0
ffffffffc02001e2:	4885                	li	a7,1
ffffffffc02001e4:	00000073          	ecall
ffffffffc02001e8:	60e2                	ld	ra,24(sp)
ffffffffc02001ea:	6105                	addi	sp,sp,32
ffffffffc02001ec:	a009                	j	ffffffffc02001ee <intr_enable>

ffffffffc02001ee <intr_enable>:
ffffffffc02001ee:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc02001f2:	8082                	ret

ffffffffc02001f4 <intr_disable>:
ffffffffc02001f4:	100177f3          	csrrci	a5,sstatus,2
ffffffffc02001f8:	8082                	ret

ffffffffc02001fa <pgfault_handler>:
ffffffffc02001fa:	10053783          	ld	a5,256(a0)
ffffffffc02001fe:	1141                	addi	sp,sp,-16
ffffffffc0200200:	e022                	sd	s0,0(sp)
ffffffffc0200202:	e406                	sd	ra,8(sp)
ffffffffc0200204:	1007f793          	andi	a5,a5,256
ffffffffc0200208:	11053583          	ld	a1,272(a0)
ffffffffc020020c:	842a                	mv	s0,a0
ffffffffc020020e:	05500613          	li	a2,85
ffffffffc0200212:	c399                	beqz	a5,ffffffffc0200218 <pgfault_handler+0x1e>
ffffffffc0200214:	04b00613          	li	a2,75
ffffffffc0200218:	11843703          	ld	a4,280(s0)
ffffffffc020021c:	47bd                	li	a5,15
ffffffffc020021e:	05700693          	li	a3,87
ffffffffc0200222:	00f70463          	beq	a4,a5,ffffffffc020022a <pgfault_handler+0x30>
ffffffffc0200226:	05200693          	li	a3,82
ffffffffc020022a:	00004517          	auipc	a0,0x4
ffffffffc020022e:	b3650513          	addi	a0,a0,-1226 # ffffffffc0203d60 <etext+0x40>
ffffffffc0200232:	e85ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200236:	00010517          	auipc	a0,0x10
ffffffffc020023a:	e6a53503          	ld	a0,-406(a0) # ffffffffc02100a0 <check_mm_struct>
ffffffffc020023e:	c911                	beqz	a0,ffffffffc0200252 <pgfault_handler+0x58>
ffffffffc0200240:	11043603          	ld	a2,272(s0)
ffffffffc0200244:	11843583          	ld	a1,280(s0)
ffffffffc0200248:	6402                	ld	s0,0(sp)
ffffffffc020024a:	60a2                	ld	ra,8(sp)
ffffffffc020024c:	0141                	addi	sp,sp,16
ffffffffc020024e:	4a10106f          	j	ffffffffc0201eee <do_pgfault>
ffffffffc0200252:	00004617          	auipc	a2,0x4
ffffffffc0200256:	b2e60613          	addi	a2,a2,-1234 # ffffffffc0203d80 <etext+0x60>
ffffffffc020025a:	06300593          	li	a1,99
ffffffffc020025e:	00004517          	auipc	a0,0x4
ffffffffc0200262:	b3a50513          	addi	a0,a0,-1222 # ffffffffc0203d98 <etext+0x78>
ffffffffc0200266:	e87ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020026a <idt_init>:
ffffffffc020026a:	14005073          	csrwi	sscratch,0
ffffffffc020026e:	00000797          	auipc	a5,0x0
ffffffffc0200272:	47278793          	addi	a5,a5,1138 # ffffffffc02006e0 <__alltraps>
ffffffffc0200276:	10579073          	csrw	stvec,a5
ffffffffc020027a:	100167f3          	csrrsi	a5,sstatus,2
ffffffffc020027e:	000407b7          	lui	a5,0x40
ffffffffc0200282:	1007a7f3          	csrrs	a5,sstatus,a5
ffffffffc0200286:	8082                	ret

ffffffffc0200288 <print_regs>:
ffffffffc0200288:	610c                	ld	a1,0(a0)
ffffffffc020028a:	1141                	addi	sp,sp,-16
ffffffffc020028c:	e022                	sd	s0,0(sp)
ffffffffc020028e:	842a                	mv	s0,a0
ffffffffc0200290:	00004517          	auipc	a0,0x4
ffffffffc0200294:	b2050513          	addi	a0,a0,-1248 # ffffffffc0203db0 <etext+0x90>
ffffffffc0200298:	e406                	sd	ra,8(sp)
ffffffffc020029a:	e1dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020029e:	640c                	ld	a1,8(s0)
ffffffffc02002a0:	00004517          	auipc	a0,0x4
ffffffffc02002a4:	b2850513          	addi	a0,a0,-1240 # ffffffffc0203dc8 <etext+0xa8>
ffffffffc02002a8:	e0fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002ac:	680c                	ld	a1,16(s0)
ffffffffc02002ae:	00004517          	auipc	a0,0x4
ffffffffc02002b2:	b3250513          	addi	a0,a0,-1230 # ffffffffc0203de0 <etext+0xc0>
ffffffffc02002b6:	e01ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002ba:	6c0c                	ld	a1,24(s0)
ffffffffc02002bc:	00004517          	auipc	a0,0x4
ffffffffc02002c0:	b3c50513          	addi	a0,a0,-1220 # ffffffffc0203df8 <etext+0xd8>
ffffffffc02002c4:	df3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002c8:	700c                	ld	a1,32(s0)
ffffffffc02002ca:	00004517          	auipc	a0,0x4
ffffffffc02002ce:	b4650513          	addi	a0,a0,-1210 # ffffffffc0203e10 <etext+0xf0>
ffffffffc02002d2:	de5ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002d6:	740c                	ld	a1,40(s0)
ffffffffc02002d8:	00004517          	auipc	a0,0x4
ffffffffc02002dc:	b5050513          	addi	a0,a0,-1200 # ffffffffc0203e28 <etext+0x108>
ffffffffc02002e0:	dd7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002e4:	780c                	ld	a1,48(s0)
ffffffffc02002e6:	00004517          	auipc	a0,0x4
ffffffffc02002ea:	b5a50513          	addi	a0,a0,-1190 # ffffffffc0203e40 <etext+0x120>
ffffffffc02002ee:	dc9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02002f2:	7c0c                	ld	a1,56(s0)
ffffffffc02002f4:	00004517          	auipc	a0,0x4
ffffffffc02002f8:	b6450513          	addi	a0,a0,-1180 # ffffffffc0203e58 <etext+0x138>
ffffffffc02002fc:	dbbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200300:	602c                	ld	a1,64(s0)
ffffffffc0200302:	00004517          	auipc	a0,0x4
ffffffffc0200306:	b6e50513          	addi	a0,a0,-1170 # ffffffffc0203e70 <etext+0x150>
ffffffffc020030a:	dadff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020030e:	642c                	ld	a1,72(s0)
ffffffffc0200310:	00004517          	auipc	a0,0x4
ffffffffc0200314:	b7850513          	addi	a0,a0,-1160 # ffffffffc0203e88 <etext+0x168>
ffffffffc0200318:	d9fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020031c:	682c                	ld	a1,80(s0)
ffffffffc020031e:	00004517          	auipc	a0,0x4
ffffffffc0200322:	b8250513          	addi	a0,a0,-1150 # ffffffffc0203ea0 <etext+0x180>
ffffffffc0200326:	d91ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020032a:	6c2c                	ld	a1,88(s0)
ffffffffc020032c:	00004517          	auipc	a0,0x4
ffffffffc0200330:	b8c50513          	addi	a0,a0,-1140 # ffffffffc0203eb8 <etext+0x198>
ffffffffc0200334:	d83ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200338:	702c                	ld	a1,96(s0)
ffffffffc020033a:	00004517          	auipc	a0,0x4
ffffffffc020033e:	b9650513          	addi	a0,a0,-1130 # ffffffffc0203ed0 <etext+0x1b0>
ffffffffc0200342:	d75ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200346:	742c                	ld	a1,104(s0)
ffffffffc0200348:	00004517          	auipc	a0,0x4
ffffffffc020034c:	ba050513          	addi	a0,a0,-1120 # ffffffffc0203ee8 <etext+0x1c8>
ffffffffc0200350:	d67ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200354:	782c                	ld	a1,112(s0)
ffffffffc0200356:	00004517          	auipc	a0,0x4
ffffffffc020035a:	baa50513          	addi	a0,a0,-1110 # ffffffffc0203f00 <etext+0x1e0>
ffffffffc020035e:	d59ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200362:	7c2c                	ld	a1,120(s0)
ffffffffc0200364:	00004517          	auipc	a0,0x4
ffffffffc0200368:	bb450513          	addi	a0,a0,-1100 # ffffffffc0203f18 <etext+0x1f8>
ffffffffc020036c:	d4bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200370:	604c                	ld	a1,128(s0)
ffffffffc0200372:	00004517          	auipc	a0,0x4
ffffffffc0200376:	bbe50513          	addi	a0,a0,-1090 # ffffffffc0203f30 <etext+0x210>
ffffffffc020037a:	d3dff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020037e:	644c                	ld	a1,136(s0)
ffffffffc0200380:	00004517          	auipc	a0,0x4
ffffffffc0200384:	bc850513          	addi	a0,a0,-1080 # ffffffffc0203f48 <etext+0x228>
ffffffffc0200388:	d2fff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020038c:	684c                	ld	a1,144(s0)
ffffffffc020038e:	00004517          	auipc	a0,0x4
ffffffffc0200392:	bd250513          	addi	a0,a0,-1070 # ffffffffc0203f60 <etext+0x240>
ffffffffc0200396:	d21ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020039a:	6c4c                	ld	a1,152(s0)
ffffffffc020039c:	00004517          	auipc	a0,0x4
ffffffffc02003a0:	bdc50513          	addi	a0,a0,-1060 # ffffffffc0203f78 <etext+0x258>
ffffffffc02003a4:	d13ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003a8:	704c                	ld	a1,160(s0)
ffffffffc02003aa:	00004517          	auipc	a0,0x4
ffffffffc02003ae:	be650513          	addi	a0,a0,-1050 # ffffffffc0203f90 <etext+0x270>
ffffffffc02003b2:	d05ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003b6:	744c                	ld	a1,168(s0)
ffffffffc02003b8:	00004517          	auipc	a0,0x4
ffffffffc02003bc:	bf050513          	addi	a0,a0,-1040 # ffffffffc0203fa8 <etext+0x288>
ffffffffc02003c0:	cf7ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003c4:	784c                	ld	a1,176(s0)
ffffffffc02003c6:	00004517          	auipc	a0,0x4
ffffffffc02003ca:	bfa50513          	addi	a0,a0,-1030 # ffffffffc0203fc0 <etext+0x2a0>
ffffffffc02003ce:	ce9ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003d2:	7c4c                	ld	a1,184(s0)
ffffffffc02003d4:	00004517          	auipc	a0,0x4
ffffffffc02003d8:	c0450513          	addi	a0,a0,-1020 # ffffffffc0203fd8 <etext+0x2b8>
ffffffffc02003dc:	cdbff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003e0:	606c                	ld	a1,192(s0)
ffffffffc02003e2:	00004517          	auipc	a0,0x4
ffffffffc02003e6:	c0e50513          	addi	a0,a0,-1010 # ffffffffc0203ff0 <etext+0x2d0>
ffffffffc02003ea:	ccdff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003ee:	646c                	ld	a1,200(s0)
ffffffffc02003f0:	00004517          	auipc	a0,0x4
ffffffffc02003f4:	c1850513          	addi	a0,a0,-1000 # ffffffffc0204008 <etext+0x2e8>
ffffffffc02003f8:	cbfff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02003fc:	686c                	ld	a1,208(s0)
ffffffffc02003fe:	00004517          	auipc	a0,0x4
ffffffffc0200402:	c2250513          	addi	a0,a0,-990 # ffffffffc0204020 <etext+0x300>
ffffffffc0200406:	cb1ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020040a:	6c6c                	ld	a1,216(s0)
ffffffffc020040c:	00004517          	auipc	a0,0x4
ffffffffc0200410:	c2c50513          	addi	a0,a0,-980 # ffffffffc0204038 <etext+0x318>
ffffffffc0200414:	ca3ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200418:	706c                	ld	a1,224(s0)
ffffffffc020041a:	00004517          	auipc	a0,0x4
ffffffffc020041e:	c3650513          	addi	a0,a0,-970 # ffffffffc0204050 <etext+0x330>
ffffffffc0200422:	c95ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200426:	746c                	ld	a1,232(s0)
ffffffffc0200428:	00004517          	auipc	a0,0x4
ffffffffc020042c:	c4050513          	addi	a0,a0,-960 # ffffffffc0204068 <etext+0x348>
ffffffffc0200430:	c87ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200434:	786c                	ld	a1,240(s0)
ffffffffc0200436:	00004517          	auipc	a0,0x4
ffffffffc020043a:	c4a50513          	addi	a0,a0,-950 # ffffffffc0204080 <etext+0x360>
ffffffffc020043e:	c79ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200442:	7c6c                	ld	a1,248(s0)
ffffffffc0200444:	6402                	ld	s0,0(sp)
ffffffffc0200446:	60a2                	ld	ra,8(sp)
ffffffffc0200448:	00004517          	auipc	a0,0x4
ffffffffc020044c:	c5050513          	addi	a0,a0,-944 # ffffffffc0204098 <etext+0x378>
ffffffffc0200450:	0141                	addi	sp,sp,16
ffffffffc0200452:	b195                	j	ffffffffc02000b6 <cprintf>

ffffffffc0200454 <print_trapframe>:
ffffffffc0200454:	1141                	addi	sp,sp,-16
ffffffffc0200456:	e022                	sd	s0,0(sp)
ffffffffc0200458:	85aa                	mv	a1,a0
ffffffffc020045a:	842a                	mv	s0,a0
ffffffffc020045c:	00004517          	auipc	a0,0x4
ffffffffc0200460:	c5450513          	addi	a0,a0,-940 # ffffffffc02040b0 <etext+0x390>
ffffffffc0200464:	e406                	sd	ra,8(sp)
ffffffffc0200466:	c51ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020046a:	8522                	mv	a0,s0
ffffffffc020046c:	e1dff0ef          	jal	ra,ffffffffc0200288 <print_regs>
ffffffffc0200470:	10043583          	ld	a1,256(s0)
ffffffffc0200474:	00004517          	auipc	a0,0x4
ffffffffc0200478:	c5450513          	addi	a0,a0,-940 # ffffffffc02040c8 <etext+0x3a8>
ffffffffc020047c:	c3bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200480:	10843583          	ld	a1,264(s0)
ffffffffc0200484:	00004517          	auipc	a0,0x4
ffffffffc0200488:	c5c50513          	addi	a0,a0,-932 # ffffffffc02040e0 <etext+0x3c0>
ffffffffc020048c:	c2bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200490:	11043583          	ld	a1,272(s0)
ffffffffc0200494:	00004517          	auipc	a0,0x4
ffffffffc0200498:	c6450513          	addi	a0,a0,-924 # ffffffffc02040f8 <etext+0x3d8>
ffffffffc020049c:	c1bff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02004a0:	11843583          	ld	a1,280(s0)
ffffffffc02004a4:	6402                	ld	s0,0(sp)
ffffffffc02004a6:	60a2                	ld	ra,8(sp)
ffffffffc02004a8:	00004517          	auipc	a0,0x4
ffffffffc02004ac:	c6850513          	addi	a0,a0,-920 # ffffffffc0204110 <etext+0x3f0>
ffffffffc02004b0:	0141                	addi	sp,sp,16
ffffffffc02004b2:	b111                	j	ffffffffc02000b6 <cprintf>

ffffffffc02004b4 <interrupt_handler>:
ffffffffc02004b4:	11853783          	ld	a5,280(a0)
ffffffffc02004b8:	472d                	li	a4,11
ffffffffc02004ba:	0786                	slli	a5,a5,0x1
ffffffffc02004bc:	8385                	srli	a5,a5,0x1
ffffffffc02004be:	06f76763          	bltu	a4,a5,ffffffffc020052c <interrupt_handler+0x78>
ffffffffc02004c2:	00004717          	auipc	a4,0x4
ffffffffc02004c6:	d1670713          	addi	a4,a4,-746 # ffffffffc02041d8 <etext+0x4b8>
ffffffffc02004ca:	078a                	slli	a5,a5,0x2
ffffffffc02004cc:	97ba                	add	a5,a5,a4
ffffffffc02004ce:	439c                	lw	a5,0(a5)
ffffffffc02004d0:	97ba                	add	a5,a5,a4
ffffffffc02004d2:	8782                	jr	a5
ffffffffc02004d4:	00004517          	auipc	a0,0x4
ffffffffc02004d8:	cb450513          	addi	a0,a0,-844 # ffffffffc0204188 <etext+0x468>
ffffffffc02004dc:	bee9                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004de:	00004517          	auipc	a0,0x4
ffffffffc02004e2:	c8a50513          	addi	a0,a0,-886 # ffffffffc0204168 <etext+0x448>
ffffffffc02004e6:	bec1                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004e8:	00004517          	auipc	a0,0x4
ffffffffc02004ec:	c4050513          	addi	a0,a0,-960 # ffffffffc0204128 <etext+0x408>
ffffffffc02004f0:	b6d9                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004f2:	00004517          	auipc	a0,0x4
ffffffffc02004f6:	c5650513          	addi	a0,a0,-938 # ffffffffc0204148 <etext+0x428>
ffffffffc02004fa:	be75                	j	ffffffffc02000b6 <cprintf>
ffffffffc02004fc:	1141                	addi	sp,sp,-16
ffffffffc02004fe:	e406                	sd	ra,8(sp)
ffffffffc0200500:	ca1ff0ef          	jal	ra,ffffffffc02001a0 <clock_set_next_event>
ffffffffc0200504:	00010697          	auipc	a3,0x10
ffffffffc0200508:	b7468693          	addi	a3,a3,-1164 # ffffffffc0210078 <ticks>
ffffffffc020050c:	629c                	ld	a5,0(a3)
ffffffffc020050e:	06400713          	li	a4,100
ffffffffc0200512:	0785                	addi	a5,a5,1
ffffffffc0200514:	02e7f733          	remu	a4,a5,a4
ffffffffc0200518:	e29c                	sd	a5,0(a3)
ffffffffc020051a:	cb11                	beqz	a4,ffffffffc020052e <interrupt_handler+0x7a>
ffffffffc020051c:	60a2                	ld	ra,8(sp)
ffffffffc020051e:	0141                	addi	sp,sp,16
ffffffffc0200520:	8082                	ret
ffffffffc0200522:	00004517          	auipc	a0,0x4
ffffffffc0200526:	c9650513          	addi	a0,a0,-874 # ffffffffc02041b8 <etext+0x498>
ffffffffc020052a:	b671                	j	ffffffffc02000b6 <cprintf>
ffffffffc020052c:	b725                	j	ffffffffc0200454 <print_trapframe>
ffffffffc020052e:	60a2                	ld	ra,8(sp)
ffffffffc0200530:	06400593          	li	a1,100
ffffffffc0200534:	00004517          	auipc	a0,0x4
ffffffffc0200538:	c7450513          	addi	a0,a0,-908 # ffffffffc02041a8 <etext+0x488>
ffffffffc020053c:	0141                	addi	sp,sp,16
ffffffffc020053e:	bea5                	j	ffffffffc02000b6 <cprintf>

ffffffffc0200540 <exception_handler>:
ffffffffc0200540:	11853783          	ld	a5,280(a0)
ffffffffc0200544:	1101                	addi	sp,sp,-32
ffffffffc0200546:	e822                	sd	s0,16(sp)
ffffffffc0200548:	ec06                	sd	ra,24(sp)
ffffffffc020054a:	e426                	sd	s1,8(sp)
ffffffffc020054c:	473d                	li	a4,15
ffffffffc020054e:	842a                	mv	s0,a0
ffffffffc0200550:	14f76963          	bltu	a4,a5,ffffffffc02006a2 <exception_handler+0x162>
ffffffffc0200554:	00004717          	auipc	a4,0x4
ffffffffc0200558:	e6c70713          	addi	a4,a4,-404 # ffffffffc02043c0 <etext+0x6a0>
ffffffffc020055c:	078a                	slli	a5,a5,0x2
ffffffffc020055e:	97ba                	add	a5,a5,a4
ffffffffc0200560:	439c                	lw	a5,0(a5)
ffffffffc0200562:	97ba                	add	a5,a5,a4
ffffffffc0200564:	8782                	jr	a5
ffffffffc0200566:	00004517          	auipc	a0,0x4
ffffffffc020056a:	e4250513          	addi	a0,a0,-446 # ffffffffc02043a8 <etext+0x688>
ffffffffc020056e:	b49ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200572:	8522                	mv	a0,s0
ffffffffc0200574:	c87ff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc0200578:	84aa                	mv	s1,a0
ffffffffc020057a:	12051a63          	bnez	a0,ffffffffc02006ae <exception_handler+0x16e>
ffffffffc020057e:	60e2                	ld	ra,24(sp)
ffffffffc0200580:	6442                	ld	s0,16(sp)
ffffffffc0200582:	64a2                	ld	s1,8(sp)
ffffffffc0200584:	6105                	addi	sp,sp,32
ffffffffc0200586:	8082                	ret
ffffffffc0200588:	00004517          	auipc	a0,0x4
ffffffffc020058c:	c8050513          	addi	a0,a0,-896 # ffffffffc0204208 <etext+0x4e8>
ffffffffc0200590:	6442                	ld	s0,16(sp)
ffffffffc0200592:	60e2                	ld	ra,24(sp)
ffffffffc0200594:	64a2                	ld	s1,8(sp)
ffffffffc0200596:	6105                	addi	sp,sp,32
ffffffffc0200598:	be39                	j	ffffffffc02000b6 <cprintf>
ffffffffc020059a:	00004517          	auipc	a0,0x4
ffffffffc020059e:	c8e50513          	addi	a0,a0,-882 # ffffffffc0204228 <etext+0x508>
ffffffffc02005a2:	b7fd                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005a4:	00004517          	auipc	a0,0x4
ffffffffc02005a8:	ca450513          	addi	a0,a0,-860 # ffffffffc0204248 <etext+0x528>
ffffffffc02005ac:	b7d5                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005ae:	00004517          	auipc	a0,0x4
ffffffffc02005b2:	cb250513          	addi	a0,a0,-846 # ffffffffc0204260 <etext+0x540>
ffffffffc02005b6:	bfe9                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005b8:	00004517          	auipc	a0,0x4
ffffffffc02005bc:	cb850513          	addi	a0,a0,-840 # ffffffffc0204270 <etext+0x550>
ffffffffc02005c0:	bfc1                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc02005c2:	00004517          	auipc	a0,0x4
ffffffffc02005c6:	cce50513          	addi	a0,a0,-818 # ffffffffc0204290 <etext+0x570>
ffffffffc02005ca:	aedff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02005ce:	8522                	mv	a0,s0
ffffffffc02005d0:	c2bff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc02005d4:	84aa                	mv	s1,a0
ffffffffc02005d6:	d545                	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc02005d8:	8522                	mv	a0,s0
ffffffffc02005da:	e7bff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc02005de:	86a6                	mv	a3,s1
ffffffffc02005e0:	00004617          	auipc	a2,0x4
ffffffffc02005e4:	cc860613          	addi	a2,a2,-824 # ffffffffc02042a8 <etext+0x588>
ffffffffc02005e8:	0af00593          	li	a1,175
ffffffffc02005ec:	00003517          	auipc	a0,0x3
ffffffffc02005f0:	7ac50513          	addi	a0,a0,1964 # ffffffffc0203d98 <etext+0x78>
ffffffffc02005f4:	af9ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02005f8:	00004517          	auipc	a0,0x4
ffffffffc02005fc:	cd050513          	addi	a0,a0,-816 # ffffffffc02042c8 <etext+0x5a8>
ffffffffc0200600:	bf41                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200602:	00004517          	auipc	a0,0x4
ffffffffc0200606:	cde50513          	addi	a0,a0,-802 # ffffffffc02042e0 <etext+0x5c0>
ffffffffc020060a:	aadff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020060e:	8522                	mv	a0,s0
ffffffffc0200610:	bebff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc0200614:	84aa                	mv	s1,a0
ffffffffc0200616:	d525                	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc0200618:	8522                	mv	a0,s0
ffffffffc020061a:	e3bff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc020061e:	86a6                	mv	a3,s1
ffffffffc0200620:	00004617          	auipc	a2,0x4
ffffffffc0200624:	c8860613          	addi	a2,a2,-888 # ffffffffc02042a8 <etext+0x588>
ffffffffc0200628:	0b900593          	li	a1,185
ffffffffc020062c:	00003517          	auipc	a0,0x3
ffffffffc0200630:	76c50513          	addi	a0,a0,1900 # ffffffffc0203d98 <etext+0x78>
ffffffffc0200634:	ab9ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200638:	00004517          	auipc	a0,0x4
ffffffffc020063c:	cc050513          	addi	a0,a0,-832 # ffffffffc02042f8 <etext+0x5d8>
ffffffffc0200640:	bf81                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200642:	00004517          	auipc	a0,0x4
ffffffffc0200646:	cd650513          	addi	a0,a0,-810 # ffffffffc0204318 <etext+0x5f8>
ffffffffc020064a:	b799                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc020064c:	00004517          	auipc	a0,0x4
ffffffffc0200650:	cec50513          	addi	a0,a0,-788 # ffffffffc0204338 <etext+0x618>
ffffffffc0200654:	bf35                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200656:	00004517          	auipc	a0,0x4
ffffffffc020065a:	d0250513          	addi	a0,a0,-766 # ffffffffc0204358 <etext+0x638>
ffffffffc020065e:	bf0d                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc0200660:	00004517          	auipc	a0,0x4
ffffffffc0200664:	d1850513          	addi	a0,a0,-744 # ffffffffc0204378 <etext+0x658>
ffffffffc0200668:	b725                	j	ffffffffc0200590 <exception_handler+0x50>
ffffffffc020066a:	00004517          	auipc	a0,0x4
ffffffffc020066e:	d2650513          	addi	a0,a0,-730 # ffffffffc0204390 <etext+0x670>
ffffffffc0200672:	a45ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200676:	8522                	mv	a0,s0
ffffffffc0200678:	b83ff0ef          	jal	ra,ffffffffc02001fa <pgfault_handler>
ffffffffc020067c:	84aa                	mv	s1,a0
ffffffffc020067e:	f00500e3          	beqz	a0,ffffffffc020057e <exception_handler+0x3e>
ffffffffc0200682:	8522                	mv	a0,s0
ffffffffc0200684:	dd1ff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc0200688:	86a6                	mv	a3,s1
ffffffffc020068a:	00004617          	auipc	a2,0x4
ffffffffc020068e:	c1e60613          	addi	a2,a2,-994 # ffffffffc02042a8 <etext+0x588>
ffffffffc0200692:	0cf00593          	li	a1,207
ffffffffc0200696:	00003517          	auipc	a0,0x3
ffffffffc020069a:	70250513          	addi	a0,a0,1794 # ffffffffc0203d98 <etext+0x78>
ffffffffc020069e:	a4fff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02006a2:	8522                	mv	a0,s0
ffffffffc02006a4:	6442                	ld	s0,16(sp)
ffffffffc02006a6:	60e2                	ld	ra,24(sp)
ffffffffc02006a8:	64a2                	ld	s1,8(sp)
ffffffffc02006aa:	6105                	addi	sp,sp,32
ffffffffc02006ac:	b365                	j	ffffffffc0200454 <print_trapframe>
ffffffffc02006ae:	8522                	mv	a0,s0
ffffffffc02006b0:	da5ff0ef          	jal	ra,ffffffffc0200454 <print_trapframe>
ffffffffc02006b4:	86a6                	mv	a3,s1
ffffffffc02006b6:	00004617          	auipc	a2,0x4
ffffffffc02006ba:	bf260613          	addi	a2,a2,-1038 # ffffffffc02042a8 <etext+0x588>
ffffffffc02006be:	0d600593          	li	a1,214
ffffffffc02006c2:	00003517          	auipc	a0,0x3
ffffffffc02006c6:	6d650513          	addi	a0,a0,1750 # ffffffffc0203d98 <etext+0x78>
ffffffffc02006ca:	a23ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02006ce <trap>:
ffffffffc02006ce:	11853783          	ld	a5,280(a0)
ffffffffc02006d2:	0007c363          	bltz	a5,ffffffffc02006d8 <trap+0xa>
ffffffffc02006d6:	b5ad                	j	ffffffffc0200540 <exception_handler>
ffffffffc02006d8:	bbf1                	j	ffffffffc02004b4 <interrupt_handler>
ffffffffc02006da:	0000                	unimp
ffffffffc02006dc:	0000                	unimp
	...

ffffffffc02006e0 <__alltraps>:
ffffffffc02006e0:	14011073          	csrw	sscratch,sp
ffffffffc02006e4:	712d                	addi	sp,sp,-288
ffffffffc02006e6:	e406                	sd	ra,8(sp)
ffffffffc02006e8:	ec0e                	sd	gp,24(sp)
ffffffffc02006ea:	f012                	sd	tp,32(sp)
ffffffffc02006ec:	f416                	sd	t0,40(sp)
ffffffffc02006ee:	f81a                	sd	t1,48(sp)
ffffffffc02006f0:	fc1e                	sd	t2,56(sp)
ffffffffc02006f2:	e0a2                	sd	s0,64(sp)
ffffffffc02006f4:	e4a6                	sd	s1,72(sp)
ffffffffc02006f6:	e8aa                	sd	a0,80(sp)
ffffffffc02006f8:	ecae                	sd	a1,88(sp)
ffffffffc02006fa:	f0b2                	sd	a2,96(sp)
ffffffffc02006fc:	f4b6                	sd	a3,104(sp)
ffffffffc02006fe:	f8ba                	sd	a4,112(sp)
ffffffffc0200700:	fcbe                	sd	a5,120(sp)
ffffffffc0200702:	e142                	sd	a6,128(sp)
ffffffffc0200704:	e546                	sd	a7,136(sp)
ffffffffc0200706:	e94a                	sd	s2,144(sp)
ffffffffc0200708:	ed4e                	sd	s3,152(sp)
ffffffffc020070a:	f152                	sd	s4,160(sp)
ffffffffc020070c:	f556                	sd	s5,168(sp)
ffffffffc020070e:	f95a                	sd	s6,176(sp)
ffffffffc0200710:	fd5e                	sd	s7,184(sp)
ffffffffc0200712:	e1e2                	sd	s8,192(sp)
ffffffffc0200714:	e5e6                	sd	s9,200(sp)
ffffffffc0200716:	e9ea                	sd	s10,208(sp)
ffffffffc0200718:	edee                	sd	s11,216(sp)
ffffffffc020071a:	f1f2                	sd	t3,224(sp)
ffffffffc020071c:	f5f6                	sd	t4,232(sp)
ffffffffc020071e:	f9fa                	sd	t5,240(sp)
ffffffffc0200720:	fdfe                	sd	t6,248(sp)
ffffffffc0200722:	14002473          	csrr	s0,sscratch
ffffffffc0200726:	100024f3          	csrr	s1,sstatus
ffffffffc020072a:	14102973          	csrr	s2,sepc
ffffffffc020072e:	143029f3          	csrr	s3,stval
ffffffffc0200732:	14202a73          	csrr	s4,scause
ffffffffc0200736:	e822                	sd	s0,16(sp)
ffffffffc0200738:	e226                	sd	s1,256(sp)
ffffffffc020073a:	e64a                	sd	s2,264(sp)
ffffffffc020073c:	ea4e                	sd	s3,272(sp)
ffffffffc020073e:	ee52                	sd	s4,280(sp)
ffffffffc0200740:	850a                	mv	a0,sp
ffffffffc0200742:	f8dff0ef          	jal	ra,ffffffffc02006ce <trap>

ffffffffc0200746 <__trapret>:
ffffffffc0200746:	6492                	ld	s1,256(sp)
ffffffffc0200748:	6932                	ld	s2,264(sp)
ffffffffc020074a:	10049073          	csrw	sstatus,s1
ffffffffc020074e:	14191073          	csrw	sepc,s2
ffffffffc0200752:	60a2                	ld	ra,8(sp)
ffffffffc0200754:	61e2                	ld	gp,24(sp)
ffffffffc0200756:	7202                	ld	tp,32(sp)
ffffffffc0200758:	72a2                	ld	t0,40(sp)
ffffffffc020075a:	7342                	ld	t1,48(sp)
ffffffffc020075c:	73e2                	ld	t2,56(sp)
ffffffffc020075e:	6406                	ld	s0,64(sp)
ffffffffc0200760:	64a6                	ld	s1,72(sp)
ffffffffc0200762:	6546                	ld	a0,80(sp)
ffffffffc0200764:	65e6                	ld	a1,88(sp)
ffffffffc0200766:	7606                	ld	a2,96(sp)
ffffffffc0200768:	76a6                	ld	a3,104(sp)
ffffffffc020076a:	7746                	ld	a4,112(sp)
ffffffffc020076c:	77e6                	ld	a5,120(sp)
ffffffffc020076e:	680a                	ld	a6,128(sp)
ffffffffc0200770:	68aa                	ld	a7,136(sp)
ffffffffc0200772:	694a                	ld	s2,144(sp)
ffffffffc0200774:	69ea                	ld	s3,152(sp)
ffffffffc0200776:	7a0a                	ld	s4,160(sp)
ffffffffc0200778:	7aaa                	ld	s5,168(sp)
ffffffffc020077a:	7b4a                	ld	s6,176(sp)
ffffffffc020077c:	7bea                	ld	s7,184(sp)
ffffffffc020077e:	6c0e                	ld	s8,192(sp)
ffffffffc0200780:	6cae                	ld	s9,200(sp)
ffffffffc0200782:	6d4e                	ld	s10,208(sp)
ffffffffc0200784:	6dee                	ld	s11,216(sp)
ffffffffc0200786:	7e0e                	ld	t3,224(sp)
ffffffffc0200788:	7eae                	ld	t4,232(sp)
ffffffffc020078a:	7f4e                	ld	t5,240(sp)
ffffffffc020078c:	7fee                	ld	t6,248(sp)
ffffffffc020078e:	6142                	ld	sp,16(sp)
ffffffffc0200790:	10200073          	sret
	...

ffffffffc02007a0 <pa2page.part.0>:
ffffffffc02007a0:	1141                	addi	sp,sp,-16
ffffffffc02007a2:	00004617          	auipc	a2,0x4
ffffffffc02007a6:	c5e60613          	addi	a2,a2,-930 # ffffffffc0204400 <etext+0x6e0>
ffffffffc02007aa:	06500593          	li	a1,101
ffffffffc02007ae:	00004517          	auipc	a0,0x4
ffffffffc02007b2:	c7250513          	addi	a0,a0,-910 # ffffffffc0204420 <etext+0x700>
ffffffffc02007b6:	e406                	sd	ra,8(sp)
ffffffffc02007b8:	935ff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02007bc <alloc_pages>:
ffffffffc02007bc:	7139                	addi	sp,sp,-64
ffffffffc02007be:	f426                	sd	s1,40(sp)
ffffffffc02007c0:	f04a                	sd	s2,32(sp)
ffffffffc02007c2:	ec4e                	sd	s3,24(sp)
ffffffffc02007c4:	e852                	sd	s4,16(sp)
ffffffffc02007c6:	e456                	sd	s5,8(sp)
ffffffffc02007c8:	e05a                	sd	s6,0(sp)
ffffffffc02007ca:	fc06                	sd	ra,56(sp)
ffffffffc02007cc:	f822                	sd	s0,48(sp)
ffffffffc02007ce:	84aa                	mv	s1,a0
ffffffffc02007d0:	00010917          	auipc	s2,0x10
ffffffffc02007d4:	8b090913          	addi	s2,s2,-1872 # ffffffffc0210080 <pmm_manager>
ffffffffc02007d8:	4a05                	li	s4,1
ffffffffc02007da:	00010a97          	auipc	s5,0x10
ffffffffc02007de:	896a8a93          	addi	s5,s5,-1898 # ffffffffc0210070 <swap_init_ok>
ffffffffc02007e2:	0005099b          	sext.w	s3,a0
ffffffffc02007e6:	00010b17          	auipc	s6,0x10
ffffffffc02007ea:	8bab0b13          	addi	s6,s6,-1862 # ffffffffc02100a0 <check_mm_struct>
ffffffffc02007ee:	a01d                	j	ffffffffc0200814 <alloc_pages+0x58>
ffffffffc02007f0:	00093783          	ld	a5,0(s2)
ffffffffc02007f4:	6f9c                	ld	a5,24(a5)
ffffffffc02007f6:	9782                	jalr	a5
ffffffffc02007f8:	842a                	mv	s0,a0
ffffffffc02007fa:	4601                	li	a2,0
ffffffffc02007fc:	85ce                	mv	a1,s3
ffffffffc02007fe:	ec0d                	bnez	s0,ffffffffc0200838 <alloc_pages+0x7c>
ffffffffc0200800:	029a6c63          	bltu	s4,s1,ffffffffc0200838 <alloc_pages+0x7c>
ffffffffc0200804:	000aa783          	lw	a5,0(s5)
ffffffffc0200808:	2781                	sext.w	a5,a5
ffffffffc020080a:	c79d                	beqz	a5,ffffffffc0200838 <alloc_pages+0x7c>
ffffffffc020080c:	000b3503          	ld	a0,0(s6)
ffffffffc0200810:	607010ef          	jal	ra,ffffffffc0202616 <swap_out>
ffffffffc0200814:	100027f3          	csrr	a5,sstatus
ffffffffc0200818:	8b89                	andi	a5,a5,2
ffffffffc020081a:	8526                	mv	a0,s1
ffffffffc020081c:	dbf1                	beqz	a5,ffffffffc02007f0 <alloc_pages+0x34>
ffffffffc020081e:	9d7ff0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0200822:	00093783          	ld	a5,0(s2)
ffffffffc0200826:	8526                	mv	a0,s1
ffffffffc0200828:	6f9c                	ld	a5,24(a5)
ffffffffc020082a:	9782                	jalr	a5
ffffffffc020082c:	842a                	mv	s0,a0
ffffffffc020082e:	9c1ff0ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc0200832:	4601                	li	a2,0
ffffffffc0200834:	85ce                	mv	a1,s3
ffffffffc0200836:	d469                	beqz	s0,ffffffffc0200800 <alloc_pages+0x44>
ffffffffc0200838:	70e2                	ld	ra,56(sp)
ffffffffc020083a:	8522                	mv	a0,s0
ffffffffc020083c:	7442                	ld	s0,48(sp)
ffffffffc020083e:	74a2                	ld	s1,40(sp)
ffffffffc0200840:	7902                	ld	s2,32(sp)
ffffffffc0200842:	69e2                	ld	s3,24(sp)
ffffffffc0200844:	6a42                	ld	s4,16(sp)
ffffffffc0200846:	6aa2                	ld	s5,8(sp)
ffffffffc0200848:	6b02                	ld	s6,0(sp)
ffffffffc020084a:	6121                	addi	sp,sp,64
ffffffffc020084c:	8082                	ret

ffffffffc020084e <free_pages>:
ffffffffc020084e:	100027f3          	csrr	a5,sstatus
ffffffffc0200852:	8b89                	andi	a5,a5,2
ffffffffc0200854:	eb81                	bnez	a5,ffffffffc0200864 <free_pages+0x16>
ffffffffc0200856:	00010797          	auipc	a5,0x10
ffffffffc020085a:	82a7b783          	ld	a5,-2006(a5) # ffffffffc0210080 <pmm_manager>
ffffffffc020085e:	0207b303          	ld	t1,32(a5)
ffffffffc0200862:	8302                	jr	t1
ffffffffc0200864:	1101                	addi	sp,sp,-32
ffffffffc0200866:	ec06                	sd	ra,24(sp)
ffffffffc0200868:	e822                	sd	s0,16(sp)
ffffffffc020086a:	e426                	sd	s1,8(sp)
ffffffffc020086c:	842a                	mv	s0,a0
ffffffffc020086e:	84ae                	mv	s1,a1
ffffffffc0200870:	985ff0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc0200874:	00010797          	auipc	a5,0x10
ffffffffc0200878:	80c7b783          	ld	a5,-2036(a5) # ffffffffc0210080 <pmm_manager>
ffffffffc020087c:	739c                	ld	a5,32(a5)
ffffffffc020087e:	85a6                	mv	a1,s1
ffffffffc0200880:	8522                	mv	a0,s0
ffffffffc0200882:	9782                	jalr	a5
ffffffffc0200884:	6442                	ld	s0,16(sp)
ffffffffc0200886:	60e2                	ld	ra,24(sp)
ffffffffc0200888:	64a2                	ld	s1,8(sp)
ffffffffc020088a:	6105                	addi	sp,sp,32
ffffffffc020088c:	963ff06f          	j	ffffffffc02001ee <intr_enable>

ffffffffc0200890 <nr_free_pages>:
ffffffffc0200890:	100027f3          	csrr	a5,sstatus
ffffffffc0200894:	8b89                	andi	a5,a5,2
ffffffffc0200896:	eb81                	bnez	a5,ffffffffc02008a6 <nr_free_pages+0x16>
ffffffffc0200898:	0000f797          	auipc	a5,0xf
ffffffffc020089c:	7e87b783          	ld	a5,2024(a5) # ffffffffc0210080 <pmm_manager>
ffffffffc02008a0:	0287b303          	ld	t1,40(a5)
ffffffffc02008a4:	8302                	jr	t1
ffffffffc02008a6:	1141                	addi	sp,sp,-16
ffffffffc02008a8:	e406                	sd	ra,8(sp)
ffffffffc02008aa:	e022                	sd	s0,0(sp)
ffffffffc02008ac:	949ff0ef          	jal	ra,ffffffffc02001f4 <intr_disable>
ffffffffc02008b0:	0000f797          	auipc	a5,0xf
ffffffffc02008b4:	7d07b783          	ld	a5,2000(a5) # ffffffffc0210080 <pmm_manager>
ffffffffc02008b8:	779c                	ld	a5,40(a5)
ffffffffc02008ba:	9782                	jalr	a5
ffffffffc02008bc:	842a                	mv	s0,a0
ffffffffc02008be:	931ff0ef          	jal	ra,ffffffffc02001ee <intr_enable>
ffffffffc02008c2:	60a2                	ld	ra,8(sp)
ffffffffc02008c4:	8522                	mv	a0,s0
ffffffffc02008c6:	6402                	ld	s0,0(sp)
ffffffffc02008c8:	0141                	addi	sp,sp,16
ffffffffc02008ca:	8082                	ret

ffffffffc02008cc <get_pte>:
ffffffffc02008cc:	01e5d793          	srli	a5,a1,0x1e
ffffffffc02008d0:	1ff7f793          	andi	a5,a5,511
ffffffffc02008d4:	715d                	addi	sp,sp,-80
ffffffffc02008d6:	078e                	slli	a5,a5,0x3
ffffffffc02008d8:	fc26                	sd	s1,56(sp)
ffffffffc02008da:	00f504b3          	add	s1,a0,a5
ffffffffc02008de:	6094                	ld	a3,0(s1)
ffffffffc02008e0:	f84a                	sd	s2,48(sp)
ffffffffc02008e2:	f44e                	sd	s3,40(sp)
ffffffffc02008e4:	f052                	sd	s4,32(sp)
ffffffffc02008e6:	e486                	sd	ra,72(sp)
ffffffffc02008e8:	e0a2                	sd	s0,64(sp)
ffffffffc02008ea:	ec56                	sd	s5,24(sp)
ffffffffc02008ec:	e85a                	sd	s6,16(sp)
ffffffffc02008ee:	e45e                	sd	s7,8(sp)
ffffffffc02008f0:	0016f793          	andi	a5,a3,1
ffffffffc02008f4:	892e                	mv	s2,a1
ffffffffc02008f6:	8a32                	mv	s4,a2
ffffffffc02008f8:	0000f997          	auipc	s3,0xf
ffffffffc02008fc:	76098993          	addi	s3,s3,1888 # ffffffffc0210058 <npage>
ffffffffc0200900:	efb5                	bnez	a5,ffffffffc020097c <get_pte+0xb0>
ffffffffc0200902:	14060c63          	beqz	a2,ffffffffc0200a5a <get_pte+0x18e>
ffffffffc0200906:	4505                	li	a0,1
ffffffffc0200908:	eb5ff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc020090c:	842a                	mv	s0,a0
ffffffffc020090e:	14050663          	beqz	a0,ffffffffc0200a5a <get_pte+0x18e>
ffffffffc0200912:	0000fb97          	auipc	s7,0xf
ffffffffc0200916:	786b8b93          	addi	s7,s7,1926 # ffffffffc0210098 <pages>
ffffffffc020091a:	000bb503          	ld	a0,0(s7)
ffffffffc020091e:	00005b17          	auipc	s6,0x5
ffffffffc0200922:	02ab3b03          	ld	s6,42(s6) # ffffffffc0205948 <error_string+0x38>
ffffffffc0200926:	00080ab7          	lui	s5,0x80
ffffffffc020092a:	40a40533          	sub	a0,s0,a0
ffffffffc020092e:	850d                	srai	a0,a0,0x3
ffffffffc0200930:	03650533          	mul	a0,a0,s6
ffffffffc0200934:	0000f997          	auipc	s3,0xf
ffffffffc0200938:	72498993          	addi	s3,s3,1828 # ffffffffc0210058 <npage>
ffffffffc020093c:	4785                	li	a5,1
ffffffffc020093e:	0009b703          	ld	a4,0(s3)
ffffffffc0200942:	c01c                	sw	a5,0(s0)
ffffffffc0200944:	9556                	add	a0,a0,s5
ffffffffc0200946:	00c51793          	slli	a5,a0,0xc
ffffffffc020094a:	83b1                	srli	a5,a5,0xc
ffffffffc020094c:	0532                	slli	a0,a0,0xc
ffffffffc020094e:	14e7fd63          	bgeu	a5,a4,ffffffffc0200aa8 <get_pte+0x1dc>
ffffffffc0200952:	0000f797          	auipc	a5,0xf
ffffffffc0200956:	73e7b783          	ld	a5,1854(a5) # ffffffffc0210090 <va_pa_offset>
ffffffffc020095a:	6605                	lui	a2,0x1
ffffffffc020095c:	4581                	li	a1,0
ffffffffc020095e:	953e                	add	a0,a0,a5
ffffffffc0200960:	7a9020ef          	jal	ra,ffffffffc0203908 <memset>
ffffffffc0200964:	000bb683          	ld	a3,0(s7)
ffffffffc0200968:	40d406b3          	sub	a3,s0,a3
ffffffffc020096c:	868d                	srai	a3,a3,0x3
ffffffffc020096e:	036686b3          	mul	a3,a3,s6
ffffffffc0200972:	96d6                	add	a3,a3,s5
ffffffffc0200974:	06aa                	slli	a3,a3,0xa
ffffffffc0200976:	0116e693          	ori	a3,a3,17
ffffffffc020097a:	e094                	sd	a3,0(s1)
ffffffffc020097c:	77fd                	lui	a5,0xfffff
ffffffffc020097e:	068a                	slli	a3,a3,0x2
ffffffffc0200980:	0009b703          	ld	a4,0(s3)
ffffffffc0200984:	8efd                	and	a3,a3,a5
ffffffffc0200986:	00c6d793          	srli	a5,a3,0xc
ffffffffc020098a:	0ce7fa63          	bgeu	a5,a4,ffffffffc0200a5e <get_pte+0x192>
ffffffffc020098e:	0000fa97          	auipc	s5,0xf
ffffffffc0200992:	702a8a93          	addi	s5,s5,1794 # ffffffffc0210090 <va_pa_offset>
ffffffffc0200996:	000ab403          	ld	s0,0(s5)
ffffffffc020099a:	01595793          	srli	a5,s2,0x15
ffffffffc020099e:	1ff7f793          	andi	a5,a5,511
ffffffffc02009a2:	96a2                	add	a3,a3,s0
ffffffffc02009a4:	00379413          	slli	s0,a5,0x3
ffffffffc02009a8:	9436                	add	s0,s0,a3
ffffffffc02009aa:	6014                	ld	a3,0(s0)
ffffffffc02009ac:	0016f793          	andi	a5,a3,1
ffffffffc02009b0:	ebad                	bnez	a5,ffffffffc0200a22 <get_pte+0x156>
ffffffffc02009b2:	0a0a0463          	beqz	s4,ffffffffc0200a5a <get_pte+0x18e>
ffffffffc02009b6:	4505                	li	a0,1
ffffffffc02009b8:	e05ff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc02009bc:	84aa                	mv	s1,a0
ffffffffc02009be:	cd51                	beqz	a0,ffffffffc0200a5a <get_pte+0x18e>
ffffffffc02009c0:	0000fb97          	auipc	s7,0xf
ffffffffc02009c4:	6d8b8b93          	addi	s7,s7,1752 # ffffffffc0210098 <pages>
ffffffffc02009c8:	000bb503          	ld	a0,0(s7)
ffffffffc02009cc:	00005b17          	auipc	s6,0x5
ffffffffc02009d0:	f7cb3b03          	ld	s6,-132(s6) # ffffffffc0205948 <error_string+0x38>
ffffffffc02009d4:	00080a37          	lui	s4,0x80
ffffffffc02009d8:	40a48533          	sub	a0,s1,a0
ffffffffc02009dc:	850d                	srai	a0,a0,0x3
ffffffffc02009de:	03650533          	mul	a0,a0,s6
ffffffffc02009e2:	4785                	li	a5,1
ffffffffc02009e4:	0009b703          	ld	a4,0(s3)
ffffffffc02009e8:	c09c                	sw	a5,0(s1)
ffffffffc02009ea:	9552                	add	a0,a0,s4
ffffffffc02009ec:	00c51793          	slli	a5,a0,0xc
ffffffffc02009f0:	83b1                	srli	a5,a5,0xc
ffffffffc02009f2:	0532                	slli	a0,a0,0xc
ffffffffc02009f4:	08e7fd63          	bgeu	a5,a4,ffffffffc0200a8e <get_pte+0x1c2>
ffffffffc02009f8:	000ab783          	ld	a5,0(s5)
ffffffffc02009fc:	6605                	lui	a2,0x1
ffffffffc02009fe:	4581                	li	a1,0
ffffffffc0200a00:	953e                	add	a0,a0,a5
ffffffffc0200a02:	707020ef          	jal	ra,ffffffffc0203908 <memset>
ffffffffc0200a06:	000bb683          	ld	a3,0(s7)
ffffffffc0200a0a:	40d486b3          	sub	a3,s1,a3
ffffffffc0200a0e:	868d                	srai	a3,a3,0x3
ffffffffc0200a10:	036686b3          	mul	a3,a3,s6
ffffffffc0200a14:	96d2                	add	a3,a3,s4
ffffffffc0200a16:	06aa                	slli	a3,a3,0xa
ffffffffc0200a18:	0116e693          	ori	a3,a3,17
ffffffffc0200a1c:	e014                	sd	a3,0(s0)
ffffffffc0200a1e:	0009b703          	ld	a4,0(s3)
ffffffffc0200a22:	068a                	slli	a3,a3,0x2
ffffffffc0200a24:	757d                	lui	a0,0xfffff
ffffffffc0200a26:	8ee9                	and	a3,a3,a0
ffffffffc0200a28:	00c6d793          	srli	a5,a3,0xc
ffffffffc0200a2c:	04e7f563          	bgeu	a5,a4,ffffffffc0200a76 <get_pte+0x1aa>
ffffffffc0200a30:	000ab503          	ld	a0,0(s5)
ffffffffc0200a34:	00c95913          	srli	s2,s2,0xc
ffffffffc0200a38:	1ff97913          	andi	s2,s2,511
ffffffffc0200a3c:	96aa                	add	a3,a3,a0
ffffffffc0200a3e:	00391513          	slli	a0,s2,0x3
ffffffffc0200a42:	9536                	add	a0,a0,a3
ffffffffc0200a44:	60a6                	ld	ra,72(sp)
ffffffffc0200a46:	6406                	ld	s0,64(sp)
ffffffffc0200a48:	74e2                	ld	s1,56(sp)
ffffffffc0200a4a:	7942                	ld	s2,48(sp)
ffffffffc0200a4c:	79a2                	ld	s3,40(sp)
ffffffffc0200a4e:	7a02                	ld	s4,32(sp)
ffffffffc0200a50:	6ae2                	ld	s5,24(sp)
ffffffffc0200a52:	6b42                	ld	s6,16(sp)
ffffffffc0200a54:	6ba2                	ld	s7,8(sp)
ffffffffc0200a56:	6161                	addi	sp,sp,80
ffffffffc0200a58:	8082                	ret
ffffffffc0200a5a:	4501                	li	a0,0
ffffffffc0200a5c:	b7e5                	j	ffffffffc0200a44 <get_pte+0x178>
ffffffffc0200a5e:	00004617          	auipc	a2,0x4
ffffffffc0200a62:	9d260613          	addi	a2,a2,-1582 # ffffffffc0204430 <etext+0x710>
ffffffffc0200a66:	0e800593          	li	a1,232
ffffffffc0200a6a:	00004517          	auipc	a0,0x4
ffffffffc0200a6e:	9ee50513          	addi	a0,a0,-1554 # ffffffffc0204458 <etext+0x738>
ffffffffc0200a72:	e7aff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a76:	00004617          	auipc	a2,0x4
ffffffffc0200a7a:	9ba60613          	addi	a2,a2,-1606 # ffffffffc0204430 <etext+0x710>
ffffffffc0200a7e:	0f300593          	li	a1,243
ffffffffc0200a82:	00004517          	auipc	a0,0x4
ffffffffc0200a86:	9d650513          	addi	a0,a0,-1578 # ffffffffc0204458 <etext+0x738>
ffffffffc0200a8a:	e62ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200a8e:	86aa                	mv	a3,a0
ffffffffc0200a90:	00004617          	auipc	a2,0x4
ffffffffc0200a94:	9a060613          	addi	a2,a2,-1632 # ffffffffc0204430 <etext+0x710>
ffffffffc0200a98:	0f000593          	li	a1,240
ffffffffc0200a9c:	00004517          	auipc	a0,0x4
ffffffffc0200aa0:	9bc50513          	addi	a0,a0,-1604 # ffffffffc0204458 <etext+0x738>
ffffffffc0200aa4:	e48ff0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0200aa8:	86aa                	mv	a3,a0
ffffffffc0200aaa:	00004617          	auipc	a2,0x4
ffffffffc0200aae:	98660613          	addi	a2,a2,-1658 # ffffffffc0204430 <etext+0x710>
ffffffffc0200ab2:	0e500593          	li	a1,229
ffffffffc0200ab6:	00004517          	auipc	a0,0x4
ffffffffc0200aba:	9a250513          	addi	a0,a0,-1630 # ffffffffc0204458 <etext+0x738>
ffffffffc0200abe:	e2eff0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0200ac2 <get_page>:
ffffffffc0200ac2:	1141                	addi	sp,sp,-16
ffffffffc0200ac4:	e022                	sd	s0,0(sp)
ffffffffc0200ac6:	8432                	mv	s0,a2
ffffffffc0200ac8:	4601                	li	a2,0
ffffffffc0200aca:	e406                	sd	ra,8(sp)
ffffffffc0200acc:	e01ff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200ad0:	c011                	beqz	s0,ffffffffc0200ad4 <get_page+0x12>
ffffffffc0200ad2:	e008                	sd	a0,0(s0)
ffffffffc0200ad4:	c511                	beqz	a0,ffffffffc0200ae0 <get_page+0x1e>
ffffffffc0200ad6:	611c                	ld	a5,0(a0)
ffffffffc0200ad8:	4501                	li	a0,0
ffffffffc0200ada:	0017f713          	andi	a4,a5,1
ffffffffc0200ade:	e709                	bnez	a4,ffffffffc0200ae8 <get_page+0x26>
ffffffffc0200ae0:	60a2                	ld	ra,8(sp)
ffffffffc0200ae2:	6402                	ld	s0,0(sp)
ffffffffc0200ae4:	0141                	addi	sp,sp,16
ffffffffc0200ae6:	8082                	ret
ffffffffc0200ae8:	078a                	slli	a5,a5,0x2
ffffffffc0200aea:	83b1                	srli	a5,a5,0xc
ffffffffc0200aec:	0000f717          	auipc	a4,0xf
ffffffffc0200af0:	56c73703          	ld	a4,1388(a4) # ffffffffc0210058 <npage>
ffffffffc0200af4:	02e7f263          	bgeu	a5,a4,ffffffffc0200b18 <get_page+0x56>
ffffffffc0200af8:	fff80537          	lui	a0,0xfff80
ffffffffc0200afc:	97aa                	add	a5,a5,a0
ffffffffc0200afe:	60a2                	ld	ra,8(sp)
ffffffffc0200b00:	6402                	ld	s0,0(sp)
ffffffffc0200b02:	00379513          	slli	a0,a5,0x3
ffffffffc0200b06:	97aa                	add	a5,a5,a0
ffffffffc0200b08:	078e                	slli	a5,a5,0x3
ffffffffc0200b0a:	0000f517          	auipc	a0,0xf
ffffffffc0200b0e:	58e53503          	ld	a0,1422(a0) # ffffffffc0210098 <pages>
ffffffffc0200b12:	953e                	add	a0,a0,a5
ffffffffc0200b14:	0141                	addi	sp,sp,16
ffffffffc0200b16:	8082                	ret
ffffffffc0200b18:	c89ff0ef          	jal	ra,ffffffffc02007a0 <pa2page.part.0>

ffffffffc0200b1c <page_remove>:
ffffffffc0200b1c:	1141                	addi	sp,sp,-16
ffffffffc0200b1e:	4601                	li	a2,0
ffffffffc0200b20:	e406                	sd	ra,8(sp)
ffffffffc0200b22:	e022                	sd	s0,0(sp)
ffffffffc0200b24:	da9ff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200b28:	c511                	beqz	a0,ffffffffc0200b34 <page_remove+0x18>
ffffffffc0200b2a:	611c                	ld	a5,0(a0)
ffffffffc0200b2c:	842a                	mv	s0,a0
ffffffffc0200b2e:	0017f713          	andi	a4,a5,1
ffffffffc0200b32:	e709                	bnez	a4,ffffffffc0200b3c <page_remove+0x20>
ffffffffc0200b34:	60a2                	ld	ra,8(sp)
ffffffffc0200b36:	6402                	ld	s0,0(sp)
ffffffffc0200b38:	0141                	addi	sp,sp,16
ffffffffc0200b3a:	8082                	ret
ffffffffc0200b3c:	078a                	slli	a5,a5,0x2
ffffffffc0200b3e:	83b1                	srli	a5,a5,0xc
ffffffffc0200b40:	0000f717          	auipc	a4,0xf
ffffffffc0200b44:	51873703          	ld	a4,1304(a4) # ffffffffc0210058 <npage>
ffffffffc0200b48:	02e7ff63          	bgeu	a5,a4,ffffffffc0200b86 <page_remove+0x6a>
ffffffffc0200b4c:	fff80737          	lui	a4,0xfff80
ffffffffc0200b50:	97ba                	add	a5,a5,a4
ffffffffc0200b52:	00379513          	slli	a0,a5,0x3
ffffffffc0200b56:	97aa                	add	a5,a5,a0
ffffffffc0200b58:	078e                	slli	a5,a5,0x3
ffffffffc0200b5a:	0000f517          	auipc	a0,0xf
ffffffffc0200b5e:	53e53503          	ld	a0,1342(a0) # ffffffffc0210098 <pages>
ffffffffc0200b62:	953e                	add	a0,a0,a5
ffffffffc0200b64:	411c                	lw	a5,0(a0)
ffffffffc0200b66:	fff7871b          	addiw	a4,a5,-1
ffffffffc0200b6a:	c118                	sw	a4,0(a0)
ffffffffc0200b6c:	cb09                	beqz	a4,ffffffffc0200b7e <page_remove+0x62>
ffffffffc0200b6e:	00043023          	sd	zero,0(s0)
ffffffffc0200b72:	12000073          	sfence.vma
ffffffffc0200b76:	60a2                	ld	ra,8(sp)
ffffffffc0200b78:	6402                	ld	s0,0(sp)
ffffffffc0200b7a:	0141                	addi	sp,sp,16
ffffffffc0200b7c:	8082                	ret
ffffffffc0200b7e:	4585                	li	a1,1
ffffffffc0200b80:	ccfff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200b84:	b7ed                	j	ffffffffc0200b6e <page_remove+0x52>
ffffffffc0200b86:	c1bff0ef          	jal	ra,ffffffffc02007a0 <pa2page.part.0>

ffffffffc0200b8a <page_insert>:
ffffffffc0200b8a:	7179                	addi	sp,sp,-48
ffffffffc0200b8c:	87b2                	mv	a5,a2
ffffffffc0200b8e:	f022                	sd	s0,32(sp)
ffffffffc0200b90:	4605                	li	a2,1
ffffffffc0200b92:	842e                	mv	s0,a1
ffffffffc0200b94:	85be                	mv	a1,a5
ffffffffc0200b96:	ec26                	sd	s1,24(sp)
ffffffffc0200b98:	f406                	sd	ra,40(sp)
ffffffffc0200b9a:	e84a                	sd	s2,16(sp)
ffffffffc0200b9c:	e44e                	sd	s3,8(sp)
ffffffffc0200b9e:	84b6                	mv	s1,a3
ffffffffc0200ba0:	d2dff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200ba4:	c54d                	beqz	a0,ffffffffc0200c4e <page_insert+0xc4>
ffffffffc0200ba6:	4014                	lw	a3,0(s0)
ffffffffc0200ba8:	611c                	ld	a5,0(a0)
ffffffffc0200baa:	892a                	mv	s2,a0
ffffffffc0200bac:	0016871b          	addiw	a4,a3,1
ffffffffc0200bb0:	c018                	sw	a4,0(s0)
ffffffffc0200bb2:	0017f713          	andi	a4,a5,1
ffffffffc0200bb6:	e329                	bnez	a4,ffffffffc0200bf8 <page_insert+0x6e>
ffffffffc0200bb8:	0000f797          	auipc	a5,0xf
ffffffffc0200bbc:	4e07b783          	ld	a5,1248(a5) # ffffffffc0210098 <pages>
ffffffffc0200bc0:	40f407b3          	sub	a5,s0,a5
ffffffffc0200bc4:	878d                	srai	a5,a5,0x3
ffffffffc0200bc6:	00005417          	auipc	s0,0x5
ffffffffc0200bca:	d8243403          	ld	s0,-638(s0) # ffffffffc0205948 <error_string+0x38>
ffffffffc0200bce:	028787b3          	mul	a5,a5,s0
ffffffffc0200bd2:	00080437          	lui	s0,0x80
ffffffffc0200bd6:	97a2                	add	a5,a5,s0
ffffffffc0200bd8:	07aa                	slli	a5,a5,0xa
ffffffffc0200bda:	8fc5                	or	a5,a5,s1
ffffffffc0200bdc:	0017e793          	ori	a5,a5,1
ffffffffc0200be0:	00f93023          	sd	a5,0(s2)
ffffffffc0200be4:	12000073          	sfence.vma
ffffffffc0200be8:	4501                	li	a0,0
ffffffffc0200bea:	70a2                	ld	ra,40(sp)
ffffffffc0200bec:	7402                	ld	s0,32(sp)
ffffffffc0200bee:	64e2                	ld	s1,24(sp)
ffffffffc0200bf0:	6942                	ld	s2,16(sp)
ffffffffc0200bf2:	69a2                	ld	s3,8(sp)
ffffffffc0200bf4:	6145                	addi	sp,sp,48
ffffffffc0200bf6:	8082                	ret
ffffffffc0200bf8:	00279513          	slli	a0,a5,0x2
ffffffffc0200bfc:	8131                	srli	a0,a0,0xc
ffffffffc0200bfe:	0000f797          	auipc	a5,0xf
ffffffffc0200c02:	45a7b783          	ld	a5,1114(a5) # ffffffffc0210058 <npage>
ffffffffc0200c06:	04f57663          	bgeu	a0,a5,ffffffffc0200c52 <page_insert+0xc8>
ffffffffc0200c0a:	fff807b7          	lui	a5,0xfff80
ffffffffc0200c0e:	953e                	add	a0,a0,a5
ffffffffc0200c10:	0000f997          	auipc	s3,0xf
ffffffffc0200c14:	48898993          	addi	s3,s3,1160 # ffffffffc0210098 <pages>
ffffffffc0200c18:	0009b783          	ld	a5,0(s3)
ffffffffc0200c1c:	00351713          	slli	a4,a0,0x3
ffffffffc0200c20:	953a                	add	a0,a0,a4
ffffffffc0200c22:	050e                	slli	a0,a0,0x3
ffffffffc0200c24:	953e                	add	a0,a0,a5
ffffffffc0200c26:	00a40e63          	beq	s0,a0,ffffffffc0200c42 <page_insert+0xb8>
ffffffffc0200c2a:	411c                	lw	a5,0(a0)
ffffffffc0200c2c:	fff7871b          	addiw	a4,a5,-1
ffffffffc0200c30:	c118                	sw	a4,0(a0)
ffffffffc0200c32:	cb11                	beqz	a4,ffffffffc0200c46 <page_insert+0xbc>
ffffffffc0200c34:	00093023          	sd	zero,0(s2)
ffffffffc0200c38:	12000073          	sfence.vma
ffffffffc0200c3c:	0009b783          	ld	a5,0(s3)
ffffffffc0200c40:	b741                	j	ffffffffc0200bc0 <page_insert+0x36>
ffffffffc0200c42:	c014                	sw	a3,0(s0)
ffffffffc0200c44:	bfb5                	j	ffffffffc0200bc0 <page_insert+0x36>
ffffffffc0200c46:	4585                	li	a1,1
ffffffffc0200c48:	c07ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200c4c:	b7e5                	j	ffffffffc0200c34 <page_insert+0xaa>
ffffffffc0200c4e:	5571                	li	a0,-4
ffffffffc0200c50:	bf69                	j	ffffffffc0200bea <page_insert+0x60>
ffffffffc0200c52:	b4fff0ef          	jal	ra,ffffffffc02007a0 <pa2page.part.0>

ffffffffc0200c56 <pmm_init>:
ffffffffc0200c56:	00005797          	auipc	a5,0x5
ffffffffc0200c5a:	a1a78793          	addi	a5,a5,-1510 # ffffffffc0205670 <default_pmm_manager>
ffffffffc0200c5e:	638c                	ld	a1,0(a5)
ffffffffc0200c60:	7139                	addi	sp,sp,-64
ffffffffc0200c62:	fc06                	sd	ra,56(sp)
ffffffffc0200c64:	f822                	sd	s0,48(sp)
ffffffffc0200c66:	f426                	sd	s1,40(sp)
ffffffffc0200c68:	f04a                	sd	s2,32(sp)
ffffffffc0200c6a:	ec4e                	sd	s3,24(sp)
ffffffffc0200c6c:	e852                	sd	s4,16(sp)
ffffffffc0200c6e:	e456                	sd	s5,8(sp)
ffffffffc0200c70:	e05a                	sd	s6,0(sp)
ffffffffc0200c72:	0000fa17          	auipc	s4,0xf
ffffffffc0200c76:	40ea0a13          	addi	s4,s4,1038 # ffffffffc0210080 <pmm_manager>
ffffffffc0200c7a:	00003517          	auipc	a0,0x3
ffffffffc0200c7e:	7ee50513          	addi	a0,a0,2030 # ffffffffc0204468 <etext+0x748>
ffffffffc0200c82:	00fa3023          	sd	a5,0(s4)
ffffffffc0200c86:	c30ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200c8a:	000a3783          	ld	a5,0(s4)
ffffffffc0200c8e:	40100913          	li	s2,1025
ffffffffc0200c92:	4445                	li	s0,17
ffffffffc0200c94:	679c                	ld	a5,8(a5)
ffffffffc0200c96:	0000f997          	auipc	s3,0xf
ffffffffc0200c9a:	3fa98993          	addi	s3,s3,1018 # ffffffffc0210090 <va_pa_offset>
ffffffffc0200c9e:	0000f497          	auipc	s1,0xf
ffffffffc0200ca2:	3ba48493          	addi	s1,s1,954 # ffffffffc0210058 <npage>
ffffffffc0200ca6:	9782                	jalr	a5
ffffffffc0200ca8:	57f5                	li	a5,-3
ffffffffc0200caa:	07fa                	slli	a5,a5,0x1e
ffffffffc0200cac:	01591593          	slli	a1,s2,0x15
ffffffffc0200cb0:	07e006b7          	lui	a3,0x7e00
ffffffffc0200cb4:	01b41613          	slli	a2,s0,0x1b
ffffffffc0200cb8:	00003517          	auipc	a0,0x3
ffffffffc0200cbc:	7c850513          	addi	a0,a0,1992 # ffffffffc0204480 <etext+0x760>
ffffffffc0200cc0:	00f9b023          	sd	a5,0(s3)
ffffffffc0200cc4:	bf2ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200cc8:	00003517          	auipc	a0,0x3
ffffffffc0200ccc:	7e850513          	addi	a0,a0,2024 # ffffffffc02044b0 <etext+0x790>
ffffffffc0200cd0:	be6ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200cd4:	01b41693          	slli	a3,s0,0x1b
ffffffffc0200cd8:	01591613          	slli	a2,s2,0x15
ffffffffc0200cdc:	16fd                	addi	a3,a3,-1
ffffffffc0200cde:	07e005b7          	lui	a1,0x7e00
ffffffffc0200ce2:	00003517          	auipc	a0,0x3
ffffffffc0200ce6:	7e650513          	addi	a0,a0,2022 # ffffffffc02044c8 <etext+0x7a8>
ffffffffc0200cea:	bccff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200cee:	777d                	lui	a4,0xfffff
ffffffffc0200cf0:	00010797          	auipc	a5,0x10
ffffffffc0200cf4:	4af78793          	addi	a5,a5,1199 # ffffffffc021119f <end+0xfff>
ffffffffc0200cf8:	8ff9                	and	a5,a5,a4
ffffffffc0200cfa:	0000f917          	auipc	s2,0xf
ffffffffc0200cfe:	39e90913          	addi	s2,s2,926 # ffffffffc0210098 <pages>
ffffffffc0200d02:	00088737          	lui	a4,0x88
ffffffffc0200d06:	e098                	sd	a4,0(s1)
ffffffffc0200d08:	00f93023          	sd	a5,0(s2)
ffffffffc0200d0c:	4681                	li	a3,0
ffffffffc0200d0e:	4701                	li	a4,0
ffffffffc0200d10:	4585                	li	a1,1
ffffffffc0200d12:	fff80637          	lui	a2,0xfff80
ffffffffc0200d16:	a019                	j	ffffffffc0200d1c <pmm_init+0xc6>
ffffffffc0200d18:	00093783          	ld	a5,0(s2)
ffffffffc0200d1c:	97b6                	add	a5,a5,a3
ffffffffc0200d1e:	07a1                	addi	a5,a5,8
ffffffffc0200d20:	40b7b02f          	amoor.d	zero,a1,(a5)
ffffffffc0200d24:	609c                	ld	a5,0(s1)
ffffffffc0200d26:	0705                	addi	a4,a4,1
ffffffffc0200d28:	04868693          	addi	a3,a3,72 # 7e00048 <kern_entry-0xffffffffb83fffb8>
ffffffffc0200d2c:	00c78533          	add	a0,a5,a2
ffffffffc0200d30:	fea764e3          	bltu	a4,a0,ffffffffc0200d18 <pmm_init+0xc2>
ffffffffc0200d34:	00093503          	ld	a0,0(s2)
ffffffffc0200d38:	00379693          	slli	a3,a5,0x3
ffffffffc0200d3c:	96be                	add	a3,a3,a5
ffffffffc0200d3e:	fdc00737          	lui	a4,0xfdc00
ffffffffc0200d42:	972a                	add	a4,a4,a0
ffffffffc0200d44:	068e                	slli	a3,a3,0x3
ffffffffc0200d46:	96ba                	add	a3,a3,a4
ffffffffc0200d48:	c0200737          	lui	a4,0xc0200
ffffffffc0200d4c:	68e6ef63          	bltu	a3,a4,ffffffffc02013ea <pmm_init+0x794>
ffffffffc0200d50:	0009b703          	ld	a4,0(s3)
ffffffffc0200d54:	45c5                	li	a1,17
ffffffffc0200d56:	05ee                	slli	a1,a1,0x1b
ffffffffc0200d58:	8e99                	sub	a3,a3,a4
ffffffffc0200d5a:	34b6ec63          	bltu	a3,a1,ffffffffc02010b2 <pmm_init+0x45c>
ffffffffc0200d5e:	000a3783          	ld	a5,0(s4)
ffffffffc0200d62:	0000f417          	auipc	s0,0xf
ffffffffc0200d66:	2ee40413          	addi	s0,s0,750 # ffffffffc0210050 <boot_pgdir>
ffffffffc0200d6a:	7b9c                	ld	a5,48(a5)
ffffffffc0200d6c:	9782                	jalr	a5
ffffffffc0200d6e:	00003517          	auipc	a0,0x3
ffffffffc0200d72:	7aa50513          	addi	a0,a0,1962 # ffffffffc0204518 <etext+0x7f8>
ffffffffc0200d76:	b40ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200d7a:	00007517          	auipc	a0,0x7
ffffffffc0200d7e:	28650513          	addi	a0,a0,646 # ffffffffc0208000 <boot_page_table_sv39>
ffffffffc0200d82:	e008                	sd	a0,0(s0)
ffffffffc0200d84:	c02007b7          	lui	a5,0xc0200
ffffffffc0200d88:	7af56963          	bltu	a0,a5,ffffffffc020153a <pmm_init+0x8e4>
ffffffffc0200d8c:	0009b783          	ld	a5,0(s3)
ffffffffc0200d90:	6098                	ld	a4,0(s1)
ffffffffc0200d92:	40f507b3          	sub	a5,a0,a5
ffffffffc0200d96:	0000f697          	auipc	a3,0xf
ffffffffc0200d9a:	2ef6b923          	sd	a5,754(a3) # ffffffffc0210088 <boot_satp>
ffffffffc0200d9e:	c80007b7          	lui	a5,0xc8000
ffffffffc0200da2:	83b1                	srli	a5,a5,0xc
ffffffffc0200da4:	76e7eb63          	bltu	a5,a4,ffffffffc020151a <pmm_init+0x8c4>
ffffffffc0200da8:	03451793          	slli	a5,a0,0x34
ffffffffc0200dac:	3a079563          	bnez	a5,ffffffffc0201156 <pmm_init+0x500>
ffffffffc0200db0:	4601                	li	a2,0
ffffffffc0200db2:	4581                	li	a1,0
ffffffffc0200db4:	d0fff0ef          	jal	ra,ffffffffc0200ac2 <get_page>
ffffffffc0200db8:	74051163          	bnez	a0,ffffffffc02014fa <pmm_init+0x8a4>
ffffffffc0200dbc:	4505                	li	a0,1
ffffffffc0200dbe:	9ffff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0200dc2:	8a2a                	mv	s4,a0
ffffffffc0200dc4:	6008                	ld	a0,0(s0)
ffffffffc0200dc6:	4681                	li	a3,0
ffffffffc0200dc8:	4601                	li	a2,0
ffffffffc0200dca:	85d2                	mv	a1,s4
ffffffffc0200dcc:	dbfff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0200dd0:	3a051363          	bnez	a0,ffffffffc0201176 <pmm_init+0x520>
ffffffffc0200dd4:	6008                	ld	a0,0(s0)
ffffffffc0200dd6:	4601                	li	a2,0
ffffffffc0200dd8:	4581                	li	a1,0
ffffffffc0200dda:	af3ff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200dde:	7a050b63          	beqz	a0,ffffffffc0201594 <pmm_init+0x93e>
ffffffffc0200de2:	611c                	ld	a5,0(a0)
ffffffffc0200de4:	0017f713          	andi	a4,a5,1
ffffffffc0200de8:	34070b63          	beqz	a4,ffffffffc020113e <pmm_init+0x4e8>
ffffffffc0200dec:	6090                	ld	a2,0(s1)
ffffffffc0200dee:	078a                	slli	a5,a5,0x2
ffffffffc0200df0:	83b1                	srli	a5,a5,0xc
ffffffffc0200df2:	34c7f463          	bgeu	a5,a2,ffffffffc020113a <pmm_init+0x4e4>
ffffffffc0200df6:	fff80737          	lui	a4,0xfff80
ffffffffc0200dfa:	97ba                	add	a5,a5,a4
ffffffffc0200dfc:	00093683          	ld	a3,0(s2)
ffffffffc0200e00:	00379713          	slli	a4,a5,0x3
ffffffffc0200e04:	97ba                	add	a5,a5,a4
ffffffffc0200e06:	078e                	slli	a5,a5,0x3
ffffffffc0200e08:	97b6                	add	a5,a5,a3
ffffffffc0200e0a:	4cfa1063          	bne	s4,a5,ffffffffc02012ca <pmm_init+0x674>
ffffffffc0200e0e:	000a2703          	lw	a4,0(s4)
ffffffffc0200e12:	4785                	li	a5,1
ffffffffc0200e14:	48f71b63          	bne	a4,a5,ffffffffc02012aa <pmm_init+0x654>
ffffffffc0200e18:	6008                	ld	a0,0(s0)
ffffffffc0200e1a:	76fd                	lui	a3,0xfffff
ffffffffc0200e1c:	611c                	ld	a5,0(a0)
ffffffffc0200e1e:	078a                	slli	a5,a5,0x2
ffffffffc0200e20:	8ff5                	and	a5,a5,a3
ffffffffc0200e22:	00c7d713          	srli	a4,a5,0xc
ffffffffc0200e26:	46c77563          	bgeu	a4,a2,ffffffffc0201290 <pmm_init+0x63a>
ffffffffc0200e2a:	0009bb03          	ld	s6,0(s3)
ffffffffc0200e2e:	97da                	add	a5,a5,s6
ffffffffc0200e30:	0007ba83          	ld	s5,0(a5) # ffffffffc8000000 <end+0x7defe60>
ffffffffc0200e34:	0a8a                	slli	s5,s5,0x2
ffffffffc0200e36:	00dafab3          	and	s5,s5,a3
ffffffffc0200e3a:	00cad793          	srli	a5,s5,0xc
ffffffffc0200e3e:	42c7fc63          	bgeu	a5,a2,ffffffffc0201276 <pmm_init+0x620>
ffffffffc0200e42:	4601                	li	a2,0
ffffffffc0200e44:	6585                	lui	a1,0x1
ffffffffc0200e46:	9ada                	add	s5,s5,s6
ffffffffc0200e48:	a85ff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200e4c:	0aa1                	addi	s5,s5,8
ffffffffc0200e4e:	41551463          	bne	a0,s5,ffffffffc0201256 <pmm_init+0x600>
ffffffffc0200e52:	4505                	li	a0,1
ffffffffc0200e54:	969ff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0200e58:	8aaa                	mv	s5,a0
ffffffffc0200e5a:	6008                	ld	a0,0(s0)
ffffffffc0200e5c:	46d1                	li	a3,20
ffffffffc0200e5e:	6605                	lui	a2,0x1
ffffffffc0200e60:	85d6                	mv	a1,s5
ffffffffc0200e62:	d29ff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0200e66:	3c051863          	bnez	a0,ffffffffc0201236 <pmm_init+0x5e0>
ffffffffc0200e6a:	6008                	ld	a0,0(s0)
ffffffffc0200e6c:	4601                	li	a2,0
ffffffffc0200e6e:	6585                	lui	a1,0x1
ffffffffc0200e70:	a5dff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200e74:	3a050163          	beqz	a0,ffffffffc0201216 <pmm_init+0x5c0>
ffffffffc0200e78:	611c                	ld	a5,0(a0)
ffffffffc0200e7a:	0107f713          	andi	a4,a5,16
ffffffffc0200e7e:	36070c63          	beqz	a4,ffffffffc02011f6 <pmm_init+0x5a0>
ffffffffc0200e82:	8b91                	andi	a5,a5,4
ffffffffc0200e84:	30078963          	beqz	a5,ffffffffc0201196 <pmm_init+0x540>
ffffffffc0200e88:	6008                	ld	a0,0(s0)
ffffffffc0200e8a:	611c                	ld	a5,0(a0)
ffffffffc0200e8c:	8bc1                	andi	a5,a5,16
ffffffffc0200e8e:	50078e63          	beqz	a5,ffffffffc02013aa <pmm_init+0x754>
ffffffffc0200e92:	000aa703          	lw	a4,0(s5)
ffffffffc0200e96:	4785                	li	a5,1
ffffffffc0200e98:	4ef71963          	bne	a4,a5,ffffffffc020138a <pmm_init+0x734>
ffffffffc0200e9c:	4681                	li	a3,0
ffffffffc0200e9e:	6605                	lui	a2,0x1
ffffffffc0200ea0:	85d2                	mv	a1,s4
ffffffffc0200ea2:	ce9ff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0200ea6:	4c051263          	bnez	a0,ffffffffc020136a <pmm_init+0x714>
ffffffffc0200eaa:	000a2703          	lw	a4,0(s4)
ffffffffc0200eae:	4789                	li	a5,2
ffffffffc0200eb0:	48f71d63          	bne	a4,a5,ffffffffc020134a <pmm_init+0x6f4>
ffffffffc0200eb4:	000aa783          	lw	a5,0(s5)
ffffffffc0200eb8:	46079963          	bnez	a5,ffffffffc020132a <pmm_init+0x6d4>
ffffffffc0200ebc:	6008                	ld	a0,0(s0)
ffffffffc0200ebe:	4601                	li	a2,0
ffffffffc0200ec0:	6585                	lui	a1,0x1
ffffffffc0200ec2:	a0bff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200ec6:	44050263          	beqz	a0,ffffffffc020130a <pmm_init+0x6b4>
ffffffffc0200eca:	6114                	ld	a3,0(a0)
ffffffffc0200ecc:	0016f793          	andi	a5,a3,1
ffffffffc0200ed0:	26078763          	beqz	a5,ffffffffc020113e <pmm_init+0x4e8>
ffffffffc0200ed4:	6098                	ld	a4,0(s1)
ffffffffc0200ed6:	00269793          	slli	a5,a3,0x2
ffffffffc0200eda:	83b1                	srli	a5,a5,0xc
ffffffffc0200edc:	24e7ff63          	bgeu	a5,a4,ffffffffc020113a <pmm_init+0x4e4>
ffffffffc0200ee0:	fff80737          	lui	a4,0xfff80
ffffffffc0200ee4:	97ba                	add	a5,a5,a4
ffffffffc0200ee6:	00093603          	ld	a2,0(s2)
ffffffffc0200eea:	00379713          	slli	a4,a5,0x3
ffffffffc0200eee:	97ba                	add	a5,a5,a4
ffffffffc0200ef0:	078e                	slli	a5,a5,0x3
ffffffffc0200ef2:	97b2                	add	a5,a5,a2
ffffffffc0200ef4:	3efa1b63          	bne	s4,a5,ffffffffc02012ea <pmm_init+0x694>
ffffffffc0200ef8:	8ac1                	andi	a3,a3,16
ffffffffc0200efa:	5c069063          	bnez	a3,ffffffffc02014ba <pmm_init+0x864>
ffffffffc0200efe:	6008                	ld	a0,0(s0)
ffffffffc0200f00:	4581                	li	a1,0
ffffffffc0200f02:	c1bff0ef          	jal	ra,ffffffffc0200b1c <page_remove>
ffffffffc0200f06:	000a2703          	lw	a4,0(s4)
ffffffffc0200f0a:	4785                	li	a5,1
ffffffffc0200f0c:	2af71563          	bne	a4,a5,ffffffffc02011b6 <pmm_init+0x560>
ffffffffc0200f10:	000aa783          	lw	a5,0(s5)
ffffffffc0200f14:	4a079b63          	bnez	a5,ffffffffc02013ca <pmm_init+0x774>
ffffffffc0200f18:	6008                	ld	a0,0(s0)
ffffffffc0200f1a:	6585                	lui	a1,0x1
ffffffffc0200f1c:	c01ff0ef          	jal	ra,ffffffffc0200b1c <page_remove>
ffffffffc0200f20:	000a2783          	lw	a5,0(s4)
ffffffffc0200f24:	2a079963          	bnez	a5,ffffffffc02011d6 <pmm_init+0x580>
ffffffffc0200f28:	000aa783          	lw	a5,0(s5)
ffffffffc0200f2c:	64079463          	bnez	a5,ffffffffc0201574 <pmm_init+0x91e>
ffffffffc0200f30:	601c                	ld	a5,0(s0)
ffffffffc0200f32:	6098                	ld	a4,0(s1)
ffffffffc0200f34:	639c                	ld	a5,0(a5)
ffffffffc0200f36:	078a                	slli	a5,a5,0x2
ffffffffc0200f38:	83b1                	srli	a5,a5,0xc
ffffffffc0200f3a:	20e7f063          	bgeu	a5,a4,ffffffffc020113a <pmm_init+0x4e4>
ffffffffc0200f3e:	fff80537          	lui	a0,0xfff80
ffffffffc0200f42:	97aa                	add	a5,a5,a0
ffffffffc0200f44:	00379713          	slli	a4,a5,0x3
ffffffffc0200f48:	00093503          	ld	a0,0(s2)
ffffffffc0200f4c:	97ba                	add	a5,a5,a4
ffffffffc0200f4e:	078e                	slli	a5,a5,0x3
ffffffffc0200f50:	953e                	add	a0,a0,a5
ffffffffc0200f52:	4118                	lw	a4,0(a0)
ffffffffc0200f54:	4785                	li	a5,1
ffffffffc0200f56:	5ef71f63          	bne	a4,a5,ffffffffc0201554 <pmm_init+0x8fe>
ffffffffc0200f5a:	4585                	li	a1,1
ffffffffc0200f5c:	8f3ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0200f60:	601c                	ld	a5,0(s0)
ffffffffc0200f62:	00004517          	auipc	a0,0x4
ffffffffc0200f66:	8be50513          	addi	a0,a0,-1858 # ffffffffc0204820 <etext+0xb00>
ffffffffc0200f6a:	c0200a37          	lui	s4,0xc0200
ffffffffc0200f6e:	0007b023          	sd	zero,0(a5)
ffffffffc0200f72:	944ff0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0200f76:	609c                	ld	a5,0(s1)
ffffffffc0200f78:	7b7d                	lui	s6,0xfffff
ffffffffc0200f7a:	6a85                	lui	s5,0x1
ffffffffc0200f7c:	00c79713          	slli	a4,a5,0xc
ffffffffc0200f80:	02ea7b63          	bgeu	s4,a4,ffffffffc0200fb6 <pmm_init+0x360>
ffffffffc0200f84:	00ca5713          	srli	a4,s4,0xc
ffffffffc0200f88:	6008                	ld	a0,0(s0)
ffffffffc0200f8a:	18f77b63          	bgeu	a4,a5,ffffffffc0201120 <pmm_init+0x4ca>
ffffffffc0200f8e:	0009b583          	ld	a1,0(s3)
ffffffffc0200f92:	4601                	li	a2,0
ffffffffc0200f94:	95d2                	add	a1,a1,s4
ffffffffc0200f96:	937ff0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0200f9a:	16050363          	beqz	a0,ffffffffc0201100 <pmm_init+0x4aa>
ffffffffc0200f9e:	611c                	ld	a5,0(a0)
ffffffffc0200fa0:	078a                	slli	a5,a5,0x2
ffffffffc0200fa2:	0167f7b3          	and	a5,a5,s6
ffffffffc0200fa6:	13479d63          	bne	a5,s4,ffffffffc02010e0 <pmm_init+0x48a>
ffffffffc0200faa:	609c                	ld	a5,0(s1)
ffffffffc0200fac:	9a56                	add	s4,s4,s5
ffffffffc0200fae:	00c79713          	slli	a4,a5,0xc
ffffffffc0200fb2:	fcea69e3          	bltu	s4,a4,ffffffffc0200f84 <pmm_init+0x32e>
ffffffffc0200fb6:	601c                	ld	a5,0(s0)
ffffffffc0200fb8:	639c                	ld	a5,0(a5)
ffffffffc0200fba:	52079063          	bnez	a5,ffffffffc02014da <pmm_init+0x884>
ffffffffc0200fbe:	4505                	li	a0,1
ffffffffc0200fc0:	ffcff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0200fc4:	8aaa                	mv	s5,a0
ffffffffc0200fc6:	6008                	ld	a0,0(s0)
ffffffffc0200fc8:	4699                	li	a3,6
ffffffffc0200fca:	10000613          	li	a2,256
ffffffffc0200fce:	85d6                	mv	a1,s5
ffffffffc0200fd0:	bbbff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0200fd4:	46051763          	bnez	a0,ffffffffc0201442 <pmm_init+0x7ec>
ffffffffc0200fd8:	000aa703          	lw	a4,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0200fdc:	4785                	li	a5,1
ffffffffc0200fde:	44f71263          	bne	a4,a5,ffffffffc0201422 <pmm_init+0x7cc>
ffffffffc0200fe2:	6008                	ld	a0,0(s0)
ffffffffc0200fe4:	6a05                	lui	s4,0x1
ffffffffc0200fe6:	4699                	li	a3,6
ffffffffc0200fe8:	100a0613          	addi	a2,s4,256 # 1100 <kern_entry-0xffffffffc01fef00>
ffffffffc0200fec:	85d6                	mv	a1,s5
ffffffffc0200fee:	b9dff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0200ff2:	5c051163          	bnez	a0,ffffffffc02015b4 <pmm_init+0x95e>
ffffffffc0200ff6:	000aa703          	lw	a4,0(s5)
ffffffffc0200ffa:	4789                	li	a5,2
ffffffffc0200ffc:	48f71f63          	bne	a4,a5,ffffffffc020149a <pmm_init+0x844>
ffffffffc0201000:	00004597          	auipc	a1,0x4
ffffffffc0201004:	95858593          	addi	a1,a1,-1704 # ffffffffc0204958 <etext+0xc38>
ffffffffc0201008:	10000513          	li	a0,256
ffffffffc020100c:	0cd020ef          	jal	ra,ffffffffc02038d8 <strcpy>
ffffffffc0201010:	100a0593          	addi	a1,s4,256
ffffffffc0201014:	10000513          	li	a0,256
ffffffffc0201018:	0d3020ef          	jal	ra,ffffffffc02038ea <strcmp>
ffffffffc020101c:	44051f63          	bnez	a0,ffffffffc020147a <pmm_init+0x824>
ffffffffc0201020:	00093683          	ld	a3,0(s2)
ffffffffc0201024:	00005797          	auipc	a5,0x5
ffffffffc0201028:	9247b783          	ld	a5,-1756(a5) # ffffffffc0205948 <error_string+0x38>
ffffffffc020102c:	00080a37          	lui	s4,0x80
ffffffffc0201030:	40da86b3          	sub	a3,s5,a3
ffffffffc0201034:	868d                	srai	a3,a3,0x3
ffffffffc0201036:	02f686b3          	mul	a3,a3,a5
ffffffffc020103a:	6098                	ld	a4,0(s1)
ffffffffc020103c:	96d2                	add	a3,a3,s4
ffffffffc020103e:	00c69793          	slli	a5,a3,0xc
ffffffffc0201042:	83b1                	srli	a5,a5,0xc
ffffffffc0201044:	06b2                	slli	a3,a3,0xc
ffffffffc0201046:	40e7fe63          	bgeu	a5,a4,ffffffffc0201462 <pmm_init+0x80c>
ffffffffc020104a:	0009b783          	ld	a5,0(s3)
ffffffffc020104e:	10000513          	li	a0,256
ffffffffc0201052:	96be                	add	a3,a3,a5
ffffffffc0201054:	10068023          	sb	zero,256(a3) # fffffffffffff100 <end+0x3fdeef60>
ffffffffc0201058:	04b020ef          	jal	ra,ffffffffc02038a2 <strlen>
ffffffffc020105c:	3a051363          	bnez	a0,ffffffffc0201402 <pmm_init+0x7ac>
ffffffffc0201060:	4585                	li	a1,1
ffffffffc0201062:	8556                	mv	a0,s5
ffffffffc0201064:	feaff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0201068:	601c                	ld	a5,0(s0)
ffffffffc020106a:	6098                	ld	a4,0(s1)
ffffffffc020106c:	639c                	ld	a5,0(a5)
ffffffffc020106e:	078a                	slli	a5,a5,0x2
ffffffffc0201070:	83b1                	srli	a5,a5,0xc
ffffffffc0201072:	0ce7f463          	bgeu	a5,a4,ffffffffc020113a <pmm_init+0x4e4>
ffffffffc0201076:	414787b3          	sub	a5,a5,s4
ffffffffc020107a:	00093503          	ld	a0,0(s2)
ffffffffc020107e:	00379713          	slli	a4,a5,0x3
ffffffffc0201082:	97ba                	add	a5,a5,a4
ffffffffc0201084:	078e                	slli	a5,a5,0x3
ffffffffc0201086:	953e                	add	a0,a0,a5
ffffffffc0201088:	4585                	li	a1,1
ffffffffc020108a:	fc4ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc020108e:	601c                	ld	a5,0(s0)
ffffffffc0201090:	7442                	ld	s0,48(sp)
ffffffffc0201092:	70e2                	ld	ra,56(sp)
ffffffffc0201094:	74a2                	ld	s1,40(sp)
ffffffffc0201096:	7902                	ld	s2,32(sp)
ffffffffc0201098:	69e2                	ld	s3,24(sp)
ffffffffc020109a:	6a42                	ld	s4,16(sp)
ffffffffc020109c:	6aa2                	ld	s5,8(sp)
ffffffffc020109e:	6b02                	ld	s6,0(sp)
ffffffffc02010a0:	0007b023          	sd	zero,0(a5)
ffffffffc02010a4:	00004517          	auipc	a0,0x4
ffffffffc02010a8:	92c50513          	addi	a0,a0,-1748 # ffffffffc02049d0 <etext+0xcb0>
ffffffffc02010ac:	6121                	addi	sp,sp,64
ffffffffc02010ae:	808ff06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc02010b2:	6705                	lui	a4,0x1
ffffffffc02010b4:	177d                	addi	a4,a4,-1
ffffffffc02010b6:	96ba                	add	a3,a3,a4
ffffffffc02010b8:	00c6d713          	srli	a4,a3,0xc
ffffffffc02010bc:	06f77f63          	bgeu	a4,a5,ffffffffc020113a <pmm_init+0x4e4>
ffffffffc02010c0:	000a3803          	ld	a6,0(s4) # 80000 <kern_entry-0xffffffffc0180000>
ffffffffc02010c4:	9732                	add	a4,a4,a2
ffffffffc02010c6:	00371793          	slli	a5,a4,0x3
ffffffffc02010ca:	767d                	lui	a2,0xfffff
ffffffffc02010cc:	8ef1                	and	a3,a3,a2
ffffffffc02010ce:	97ba                	add	a5,a5,a4
ffffffffc02010d0:	01083703          	ld	a4,16(a6)
ffffffffc02010d4:	8d95                	sub	a1,a1,a3
ffffffffc02010d6:	078e                	slli	a5,a5,0x3
ffffffffc02010d8:	81b1                	srli	a1,a1,0xc
ffffffffc02010da:	953e                	add	a0,a0,a5
ffffffffc02010dc:	9702                	jalr	a4
ffffffffc02010de:	b141                	j	ffffffffc0200d5e <pmm_init+0x108>
ffffffffc02010e0:	00003697          	auipc	a3,0x3
ffffffffc02010e4:	7a068693          	addi	a3,a3,1952 # ffffffffc0204880 <etext+0xb60>
ffffffffc02010e8:	00003617          	auipc	a2,0x3
ffffffffc02010ec:	47060613          	addi	a2,a2,1136 # ffffffffc0204558 <etext+0x838>
ffffffffc02010f0:	18b00593          	li	a1,395
ffffffffc02010f4:	00003517          	auipc	a0,0x3
ffffffffc02010f8:	36450513          	addi	a0,a0,868 # ffffffffc0204458 <etext+0x738>
ffffffffc02010fc:	ff1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201100:	00003697          	auipc	a3,0x3
ffffffffc0201104:	74068693          	addi	a3,a3,1856 # ffffffffc0204840 <etext+0xb20>
ffffffffc0201108:	00003617          	auipc	a2,0x3
ffffffffc020110c:	45060613          	addi	a2,a2,1104 # ffffffffc0204558 <etext+0x838>
ffffffffc0201110:	18a00593          	li	a1,394
ffffffffc0201114:	00003517          	auipc	a0,0x3
ffffffffc0201118:	34450513          	addi	a0,a0,836 # ffffffffc0204458 <etext+0x738>
ffffffffc020111c:	fd1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201120:	86d2                	mv	a3,s4
ffffffffc0201122:	00003617          	auipc	a2,0x3
ffffffffc0201126:	30e60613          	addi	a2,a2,782 # ffffffffc0204430 <etext+0x710>
ffffffffc020112a:	18a00593          	li	a1,394
ffffffffc020112e:	00003517          	auipc	a0,0x3
ffffffffc0201132:	32a50513          	addi	a0,a0,810 # ffffffffc0204458 <etext+0x738>
ffffffffc0201136:	fb7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020113a:	e66ff0ef          	jal	ra,ffffffffc02007a0 <pa2page.part.0>
ffffffffc020113e:	00003617          	auipc	a2,0x3
ffffffffc0201142:	4f260613          	addi	a2,a2,1266 # ffffffffc0204630 <etext+0x910>
ffffffffc0201146:	07000593          	li	a1,112
ffffffffc020114a:	00003517          	auipc	a0,0x3
ffffffffc020114e:	2d650513          	addi	a0,a0,726 # ffffffffc0204420 <etext+0x700>
ffffffffc0201152:	f9bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201156:	00003697          	auipc	a3,0x3
ffffffffc020115a:	41a68693          	addi	a3,a3,1050 # ffffffffc0204570 <etext+0x850>
ffffffffc020115e:	00003617          	auipc	a2,0x3
ffffffffc0201162:	3fa60613          	addi	a2,a2,1018 # ffffffffc0204558 <etext+0x838>
ffffffffc0201166:	15900593          	li	a1,345
ffffffffc020116a:	00003517          	auipc	a0,0x3
ffffffffc020116e:	2ee50513          	addi	a0,a0,750 # ffffffffc0204458 <etext+0x738>
ffffffffc0201172:	f7bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201176:	00003697          	auipc	a3,0x3
ffffffffc020117a:	45a68693          	addi	a3,a3,1114 # ffffffffc02045d0 <etext+0x8b0>
ffffffffc020117e:	00003617          	auipc	a2,0x3
ffffffffc0201182:	3da60613          	addi	a2,a2,986 # ffffffffc0204558 <etext+0x838>
ffffffffc0201186:	15e00593          	li	a1,350
ffffffffc020118a:	00003517          	auipc	a0,0x3
ffffffffc020118e:	2ce50513          	addi	a0,a0,718 # ffffffffc0204458 <etext+0x738>
ffffffffc0201192:	f5bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201196:	00003697          	auipc	a3,0x3
ffffffffc020119a:	59268693          	addi	a3,a3,1426 # ffffffffc0204728 <etext+0xa08>
ffffffffc020119e:	00003617          	auipc	a2,0x3
ffffffffc02011a2:	3ba60613          	addi	a2,a2,954 # ffffffffc0204558 <etext+0x838>
ffffffffc02011a6:	16c00593          	li	a1,364
ffffffffc02011aa:	00003517          	auipc	a0,0x3
ffffffffc02011ae:	2ae50513          	addi	a0,a0,686 # ffffffffc0204458 <etext+0x738>
ffffffffc02011b2:	f3bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011b6:	00003697          	auipc	a3,0x3
ffffffffc02011ba:	4ba68693          	addi	a3,a3,1210 # ffffffffc0204670 <etext+0x950>
ffffffffc02011be:	00003617          	auipc	a2,0x3
ffffffffc02011c2:	39a60613          	addi	a2,a2,922 # ffffffffc0204558 <etext+0x838>
ffffffffc02011c6:	17800593          	li	a1,376
ffffffffc02011ca:	00003517          	auipc	a0,0x3
ffffffffc02011ce:	28e50513          	addi	a0,a0,654 # ffffffffc0204458 <etext+0x738>
ffffffffc02011d2:	f1bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011d6:	00003697          	auipc	a3,0x3
ffffffffc02011da:	60a68693          	addi	a3,a3,1546 # ffffffffc02047e0 <etext+0xac0>
ffffffffc02011de:	00003617          	auipc	a2,0x3
ffffffffc02011e2:	37a60613          	addi	a2,a2,890 # ffffffffc0204558 <etext+0x838>
ffffffffc02011e6:	17c00593          	li	a1,380
ffffffffc02011ea:	00003517          	auipc	a0,0x3
ffffffffc02011ee:	26e50513          	addi	a0,a0,622 # ffffffffc0204458 <etext+0x738>
ffffffffc02011f2:	efbfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02011f6:	00003697          	auipc	a3,0x3
ffffffffc02011fa:	52268693          	addi	a3,a3,1314 # ffffffffc0204718 <etext+0x9f8>
ffffffffc02011fe:	00003617          	auipc	a2,0x3
ffffffffc0201202:	35a60613          	addi	a2,a2,858 # ffffffffc0204558 <etext+0x838>
ffffffffc0201206:	16b00593          	li	a1,363
ffffffffc020120a:	00003517          	auipc	a0,0x3
ffffffffc020120e:	24e50513          	addi	a0,a0,590 # ffffffffc0204458 <etext+0x738>
ffffffffc0201212:	edbfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201216:	00003697          	auipc	a3,0x3
ffffffffc020121a:	4d268693          	addi	a3,a3,1234 # ffffffffc02046e8 <etext+0x9c8>
ffffffffc020121e:	00003617          	auipc	a2,0x3
ffffffffc0201222:	33a60613          	addi	a2,a2,826 # ffffffffc0204558 <etext+0x838>
ffffffffc0201226:	16a00593          	li	a1,362
ffffffffc020122a:	00003517          	auipc	a0,0x3
ffffffffc020122e:	22e50513          	addi	a0,a0,558 # ffffffffc0204458 <etext+0x738>
ffffffffc0201232:	ebbfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201236:	00003697          	auipc	a3,0x3
ffffffffc020123a:	47a68693          	addi	a3,a3,1146 # ffffffffc02046b0 <etext+0x990>
ffffffffc020123e:	00003617          	auipc	a2,0x3
ffffffffc0201242:	31a60613          	addi	a2,a2,794 # ffffffffc0204558 <etext+0x838>
ffffffffc0201246:	16900593          	li	a1,361
ffffffffc020124a:	00003517          	auipc	a0,0x3
ffffffffc020124e:	20e50513          	addi	a0,a0,526 # ffffffffc0204458 <etext+0x738>
ffffffffc0201252:	e9bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201256:	00003697          	auipc	a3,0x3
ffffffffc020125a:	43268693          	addi	a3,a3,1074 # ffffffffc0204688 <etext+0x968>
ffffffffc020125e:	00003617          	auipc	a2,0x3
ffffffffc0201262:	2fa60613          	addi	a2,a2,762 # ffffffffc0204558 <etext+0x838>
ffffffffc0201266:	16600593          	li	a1,358
ffffffffc020126a:	00003517          	auipc	a0,0x3
ffffffffc020126e:	1ee50513          	addi	a0,a0,494 # ffffffffc0204458 <etext+0x738>
ffffffffc0201272:	e7bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201276:	86d6                	mv	a3,s5
ffffffffc0201278:	00003617          	auipc	a2,0x3
ffffffffc020127c:	1b860613          	addi	a2,a2,440 # ffffffffc0204430 <etext+0x710>
ffffffffc0201280:	16500593          	li	a1,357
ffffffffc0201284:	00003517          	auipc	a0,0x3
ffffffffc0201288:	1d450513          	addi	a0,a0,468 # ffffffffc0204458 <etext+0x738>
ffffffffc020128c:	e61fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201290:	86be                	mv	a3,a5
ffffffffc0201292:	00003617          	auipc	a2,0x3
ffffffffc0201296:	19e60613          	addi	a2,a2,414 # ffffffffc0204430 <etext+0x710>
ffffffffc020129a:	16400593          	li	a1,356
ffffffffc020129e:	00003517          	auipc	a0,0x3
ffffffffc02012a2:	1ba50513          	addi	a0,a0,442 # ffffffffc0204458 <etext+0x738>
ffffffffc02012a6:	e47fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02012aa:	00003697          	auipc	a3,0x3
ffffffffc02012ae:	3c668693          	addi	a3,a3,966 # ffffffffc0204670 <etext+0x950>
ffffffffc02012b2:	00003617          	auipc	a2,0x3
ffffffffc02012b6:	2a660613          	addi	a2,a2,678 # ffffffffc0204558 <etext+0x838>
ffffffffc02012ba:	16200593          	li	a1,354
ffffffffc02012be:	00003517          	auipc	a0,0x3
ffffffffc02012c2:	19a50513          	addi	a0,a0,410 # ffffffffc0204458 <etext+0x738>
ffffffffc02012c6:	e27fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02012ca:	00003697          	auipc	a3,0x3
ffffffffc02012ce:	38e68693          	addi	a3,a3,910 # ffffffffc0204658 <etext+0x938>
ffffffffc02012d2:	00003617          	auipc	a2,0x3
ffffffffc02012d6:	28660613          	addi	a2,a2,646 # ffffffffc0204558 <etext+0x838>
ffffffffc02012da:	16100593          	li	a1,353
ffffffffc02012de:	00003517          	auipc	a0,0x3
ffffffffc02012e2:	17a50513          	addi	a0,a0,378 # ffffffffc0204458 <etext+0x738>
ffffffffc02012e6:	e07fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02012ea:	00003697          	auipc	a3,0x3
ffffffffc02012ee:	36e68693          	addi	a3,a3,878 # ffffffffc0204658 <etext+0x938>
ffffffffc02012f2:	00003617          	auipc	a2,0x3
ffffffffc02012f6:	26660613          	addi	a2,a2,614 # ffffffffc0204558 <etext+0x838>
ffffffffc02012fa:	17400593          	li	a1,372
ffffffffc02012fe:	00003517          	auipc	a0,0x3
ffffffffc0201302:	15a50513          	addi	a0,a0,346 # ffffffffc0204458 <etext+0x738>
ffffffffc0201306:	de7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020130a:	00003697          	auipc	a3,0x3
ffffffffc020130e:	3de68693          	addi	a3,a3,990 # ffffffffc02046e8 <etext+0x9c8>
ffffffffc0201312:	00003617          	auipc	a2,0x3
ffffffffc0201316:	24660613          	addi	a2,a2,582 # ffffffffc0204558 <etext+0x838>
ffffffffc020131a:	17300593          	li	a1,371
ffffffffc020131e:	00003517          	auipc	a0,0x3
ffffffffc0201322:	13a50513          	addi	a0,a0,314 # ffffffffc0204458 <etext+0x738>
ffffffffc0201326:	dc7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020132a:	00003697          	auipc	a3,0x3
ffffffffc020132e:	48668693          	addi	a3,a3,1158 # ffffffffc02047b0 <etext+0xa90>
ffffffffc0201332:	00003617          	auipc	a2,0x3
ffffffffc0201336:	22660613          	addi	a2,a2,550 # ffffffffc0204558 <etext+0x838>
ffffffffc020133a:	17200593          	li	a1,370
ffffffffc020133e:	00003517          	auipc	a0,0x3
ffffffffc0201342:	11a50513          	addi	a0,a0,282 # ffffffffc0204458 <etext+0x738>
ffffffffc0201346:	da7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020134a:	00003697          	auipc	a3,0x3
ffffffffc020134e:	44e68693          	addi	a3,a3,1102 # ffffffffc0204798 <etext+0xa78>
ffffffffc0201352:	00003617          	auipc	a2,0x3
ffffffffc0201356:	20660613          	addi	a2,a2,518 # ffffffffc0204558 <etext+0x838>
ffffffffc020135a:	17100593          	li	a1,369
ffffffffc020135e:	00003517          	auipc	a0,0x3
ffffffffc0201362:	0fa50513          	addi	a0,a0,250 # ffffffffc0204458 <etext+0x738>
ffffffffc0201366:	d87fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020136a:	00003697          	auipc	a3,0x3
ffffffffc020136e:	3fe68693          	addi	a3,a3,1022 # ffffffffc0204768 <etext+0xa48>
ffffffffc0201372:	00003617          	auipc	a2,0x3
ffffffffc0201376:	1e660613          	addi	a2,a2,486 # ffffffffc0204558 <etext+0x838>
ffffffffc020137a:	17000593          	li	a1,368
ffffffffc020137e:	00003517          	auipc	a0,0x3
ffffffffc0201382:	0da50513          	addi	a0,a0,218 # ffffffffc0204458 <etext+0x738>
ffffffffc0201386:	d67fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020138a:	00003697          	auipc	a3,0x3
ffffffffc020138e:	3c668693          	addi	a3,a3,966 # ffffffffc0204750 <etext+0xa30>
ffffffffc0201392:	00003617          	auipc	a2,0x3
ffffffffc0201396:	1c660613          	addi	a2,a2,454 # ffffffffc0204558 <etext+0x838>
ffffffffc020139a:	16e00593          	li	a1,366
ffffffffc020139e:	00003517          	auipc	a0,0x3
ffffffffc02013a2:	0ba50513          	addi	a0,a0,186 # ffffffffc0204458 <etext+0x738>
ffffffffc02013a6:	d47fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02013aa:	00003697          	auipc	a3,0x3
ffffffffc02013ae:	38e68693          	addi	a3,a3,910 # ffffffffc0204738 <etext+0xa18>
ffffffffc02013b2:	00003617          	auipc	a2,0x3
ffffffffc02013b6:	1a660613          	addi	a2,a2,422 # ffffffffc0204558 <etext+0x838>
ffffffffc02013ba:	16d00593          	li	a1,365
ffffffffc02013be:	00003517          	auipc	a0,0x3
ffffffffc02013c2:	09a50513          	addi	a0,a0,154 # ffffffffc0204458 <etext+0x738>
ffffffffc02013c6:	d27fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02013ca:	00003697          	auipc	a3,0x3
ffffffffc02013ce:	3e668693          	addi	a3,a3,998 # ffffffffc02047b0 <etext+0xa90>
ffffffffc02013d2:	00003617          	auipc	a2,0x3
ffffffffc02013d6:	18660613          	addi	a2,a2,390 # ffffffffc0204558 <etext+0x838>
ffffffffc02013da:	17900593          	li	a1,377
ffffffffc02013de:	00003517          	auipc	a0,0x3
ffffffffc02013e2:	07a50513          	addi	a0,a0,122 # ffffffffc0204458 <etext+0x738>
ffffffffc02013e6:	d07fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02013ea:	00003617          	auipc	a2,0x3
ffffffffc02013ee:	10660613          	addi	a2,a2,262 # ffffffffc02044f0 <etext+0x7d0>
ffffffffc02013f2:	07700593          	li	a1,119
ffffffffc02013f6:	00003517          	auipc	a0,0x3
ffffffffc02013fa:	06250513          	addi	a0,a0,98 # ffffffffc0204458 <etext+0x738>
ffffffffc02013fe:	ceffe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201402:	00003697          	auipc	a3,0x3
ffffffffc0201406:	5a668693          	addi	a3,a3,1446 # ffffffffc02049a8 <etext+0xc88>
ffffffffc020140a:	00003617          	auipc	a2,0x3
ffffffffc020140e:	14e60613          	addi	a2,a2,334 # ffffffffc0204558 <etext+0x838>
ffffffffc0201412:	19d00593          	li	a1,413
ffffffffc0201416:	00003517          	auipc	a0,0x3
ffffffffc020141a:	04250513          	addi	a0,a0,66 # ffffffffc0204458 <etext+0x738>
ffffffffc020141e:	ccffe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201422:	00003697          	auipc	a3,0x3
ffffffffc0201426:	4c668693          	addi	a3,a3,1222 # ffffffffc02048e8 <etext+0xbc8>
ffffffffc020142a:	00003617          	auipc	a2,0x3
ffffffffc020142e:	12e60613          	addi	a2,a2,302 # ffffffffc0204558 <etext+0x838>
ffffffffc0201432:	19400593          	li	a1,404
ffffffffc0201436:	00003517          	auipc	a0,0x3
ffffffffc020143a:	02250513          	addi	a0,a0,34 # ffffffffc0204458 <etext+0x738>
ffffffffc020143e:	caffe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201442:	00003697          	auipc	a3,0x3
ffffffffc0201446:	46e68693          	addi	a3,a3,1134 # ffffffffc02048b0 <etext+0xb90>
ffffffffc020144a:	00003617          	auipc	a2,0x3
ffffffffc020144e:	10e60613          	addi	a2,a2,270 # ffffffffc0204558 <etext+0x838>
ffffffffc0201452:	19300593          	li	a1,403
ffffffffc0201456:	00003517          	auipc	a0,0x3
ffffffffc020145a:	00250513          	addi	a0,a0,2 # ffffffffc0204458 <etext+0x738>
ffffffffc020145e:	c8ffe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201462:	00003617          	auipc	a2,0x3
ffffffffc0201466:	fce60613          	addi	a2,a2,-50 # ffffffffc0204430 <etext+0x710>
ffffffffc020146a:	06a00593          	li	a1,106
ffffffffc020146e:	00003517          	auipc	a0,0x3
ffffffffc0201472:	fb250513          	addi	a0,a0,-78 # ffffffffc0204420 <etext+0x700>
ffffffffc0201476:	c77fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020147a:	00003697          	auipc	a3,0x3
ffffffffc020147e:	4f668693          	addi	a3,a3,1270 # ffffffffc0204970 <etext+0xc50>
ffffffffc0201482:	00003617          	auipc	a2,0x3
ffffffffc0201486:	0d660613          	addi	a2,a2,214 # ffffffffc0204558 <etext+0x838>
ffffffffc020148a:	19a00593          	li	a1,410
ffffffffc020148e:	00003517          	auipc	a0,0x3
ffffffffc0201492:	fca50513          	addi	a0,a0,-54 # ffffffffc0204458 <etext+0x738>
ffffffffc0201496:	c57fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020149a:	00003697          	auipc	a3,0x3
ffffffffc020149e:	4a668693          	addi	a3,a3,1190 # ffffffffc0204940 <etext+0xc20>
ffffffffc02014a2:	00003617          	auipc	a2,0x3
ffffffffc02014a6:	0b660613          	addi	a2,a2,182 # ffffffffc0204558 <etext+0x838>
ffffffffc02014aa:	19600593          	li	a1,406
ffffffffc02014ae:	00003517          	auipc	a0,0x3
ffffffffc02014b2:	faa50513          	addi	a0,a0,-86 # ffffffffc0204458 <etext+0x738>
ffffffffc02014b6:	c37fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02014ba:	00003697          	auipc	a3,0x3
ffffffffc02014be:	30e68693          	addi	a3,a3,782 # ffffffffc02047c8 <etext+0xaa8>
ffffffffc02014c2:	00003617          	auipc	a2,0x3
ffffffffc02014c6:	09660613          	addi	a2,a2,150 # ffffffffc0204558 <etext+0x838>
ffffffffc02014ca:	17500593          	li	a1,373
ffffffffc02014ce:	00003517          	auipc	a0,0x3
ffffffffc02014d2:	f8a50513          	addi	a0,a0,-118 # ffffffffc0204458 <etext+0x738>
ffffffffc02014d6:	c17fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02014da:	00003697          	auipc	a3,0x3
ffffffffc02014de:	3be68693          	addi	a3,a3,958 # ffffffffc0204898 <etext+0xb78>
ffffffffc02014e2:	00003617          	auipc	a2,0x3
ffffffffc02014e6:	07660613          	addi	a2,a2,118 # ffffffffc0204558 <etext+0x838>
ffffffffc02014ea:	18f00593          	li	a1,399
ffffffffc02014ee:	00003517          	auipc	a0,0x3
ffffffffc02014f2:	f6a50513          	addi	a0,a0,-150 # ffffffffc0204458 <etext+0x738>
ffffffffc02014f6:	bf7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02014fa:	00003697          	auipc	a3,0x3
ffffffffc02014fe:	0ae68693          	addi	a3,a3,174 # ffffffffc02045a8 <etext+0x888>
ffffffffc0201502:	00003617          	auipc	a2,0x3
ffffffffc0201506:	05660613          	addi	a2,a2,86 # ffffffffc0204558 <etext+0x838>
ffffffffc020150a:	15a00593          	li	a1,346
ffffffffc020150e:	00003517          	auipc	a0,0x3
ffffffffc0201512:	f4a50513          	addi	a0,a0,-182 # ffffffffc0204458 <etext+0x738>
ffffffffc0201516:	bd7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020151a:	00003697          	auipc	a3,0x3
ffffffffc020151e:	01e68693          	addi	a3,a3,30 # ffffffffc0204538 <etext+0x818>
ffffffffc0201522:	00003617          	auipc	a2,0x3
ffffffffc0201526:	03660613          	addi	a2,a2,54 # ffffffffc0204558 <etext+0x838>
ffffffffc020152a:	15800593          	li	a1,344
ffffffffc020152e:	00003517          	auipc	a0,0x3
ffffffffc0201532:	f2a50513          	addi	a0,a0,-214 # ffffffffc0204458 <etext+0x738>
ffffffffc0201536:	bb7fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020153a:	86aa                	mv	a3,a0
ffffffffc020153c:	00003617          	auipc	a2,0x3
ffffffffc0201540:	fb460613          	addi	a2,a2,-76 # ffffffffc02044f0 <etext+0x7d0>
ffffffffc0201544:	0bd00593          	li	a1,189
ffffffffc0201548:	00003517          	auipc	a0,0x3
ffffffffc020154c:	f1050513          	addi	a0,a0,-240 # ffffffffc0204458 <etext+0x738>
ffffffffc0201550:	b9dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201554:	00003697          	auipc	a3,0x3
ffffffffc0201558:	2a468693          	addi	a3,a3,676 # ffffffffc02047f8 <etext+0xad8>
ffffffffc020155c:	00003617          	auipc	a2,0x3
ffffffffc0201560:	ffc60613          	addi	a2,a2,-4 # ffffffffc0204558 <etext+0x838>
ffffffffc0201564:	17f00593          	li	a1,383
ffffffffc0201568:	00003517          	auipc	a0,0x3
ffffffffc020156c:	ef050513          	addi	a0,a0,-272 # ffffffffc0204458 <etext+0x738>
ffffffffc0201570:	b7dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201574:	00003697          	auipc	a3,0x3
ffffffffc0201578:	23c68693          	addi	a3,a3,572 # ffffffffc02047b0 <etext+0xa90>
ffffffffc020157c:	00003617          	auipc	a2,0x3
ffffffffc0201580:	fdc60613          	addi	a2,a2,-36 # ffffffffc0204558 <etext+0x838>
ffffffffc0201584:	17d00593          	li	a1,381
ffffffffc0201588:	00003517          	auipc	a0,0x3
ffffffffc020158c:	ed050513          	addi	a0,a0,-304 # ffffffffc0204458 <etext+0x738>
ffffffffc0201590:	b5dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201594:	00003697          	auipc	a3,0x3
ffffffffc0201598:	06c68693          	addi	a3,a3,108 # ffffffffc0204600 <etext+0x8e0>
ffffffffc020159c:	00003617          	auipc	a2,0x3
ffffffffc02015a0:	fbc60613          	addi	a2,a2,-68 # ffffffffc0204558 <etext+0x838>
ffffffffc02015a4:	16000593          	li	a1,352
ffffffffc02015a8:	00003517          	auipc	a0,0x3
ffffffffc02015ac:	eb050513          	addi	a0,a0,-336 # ffffffffc0204458 <etext+0x738>
ffffffffc02015b0:	b3dfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02015b4:	00003697          	auipc	a3,0x3
ffffffffc02015b8:	34c68693          	addi	a3,a3,844 # ffffffffc0204900 <etext+0xbe0>
ffffffffc02015bc:	00003617          	auipc	a2,0x3
ffffffffc02015c0:	f9c60613          	addi	a2,a2,-100 # ffffffffc0204558 <etext+0x838>
ffffffffc02015c4:	19500593          	li	a1,405
ffffffffc02015c8:	00003517          	auipc	a0,0x3
ffffffffc02015cc:	e9050513          	addi	a0,a0,-368 # ffffffffc0204458 <etext+0x738>
ffffffffc02015d0:	b1dfe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02015d4 <tlb_invalidate>:
ffffffffc02015d4:	12000073          	sfence.vma
ffffffffc02015d8:	8082                	ret

ffffffffc02015da <pgdir_alloc_page>:
ffffffffc02015da:	7179                	addi	sp,sp,-48
ffffffffc02015dc:	e84a                	sd	s2,16(sp)
ffffffffc02015de:	892a                	mv	s2,a0
ffffffffc02015e0:	4505                	li	a0,1
ffffffffc02015e2:	f022                	sd	s0,32(sp)
ffffffffc02015e4:	ec26                	sd	s1,24(sp)
ffffffffc02015e6:	e44e                	sd	s3,8(sp)
ffffffffc02015e8:	f406                	sd	ra,40(sp)
ffffffffc02015ea:	84ae                	mv	s1,a1
ffffffffc02015ec:	89b2                	mv	s3,a2
ffffffffc02015ee:	9ceff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc02015f2:	842a                	mv	s0,a0
ffffffffc02015f4:	cd09                	beqz	a0,ffffffffc020160e <pgdir_alloc_page+0x34>
ffffffffc02015f6:	85aa                	mv	a1,a0
ffffffffc02015f8:	86ce                	mv	a3,s3
ffffffffc02015fa:	8626                	mv	a2,s1
ffffffffc02015fc:	854a                	mv	a0,s2
ffffffffc02015fe:	d8cff0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0201602:	ed21                	bnez	a0,ffffffffc020165a <pgdir_alloc_page+0x80>
ffffffffc0201604:	0000f797          	auipc	a5,0xf
ffffffffc0201608:	a6c7a783          	lw	a5,-1428(a5) # ffffffffc0210070 <swap_init_ok>
ffffffffc020160c:	eb89                	bnez	a5,ffffffffc020161e <pgdir_alloc_page+0x44>
ffffffffc020160e:	70a2                	ld	ra,40(sp)
ffffffffc0201610:	8522                	mv	a0,s0
ffffffffc0201612:	7402                	ld	s0,32(sp)
ffffffffc0201614:	64e2                	ld	s1,24(sp)
ffffffffc0201616:	6942                	ld	s2,16(sp)
ffffffffc0201618:	69a2                	ld	s3,8(sp)
ffffffffc020161a:	6145                	addi	sp,sp,48
ffffffffc020161c:	8082                	ret
ffffffffc020161e:	4681                	li	a3,0
ffffffffc0201620:	8622                	mv	a2,s0
ffffffffc0201622:	85a6                	mv	a1,s1
ffffffffc0201624:	0000f517          	auipc	a0,0xf
ffffffffc0201628:	a7c53503          	ld	a0,-1412(a0) # ffffffffc02100a0 <check_mm_struct>
ffffffffc020162c:	7dd000ef          	jal	ra,ffffffffc0202608 <swap_map_swappable>
ffffffffc0201630:	4018                	lw	a4,0(s0)
ffffffffc0201632:	e024                	sd	s1,64(s0)
ffffffffc0201634:	4785                	li	a5,1
ffffffffc0201636:	fcf70ce3          	beq	a4,a5,ffffffffc020160e <pgdir_alloc_page+0x34>
ffffffffc020163a:	00003697          	auipc	a3,0x3
ffffffffc020163e:	3b668693          	addi	a3,a3,950 # ffffffffc02049f0 <etext+0xcd0>
ffffffffc0201642:	00003617          	auipc	a2,0x3
ffffffffc0201646:	f1660613          	addi	a2,a2,-234 # ffffffffc0204558 <etext+0x838>
ffffffffc020164a:	14800593          	li	a1,328
ffffffffc020164e:	00003517          	auipc	a0,0x3
ffffffffc0201652:	e0a50513          	addi	a0,a0,-502 # ffffffffc0204458 <etext+0x738>
ffffffffc0201656:	a97fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020165a:	8522                	mv	a0,s0
ffffffffc020165c:	4585                	li	a1,1
ffffffffc020165e:	9f0ff0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0201662:	4401                	li	s0,0
ffffffffc0201664:	b76d                	j	ffffffffc020160e <pgdir_alloc_page+0x34>

ffffffffc0201666 <kmalloc>:
ffffffffc0201666:	1141                	addi	sp,sp,-16
ffffffffc0201668:	67d5                	lui	a5,0x15
ffffffffc020166a:	e406                	sd	ra,8(sp)
ffffffffc020166c:	fff50713          	addi	a4,a0,-1
ffffffffc0201670:	17f9                	addi	a5,a5,-2
ffffffffc0201672:	04e7ea63          	bltu	a5,a4,ffffffffc02016c6 <kmalloc+0x60>
ffffffffc0201676:	6785                	lui	a5,0x1
ffffffffc0201678:	17fd                	addi	a5,a5,-1
ffffffffc020167a:	953e                	add	a0,a0,a5
ffffffffc020167c:	8131                	srli	a0,a0,0xc
ffffffffc020167e:	93eff0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0201682:	cd3d                	beqz	a0,ffffffffc0201700 <kmalloc+0x9a>
ffffffffc0201684:	0000f797          	auipc	a5,0xf
ffffffffc0201688:	a147b783          	ld	a5,-1516(a5) # ffffffffc0210098 <pages>
ffffffffc020168c:	8d1d                	sub	a0,a0,a5
ffffffffc020168e:	00004697          	auipc	a3,0x4
ffffffffc0201692:	2ba6b683          	ld	a3,698(a3) # ffffffffc0205948 <error_string+0x38>
ffffffffc0201696:	850d                	srai	a0,a0,0x3
ffffffffc0201698:	02d50533          	mul	a0,a0,a3
ffffffffc020169c:	000806b7          	lui	a3,0x80
ffffffffc02016a0:	0000f717          	auipc	a4,0xf
ffffffffc02016a4:	9b873703          	ld	a4,-1608(a4) # ffffffffc0210058 <npage>
ffffffffc02016a8:	9536                	add	a0,a0,a3
ffffffffc02016aa:	00c51793          	slli	a5,a0,0xc
ffffffffc02016ae:	83b1                	srli	a5,a5,0xc
ffffffffc02016b0:	0532                	slli	a0,a0,0xc
ffffffffc02016b2:	02e7fa63          	bgeu	a5,a4,ffffffffc02016e6 <kmalloc+0x80>
ffffffffc02016b6:	60a2                	ld	ra,8(sp)
ffffffffc02016b8:	0000f797          	auipc	a5,0xf
ffffffffc02016bc:	9d87b783          	ld	a5,-1576(a5) # ffffffffc0210090 <va_pa_offset>
ffffffffc02016c0:	953e                	add	a0,a0,a5
ffffffffc02016c2:	0141                	addi	sp,sp,16
ffffffffc02016c4:	8082                	ret
ffffffffc02016c6:	00003697          	auipc	a3,0x3
ffffffffc02016ca:	34268693          	addi	a3,a3,834 # ffffffffc0204a08 <etext+0xce8>
ffffffffc02016ce:	00003617          	auipc	a2,0x3
ffffffffc02016d2:	e8a60613          	addi	a2,a2,-374 # ffffffffc0204558 <etext+0x838>
ffffffffc02016d6:	1a900593          	li	a1,425
ffffffffc02016da:	00003517          	auipc	a0,0x3
ffffffffc02016de:	d7e50513          	addi	a0,a0,-642 # ffffffffc0204458 <etext+0x738>
ffffffffc02016e2:	a0bfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02016e6:	86aa                	mv	a3,a0
ffffffffc02016e8:	00003617          	auipc	a2,0x3
ffffffffc02016ec:	d4860613          	addi	a2,a2,-696 # ffffffffc0204430 <etext+0x710>
ffffffffc02016f0:	06a00593          	li	a1,106
ffffffffc02016f4:	00003517          	auipc	a0,0x3
ffffffffc02016f8:	d2c50513          	addi	a0,a0,-724 # ffffffffc0204420 <etext+0x700>
ffffffffc02016fc:	9f1fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201700:	00003697          	auipc	a3,0x3
ffffffffc0201704:	32868693          	addi	a3,a3,808 # ffffffffc0204a28 <etext+0xd08>
ffffffffc0201708:	00003617          	auipc	a2,0x3
ffffffffc020170c:	e5060613          	addi	a2,a2,-432 # ffffffffc0204558 <etext+0x838>
ffffffffc0201710:	1ac00593          	li	a1,428
ffffffffc0201714:	00003517          	auipc	a0,0x3
ffffffffc0201718:	d4450513          	addi	a0,a0,-700 # ffffffffc0204458 <etext+0x738>
ffffffffc020171c:	9d1fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0201720 <kfree>:
ffffffffc0201720:	1141                	addi	sp,sp,-16
ffffffffc0201722:	67d5                	lui	a5,0x15
ffffffffc0201724:	e406                	sd	ra,8(sp)
ffffffffc0201726:	fff58713          	addi	a4,a1,-1
ffffffffc020172a:	17f9                	addi	a5,a5,-2
ffffffffc020172c:	04e7e763          	bltu	a5,a4,ffffffffc020177a <kfree+0x5a>
ffffffffc0201730:	c541                	beqz	a0,ffffffffc02017b8 <kfree+0x98>
ffffffffc0201732:	6785                	lui	a5,0x1
ffffffffc0201734:	17fd                	addi	a5,a5,-1
ffffffffc0201736:	95be                	add	a1,a1,a5
ffffffffc0201738:	c02007b7          	lui	a5,0xc0200
ffffffffc020173c:	81b1                	srli	a1,a1,0xc
ffffffffc020173e:	06f56063          	bltu	a0,a5,ffffffffc020179e <kfree+0x7e>
ffffffffc0201742:	0000f697          	auipc	a3,0xf
ffffffffc0201746:	94e6b683          	ld	a3,-1714(a3) # ffffffffc0210090 <va_pa_offset>
ffffffffc020174a:	8d15                	sub	a0,a0,a3
ffffffffc020174c:	8131                	srli	a0,a0,0xc
ffffffffc020174e:	0000f797          	auipc	a5,0xf
ffffffffc0201752:	90a7b783          	ld	a5,-1782(a5) # ffffffffc0210058 <npage>
ffffffffc0201756:	04f57263          	bgeu	a0,a5,ffffffffc020179a <kfree+0x7a>
ffffffffc020175a:	fff806b7          	lui	a3,0xfff80
ffffffffc020175e:	9536                	add	a0,a0,a3
ffffffffc0201760:	00351793          	slli	a5,a0,0x3
ffffffffc0201764:	60a2                	ld	ra,8(sp)
ffffffffc0201766:	953e                	add	a0,a0,a5
ffffffffc0201768:	050e                	slli	a0,a0,0x3
ffffffffc020176a:	0000f797          	auipc	a5,0xf
ffffffffc020176e:	92e7b783          	ld	a5,-1746(a5) # ffffffffc0210098 <pages>
ffffffffc0201772:	953e                	add	a0,a0,a5
ffffffffc0201774:	0141                	addi	sp,sp,16
ffffffffc0201776:	8d8ff06f          	j	ffffffffc020084e <free_pages>
ffffffffc020177a:	00003697          	auipc	a3,0x3
ffffffffc020177e:	28e68693          	addi	a3,a3,654 # ffffffffc0204a08 <etext+0xce8>
ffffffffc0201782:	00003617          	auipc	a2,0x3
ffffffffc0201786:	dd660613          	addi	a2,a2,-554 # ffffffffc0204558 <etext+0x838>
ffffffffc020178a:	1b200593          	li	a1,434
ffffffffc020178e:	00003517          	auipc	a0,0x3
ffffffffc0201792:	cca50513          	addi	a0,a0,-822 # ffffffffc0204458 <etext+0x738>
ffffffffc0201796:	957fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020179a:	806ff0ef          	jal	ra,ffffffffc02007a0 <pa2page.part.0>
ffffffffc020179e:	86aa                	mv	a3,a0
ffffffffc02017a0:	00003617          	auipc	a2,0x3
ffffffffc02017a4:	d5060613          	addi	a2,a2,-688 # ffffffffc02044f0 <etext+0x7d0>
ffffffffc02017a8:	06c00593          	li	a1,108
ffffffffc02017ac:	00003517          	auipc	a0,0x3
ffffffffc02017b0:	c7450513          	addi	a0,a0,-908 # ffffffffc0204420 <etext+0x700>
ffffffffc02017b4:	939fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02017b8:	00003697          	auipc	a3,0x3
ffffffffc02017bc:	28068693          	addi	a3,a3,640 # ffffffffc0204a38 <etext+0xd18>
ffffffffc02017c0:	00003617          	auipc	a2,0x3
ffffffffc02017c4:	d9860613          	addi	a2,a2,-616 # ffffffffc0204558 <etext+0x838>
ffffffffc02017c8:	1b300593          	li	a1,435
ffffffffc02017cc:	00003517          	auipc	a0,0x3
ffffffffc02017d0:	c8c50513          	addi	a0,a0,-884 # ffffffffc0204458 <etext+0x738>
ffffffffc02017d4:	919fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02017d8 <check_vma_overlap.isra.0.part.0>:
ffffffffc02017d8:	1141                	addi	sp,sp,-16
ffffffffc02017da:	00003697          	auipc	a3,0x3
ffffffffc02017de:	26e68693          	addi	a3,a3,622 # ffffffffc0204a48 <etext+0xd28>
ffffffffc02017e2:	00003617          	auipc	a2,0x3
ffffffffc02017e6:	d7660613          	addi	a2,a2,-650 # ffffffffc0204558 <etext+0x838>
ffffffffc02017ea:	07c00593          	li	a1,124
ffffffffc02017ee:	00003517          	auipc	a0,0x3
ffffffffc02017f2:	27a50513          	addi	a0,a0,634 # ffffffffc0204a68 <etext+0xd48>
ffffffffc02017f6:	e406                	sd	ra,8(sp)
ffffffffc02017f8:	8f5fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02017fc <mm_create>:
ffffffffc02017fc:	1141                	addi	sp,sp,-16
ffffffffc02017fe:	03000513          	li	a0,48
ffffffffc0201802:	e022                	sd	s0,0(sp)
ffffffffc0201804:	e406                	sd	ra,8(sp)
ffffffffc0201806:	e61ff0ef          	jal	ra,ffffffffc0201666 <kmalloc>
ffffffffc020180a:	842a                	mv	s0,a0
ffffffffc020180c:	c105                	beqz	a0,ffffffffc020182c <mm_create+0x30>
ffffffffc020180e:	e408                	sd	a0,8(s0)
ffffffffc0201810:	e008                	sd	a0,0(s0)
ffffffffc0201812:	00053823          	sd	zero,16(a0)
ffffffffc0201816:	00053c23          	sd	zero,24(a0)
ffffffffc020181a:	02052023          	sw	zero,32(a0)
ffffffffc020181e:	0000f797          	auipc	a5,0xf
ffffffffc0201822:	8527a783          	lw	a5,-1966(a5) # ffffffffc0210070 <swap_init_ok>
ffffffffc0201826:	eb81                	bnez	a5,ffffffffc0201836 <mm_create+0x3a>
ffffffffc0201828:	02053423          	sd	zero,40(a0)
ffffffffc020182c:	60a2                	ld	ra,8(sp)
ffffffffc020182e:	8522                	mv	a0,s0
ffffffffc0201830:	6402                	ld	s0,0(sp)
ffffffffc0201832:	0141                	addi	sp,sp,16
ffffffffc0201834:	8082                	ret
ffffffffc0201836:	5c5000ef          	jal	ra,ffffffffc02025fa <swap_init_mm>
ffffffffc020183a:	60a2                	ld	ra,8(sp)
ffffffffc020183c:	8522                	mv	a0,s0
ffffffffc020183e:	6402                	ld	s0,0(sp)
ffffffffc0201840:	0141                	addi	sp,sp,16
ffffffffc0201842:	8082                	ret

ffffffffc0201844 <vma_create>:
ffffffffc0201844:	1101                	addi	sp,sp,-32
ffffffffc0201846:	e04a                	sd	s2,0(sp)
ffffffffc0201848:	892a                	mv	s2,a0
ffffffffc020184a:	03000513          	li	a0,48
ffffffffc020184e:	e822                	sd	s0,16(sp)
ffffffffc0201850:	e426                	sd	s1,8(sp)
ffffffffc0201852:	ec06                	sd	ra,24(sp)
ffffffffc0201854:	84ae                	mv	s1,a1
ffffffffc0201856:	8432                	mv	s0,a2
ffffffffc0201858:	e0fff0ef          	jal	ra,ffffffffc0201666 <kmalloc>
ffffffffc020185c:	c509                	beqz	a0,ffffffffc0201866 <vma_create+0x22>
ffffffffc020185e:	01253423          	sd	s2,8(a0)
ffffffffc0201862:	e904                	sd	s1,16(a0)
ffffffffc0201864:	ed00                	sd	s0,24(a0)
ffffffffc0201866:	60e2                	ld	ra,24(sp)
ffffffffc0201868:	6442                	ld	s0,16(sp)
ffffffffc020186a:	64a2                	ld	s1,8(sp)
ffffffffc020186c:	6902                	ld	s2,0(sp)
ffffffffc020186e:	6105                	addi	sp,sp,32
ffffffffc0201870:	8082                	ret

ffffffffc0201872 <find_vma>:
ffffffffc0201872:	86aa                	mv	a3,a0
ffffffffc0201874:	c505                	beqz	a0,ffffffffc020189c <find_vma+0x2a>
ffffffffc0201876:	6908                	ld	a0,16(a0)
ffffffffc0201878:	c501                	beqz	a0,ffffffffc0201880 <find_vma+0xe>
ffffffffc020187a:	651c                	ld	a5,8(a0)
ffffffffc020187c:	02f5f263          	bgeu	a1,a5,ffffffffc02018a0 <find_vma+0x2e>
ffffffffc0201880:	669c                	ld	a5,8(a3)
ffffffffc0201882:	00f68d63          	beq	a3,a5,ffffffffc020189c <find_vma+0x2a>
ffffffffc0201886:	fe87b703          	ld	a4,-24(a5)
ffffffffc020188a:	00e5e663          	bltu	a1,a4,ffffffffc0201896 <find_vma+0x24>
ffffffffc020188e:	ff07b703          	ld	a4,-16(a5)
ffffffffc0201892:	00e5ec63          	bltu	a1,a4,ffffffffc02018aa <find_vma+0x38>
ffffffffc0201896:	679c                	ld	a5,8(a5)
ffffffffc0201898:	fef697e3          	bne	a3,a5,ffffffffc0201886 <find_vma+0x14>
ffffffffc020189c:	4501                	li	a0,0
ffffffffc020189e:	8082                	ret
ffffffffc02018a0:	691c                	ld	a5,16(a0)
ffffffffc02018a2:	fcf5ffe3          	bgeu	a1,a5,ffffffffc0201880 <find_vma+0xe>
ffffffffc02018a6:	ea88                	sd	a0,16(a3)
ffffffffc02018a8:	8082                	ret
ffffffffc02018aa:	fe078513          	addi	a0,a5,-32
ffffffffc02018ae:	ea88                	sd	a0,16(a3)
ffffffffc02018b0:	8082                	ret

ffffffffc02018b2 <insert_vma_struct>:
ffffffffc02018b2:	6590                	ld	a2,8(a1)
ffffffffc02018b4:	0105b803          	ld	a6,16(a1)
ffffffffc02018b8:	1141                	addi	sp,sp,-16
ffffffffc02018ba:	e406                	sd	ra,8(sp)
ffffffffc02018bc:	87aa                	mv	a5,a0
ffffffffc02018be:	01066763          	bltu	a2,a6,ffffffffc02018cc <insert_vma_struct+0x1a>
ffffffffc02018c2:	a085                	j	ffffffffc0201922 <insert_vma_struct+0x70>
ffffffffc02018c4:	fe87b703          	ld	a4,-24(a5)
ffffffffc02018c8:	04e66863          	bltu	a2,a4,ffffffffc0201918 <insert_vma_struct+0x66>
ffffffffc02018cc:	86be                	mv	a3,a5
ffffffffc02018ce:	679c                	ld	a5,8(a5)
ffffffffc02018d0:	fef51ae3          	bne	a0,a5,ffffffffc02018c4 <insert_vma_struct+0x12>
ffffffffc02018d4:	02a68463          	beq	a3,a0,ffffffffc02018fc <insert_vma_struct+0x4a>
ffffffffc02018d8:	ff06b703          	ld	a4,-16(a3)
ffffffffc02018dc:	fe86b883          	ld	a7,-24(a3)
ffffffffc02018e0:	08e8f163          	bgeu	a7,a4,ffffffffc0201962 <insert_vma_struct+0xb0>
ffffffffc02018e4:	04e66f63          	bltu	a2,a4,ffffffffc0201942 <insert_vma_struct+0x90>
ffffffffc02018e8:	00f50a63          	beq	a0,a5,ffffffffc02018fc <insert_vma_struct+0x4a>
ffffffffc02018ec:	fe87b703          	ld	a4,-24(a5)
ffffffffc02018f0:	05076963          	bltu	a4,a6,ffffffffc0201942 <insert_vma_struct+0x90>
ffffffffc02018f4:	ff07b603          	ld	a2,-16(a5)
ffffffffc02018f8:	02c77363          	bgeu	a4,a2,ffffffffc020191e <insert_vma_struct+0x6c>
ffffffffc02018fc:	5118                	lw	a4,32(a0)
ffffffffc02018fe:	e188                	sd	a0,0(a1)
ffffffffc0201900:	02058613          	addi	a2,a1,32
ffffffffc0201904:	e390                	sd	a2,0(a5)
ffffffffc0201906:	e690                	sd	a2,8(a3)
ffffffffc0201908:	60a2                	ld	ra,8(sp)
ffffffffc020190a:	f59c                	sd	a5,40(a1)
ffffffffc020190c:	f194                	sd	a3,32(a1)
ffffffffc020190e:	0017079b          	addiw	a5,a4,1
ffffffffc0201912:	d11c                	sw	a5,32(a0)
ffffffffc0201914:	0141                	addi	sp,sp,16
ffffffffc0201916:	8082                	ret
ffffffffc0201918:	fca690e3          	bne	a3,a0,ffffffffc02018d8 <insert_vma_struct+0x26>
ffffffffc020191c:	bfd1                	j	ffffffffc02018f0 <insert_vma_struct+0x3e>
ffffffffc020191e:	ebbff0ef          	jal	ra,ffffffffc02017d8 <check_vma_overlap.isra.0.part.0>
ffffffffc0201922:	00003697          	auipc	a3,0x3
ffffffffc0201926:	15668693          	addi	a3,a3,342 # ffffffffc0204a78 <etext+0xd58>
ffffffffc020192a:	00003617          	auipc	a2,0x3
ffffffffc020192e:	c2e60613          	addi	a2,a2,-978 # ffffffffc0204558 <etext+0x838>
ffffffffc0201932:	08300593          	li	a1,131
ffffffffc0201936:	00003517          	auipc	a0,0x3
ffffffffc020193a:	13250513          	addi	a0,a0,306 # ffffffffc0204a68 <etext+0xd48>
ffffffffc020193e:	faefe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201942:	00003697          	auipc	a3,0x3
ffffffffc0201946:	17668693          	addi	a3,a3,374 # ffffffffc0204ab8 <etext+0xd98>
ffffffffc020194a:	00003617          	auipc	a2,0x3
ffffffffc020194e:	c0e60613          	addi	a2,a2,-1010 # ffffffffc0204558 <etext+0x838>
ffffffffc0201952:	07b00593          	li	a1,123
ffffffffc0201956:	00003517          	auipc	a0,0x3
ffffffffc020195a:	11250513          	addi	a0,a0,274 # ffffffffc0204a68 <etext+0xd48>
ffffffffc020195e:	f8efe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201962:	00003697          	auipc	a3,0x3
ffffffffc0201966:	13668693          	addi	a3,a3,310 # ffffffffc0204a98 <etext+0xd78>
ffffffffc020196a:	00003617          	auipc	a2,0x3
ffffffffc020196e:	bee60613          	addi	a2,a2,-1042 # ffffffffc0204558 <etext+0x838>
ffffffffc0201972:	07a00593          	li	a1,122
ffffffffc0201976:	00003517          	auipc	a0,0x3
ffffffffc020197a:	0f250513          	addi	a0,a0,242 # ffffffffc0204a68 <etext+0xd48>
ffffffffc020197e:	f6efe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0201982 <mm_destroy>:
ffffffffc0201982:	1141                	addi	sp,sp,-16
ffffffffc0201984:	e022                	sd	s0,0(sp)
ffffffffc0201986:	842a                	mv	s0,a0
ffffffffc0201988:	6508                	ld	a0,8(a0)
ffffffffc020198a:	e406                	sd	ra,8(sp)
ffffffffc020198c:	00a40e63          	beq	s0,a0,ffffffffc02019a8 <mm_destroy+0x26>
ffffffffc0201990:	6118                	ld	a4,0(a0)
ffffffffc0201992:	651c                	ld	a5,8(a0)
ffffffffc0201994:	03000593          	li	a1,48
ffffffffc0201998:	1501                	addi	a0,a0,-32
ffffffffc020199a:	e71c                	sd	a5,8(a4)
ffffffffc020199c:	e398                	sd	a4,0(a5)
ffffffffc020199e:	d83ff0ef          	jal	ra,ffffffffc0201720 <kfree>
ffffffffc02019a2:	6408                	ld	a0,8(s0)
ffffffffc02019a4:	fea416e3          	bne	s0,a0,ffffffffc0201990 <mm_destroy+0xe>
ffffffffc02019a8:	8522                	mv	a0,s0
ffffffffc02019aa:	6402                	ld	s0,0(sp)
ffffffffc02019ac:	60a2                	ld	ra,8(sp)
ffffffffc02019ae:	03000593          	li	a1,48
ffffffffc02019b2:	0141                	addi	sp,sp,16
ffffffffc02019b4:	b3b5                	j	ffffffffc0201720 <kfree>

ffffffffc02019b6 <vmm_init>:
ffffffffc02019b6:	715d                	addi	sp,sp,-80
ffffffffc02019b8:	e486                	sd	ra,72(sp)
ffffffffc02019ba:	e0a2                	sd	s0,64(sp)
ffffffffc02019bc:	fc26                	sd	s1,56(sp)
ffffffffc02019be:	f84a                	sd	s2,48(sp)
ffffffffc02019c0:	f052                	sd	s4,32(sp)
ffffffffc02019c2:	f44e                	sd	s3,40(sp)
ffffffffc02019c4:	ec56                	sd	s5,24(sp)
ffffffffc02019c6:	e85a                	sd	s6,16(sp)
ffffffffc02019c8:	e45e                	sd	s7,8(sp)
ffffffffc02019ca:	ec7fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc02019ce:	892a                	mv	s2,a0
ffffffffc02019d0:	ec1fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc02019d4:	8a2a                	mv	s4,a0
ffffffffc02019d6:	e27ff0ef          	jal	ra,ffffffffc02017fc <mm_create>
ffffffffc02019da:	842a                	mv	s0,a0
ffffffffc02019dc:	03200493          	li	s1,50
ffffffffc02019e0:	e919                	bnez	a0,ffffffffc02019f6 <vmm_init+0x40>
ffffffffc02019e2:	aed5                	j	ffffffffc0201dd6 <vmm_init+0x420>
ffffffffc02019e4:	e504                	sd	s1,8(a0)
ffffffffc02019e6:	e91c                	sd	a5,16(a0)
ffffffffc02019e8:	00053c23          	sd	zero,24(a0)
ffffffffc02019ec:	14ed                	addi	s1,s1,-5
ffffffffc02019ee:	8522                	mv	a0,s0
ffffffffc02019f0:	ec3ff0ef          	jal	ra,ffffffffc02018b2 <insert_vma_struct>
ffffffffc02019f4:	c88d                	beqz	s1,ffffffffc0201a26 <vmm_init+0x70>
ffffffffc02019f6:	03000513          	li	a0,48
ffffffffc02019fa:	c6dff0ef          	jal	ra,ffffffffc0201666 <kmalloc>
ffffffffc02019fe:	85aa                	mv	a1,a0
ffffffffc0201a00:	00248793          	addi	a5,s1,2
ffffffffc0201a04:	f165                	bnez	a0,ffffffffc02019e4 <vmm_init+0x2e>
ffffffffc0201a06:	00003697          	auipc	a3,0x3
ffffffffc0201a0a:	2fa68693          	addi	a3,a3,762 # ffffffffc0204d00 <etext+0xfe0>
ffffffffc0201a0e:	00003617          	auipc	a2,0x3
ffffffffc0201a12:	b4a60613          	addi	a2,a2,-1206 # ffffffffc0204558 <etext+0x838>
ffffffffc0201a16:	0cd00593          	li	a1,205
ffffffffc0201a1a:	00003517          	auipc	a0,0x3
ffffffffc0201a1e:	04e50513          	addi	a0,a0,78 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201a22:	ecafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201a26:	03700493          	li	s1,55
ffffffffc0201a2a:	1f900993          	li	s3,505
ffffffffc0201a2e:	a819                	j	ffffffffc0201a44 <vmm_init+0x8e>
ffffffffc0201a30:	e504                	sd	s1,8(a0)
ffffffffc0201a32:	e91c                	sd	a5,16(a0)
ffffffffc0201a34:	00053c23          	sd	zero,24(a0)
ffffffffc0201a38:	0495                	addi	s1,s1,5
ffffffffc0201a3a:	8522                	mv	a0,s0
ffffffffc0201a3c:	e77ff0ef          	jal	ra,ffffffffc02018b2 <insert_vma_struct>
ffffffffc0201a40:	03348a63          	beq	s1,s3,ffffffffc0201a74 <vmm_init+0xbe>
ffffffffc0201a44:	03000513          	li	a0,48
ffffffffc0201a48:	c1fff0ef          	jal	ra,ffffffffc0201666 <kmalloc>
ffffffffc0201a4c:	85aa                	mv	a1,a0
ffffffffc0201a4e:	00248793          	addi	a5,s1,2
ffffffffc0201a52:	fd79                	bnez	a0,ffffffffc0201a30 <vmm_init+0x7a>
ffffffffc0201a54:	00003697          	auipc	a3,0x3
ffffffffc0201a58:	2ac68693          	addi	a3,a3,684 # ffffffffc0204d00 <etext+0xfe0>
ffffffffc0201a5c:	00003617          	auipc	a2,0x3
ffffffffc0201a60:	afc60613          	addi	a2,a2,-1284 # ffffffffc0204558 <etext+0x838>
ffffffffc0201a64:	0d300593          	li	a1,211
ffffffffc0201a68:	00003517          	auipc	a0,0x3
ffffffffc0201a6c:	00050513          	mv	a0,a0
ffffffffc0201a70:	e7cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201a74:	6418                	ld	a4,8(s0)
ffffffffc0201a76:	479d                	li	a5,7
ffffffffc0201a78:	1fb00593          	li	a1,507
ffffffffc0201a7c:	28e40d63          	beq	s0,a4,ffffffffc0201d16 <vmm_init+0x360>
ffffffffc0201a80:	fe873683          	ld	a3,-24(a4)
ffffffffc0201a84:	ffe78613          	addi	a2,a5,-2
ffffffffc0201a88:	20d61763          	bne	a2,a3,ffffffffc0201c96 <vmm_init+0x2e0>
ffffffffc0201a8c:	ff073683          	ld	a3,-16(a4)
ffffffffc0201a90:	20d79363          	bne	a5,a3,ffffffffc0201c96 <vmm_init+0x2e0>
ffffffffc0201a94:	0795                	addi	a5,a5,5
ffffffffc0201a96:	6718                	ld	a4,8(a4)
ffffffffc0201a98:	feb792e3          	bne	a5,a1,ffffffffc0201a7c <vmm_init+0xc6>
ffffffffc0201a9c:	4b1d                	li	s6,7
ffffffffc0201a9e:	4495                	li	s1,5
ffffffffc0201aa0:	1f900b93          	li	s7,505
ffffffffc0201aa4:	85a6                	mv	a1,s1
ffffffffc0201aa6:	8522                	mv	a0,s0
ffffffffc0201aa8:	dcbff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201aac:	8aaa                	mv	s5,a0
ffffffffc0201aae:	2e050463          	beqz	a0,ffffffffc0201d96 <vmm_init+0x3e0>
ffffffffc0201ab2:	00148593          	addi	a1,s1,1
ffffffffc0201ab6:	8522                	mv	a0,s0
ffffffffc0201ab8:	dbbff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201abc:	89aa                	mv	s3,a0
ffffffffc0201abe:	2a050c63          	beqz	a0,ffffffffc0201d76 <vmm_init+0x3c0>
ffffffffc0201ac2:	85da                	mv	a1,s6
ffffffffc0201ac4:	8522                	mv	a0,s0
ffffffffc0201ac6:	dadff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201aca:	28051663          	bnez	a0,ffffffffc0201d56 <vmm_init+0x3a0>
ffffffffc0201ace:	00348593          	addi	a1,s1,3
ffffffffc0201ad2:	8522                	mv	a0,s0
ffffffffc0201ad4:	d9fff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201ad8:	24051f63          	bnez	a0,ffffffffc0201d36 <vmm_init+0x380>
ffffffffc0201adc:	00448593          	addi	a1,s1,4
ffffffffc0201ae0:	8522                	mv	a0,s0
ffffffffc0201ae2:	d91ff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201ae6:	2c051863          	bnez	a0,ffffffffc0201db6 <vmm_init+0x400>
ffffffffc0201aea:	008ab783          	ld	a5,8(s5)
ffffffffc0201aee:	1c979463          	bne	a5,s1,ffffffffc0201cb6 <vmm_init+0x300>
ffffffffc0201af2:	010ab783          	ld	a5,16(s5)
ffffffffc0201af6:	1d679063          	bne	a5,s6,ffffffffc0201cb6 <vmm_init+0x300>
ffffffffc0201afa:	0089b783          	ld	a5,8(s3)
ffffffffc0201afe:	1c979c63          	bne	a5,s1,ffffffffc0201cd6 <vmm_init+0x320>
ffffffffc0201b02:	0109b783          	ld	a5,16(s3)
ffffffffc0201b06:	1d679863          	bne	a5,s6,ffffffffc0201cd6 <vmm_init+0x320>
ffffffffc0201b0a:	0495                	addi	s1,s1,5
ffffffffc0201b0c:	0b15                	addi	s6,s6,5
ffffffffc0201b0e:	f9749be3          	bne	s1,s7,ffffffffc0201aa4 <vmm_init+0xee>
ffffffffc0201b12:	4491                	li	s1,4
ffffffffc0201b14:	59fd                	li	s3,-1
ffffffffc0201b16:	85a6                	mv	a1,s1
ffffffffc0201b18:	8522                	mv	a0,s0
ffffffffc0201b1a:	d59ff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201b1e:	0004859b          	sext.w	a1,s1
ffffffffc0201b22:	c90d                	beqz	a0,ffffffffc0201b54 <vmm_init+0x19e>
ffffffffc0201b24:	6914                	ld	a3,16(a0)
ffffffffc0201b26:	6510                	ld	a2,8(a0)
ffffffffc0201b28:	00003517          	auipc	a0,0x3
ffffffffc0201b2c:	0c050513          	addi	a0,a0,192 # ffffffffc0204be8 <etext+0xec8>
ffffffffc0201b30:	d86fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201b34:	00003697          	auipc	a3,0x3
ffffffffc0201b38:	0dc68693          	addi	a3,a3,220 # ffffffffc0204c10 <etext+0xef0>
ffffffffc0201b3c:	00003617          	auipc	a2,0x3
ffffffffc0201b40:	a1c60613          	addi	a2,a2,-1508 # ffffffffc0204558 <etext+0x838>
ffffffffc0201b44:	0f500593          	li	a1,245
ffffffffc0201b48:	00003517          	auipc	a0,0x3
ffffffffc0201b4c:	f2050513          	addi	a0,a0,-224 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201b50:	d9cfe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201b54:	14fd                	addi	s1,s1,-1
ffffffffc0201b56:	fd3490e3          	bne	s1,s3,ffffffffc0201b16 <vmm_init+0x160>
ffffffffc0201b5a:	8522                	mv	a0,s0
ffffffffc0201b5c:	e27ff0ef          	jal	ra,ffffffffc0201982 <mm_destroy>
ffffffffc0201b60:	d31fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc0201b64:	28aa1963          	bne	s4,a0,ffffffffc0201df6 <vmm_init+0x440>
ffffffffc0201b68:	00003517          	auipc	a0,0x3
ffffffffc0201b6c:	0e850513          	addi	a0,a0,232 # ffffffffc0204c50 <etext+0xf30>
ffffffffc0201b70:	d46fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201b74:	d1dfe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc0201b78:	89aa                	mv	s3,a0
ffffffffc0201b7a:	c83ff0ef          	jal	ra,ffffffffc02017fc <mm_create>
ffffffffc0201b7e:	0000e797          	auipc	a5,0xe
ffffffffc0201b82:	52a7b123          	sd	a0,1314(a5) # ffffffffc02100a0 <check_mm_struct>
ffffffffc0201b86:	842a                	mv	s0,a0
ffffffffc0201b88:	2a050763          	beqz	a0,ffffffffc0201e36 <vmm_init+0x480>
ffffffffc0201b8c:	0000ea17          	auipc	s4,0xe
ffffffffc0201b90:	4c4a3a03          	ld	s4,1220(s4) # ffffffffc0210050 <boot_pgdir>
ffffffffc0201b94:	000a3783          	ld	a5,0(s4)
ffffffffc0201b98:	01453c23          	sd	s4,24(a0)
ffffffffc0201b9c:	32079963          	bnez	a5,ffffffffc0201ece <vmm_init+0x518>
ffffffffc0201ba0:	03000513          	li	a0,48
ffffffffc0201ba4:	ac3ff0ef          	jal	ra,ffffffffc0201666 <kmalloc>
ffffffffc0201ba8:	84aa                	mv	s1,a0
ffffffffc0201baa:	14050663          	beqz	a0,ffffffffc0201cf6 <vmm_init+0x340>
ffffffffc0201bae:	002007b7          	lui	a5,0x200
ffffffffc0201bb2:	e89c                	sd	a5,16(s1)
ffffffffc0201bb4:	4789                	li	a5,2
ffffffffc0201bb6:	85aa                	mv	a1,a0
ffffffffc0201bb8:	ec9c                	sd	a5,24(s1)
ffffffffc0201bba:	8522                	mv	a0,s0
ffffffffc0201bbc:	0004b423          	sd	zero,8(s1)
ffffffffc0201bc0:	cf3ff0ef          	jal	ra,ffffffffc02018b2 <insert_vma_struct>
ffffffffc0201bc4:	10000593          	li	a1,256
ffffffffc0201bc8:	8522                	mv	a0,s0
ffffffffc0201bca:	ca9ff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201bce:	10000793          	li	a5,256
ffffffffc0201bd2:	16400713          	li	a4,356
ffffffffc0201bd6:	2aa49063          	bne	s1,a0,ffffffffc0201e76 <vmm_init+0x4c0>
ffffffffc0201bda:	00f78023          	sb	a5,0(a5) # 200000 <kern_entry-0xffffffffc0000000>
ffffffffc0201bde:	0785                	addi	a5,a5,1
ffffffffc0201be0:	fee79de3          	bne	a5,a4,ffffffffc0201bda <vmm_init+0x224>
ffffffffc0201be4:	6705                	lui	a4,0x1
ffffffffc0201be6:	10000793          	li	a5,256
ffffffffc0201bea:	35670713          	addi	a4,a4,854 # 1356 <kern_entry-0xffffffffc01fecaa>
ffffffffc0201bee:	16400613          	li	a2,356
ffffffffc0201bf2:	0007c683          	lbu	a3,0(a5)
ffffffffc0201bf6:	0785                	addi	a5,a5,1
ffffffffc0201bf8:	9f15                	subw	a4,a4,a3
ffffffffc0201bfa:	fec79ce3          	bne	a5,a2,ffffffffc0201bf2 <vmm_init+0x23c>
ffffffffc0201bfe:	2a071863          	bnez	a4,ffffffffc0201eae <vmm_init+0x4f8>
ffffffffc0201c02:	4581                	li	a1,0
ffffffffc0201c04:	8552                	mv	a0,s4
ffffffffc0201c06:	f17fe0ef          	jal	ra,ffffffffc0200b1c <page_remove>
ffffffffc0201c0a:	000a3783          	ld	a5,0(s4)
ffffffffc0201c0e:	0000e717          	auipc	a4,0xe
ffffffffc0201c12:	44a73703          	ld	a4,1098(a4) # ffffffffc0210058 <npage>
ffffffffc0201c16:	078a                	slli	a5,a5,0x2
ffffffffc0201c18:	83b1                	srli	a5,a5,0xc
ffffffffc0201c1a:	26e7fe63          	bgeu	a5,a4,ffffffffc0201e96 <vmm_init+0x4e0>
ffffffffc0201c1e:	00004517          	auipc	a0,0x4
ffffffffc0201c22:	d3253503          	ld	a0,-718(a0) # ffffffffc0205950 <nbase>
ffffffffc0201c26:	8f89                	sub	a5,a5,a0
ffffffffc0201c28:	00379513          	slli	a0,a5,0x3
ffffffffc0201c2c:	97aa                	add	a5,a5,a0
ffffffffc0201c2e:	078e                	slli	a5,a5,0x3
ffffffffc0201c30:	0000e517          	auipc	a0,0xe
ffffffffc0201c34:	46853503          	ld	a0,1128(a0) # ffffffffc0210098 <pages>
ffffffffc0201c38:	953e                	add	a0,a0,a5
ffffffffc0201c3a:	4585                	li	a1,1
ffffffffc0201c3c:	c13fe0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0201c40:	000a3023          	sd	zero,0(s4)
ffffffffc0201c44:	8522                	mv	a0,s0
ffffffffc0201c46:	00043c23          	sd	zero,24(s0)
ffffffffc0201c4a:	d39ff0ef          	jal	ra,ffffffffc0201982 <mm_destroy>
ffffffffc0201c4e:	19fd                	addi	s3,s3,-1
ffffffffc0201c50:	0000e797          	auipc	a5,0xe
ffffffffc0201c54:	4407b823          	sd	zero,1104(a5) # ffffffffc02100a0 <check_mm_struct>
ffffffffc0201c58:	c39fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc0201c5c:	1aa99d63          	bne	s3,a0,ffffffffc0201e16 <vmm_init+0x460>
ffffffffc0201c60:	00003517          	auipc	a0,0x3
ffffffffc0201c64:	06850513          	addi	a0,a0,104 # ffffffffc0204cc8 <etext+0xfa8>
ffffffffc0201c68:	c4efe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201c6c:	c25fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc0201c70:	197d                	addi	s2,s2,-1
ffffffffc0201c72:	1ea91263          	bne	s2,a0,ffffffffc0201e56 <vmm_init+0x4a0>
ffffffffc0201c76:	6406                	ld	s0,64(sp)
ffffffffc0201c78:	60a6                	ld	ra,72(sp)
ffffffffc0201c7a:	74e2                	ld	s1,56(sp)
ffffffffc0201c7c:	7942                	ld	s2,48(sp)
ffffffffc0201c7e:	79a2                	ld	s3,40(sp)
ffffffffc0201c80:	7a02                	ld	s4,32(sp)
ffffffffc0201c82:	6ae2                	ld	s5,24(sp)
ffffffffc0201c84:	6b42                	ld	s6,16(sp)
ffffffffc0201c86:	6ba2                	ld	s7,8(sp)
ffffffffc0201c88:	00003517          	auipc	a0,0x3
ffffffffc0201c8c:	06050513          	addi	a0,a0,96 # ffffffffc0204ce8 <etext+0xfc8>
ffffffffc0201c90:	6161                	addi	sp,sp,80
ffffffffc0201c92:	c24fe06f          	j	ffffffffc02000b6 <cprintf>
ffffffffc0201c96:	00003697          	auipc	a3,0x3
ffffffffc0201c9a:	e6a68693          	addi	a3,a3,-406 # ffffffffc0204b00 <etext+0xde0>
ffffffffc0201c9e:	00003617          	auipc	a2,0x3
ffffffffc0201ca2:	8ba60613          	addi	a2,a2,-1862 # ffffffffc0204558 <etext+0x838>
ffffffffc0201ca6:	0dc00593          	li	a1,220
ffffffffc0201caa:	00003517          	auipc	a0,0x3
ffffffffc0201cae:	dbe50513          	addi	a0,a0,-578 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201cb2:	c3afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201cb6:	00003697          	auipc	a3,0x3
ffffffffc0201cba:	ed268693          	addi	a3,a3,-302 # ffffffffc0204b88 <etext+0xe68>
ffffffffc0201cbe:	00003617          	auipc	a2,0x3
ffffffffc0201cc2:	89a60613          	addi	a2,a2,-1894 # ffffffffc0204558 <etext+0x838>
ffffffffc0201cc6:	0ec00593          	li	a1,236
ffffffffc0201cca:	00003517          	auipc	a0,0x3
ffffffffc0201cce:	d9e50513          	addi	a0,a0,-610 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201cd2:	c1afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201cd6:	00003697          	auipc	a3,0x3
ffffffffc0201cda:	ee268693          	addi	a3,a3,-286 # ffffffffc0204bb8 <etext+0xe98>
ffffffffc0201cde:	00003617          	auipc	a2,0x3
ffffffffc0201ce2:	87a60613          	addi	a2,a2,-1926 # ffffffffc0204558 <etext+0x838>
ffffffffc0201ce6:	0ed00593          	li	a1,237
ffffffffc0201cea:	00003517          	auipc	a0,0x3
ffffffffc0201cee:	d7e50513          	addi	a0,a0,-642 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201cf2:	bfafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201cf6:	00003697          	auipc	a3,0x3
ffffffffc0201cfa:	00a68693          	addi	a3,a3,10 # ffffffffc0204d00 <etext+0xfe0>
ffffffffc0201cfe:	00003617          	auipc	a2,0x3
ffffffffc0201d02:	85a60613          	addi	a2,a2,-1958 # ffffffffc0204558 <etext+0x838>
ffffffffc0201d06:	11000593          	li	a1,272
ffffffffc0201d0a:	00003517          	auipc	a0,0x3
ffffffffc0201d0e:	d5e50513          	addi	a0,a0,-674 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201d12:	bdafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201d16:	00003697          	auipc	a3,0x3
ffffffffc0201d1a:	dd268693          	addi	a3,a3,-558 # ffffffffc0204ae8 <etext+0xdc8>
ffffffffc0201d1e:	00003617          	auipc	a2,0x3
ffffffffc0201d22:	83a60613          	addi	a2,a2,-1990 # ffffffffc0204558 <etext+0x838>
ffffffffc0201d26:	0da00593          	li	a1,218
ffffffffc0201d2a:	00003517          	auipc	a0,0x3
ffffffffc0201d2e:	d3e50513          	addi	a0,a0,-706 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201d32:	bbafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201d36:	00003697          	auipc	a3,0x3
ffffffffc0201d3a:	e3268693          	addi	a3,a3,-462 # ffffffffc0204b68 <etext+0xe48>
ffffffffc0201d3e:	00003617          	auipc	a2,0x3
ffffffffc0201d42:	81a60613          	addi	a2,a2,-2022 # ffffffffc0204558 <etext+0x838>
ffffffffc0201d46:	0e800593          	li	a1,232
ffffffffc0201d4a:	00003517          	auipc	a0,0x3
ffffffffc0201d4e:	d1e50513          	addi	a0,a0,-738 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201d52:	b9afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201d56:	00003697          	auipc	a3,0x3
ffffffffc0201d5a:	e0268693          	addi	a3,a3,-510 # ffffffffc0204b58 <etext+0xe38>
ffffffffc0201d5e:	00002617          	auipc	a2,0x2
ffffffffc0201d62:	7fa60613          	addi	a2,a2,2042 # ffffffffc0204558 <etext+0x838>
ffffffffc0201d66:	0e600593          	li	a1,230
ffffffffc0201d6a:	00003517          	auipc	a0,0x3
ffffffffc0201d6e:	cfe50513          	addi	a0,a0,-770 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201d72:	b7afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201d76:	00003697          	auipc	a3,0x3
ffffffffc0201d7a:	dd268693          	addi	a3,a3,-558 # ffffffffc0204b48 <etext+0xe28>
ffffffffc0201d7e:	00002617          	auipc	a2,0x2
ffffffffc0201d82:	7da60613          	addi	a2,a2,2010 # ffffffffc0204558 <etext+0x838>
ffffffffc0201d86:	0e400593          	li	a1,228
ffffffffc0201d8a:	00003517          	auipc	a0,0x3
ffffffffc0201d8e:	cde50513          	addi	a0,a0,-802 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201d92:	b5afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201d96:	00003697          	auipc	a3,0x3
ffffffffc0201d9a:	da268693          	addi	a3,a3,-606 # ffffffffc0204b38 <etext+0xe18>
ffffffffc0201d9e:	00002617          	auipc	a2,0x2
ffffffffc0201da2:	7ba60613          	addi	a2,a2,1978 # ffffffffc0204558 <etext+0x838>
ffffffffc0201da6:	0e200593          	li	a1,226
ffffffffc0201daa:	00003517          	auipc	a0,0x3
ffffffffc0201dae:	cbe50513          	addi	a0,a0,-834 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201db2:	b3afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201db6:	00003697          	auipc	a3,0x3
ffffffffc0201dba:	dc268693          	addi	a3,a3,-574 # ffffffffc0204b78 <etext+0xe58>
ffffffffc0201dbe:	00002617          	auipc	a2,0x2
ffffffffc0201dc2:	79a60613          	addi	a2,a2,1946 # ffffffffc0204558 <etext+0x838>
ffffffffc0201dc6:	0ea00593          	li	a1,234
ffffffffc0201dca:	00003517          	auipc	a0,0x3
ffffffffc0201dce:	c9e50513          	addi	a0,a0,-866 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201dd2:	b1afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201dd6:	00003697          	auipc	a3,0x3
ffffffffc0201dda:	d0268693          	addi	a3,a3,-766 # ffffffffc0204ad8 <etext+0xdb8>
ffffffffc0201dde:	00002617          	auipc	a2,0x2
ffffffffc0201de2:	77a60613          	addi	a2,a2,1914 # ffffffffc0204558 <etext+0x838>
ffffffffc0201de6:	0c600593          	li	a1,198
ffffffffc0201dea:	00003517          	auipc	a0,0x3
ffffffffc0201dee:	c7e50513          	addi	a0,a0,-898 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201df2:	afafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201df6:	00003697          	auipc	a3,0x3
ffffffffc0201dfa:	e3268693          	addi	a3,a3,-462 # ffffffffc0204c28 <etext+0xf08>
ffffffffc0201dfe:	00002617          	auipc	a2,0x2
ffffffffc0201e02:	75a60613          	addi	a2,a2,1882 # ffffffffc0204558 <etext+0x838>
ffffffffc0201e06:	0fa00593          	li	a1,250
ffffffffc0201e0a:	00003517          	auipc	a0,0x3
ffffffffc0201e0e:	c5e50513          	addi	a0,a0,-930 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201e12:	adafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201e16:	00003697          	auipc	a3,0x3
ffffffffc0201e1a:	e1268693          	addi	a3,a3,-494 # ffffffffc0204c28 <etext+0xf08>
ffffffffc0201e1e:	00002617          	auipc	a2,0x2
ffffffffc0201e22:	73a60613          	addi	a2,a2,1850 # ffffffffc0204558 <etext+0x838>
ffffffffc0201e26:	12c00593          	li	a1,300
ffffffffc0201e2a:	00003517          	auipc	a0,0x3
ffffffffc0201e2e:	c3e50513          	addi	a0,a0,-962 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201e32:	abafe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201e36:	00003697          	auipc	a3,0x3
ffffffffc0201e3a:	e3a68693          	addi	a3,a3,-454 # ffffffffc0204c70 <etext+0xf50>
ffffffffc0201e3e:	00002617          	auipc	a2,0x2
ffffffffc0201e42:	71a60613          	addi	a2,a2,1818 # ffffffffc0204558 <etext+0x838>
ffffffffc0201e46:	10900593          	li	a1,265
ffffffffc0201e4a:	00003517          	auipc	a0,0x3
ffffffffc0201e4e:	c1e50513          	addi	a0,a0,-994 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201e52:	a9afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201e56:	00003697          	auipc	a3,0x3
ffffffffc0201e5a:	dd268693          	addi	a3,a3,-558 # ffffffffc0204c28 <etext+0xf08>
ffffffffc0201e5e:	00002617          	auipc	a2,0x2
ffffffffc0201e62:	6fa60613          	addi	a2,a2,1786 # ffffffffc0204558 <etext+0x838>
ffffffffc0201e66:	0bc00593          	li	a1,188
ffffffffc0201e6a:	00003517          	auipc	a0,0x3
ffffffffc0201e6e:	bfe50513          	addi	a0,a0,-1026 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201e72:	a7afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201e76:	00003697          	auipc	a3,0x3
ffffffffc0201e7a:	e2268693          	addi	a3,a3,-478 # ffffffffc0204c98 <etext+0xf78>
ffffffffc0201e7e:	00002617          	auipc	a2,0x2
ffffffffc0201e82:	6da60613          	addi	a2,a2,1754 # ffffffffc0204558 <etext+0x838>
ffffffffc0201e86:	11500593          	li	a1,277
ffffffffc0201e8a:	00003517          	auipc	a0,0x3
ffffffffc0201e8e:	bde50513          	addi	a0,a0,-1058 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201e92:	a5afe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201e96:	00002617          	auipc	a2,0x2
ffffffffc0201e9a:	56a60613          	addi	a2,a2,1386 # ffffffffc0204400 <etext+0x6e0>
ffffffffc0201e9e:	06500593          	li	a1,101
ffffffffc0201ea2:	00002517          	auipc	a0,0x2
ffffffffc0201ea6:	57e50513          	addi	a0,a0,1406 # ffffffffc0204420 <etext+0x700>
ffffffffc0201eaa:	a42fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201eae:	00003697          	auipc	a3,0x3
ffffffffc0201eb2:	e0a68693          	addi	a3,a3,-502 # ffffffffc0204cb8 <etext+0xf98>
ffffffffc0201eb6:	00002617          	auipc	a2,0x2
ffffffffc0201eba:	6a260613          	addi	a2,a2,1698 # ffffffffc0204558 <etext+0x838>
ffffffffc0201ebe:	11f00593          	li	a1,287
ffffffffc0201ec2:	00003517          	auipc	a0,0x3
ffffffffc0201ec6:	ba650513          	addi	a0,a0,-1114 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201eca:	a22fe0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0201ece:	00003697          	auipc	a3,0x3
ffffffffc0201ed2:	dba68693          	addi	a3,a3,-582 # ffffffffc0204c88 <etext+0xf68>
ffffffffc0201ed6:	00002617          	auipc	a2,0x2
ffffffffc0201eda:	68260613          	addi	a2,a2,1666 # ffffffffc0204558 <etext+0x838>
ffffffffc0201ede:	10c00593          	li	a1,268
ffffffffc0201ee2:	00003517          	auipc	a0,0x3
ffffffffc0201ee6:	b8650513          	addi	a0,a0,-1146 # ffffffffc0204a68 <etext+0xd48>
ffffffffc0201eea:	a02fe0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0201eee <do_pgfault>:
ffffffffc0201eee:	7179                	addi	sp,sp,-48
ffffffffc0201ef0:	85b2                	mv	a1,a2
ffffffffc0201ef2:	f022                	sd	s0,32(sp)
ffffffffc0201ef4:	ec26                	sd	s1,24(sp)
ffffffffc0201ef6:	f406                	sd	ra,40(sp)
ffffffffc0201ef8:	e84a                	sd	s2,16(sp)
ffffffffc0201efa:	8432                	mv	s0,a2
ffffffffc0201efc:	84aa                	mv	s1,a0
ffffffffc0201efe:	975ff0ef          	jal	ra,ffffffffc0201872 <find_vma>
ffffffffc0201f02:	0000e797          	auipc	a5,0xe
ffffffffc0201f06:	15e7a783          	lw	a5,350(a5) # ffffffffc0210060 <pgfault_num>
ffffffffc0201f0a:	2785                	addiw	a5,a5,1
ffffffffc0201f0c:	0000e717          	auipc	a4,0xe
ffffffffc0201f10:	14f72a23          	sw	a5,340(a4) # ffffffffc0210060 <pgfault_num>
ffffffffc0201f14:	c159                	beqz	a0,ffffffffc0201f9a <do_pgfault+0xac>
ffffffffc0201f16:	651c                	ld	a5,8(a0)
ffffffffc0201f18:	08f46163          	bltu	s0,a5,ffffffffc0201f9a <do_pgfault+0xac>
ffffffffc0201f1c:	6d1c                	ld	a5,24(a0)
ffffffffc0201f1e:	4941                	li	s2,16
ffffffffc0201f20:	8b89                	andi	a5,a5,2
ffffffffc0201f22:	ebb1                	bnez	a5,ffffffffc0201f76 <do_pgfault+0x88>
ffffffffc0201f24:	75fd                	lui	a1,0xfffff
ffffffffc0201f26:	6c88                	ld	a0,24(s1)
ffffffffc0201f28:	8c6d                	and	s0,s0,a1
ffffffffc0201f2a:	85a2                	mv	a1,s0
ffffffffc0201f2c:	4605                	li	a2,1
ffffffffc0201f2e:	99ffe0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0201f32:	610c                	ld	a1,0(a0)
ffffffffc0201f34:	c1b9                	beqz	a1,ffffffffc0201f7a <do_pgfault+0x8c>
ffffffffc0201f36:	0000e797          	auipc	a5,0xe
ffffffffc0201f3a:	13a7a783          	lw	a5,314(a5) # ffffffffc0210070 <swap_init_ok>
ffffffffc0201f3e:	c7bd                	beqz	a5,ffffffffc0201fac <do_pgfault+0xbe>
ffffffffc0201f40:	85a2                	mv	a1,s0
ffffffffc0201f42:	0030                	addi	a2,sp,8
ffffffffc0201f44:	8526                	mv	a0,s1
ffffffffc0201f46:	e402                	sd	zero,8(sp)
ffffffffc0201f48:	7e2000ef          	jal	ra,ffffffffc020272a <swap_in>
ffffffffc0201f4c:	65a2                	ld	a1,8(sp)
ffffffffc0201f4e:	6c88                	ld	a0,24(s1)
ffffffffc0201f50:	86ca                	mv	a3,s2
ffffffffc0201f52:	8622                	mv	a2,s0
ffffffffc0201f54:	c37fe0ef          	jal	ra,ffffffffc0200b8a <page_insert>
ffffffffc0201f58:	6622                	ld	a2,8(sp)
ffffffffc0201f5a:	4685                	li	a3,1
ffffffffc0201f5c:	85a2                	mv	a1,s0
ffffffffc0201f5e:	8526                	mv	a0,s1
ffffffffc0201f60:	6a8000ef          	jal	ra,ffffffffc0202608 <swap_map_swappable>
ffffffffc0201f64:	67a2                	ld	a5,8(sp)
ffffffffc0201f66:	4501                	li	a0,0
ffffffffc0201f68:	e3a0                	sd	s0,64(a5)
ffffffffc0201f6a:	70a2                	ld	ra,40(sp)
ffffffffc0201f6c:	7402                	ld	s0,32(sp)
ffffffffc0201f6e:	64e2                	ld	s1,24(sp)
ffffffffc0201f70:	6942                	ld	s2,16(sp)
ffffffffc0201f72:	6145                	addi	sp,sp,48
ffffffffc0201f74:	8082                	ret
ffffffffc0201f76:	4959                	li	s2,22
ffffffffc0201f78:	b775                	j	ffffffffc0201f24 <do_pgfault+0x36>
ffffffffc0201f7a:	6c88                	ld	a0,24(s1)
ffffffffc0201f7c:	864a                	mv	a2,s2
ffffffffc0201f7e:	85a2                	mv	a1,s0
ffffffffc0201f80:	e5aff0ef          	jal	ra,ffffffffc02015da <pgdir_alloc_page>
ffffffffc0201f84:	87aa                	mv	a5,a0
ffffffffc0201f86:	4501                	li	a0,0
ffffffffc0201f88:	f3ed                	bnez	a5,ffffffffc0201f6a <do_pgfault+0x7c>
ffffffffc0201f8a:	00003517          	auipc	a0,0x3
ffffffffc0201f8e:	db650513          	addi	a0,a0,-586 # ffffffffc0204d40 <etext+0x1020>
ffffffffc0201f92:	924fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201f96:	5571                	li	a0,-4
ffffffffc0201f98:	bfc9                	j	ffffffffc0201f6a <do_pgfault+0x7c>
ffffffffc0201f9a:	85a2                	mv	a1,s0
ffffffffc0201f9c:	00003517          	auipc	a0,0x3
ffffffffc0201fa0:	d7450513          	addi	a0,a0,-652 # ffffffffc0204d10 <etext+0xff0>
ffffffffc0201fa4:	912fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201fa8:	5575                	li	a0,-3
ffffffffc0201faa:	b7c1                	j	ffffffffc0201f6a <do_pgfault+0x7c>
ffffffffc0201fac:	00003517          	auipc	a0,0x3
ffffffffc0201fb0:	dbc50513          	addi	a0,a0,-580 # ffffffffc0204d68 <etext+0x1048>
ffffffffc0201fb4:	902fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0201fb8:	5571                	li	a0,-4
ffffffffc0201fba:	bf45                	j	ffffffffc0201f6a <do_pgfault+0x7c>

ffffffffc0201fbc <swap_init>:
ffffffffc0201fbc:	7175                	addi	sp,sp,-144
ffffffffc0201fbe:	e506                	sd	ra,136(sp)
ffffffffc0201fc0:	e122                	sd	s0,128(sp)
ffffffffc0201fc2:	fca6                	sd	s1,120(sp)
ffffffffc0201fc4:	f8ca                	sd	s2,112(sp)
ffffffffc0201fc6:	f4ce                	sd	s3,104(sp)
ffffffffc0201fc8:	f0d2                	sd	s4,96(sp)
ffffffffc0201fca:	ecd6                	sd	s5,88(sp)
ffffffffc0201fcc:	e8da                	sd	s6,80(sp)
ffffffffc0201fce:	e4de                	sd	s7,72(sp)
ffffffffc0201fd0:	e0e2                	sd	s8,64(sp)
ffffffffc0201fd2:	fc66                	sd	s9,56(sp)
ffffffffc0201fd4:	f86a                	sd	s10,48(sp)
ffffffffc0201fd6:	f46e                	sd	s11,40(sp)
ffffffffc0201fd8:	75e010ef          	jal	ra,ffffffffc0203736 <swapfs_init>
ffffffffc0201fdc:	0000e697          	auipc	a3,0xe
ffffffffc0201fe0:	1546b683          	ld	a3,340(a3) # ffffffffc0210130 <max_swap_offset>
ffffffffc0201fe4:	010007b7          	lui	a5,0x1000
ffffffffc0201fe8:	ff968713          	addi	a4,a3,-7
ffffffffc0201fec:	17e1                	addi	a5,a5,-8
ffffffffc0201fee:	3ce7ea63          	bltu	a5,a4,ffffffffc02023c2 <swap_init+0x406>
ffffffffc0201ff2:	00007797          	auipc	a5,0x7
ffffffffc0201ff6:	00e78793          	addi	a5,a5,14 # ffffffffc0209000 <swap_manager_clock>
ffffffffc0201ffa:	6798                	ld	a4,8(a5)
ffffffffc0201ffc:	0000ea97          	auipc	s5,0xe
ffffffffc0202000:	06ca8a93          	addi	s5,s5,108 # ffffffffc0210068 <sm>
ffffffffc0202004:	00fab023          	sd	a5,0(s5)
ffffffffc0202008:	9702                	jalr	a4
ffffffffc020200a:	84aa                	mv	s1,a0
ffffffffc020200c:	c10d                	beqz	a0,ffffffffc020202e <swap_init+0x72>
ffffffffc020200e:	60aa                	ld	ra,136(sp)
ffffffffc0202010:	640a                	ld	s0,128(sp)
ffffffffc0202012:	7946                	ld	s2,112(sp)
ffffffffc0202014:	79a6                	ld	s3,104(sp)
ffffffffc0202016:	7a06                	ld	s4,96(sp)
ffffffffc0202018:	6ae6                	ld	s5,88(sp)
ffffffffc020201a:	6b46                	ld	s6,80(sp)
ffffffffc020201c:	6ba6                	ld	s7,72(sp)
ffffffffc020201e:	6c06                	ld	s8,64(sp)
ffffffffc0202020:	7ce2                	ld	s9,56(sp)
ffffffffc0202022:	7d42                	ld	s10,48(sp)
ffffffffc0202024:	7da2                	ld	s11,40(sp)
ffffffffc0202026:	8526                	mv	a0,s1
ffffffffc0202028:	74e6                	ld	s1,120(sp)
ffffffffc020202a:	6149                	addi	sp,sp,144
ffffffffc020202c:	8082                	ret
ffffffffc020202e:	000ab783          	ld	a5,0(s5)
ffffffffc0202032:	00003517          	auipc	a0,0x3
ffffffffc0202036:	d8e50513          	addi	a0,a0,-626 # ffffffffc0204dc0 <etext+0x10a0>
ffffffffc020203a:	0000e417          	auipc	s0,0xe
ffffffffc020203e:	14e40413          	addi	s0,s0,334 # ffffffffc0210188 <free_area>
ffffffffc0202042:	638c                	ld	a1,0(a5)
ffffffffc0202044:	4785                	li	a5,1
ffffffffc0202046:	0000e717          	auipc	a4,0xe
ffffffffc020204a:	02f72523          	sw	a5,42(a4) # ffffffffc0210070 <swap_init_ok>
ffffffffc020204e:	868fe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202052:	641c                	ld	a5,8(s0)
ffffffffc0202054:	4901                	li	s2,0
ffffffffc0202056:	4981                	li	s3,0
ffffffffc0202058:	28878b63          	beq	a5,s0,ffffffffc02022ee <swap_init+0x332>
ffffffffc020205c:	fe87b703          	ld	a4,-24(a5)
ffffffffc0202060:	8b09                	andi	a4,a4,2
ffffffffc0202062:	28070863          	beqz	a4,ffffffffc02022f2 <swap_init+0x336>
ffffffffc0202066:	ff87a703          	lw	a4,-8(a5)
ffffffffc020206a:	679c                	ld	a5,8(a5)
ffffffffc020206c:	2985                	addiw	s3,s3,1
ffffffffc020206e:	0127093b          	addw	s2,a4,s2
ffffffffc0202072:	fe8795e3          	bne	a5,s0,ffffffffc020205c <swap_init+0xa0>
ffffffffc0202076:	8a4a                	mv	s4,s2
ffffffffc0202078:	819fe0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc020207c:	55451f63          	bne	a0,s4,ffffffffc02025da <swap_init+0x61e>
ffffffffc0202080:	864a                	mv	a2,s2
ffffffffc0202082:	85ce                	mv	a1,s3
ffffffffc0202084:	00003517          	auipc	a0,0x3
ffffffffc0202088:	d8450513          	addi	a0,a0,-636 # ffffffffc0204e08 <etext+0x10e8>
ffffffffc020208c:	82afe0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202090:	f6cff0ef          	jal	ra,ffffffffc02017fc <mm_create>
ffffffffc0202094:	8a2a                	mv	s4,a0
ffffffffc0202096:	4c050263          	beqz	a0,ffffffffc020255a <swap_init+0x59e>
ffffffffc020209a:	0000e797          	auipc	a5,0xe
ffffffffc020209e:	00678793          	addi	a5,a5,6 # ffffffffc02100a0 <check_mm_struct>
ffffffffc02020a2:	6398                	ld	a4,0(a5)
ffffffffc02020a4:	4c071b63          	bnez	a4,ffffffffc020257a <swap_init+0x5be>
ffffffffc02020a8:	0000eb17          	auipc	s6,0xe
ffffffffc02020ac:	fa8b3b03          	ld	s6,-88(s6) # ffffffffc0210050 <boot_pgdir>
ffffffffc02020b0:	000b3703          	ld	a4,0(s6)
ffffffffc02020b4:	e388                	sd	a0,0(a5)
ffffffffc02020b6:	01653c23          	sd	s6,24(a0)
ffffffffc02020ba:	4e071063          	bnez	a4,ffffffffc020259a <swap_init+0x5de>
ffffffffc02020be:	6599                	lui	a1,0x6
ffffffffc02020c0:	460d                	li	a2,3
ffffffffc02020c2:	6505                	lui	a0,0x1
ffffffffc02020c4:	f80ff0ef          	jal	ra,ffffffffc0201844 <vma_create>
ffffffffc02020c8:	85aa                	mv	a1,a0
ffffffffc02020ca:	4e050863          	beqz	a0,ffffffffc02025ba <swap_init+0x5fe>
ffffffffc02020ce:	8552                	mv	a0,s4
ffffffffc02020d0:	fe2ff0ef          	jal	ra,ffffffffc02018b2 <insert_vma_struct>
ffffffffc02020d4:	00003517          	auipc	a0,0x3
ffffffffc02020d8:	d7450513          	addi	a0,a0,-652 # ffffffffc0204e48 <etext+0x1128>
ffffffffc02020dc:	fdbfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02020e0:	018a3503          	ld	a0,24(s4)
ffffffffc02020e4:	4605                	li	a2,1
ffffffffc02020e6:	6585                	lui	a1,0x1
ffffffffc02020e8:	fe4fe0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc02020ec:	3c050763          	beqz	a0,ffffffffc02024ba <swap_init+0x4fe>
ffffffffc02020f0:	00003517          	auipc	a0,0x3
ffffffffc02020f4:	da850513          	addi	a0,a0,-600 # ffffffffc0204e98 <etext+0x1178>
ffffffffc02020f8:	0000e917          	auipc	s2,0xe
ffffffffc02020fc:	fb090913          	addi	s2,s2,-80 # ffffffffc02100a8 <check_rp>
ffffffffc0202100:	fb7fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202104:	0000e997          	auipc	s3,0xe
ffffffffc0202108:	fc498993          	addi	s3,s3,-60 # ffffffffc02100c8 <swap_in_seq_no>
ffffffffc020210c:	8bca                	mv	s7,s2
ffffffffc020210e:	4505                	li	a0,1
ffffffffc0202110:	eacfe0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202114:	00abb023          	sd	a0,0(s7)
ffffffffc0202118:	26050563          	beqz	a0,ffffffffc0202382 <swap_init+0x3c6>
ffffffffc020211c:	651c                	ld	a5,8(a0)
ffffffffc020211e:	8b89                	andi	a5,a5,2
ffffffffc0202120:	24079163          	bnez	a5,ffffffffc0202362 <swap_init+0x3a6>
ffffffffc0202124:	0ba1                	addi	s7,s7,8
ffffffffc0202126:	ff3b94e3          	bne	s7,s3,ffffffffc020210e <swap_init+0x152>
ffffffffc020212a:	601c                	ld	a5,0(s0)
ffffffffc020212c:	0000eb97          	auipc	s7,0xe
ffffffffc0202130:	f7cb8b93          	addi	s7,s7,-132 # ffffffffc02100a8 <check_rp>
ffffffffc0202134:	e000                	sd	s0,0(s0)
ffffffffc0202136:	e43e                	sd	a5,8(sp)
ffffffffc0202138:	641c                	ld	a5,8(s0)
ffffffffc020213a:	e400                	sd	s0,8(s0)
ffffffffc020213c:	e83e                	sd	a5,16(sp)
ffffffffc020213e:	481c                	lw	a5,16(s0)
ffffffffc0202140:	ec3e                	sd	a5,24(sp)
ffffffffc0202142:	0000e797          	auipc	a5,0xe
ffffffffc0202146:	0407ab23          	sw	zero,86(a5) # ffffffffc0210198 <free_area+0x10>
ffffffffc020214a:	000bb503          	ld	a0,0(s7)
ffffffffc020214e:	4585                	li	a1,1
ffffffffc0202150:	0ba1                	addi	s7,s7,8
ffffffffc0202152:	efcfe0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202156:	ff3b9ae3          	bne	s7,s3,ffffffffc020214a <swap_init+0x18e>
ffffffffc020215a:	01042b83          	lw	s7,16(s0)
ffffffffc020215e:	4791                	li	a5,4
ffffffffc0202160:	32fb9d63          	bne	s7,a5,ffffffffc020249a <swap_init+0x4de>
ffffffffc0202164:	00003517          	auipc	a0,0x3
ffffffffc0202168:	dbc50513          	addi	a0,a0,-580 # ffffffffc0204f20 <etext+0x1200>
ffffffffc020216c:	f4bfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202170:	6705                	lui	a4,0x1
ffffffffc0202172:	0000e797          	auipc	a5,0xe
ffffffffc0202176:	ee07a723          	sw	zero,-274(a5) # ffffffffc0210060 <pgfault_num>
ffffffffc020217a:	4629                	li	a2,10
ffffffffc020217c:	00c70023          	sb	a2,0(a4) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0202180:	0000e697          	auipc	a3,0xe
ffffffffc0202184:	ee06a683          	lw	a3,-288(a3) # ffffffffc0210060 <pgfault_num>
ffffffffc0202188:	4585                	li	a1,1
ffffffffc020218a:	0000e797          	auipc	a5,0xe
ffffffffc020218e:	ed678793          	addi	a5,a5,-298 # ffffffffc0210060 <pgfault_num>
ffffffffc0202192:	2cb69463          	bne	a3,a1,ffffffffc020245a <swap_init+0x49e>
ffffffffc0202196:	00c70823          	sb	a2,16(a4)
ffffffffc020219a:	4398                	lw	a4,0(a5)
ffffffffc020219c:	2701                	sext.w	a4,a4
ffffffffc020219e:	2cd71e63          	bne	a4,a3,ffffffffc020247a <swap_init+0x4be>
ffffffffc02021a2:	6689                	lui	a3,0x2
ffffffffc02021a4:	462d                	li	a2,11
ffffffffc02021a6:	00c68023          	sb	a2,0(a3) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc02021aa:	4398                	lw	a4,0(a5)
ffffffffc02021ac:	4589                	li	a1,2
ffffffffc02021ae:	2701                	sext.w	a4,a4
ffffffffc02021b0:	22b71563          	bne	a4,a1,ffffffffc02023da <swap_init+0x41e>
ffffffffc02021b4:	00c68823          	sb	a2,16(a3)
ffffffffc02021b8:	4394                	lw	a3,0(a5)
ffffffffc02021ba:	2681                	sext.w	a3,a3
ffffffffc02021bc:	22e69f63          	bne	a3,a4,ffffffffc02023fa <swap_init+0x43e>
ffffffffc02021c0:	668d                	lui	a3,0x3
ffffffffc02021c2:	4631                	li	a2,12
ffffffffc02021c4:	00c68023          	sb	a2,0(a3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc02021c8:	4398                	lw	a4,0(a5)
ffffffffc02021ca:	458d                	li	a1,3
ffffffffc02021cc:	2701                	sext.w	a4,a4
ffffffffc02021ce:	24b71663          	bne	a4,a1,ffffffffc020241a <swap_init+0x45e>
ffffffffc02021d2:	00c68823          	sb	a2,16(a3)
ffffffffc02021d6:	4394                	lw	a3,0(a5)
ffffffffc02021d8:	2681                	sext.w	a3,a3
ffffffffc02021da:	26e69063          	bne	a3,a4,ffffffffc020243a <swap_init+0x47e>
ffffffffc02021de:	6691                	lui	a3,0x4
ffffffffc02021e0:	4635                	li	a2,13
ffffffffc02021e2:	00c68023          	sb	a2,0(a3) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc02021e6:	4398                	lw	a4,0(a5)
ffffffffc02021e8:	2701                	sext.w	a4,a4
ffffffffc02021ea:	2f771863          	bne	a4,s7,ffffffffc02024da <swap_init+0x51e>
ffffffffc02021ee:	00c68823          	sb	a2,16(a3)
ffffffffc02021f2:	439c                	lw	a5,0(a5)
ffffffffc02021f4:	2781                	sext.w	a5,a5
ffffffffc02021f6:	30e79263          	bne	a5,a4,ffffffffc02024fa <swap_init+0x53e>
ffffffffc02021fa:	481c                	lw	a5,16(s0)
ffffffffc02021fc:	30079f63          	bnez	a5,ffffffffc020251a <swap_init+0x55e>
ffffffffc0202200:	0000e797          	auipc	a5,0xe
ffffffffc0202204:	ec878793          	addi	a5,a5,-312 # ffffffffc02100c8 <swap_in_seq_no>
ffffffffc0202208:	0000e717          	auipc	a4,0xe
ffffffffc020220c:	ee870713          	addi	a4,a4,-280 # ffffffffc02100f0 <swap_out_seq_no>
ffffffffc0202210:	0000e617          	auipc	a2,0xe
ffffffffc0202214:	ee060613          	addi	a2,a2,-288 # ffffffffc02100f0 <swap_out_seq_no>
ffffffffc0202218:	56fd                	li	a3,-1
ffffffffc020221a:	c394                	sw	a3,0(a5)
ffffffffc020221c:	c314                	sw	a3,0(a4)
ffffffffc020221e:	0791                	addi	a5,a5,4
ffffffffc0202220:	0711                	addi	a4,a4,4
ffffffffc0202222:	fef61ce3          	bne	a2,a5,ffffffffc020221a <swap_init+0x25e>
ffffffffc0202226:	0000e697          	auipc	a3,0xe
ffffffffc020222a:	f2a68693          	addi	a3,a3,-214 # ffffffffc0210150 <check_ptep>
ffffffffc020222e:	0000ec17          	auipc	s8,0xe
ffffffffc0202232:	e7ac0c13          	addi	s8,s8,-390 # ffffffffc02100a8 <check_rp>
ffffffffc0202236:	6b85                	lui	s7,0x1
ffffffffc0202238:	0000ed97          	auipc	s11,0xe
ffffffffc020223c:	e20d8d93          	addi	s11,s11,-480 # ffffffffc0210058 <npage>
ffffffffc0202240:	0000ed17          	auipc	s10,0xe
ffffffffc0202244:	e58d0d13          	addi	s10,s10,-424 # ffffffffc0210098 <pages>
ffffffffc0202248:	00003c97          	auipc	s9,0x3
ffffffffc020224c:	708c8c93          	addi	s9,s9,1800 # ffffffffc0205950 <nbase>
ffffffffc0202250:	0006b023          	sd	zero,0(a3)
ffffffffc0202254:	4601                	li	a2,0
ffffffffc0202256:	85de                	mv	a1,s7
ffffffffc0202258:	855a                	mv	a0,s6
ffffffffc020225a:	e036                	sd	a3,0(sp)
ffffffffc020225c:	e70fe0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0202260:	6682                	ld	a3,0(sp)
ffffffffc0202262:	e288                	sd	a0,0(a3)
ffffffffc0202264:	12050f63          	beqz	a0,ffffffffc02023a2 <swap_init+0x3e6>
ffffffffc0202268:	611c                	ld	a5,0(a0)
ffffffffc020226a:	0017f713          	andi	a4,a5,1
ffffffffc020226e:	c371                	beqz	a4,ffffffffc0202332 <swap_init+0x376>
ffffffffc0202270:	000db703          	ld	a4,0(s11)
ffffffffc0202274:	078a                	slli	a5,a5,0x2
ffffffffc0202276:	83b1                	srli	a5,a5,0xc
ffffffffc0202278:	0ce7f963          	bgeu	a5,a4,ffffffffc020234a <swap_init+0x38e>
ffffffffc020227c:	000cb703          	ld	a4,0(s9)
ffffffffc0202280:	000d3603          	ld	a2,0(s10)
ffffffffc0202284:	000c3503          	ld	a0,0(s8)
ffffffffc0202288:	8f99                	sub	a5,a5,a4
ffffffffc020228a:	00379713          	slli	a4,a5,0x3
ffffffffc020228e:	97ba                	add	a5,a5,a4
ffffffffc0202290:	078e                	slli	a5,a5,0x3
ffffffffc0202292:	97b2                	add	a5,a5,a2
ffffffffc0202294:	06f51f63          	bne	a0,a5,ffffffffc0202312 <swap_init+0x356>
ffffffffc0202298:	6785                	lui	a5,0x1
ffffffffc020229a:	9bbe                	add	s7,s7,a5
ffffffffc020229c:	6795                	lui	a5,0x5
ffffffffc020229e:	06a1                	addi	a3,a3,8
ffffffffc02022a0:	0c21                	addi	s8,s8,8
ffffffffc02022a2:	fafb97e3          	bne	s7,a5,ffffffffc0202250 <swap_init+0x294>
ffffffffc02022a6:	00003517          	auipc	a0,0x3
ffffffffc02022aa:	d3250513          	addi	a0,a0,-718 # ffffffffc0204fd8 <etext+0x12b8>
ffffffffc02022ae:	e09fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02022b2:	000ab783          	ld	a5,0(s5)
ffffffffc02022b6:	7f9c                	ld	a5,56(a5)
ffffffffc02022b8:	9782                	jalr	a5
ffffffffc02022ba:	28051063          	bnez	a0,ffffffffc020253a <swap_init+0x57e>
ffffffffc02022be:	00093503          	ld	a0,0(s2)
ffffffffc02022c2:	4585                	li	a1,1
ffffffffc02022c4:	0921                	addi	s2,s2,8
ffffffffc02022c6:	d88fe0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc02022ca:	ff391ae3          	bne	s2,s3,ffffffffc02022be <swap_init+0x302>
ffffffffc02022ce:	8552                	mv	a0,s4
ffffffffc02022d0:	eb2ff0ef          	jal	ra,ffffffffc0201982 <mm_destroy>
ffffffffc02022d4:	67e2                	ld	a5,24(sp)
ffffffffc02022d6:	00003517          	auipc	a0,0x3
ffffffffc02022da:	d3250513          	addi	a0,a0,-718 # ffffffffc0205008 <etext+0x12e8>
ffffffffc02022de:	c81c                	sw	a5,16(s0)
ffffffffc02022e0:	67a2                	ld	a5,8(sp)
ffffffffc02022e2:	e01c                	sd	a5,0(s0)
ffffffffc02022e4:	67c2                	ld	a5,16(sp)
ffffffffc02022e6:	e41c                	sd	a5,8(s0)
ffffffffc02022e8:	dcffd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02022ec:	b30d                	j	ffffffffc020200e <swap_init+0x52>
ffffffffc02022ee:	4a01                	li	s4,0
ffffffffc02022f0:	b361                	j	ffffffffc0202078 <swap_init+0xbc>
ffffffffc02022f2:	00003697          	auipc	a3,0x3
ffffffffc02022f6:	ae668693          	addi	a3,a3,-1306 # ffffffffc0204dd8 <etext+0x10b8>
ffffffffc02022fa:	00002617          	auipc	a2,0x2
ffffffffc02022fe:	25e60613          	addi	a2,a2,606 # ffffffffc0204558 <etext+0x838>
ffffffffc0202302:	0c500593          	li	a1,197
ffffffffc0202306:	00003517          	auipc	a0,0x3
ffffffffc020230a:	aaa50513          	addi	a0,a0,-1366 # ffffffffc0204db0 <etext+0x1090>
ffffffffc020230e:	ddffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202312:	00003697          	auipc	a3,0x3
ffffffffc0202316:	c9e68693          	addi	a3,a3,-866 # ffffffffc0204fb0 <etext+0x1290>
ffffffffc020231a:	00002617          	auipc	a2,0x2
ffffffffc020231e:	23e60613          	addi	a2,a2,574 # ffffffffc0204558 <etext+0x838>
ffffffffc0202322:	10400593          	li	a1,260
ffffffffc0202326:	00003517          	auipc	a0,0x3
ffffffffc020232a:	a8a50513          	addi	a0,a0,-1398 # ffffffffc0204db0 <etext+0x1090>
ffffffffc020232e:	dbffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202332:	00002617          	auipc	a2,0x2
ffffffffc0202336:	2fe60613          	addi	a2,a2,766 # ffffffffc0204630 <etext+0x910>
ffffffffc020233a:	07000593          	li	a1,112
ffffffffc020233e:	00002517          	auipc	a0,0x2
ffffffffc0202342:	0e250513          	addi	a0,a0,226 # ffffffffc0204420 <etext+0x700>
ffffffffc0202346:	da7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020234a:	00002617          	auipc	a2,0x2
ffffffffc020234e:	0b660613          	addi	a2,a2,182 # ffffffffc0204400 <etext+0x6e0>
ffffffffc0202352:	06500593          	li	a1,101
ffffffffc0202356:	00002517          	auipc	a0,0x2
ffffffffc020235a:	0ca50513          	addi	a0,a0,202 # ffffffffc0204420 <etext+0x700>
ffffffffc020235e:	d8ffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202362:	00003697          	auipc	a3,0x3
ffffffffc0202366:	b7668693          	addi	a3,a3,-1162 # ffffffffc0204ed8 <etext+0x11b8>
ffffffffc020236a:	00002617          	auipc	a2,0x2
ffffffffc020236e:	1ee60613          	addi	a2,a2,494 # ffffffffc0204558 <etext+0x838>
ffffffffc0202372:	0e600593          	li	a1,230
ffffffffc0202376:	00003517          	auipc	a0,0x3
ffffffffc020237a:	a3a50513          	addi	a0,a0,-1478 # ffffffffc0204db0 <etext+0x1090>
ffffffffc020237e:	d6ffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202382:	00003697          	auipc	a3,0x3
ffffffffc0202386:	b3e68693          	addi	a3,a3,-1218 # ffffffffc0204ec0 <etext+0x11a0>
ffffffffc020238a:	00002617          	auipc	a2,0x2
ffffffffc020238e:	1ce60613          	addi	a2,a2,462 # ffffffffc0204558 <etext+0x838>
ffffffffc0202392:	0e500593          	li	a1,229
ffffffffc0202396:	00003517          	auipc	a0,0x3
ffffffffc020239a:	a1a50513          	addi	a0,a0,-1510 # ffffffffc0204db0 <etext+0x1090>
ffffffffc020239e:	d4ffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02023a2:	00003697          	auipc	a3,0x3
ffffffffc02023a6:	bf668693          	addi	a3,a3,-1034 # ffffffffc0204f98 <etext+0x1278>
ffffffffc02023aa:	00002617          	auipc	a2,0x2
ffffffffc02023ae:	1ae60613          	addi	a2,a2,430 # ffffffffc0204558 <etext+0x838>
ffffffffc02023b2:	10300593          	li	a1,259
ffffffffc02023b6:	00003517          	auipc	a0,0x3
ffffffffc02023ba:	9fa50513          	addi	a0,a0,-1542 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02023be:	d2ffd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02023c2:	00003617          	auipc	a2,0x3
ffffffffc02023c6:	9ce60613          	addi	a2,a2,-1586 # ffffffffc0204d90 <etext+0x1070>
ffffffffc02023ca:	02800593          	li	a1,40
ffffffffc02023ce:	00003517          	auipc	a0,0x3
ffffffffc02023d2:	9e250513          	addi	a0,a0,-1566 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02023d6:	d17fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02023da:	00003697          	auipc	a3,0x3
ffffffffc02023de:	b7e68693          	addi	a3,a3,-1154 # ffffffffc0204f58 <etext+0x1238>
ffffffffc02023e2:	00002617          	auipc	a2,0x2
ffffffffc02023e6:	17660613          	addi	a2,a2,374 # ffffffffc0204558 <etext+0x838>
ffffffffc02023ea:	0a000593          	li	a1,160
ffffffffc02023ee:	00003517          	auipc	a0,0x3
ffffffffc02023f2:	9c250513          	addi	a0,a0,-1598 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02023f6:	cf7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02023fa:	00003697          	auipc	a3,0x3
ffffffffc02023fe:	b5e68693          	addi	a3,a3,-1186 # ffffffffc0204f58 <etext+0x1238>
ffffffffc0202402:	00002617          	auipc	a2,0x2
ffffffffc0202406:	15660613          	addi	a2,a2,342 # ffffffffc0204558 <etext+0x838>
ffffffffc020240a:	0a200593          	li	a1,162
ffffffffc020240e:	00003517          	auipc	a0,0x3
ffffffffc0202412:	9a250513          	addi	a0,a0,-1630 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202416:	cd7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020241a:	00003697          	auipc	a3,0x3
ffffffffc020241e:	b4e68693          	addi	a3,a3,-1202 # ffffffffc0204f68 <etext+0x1248>
ffffffffc0202422:	00002617          	auipc	a2,0x2
ffffffffc0202426:	13660613          	addi	a2,a2,310 # ffffffffc0204558 <etext+0x838>
ffffffffc020242a:	0a400593          	li	a1,164
ffffffffc020242e:	00003517          	auipc	a0,0x3
ffffffffc0202432:	98250513          	addi	a0,a0,-1662 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202436:	cb7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020243a:	00003697          	auipc	a3,0x3
ffffffffc020243e:	b2e68693          	addi	a3,a3,-1234 # ffffffffc0204f68 <etext+0x1248>
ffffffffc0202442:	00002617          	auipc	a2,0x2
ffffffffc0202446:	11660613          	addi	a2,a2,278 # ffffffffc0204558 <etext+0x838>
ffffffffc020244a:	0a600593          	li	a1,166
ffffffffc020244e:	00003517          	auipc	a0,0x3
ffffffffc0202452:	96250513          	addi	a0,a0,-1694 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202456:	c97fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020245a:	00003697          	auipc	a3,0x3
ffffffffc020245e:	aee68693          	addi	a3,a3,-1298 # ffffffffc0204f48 <etext+0x1228>
ffffffffc0202462:	00002617          	auipc	a2,0x2
ffffffffc0202466:	0f660613          	addi	a2,a2,246 # ffffffffc0204558 <etext+0x838>
ffffffffc020246a:	09c00593          	li	a1,156
ffffffffc020246e:	00003517          	auipc	a0,0x3
ffffffffc0202472:	94250513          	addi	a0,a0,-1726 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202476:	c77fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020247a:	00003697          	auipc	a3,0x3
ffffffffc020247e:	ace68693          	addi	a3,a3,-1330 # ffffffffc0204f48 <etext+0x1228>
ffffffffc0202482:	00002617          	auipc	a2,0x2
ffffffffc0202486:	0d660613          	addi	a2,a2,214 # ffffffffc0204558 <etext+0x838>
ffffffffc020248a:	09e00593          	li	a1,158
ffffffffc020248e:	00003517          	auipc	a0,0x3
ffffffffc0202492:	92250513          	addi	a0,a0,-1758 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202496:	c57fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020249a:	00003697          	auipc	a3,0x3
ffffffffc020249e:	a5e68693          	addi	a3,a3,-1442 # ffffffffc0204ef8 <etext+0x11d8>
ffffffffc02024a2:	00002617          	auipc	a2,0x2
ffffffffc02024a6:	0b660613          	addi	a2,a2,182 # ffffffffc0204558 <etext+0x838>
ffffffffc02024aa:	0f300593          	li	a1,243
ffffffffc02024ae:	00003517          	auipc	a0,0x3
ffffffffc02024b2:	90250513          	addi	a0,a0,-1790 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02024b6:	c37fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02024ba:	00003697          	auipc	a3,0x3
ffffffffc02024be:	9c668693          	addi	a3,a3,-1594 # ffffffffc0204e80 <etext+0x1160>
ffffffffc02024c2:	00002617          	auipc	a2,0x2
ffffffffc02024c6:	09660613          	addi	a2,a2,150 # ffffffffc0204558 <etext+0x838>
ffffffffc02024ca:	0e000593          	li	a1,224
ffffffffc02024ce:	00003517          	auipc	a0,0x3
ffffffffc02024d2:	8e250513          	addi	a0,a0,-1822 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02024d6:	c17fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02024da:	00003697          	auipc	a3,0x3
ffffffffc02024de:	a9e68693          	addi	a3,a3,-1378 # ffffffffc0204f78 <etext+0x1258>
ffffffffc02024e2:	00002617          	auipc	a2,0x2
ffffffffc02024e6:	07660613          	addi	a2,a2,118 # ffffffffc0204558 <etext+0x838>
ffffffffc02024ea:	0a800593          	li	a1,168
ffffffffc02024ee:	00003517          	auipc	a0,0x3
ffffffffc02024f2:	8c250513          	addi	a0,a0,-1854 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02024f6:	bf7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02024fa:	00003697          	auipc	a3,0x3
ffffffffc02024fe:	a7e68693          	addi	a3,a3,-1410 # ffffffffc0204f78 <etext+0x1258>
ffffffffc0202502:	00002617          	auipc	a2,0x2
ffffffffc0202506:	05660613          	addi	a2,a2,86 # ffffffffc0204558 <etext+0x838>
ffffffffc020250a:	0aa00593          	li	a1,170
ffffffffc020250e:	00003517          	auipc	a0,0x3
ffffffffc0202512:	8a250513          	addi	a0,a0,-1886 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202516:	bd7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020251a:	00003697          	auipc	a3,0x3
ffffffffc020251e:	a6e68693          	addi	a3,a3,-1426 # ffffffffc0204f88 <etext+0x1268>
ffffffffc0202522:	00002617          	auipc	a2,0x2
ffffffffc0202526:	03660613          	addi	a2,a2,54 # ffffffffc0204558 <etext+0x838>
ffffffffc020252a:	0fc00593          	li	a1,252
ffffffffc020252e:	00003517          	auipc	a0,0x3
ffffffffc0202532:	88250513          	addi	a0,a0,-1918 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202536:	bb7fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020253a:	00003697          	auipc	a3,0x3
ffffffffc020253e:	ac668693          	addi	a3,a3,-1338 # ffffffffc0205000 <etext+0x12e0>
ffffffffc0202542:	00002617          	auipc	a2,0x2
ffffffffc0202546:	01660613          	addi	a2,a2,22 # ffffffffc0204558 <etext+0x838>
ffffffffc020254a:	10b00593          	li	a1,267
ffffffffc020254e:	00003517          	auipc	a0,0x3
ffffffffc0202552:	86250513          	addi	a0,a0,-1950 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202556:	b97fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020255a:	00002697          	auipc	a3,0x2
ffffffffc020255e:	57e68693          	addi	a3,a3,1406 # ffffffffc0204ad8 <etext+0xdb8>
ffffffffc0202562:	00002617          	auipc	a2,0x2
ffffffffc0202566:	ff660613          	addi	a2,a2,-10 # ffffffffc0204558 <etext+0x838>
ffffffffc020256a:	0cd00593          	li	a1,205
ffffffffc020256e:	00003517          	auipc	a0,0x3
ffffffffc0202572:	84250513          	addi	a0,a0,-1982 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202576:	b77fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020257a:	00003697          	auipc	a3,0x3
ffffffffc020257e:	8b668693          	addi	a3,a3,-1866 # ffffffffc0204e30 <etext+0x1110>
ffffffffc0202582:	00002617          	auipc	a2,0x2
ffffffffc0202586:	fd660613          	addi	a2,a2,-42 # ffffffffc0204558 <etext+0x838>
ffffffffc020258a:	0d000593          	li	a1,208
ffffffffc020258e:	00003517          	auipc	a0,0x3
ffffffffc0202592:	82250513          	addi	a0,a0,-2014 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202596:	b57fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020259a:	00002697          	auipc	a3,0x2
ffffffffc020259e:	6ee68693          	addi	a3,a3,1774 # ffffffffc0204c88 <etext+0xf68>
ffffffffc02025a2:	00002617          	auipc	a2,0x2
ffffffffc02025a6:	fb660613          	addi	a2,a2,-74 # ffffffffc0204558 <etext+0x838>
ffffffffc02025aa:	0d500593          	li	a1,213
ffffffffc02025ae:	00003517          	auipc	a0,0x3
ffffffffc02025b2:	80250513          	addi	a0,a0,-2046 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02025b6:	b37fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02025ba:	00002697          	auipc	a3,0x2
ffffffffc02025be:	74668693          	addi	a3,a3,1862 # ffffffffc0204d00 <etext+0xfe0>
ffffffffc02025c2:	00002617          	auipc	a2,0x2
ffffffffc02025c6:	f9660613          	addi	a2,a2,-106 # ffffffffc0204558 <etext+0x838>
ffffffffc02025ca:	0d800593          	li	a1,216
ffffffffc02025ce:	00002517          	auipc	a0,0x2
ffffffffc02025d2:	7e250513          	addi	a0,a0,2018 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02025d6:	b17fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02025da:	00003697          	auipc	a3,0x3
ffffffffc02025de:	80e68693          	addi	a3,a3,-2034 # ffffffffc0204de8 <etext+0x10c8>
ffffffffc02025e2:	00002617          	auipc	a2,0x2
ffffffffc02025e6:	f7660613          	addi	a2,a2,-138 # ffffffffc0204558 <etext+0x838>
ffffffffc02025ea:	0c800593          	li	a1,200
ffffffffc02025ee:	00002517          	auipc	a0,0x2
ffffffffc02025f2:	7c250513          	addi	a0,a0,1986 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02025f6:	af7fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02025fa <swap_init_mm>:
ffffffffc02025fa:	0000e797          	auipc	a5,0xe
ffffffffc02025fe:	a6e7b783          	ld	a5,-1426(a5) # ffffffffc0210068 <sm>
ffffffffc0202602:	0107b303          	ld	t1,16(a5)
ffffffffc0202606:	8302                	jr	t1

ffffffffc0202608 <swap_map_swappable>:
ffffffffc0202608:	0000e797          	auipc	a5,0xe
ffffffffc020260c:	a607b783          	ld	a5,-1440(a5) # ffffffffc0210068 <sm>
ffffffffc0202610:	0207b303          	ld	t1,32(a5)
ffffffffc0202614:	8302                	jr	t1

ffffffffc0202616 <swap_out>:
ffffffffc0202616:	711d                	addi	sp,sp,-96
ffffffffc0202618:	ec86                	sd	ra,88(sp)
ffffffffc020261a:	e8a2                	sd	s0,80(sp)
ffffffffc020261c:	e4a6                	sd	s1,72(sp)
ffffffffc020261e:	e0ca                	sd	s2,64(sp)
ffffffffc0202620:	fc4e                	sd	s3,56(sp)
ffffffffc0202622:	f852                	sd	s4,48(sp)
ffffffffc0202624:	f456                	sd	s5,40(sp)
ffffffffc0202626:	f05a                	sd	s6,32(sp)
ffffffffc0202628:	ec5e                	sd	s7,24(sp)
ffffffffc020262a:	e862                	sd	s8,16(sp)
ffffffffc020262c:	cde9                	beqz	a1,ffffffffc0202706 <swap_out+0xf0>
ffffffffc020262e:	8a2e                	mv	s4,a1
ffffffffc0202630:	892a                	mv	s2,a0
ffffffffc0202632:	8ab2                	mv	s5,a2
ffffffffc0202634:	4401                	li	s0,0
ffffffffc0202636:	0000e997          	auipc	s3,0xe
ffffffffc020263a:	a3298993          	addi	s3,s3,-1486 # ffffffffc0210068 <sm>
ffffffffc020263e:	00003b17          	auipc	s6,0x3
ffffffffc0202642:	a4ab0b13          	addi	s6,s6,-1462 # ffffffffc0205088 <etext+0x1368>
ffffffffc0202646:	00003b97          	auipc	s7,0x3
ffffffffc020264a:	a2ab8b93          	addi	s7,s7,-1494 # ffffffffc0205070 <etext+0x1350>
ffffffffc020264e:	a825                	j	ffffffffc0202686 <swap_out+0x70>
ffffffffc0202650:	67a2                	ld	a5,8(sp)
ffffffffc0202652:	8626                	mv	a2,s1
ffffffffc0202654:	85a2                	mv	a1,s0
ffffffffc0202656:	63b4                	ld	a3,64(a5)
ffffffffc0202658:	855a                	mv	a0,s6
ffffffffc020265a:	2405                	addiw	s0,s0,1
ffffffffc020265c:	82b1                	srli	a3,a3,0xc
ffffffffc020265e:	0685                	addi	a3,a3,1
ffffffffc0202660:	a57fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202664:	6522                	ld	a0,8(sp)
ffffffffc0202666:	4585                	li	a1,1
ffffffffc0202668:	613c                	ld	a5,64(a0)
ffffffffc020266a:	83b1                	srli	a5,a5,0xc
ffffffffc020266c:	0785                	addi	a5,a5,1
ffffffffc020266e:	07a2                	slli	a5,a5,0x8
ffffffffc0202670:	00fc3023          	sd	a5,0(s8)
ffffffffc0202674:	9dafe0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202678:	01893503          	ld	a0,24(s2)
ffffffffc020267c:	85a6                	mv	a1,s1
ffffffffc020267e:	f57fe0ef          	jal	ra,ffffffffc02015d4 <tlb_invalidate>
ffffffffc0202682:	048a0d63          	beq	s4,s0,ffffffffc02026dc <swap_out+0xc6>
ffffffffc0202686:	0009b783          	ld	a5,0(s3)
ffffffffc020268a:	8656                	mv	a2,s5
ffffffffc020268c:	002c                	addi	a1,sp,8
ffffffffc020268e:	7b9c                	ld	a5,48(a5)
ffffffffc0202690:	854a                	mv	a0,s2
ffffffffc0202692:	9782                	jalr	a5
ffffffffc0202694:	e12d                	bnez	a0,ffffffffc02026f6 <swap_out+0xe0>
ffffffffc0202696:	67a2                	ld	a5,8(sp)
ffffffffc0202698:	01893503          	ld	a0,24(s2)
ffffffffc020269c:	4601                	li	a2,0
ffffffffc020269e:	63a4                	ld	s1,64(a5)
ffffffffc02026a0:	85a6                	mv	a1,s1
ffffffffc02026a2:	a2afe0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc02026a6:	611c                	ld	a5,0(a0)
ffffffffc02026a8:	8c2a                	mv	s8,a0
ffffffffc02026aa:	8b85                	andi	a5,a5,1
ffffffffc02026ac:	cfb9                	beqz	a5,ffffffffc020270a <swap_out+0xf4>
ffffffffc02026ae:	65a2                	ld	a1,8(sp)
ffffffffc02026b0:	61bc                	ld	a5,64(a1)
ffffffffc02026b2:	83b1                	srli	a5,a5,0xc
ffffffffc02026b4:	0785                	addi	a5,a5,1
ffffffffc02026b6:	00879513          	slli	a0,a5,0x8
ffffffffc02026ba:	14e010ef          	jal	ra,ffffffffc0203808 <swapfs_write>
ffffffffc02026be:	d949                	beqz	a0,ffffffffc0202650 <swap_out+0x3a>
ffffffffc02026c0:	855e                	mv	a0,s7
ffffffffc02026c2:	9f5fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02026c6:	0009b783          	ld	a5,0(s3)
ffffffffc02026ca:	6622                	ld	a2,8(sp)
ffffffffc02026cc:	4681                	li	a3,0
ffffffffc02026ce:	739c                	ld	a5,32(a5)
ffffffffc02026d0:	85a6                	mv	a1,s1
ffffffffc02026d2:	854a                	mv	a0,s2
ffffffffc02026d4:	2405                	addiw	s0,s0,1
ffffffffc02026d6:	9782                	jalr	a5
ffffffffc02026d8:	fa8a17e3          	bne	s4,s0,ffffffffc0202686 <swap_out+0x70>
ffffffffc02026dc:	60e6                	ld	ra,88(sp)
ffffffffc02026de:	8522                	mv	a0,s0
ffffffffc02026e0:	6446                	ld	s0,80(sp)
ffffffffc02026e2:	64a6                	ld	s1,72(sp)
ffffffffc02026e4:	6906                	ld	s2,64(sp)
ffffffffc02026e6:	79e2                	ld	s3,56(sp)
ffffffffc02026e8:	7a42                	ld	s4,48(sp)
ffffffffc02026ea:	7aa2                	ld	s5,40(sp)
ffffffffc02026ec:	7b02                	ld	s6,32(sp)
ffffffffc02026ee:	6be2                	ld	s7,24(sp)
ffffffffc02026f0:	6c42                	ld	s8,16(sp)
ffffffffc02026f2:	6125                	addi	sp,sp,96
ffffffffc02026f4:	8082                	ret
ffffffffc02026f6:	85a2                	mv	a1,s0
ffffffffc02026f8:	00003517          	auipc	a0,0x3
ffffffffc02026fc:	93050513          	addi	a0,a0,-1744 # ffffffffc0205028 <etext+0x1308>
ffffffffc0202700:	9b7fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202704:	bfe1                	j	ffffffffc02026dc <swap_out+0xc6>
ffffffffc0202706:	4401                	li	s0,0
ffffffffc0202708:	bfd1                	j	ffffffffc02026dc <swap_out+0xc6>
ffffffffc020270a:	00003697          	auipc	a3,0x3
ffffffffc020270e:	94e68693          	addi	a3,a3,-1714 # ffffffffc0205058 <etext+0x1338>
ffffffffc0202712:	00002617          	auipc	a2,0x2
ffffffffc0202716:	e4660613          	addi	a2,a2,-442 # ffffffffc0204558 <etext+0x838>
ffffffffc020271a:	07200593          	li	a1,114
ffffffffc020271e:	00002517          	auipc	a0,0x2
ffffffffc0202722:	69250513          	addi	a0,a0,1682 # ffffffffc0204db0 <etext+0x1090>
ffffffffc0202726:	9c7fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020272a <swap_in>:
ffffffffc020272a:	7179                	addi	sp,sp,-48
ffffffffc020272c:	e84a                	sd	s2,16(sp)
ffffffffc020272e:	892a                	mv	s2,a0
ffffffffc0202730:	4505                	li	a0,1
ffffffffc0202732:	ec26                	sd	s1,24(sp)
ffffffffc0202734:	e44e                	sd	s3,8(sp)
ffffffffc0202736:	f406                	sd	ra,40(sp)
ffffffffc0202738:	f022                	sd	s0,32(sp)
ffffffffc020273a:	84ae                	mv	s1,a1
ffffffffc020273c:	89b2                	mv	s3,a2
ffffffffc020273e:	87efe0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202742:	c129                	beqz	a0,ffffffffc0202784 <swap_in+0x5a>
ffffffffc0202744:	842a                	mv	s0,a0
ffffffffc0202746:	01893503          	ld	a0,24(s2)
ffffffffc020274a:	4601                	li	a2,0
ffffffffc020274c:	85a6                	mv	a1,s1
ffffffffc020274e:	97efe0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0202752:	892a                	mv	s2,a0
ffffffffc0202754:	6108                	ld	a0,0(a0)
ffffffffc0202756:	85a2                	mv	a1,s0
ffffffffc0202758:	016010ef          	jal	ra,ffffffffc020376e <swapfs_read>
ffffffffc020275c:	00093583          	ld	a1,0(s2)
ffffffffc0202760:	8626                	mv	a2,s1
ffffffffc0202762:	00003517          	auipc	a0,0x3
ffffffffc0202766:	97650513          	addi	a0,a0,-1674 # ffffffffc02050d8 <etext+0x13b8>
ffffffffc020276a:	81a1                	srli	a1,a1,0x8
ffffffffc020276c:	94bfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202770:	70a2                	ld	ra,40(sp)
ffffffffc0202772:	0089b023          	sd	s0,0(s3)
ffffffffc0202776:	7402                	ld	s0,32(sp)
ffffffffc0202778:	64e2                	ld	s1,24(sp)
ffffffffc020277a:	6942                	ld	s2,16(sp)
ffffffffc020277c:	69a2                	ld	s3,8(sp)
ffffffffc020277e:	4501                	li	a0,0
ffffffffc0202780:	6145                	addi	sp,sp,48
ffffffffc0202782:	8082                	ret
ffffffffc0202784:	00003697          	auipc	a3,0x3
ffffffffc0202788:	94468693          	addi	a3,a3,-1724 # ffffffffc02050c8 <etext+0x13a8>
ffffffffc020278c:	00002617          	auipc	a2,0x2
ffffffffc0202790:	dcc60613          	addi	a2,a2,-564 # ffffffffc0204558 <etext+0x838>
ffffffffc0202794:	08800593          	li	a1,136
ffffffffc0202798:	00002517          	auipc	a0,0x2
ffffffffc020279c:	61850513          	addi	a0,a0,1560 # ffffffffc0204db0 <etext+0x1090>
ffffffffc02027a0:	94dfd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02027a4 <_clock_init_mm>:
ffffffffc02027a4:	0000e797          	auipc	a5,0xe
ffffffffc02027a8:	9cc78793          	addi	a5,a5,-1588 # ffffffffc0210170 <pra_list_head>
ffffffffc02027ac:	f51c                	sd	a5,40(a0)
ffffffffc02027ae:	e79c                	sd	a5,8(a5)
ffffffffc02027b0:	e39c                	sd	a5,0(a5)
ffffffffc02027b2:	4501                	li	a0,0
ffffffffc02027b4:	8082                	ret

ffffffffc02027b6 <_clock_init>:
ffffffffc02027b6:	4501                	li	a0,0
ffffffffc02027b8:	8082                	ret

ffffffffc02027ba <_clock_set_unswappable>:
ffffffffc02027ba:	4501                	li	a0,0
ffffffffc02027bc:	8082                	ret

ffffffffc02027be <_clock_tick_event>:
ffffffffc02027be:	4501                	li	a0,0
ffffffffc02027c0:	8082                	ret

ffffffffc02027c2 <_clock_check_swap>:
ffffffffc02027c2:	711d                	addi	sp,sp,-96
ffffffffc02027c4:	00003517          	auipc	a0,0x3
ffffffffc02027c8:	95450513          	addi	a0,a0,-1708 # ffffffffc0205118 <etext+0x13f8>
ffffffffc02027cc:	ec86                	sd	ra,88(sp)
ffffffffc02027ce:	e0ca                	sd	s2,64(sp)
ffffffffc02027d0:	fc4e                	sd	s3,56(sp)
ffffffffc02027d2:	f852                	sd	s4,48(sp)
ffffffffc02027d4:	e8a2                	sd	s0,80(sp)
ffffffffc02027d6:	e4a6                	sd	s1,72(sp)
ffffffffc02027d8:	f456                	sd	s5,40(sp)
ffffffffc02027da:	f05a                	sd	s6,32(sp)
ffffffffc02027dc:	ec5e                	sd	s7,24(sp)
ffffffffc02027de:	e862                	sd	s8,16(sp)
ffffffffc02027e0:	e466                	sd	s9,8(sp)
ffffffffc02027e2:	e06a                	sd	s10,0(sp)
ffffffffc02027e4:	8d3fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02027e8:	00003517          	auipc	a0,0x3
ffffffffc02027ec:	95850513          	addi	a0,a0,-1704 # ffffffffc0205140 <etext+0x1420>
ffffffffc02027f0:	698d                	lui	s3,0x3
ffffffffc02027f2:	4a31                	li	s4,12
ffffffffc02027f4:	8c3fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02027f8:	01498023          	sb	s4,0(s3) # 3000 <kern_entry-0xffffffffc01fd000>
ffffffffc02027fc:	0000e917          	auipc	s2,0xe
ffffffffc0202800:	86492903          	lw	s2,-1948(s2) # ffffffffc0210060 <pgfault_num>
ffffffffc0202804:	4791                	li	a5,4
ffffffffc0202806:	16f91363          	bne	s2,a5,ffffffffc020296c <_clock_check_swap+0x1aa>
ffffffffc020280a:	00003517          	auipc	a0,0x3
ffffffffc020280e:	97650513          	addi	a0,a0,-1674 # ffffffffc0205180 <etext+0x1460>
ffffffffc0202812:	6a85                	lui	s5,0x1
ffffffffc0202814:	4b29                	li	s6,10
ffffffffc0202816:	8a1fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020281a:	0000e417          	auipc	s0,0xe
ffffffffc020281e:	84640413          	addi	s0,s0,-1978 # ffffffffc0210060 <pgfault_num>
ffffffffc0202822:	016a8023          	sb	s6,0(s5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0202826:	4004                	lw	s1,0(s0)
ffffffffc0202828:	2481                	sext.w	s1,s1
ffffffffc020282a:	2d249163          	bne	s1,s2,ffffffffc0202aec <_clock_check_swap+0x32a>
ffffffffc020282e:	00003517          	auipc	a0,0x3
ffffffffc0202832:	97a50513          	addi	a0,a0,-1670 # ffffffffc02051a8 <etext+0x1488>
ffffffffc0202836:	6b91                	lui	s7,0x4
ffffffffc0202838:	4c35                	li	s8,13
ffffffffc020283a:	87dfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020283e:	018b8023          	sb	s8,0(s7) # 4000 <kern_entry-0xffffffffc01fc000>
ffffffffc0202842:	00042903          	lw	s2,0(s0)
ffffffffc0202846:	2901                	sext.w	s2,s2
ffffffffc0202848:	28991263          	bne	s2,s1,ffffffffc0202acc <_clock_check_swap+0x30a>
ffffffffc020284c:	00003517          	auipc	a0,0x3
ffffffffc0202850:	98450513          	addi	a0,a0,-1660 # ffffffffc02051d0 <etext+0x14b0>
ffffffffc0202854:	6c89                	lui	s9,0x2
ffffffffc0202856:	4d2d                	li	s10,11
ffffffffc0202858:	85ffd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020285c:	01ac8023          	sb	s10,0(s9) # 2000 <kern_entry-0xffffffffc01fe000>
ffffffffc0202860:	401c                	lw	a5,0(s0)
ffffffffc0202862:	2781                	sext.w	a5,a5
ffffffffc0202864:	25279463          	bne	a5,s2,ffffffffc0202aac <_clock_check_swap+0x2ea>
ffffffffc0202868:	00003517          	auipc	a0,0x3
ffffffffc020286c:	99050513          	addi	a0,a0,-1648 # ffffffffc02051f8 <etext+0x14d8>
ffffffffc0202870:	847fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202874:	6795                	lui	a5,0x5
ffffffffc0202876:	4739                	li	a4,14
ffffffffc0202878:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc020287c:	4004                	lw	s1,0(s0)
ffffffffc020287e:	4795                	li	a5,5
ffffffffc0202880:	2481                	sext.w	s1,s1
ffffffffc0202882:	20f49563          	bne	s1,a5,ffffffffc0202a8c <_clock_check_swap+0x2ca>
ffffffffc0202886:	00003517          	auipc	a0,0x3
ffffffffc020288a:	94a50513          	addi	a0,a0,-1718 # ffffffffc02051d0 <etext+0x14b0>
ffffffffc020288e:	829fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202892:	01ac8023          	sb	s10,0(s9)
ffffffffc0202896:	401c                	lw	a5,0(s0)
ffffffffc0202898:	2781                	sext.w	a5,a5
ffffffffc020289a:	1c979963          	bne	a5,s1,ffffffffc0202a6c <_clock_check_swap+0x2aa>
ffffffffc020289e:	00003517          	auipc	a0,0x3
ffffffffc02028a2:	8e250513          	addi	a0,a0,-1822 # ffffffffc0205180 <etext+0x1460>
ffffffffc02028a6:	811fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02028aa:	016a8023          	sb	s6,0(s5)
ffffffffc02028ae:	4004                	lw	s1,0(s0)
ffffffffc02028b0:	4799                	li	a5,6
ffffffffc02028b2:	2481                	sext.w	s1,s1
ffffffffc02028b4:	18f49c63          	bne	s1,a5,ffffffffc0202a4c <_clock_check_swap+0x28a>
ffffffffc02028b8:	00003517          	auipc	a0,0x3
ffffffffc02028bc:	91850513          	addi	a0,a0,-1768 # ffffffffc02051d0 <etext+0x14b0>
ffffffffc02028c0:	ff6fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02028c4:	01ac8023          	sb	s10,0(s9)
ffffffffc02028c8:	401c                	lw	a5,0(s0)
ffffffffc02028ca:	2781                	sext.w	a5,a5
ffffffffc02028cc:	16979063          	bne	a5,s1,ffffffffc0202a2c <_clock_check_swap+0x26a>
ffffffffc02028d0:	00003517          	auipc	a0,0x3
ffffffffc02028d4:	87050513          	addi	a0,a0,-1936 # ffffffffc0205140 <etext+0x1420>
ffffffffc02028d8:	fdefd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02028dc:	01498023          	sb	s4,0(s3)
ffffffffc02028e0:	401c                	lw	a5,0(s0)
ffffffffc02028e2:	471d                	li	a4,7
ffffffffc02028e4:	2781                	sext.w	a5,a5
ffffffffc02028e6:	12e79363          	bne	a5,a4,ffffffffc0202a0c <_clock_check_swap+0x24a>
ffffffffc02028ea:	00003517          	auipc	a0,0x3
ffffffffc02028ee:	8be50513          	addi	a0,a0,-1858 # ffffffffc02051a8 <etext+0x1488>
ffffffffc02028f2:	fc4fd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc02028f6:	018b8023          	sb	s8,0(s7)
ffffffffc02028fa:	401c                	lw	a5,0(s0)
ffffffffc02028fc:	4721                	li	a4,8
ffffffffc02028fe:	2781                	sext.w	a5,a5
ffffffffc0202900:	0ee79663          	bne	a5,a4,ffffffffc02029ec <_clock_check_swap+0x22a>
ffffffffc0202904:	00003517          	auipc	a0,0x3
ffffffffc0202908:	8f450513          	addi	a0,a0,-1804 # ffffffffc02051f8 <etext+0x14d8>
ffffffffc020290c:	faafd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc0202910:	6795                	lui	a5,0x5
ffffffffc0202912:	4739                	li	a4,14
ffffffffc0202914:	00e78023          	sb	a4,0(a5) # 5000 <kern_entry-0xffffffffc01fb000>
ffffffffc0202918:	4004                	lw	s1,0(s0)
ffffffffc020291a:	47a5                	li	a5,9
ffffffffc020291c:	2481                	sext.w	s1,s1
ffffffffc020291e:	0af49763          	bne	s1,a5,ffffffffc02029cc <_clock_check_swap+0x20a>
ffffffffc0202922:	00003517          	auipc	a0,0x3
ffffffffc0202926:	85e50513          	addi	a0,a0,-1954 # ffffffffc0205180 <etext+0x1460>
ffffffffc020292a:	f8cfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020292e:	6785                	lui	a5,0x1
ffffffffc0202930:	0007c703          	lbu	a4,0(a5) # 1000 <kern_entry-0xffffffffc01ff000>
ffffffffc0202934:	47a9                	li	a5,10
ffffffffc0202936:	06f71b63          	bne	a4,a5,ffffffffc02029ac <_clock_check_swap+0x1ea>
ffffffffc020293a:	401c                	lw	a5,0(s0)
ffffffffc020293c:	2781                	sext.w	a5,a5
ffffffffc020293e:	04979763          	bne	a5,s1,ffffffffc020298c <_clock_check_swap+0x1ca>
ffffffffc0202942:	00003517          	auipc	a0,0x3
ffffffffc0202946:	95650513          	addi	a0,a0,-1706 # ffffffffc0205298 <etext+0x1578>
ffffffffc020294a:	f6cfd0ef          	jal	ra,ffffffffc02000b6 <cprintf>
ffffffffc020294e:	60e6                	ld	ra,88(sp)
ffffffffc0202950:	6446                	ld	s0,80(sp)
ffffffffc0202952:	64a6                	ld	s1,72(sp)
ffffffffc0202954:	6906                	ld	s2,64(sp)
ffffffffc0202956:	79e2                	ld	s3,56(sp)
ffffffffc0202958:	7a42                	ld	s4,48(sp)
ffffffffc020295a:	7aa2                	ld	s5,40(sp)
ffffffffc020295c:	7b02                	ld	s6,32(sp)
ffffffffc020295e:	6be2                	ld	s7,24(sp)
ffffffffc0202960:	6c42                	ld	s8,16(sp)
ffffffffc0202962:	6ca2                	ld	s9,8(sp)
ffffffffc0202964:	6d02                	ld	s10,0(sp)
ffffffffc0202966:	4501                	li	a0,0
ffffffffc0202968:	6125                	addi	sp,sp,96
ffffffffc020296a:	8082                	ret
ffffffffc020296c:	00002697          	auipc	a3,0x2
ffffffffc0202970:	60c68693          	addi	a3,a3,1548 # ffffffffc0204f78 <etext+0x1258>
ffffffffc0202974:	00002617          	auipc	a2,0x2
ffffffffc0202978:	be460613          	addi	a2,a2,-1052 # ffffffffc0204558 <etext+0x838>
ffffffffc020297c:	04f00593          	li	a1,79
ffffffffc0202980:	00002517          	auipc	a0,0x2
ffffffffc0202984:	7e850513          	addi	a0,a0,2024 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202988:	f64fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020298c:	00003697          	auipc	a3,0x3
ffffffffc0202990:	8d468693          	addi	a3,a3,-1836 # ffffffffc0205260 <etext+0x1540>
ffffffffc0202994:	00002617          	auipc	a2,0x2
ffffffffc0202998:	bc460613          	addi	a2,a2,-1084 # ffffffffc0204558 <etext+0x838>
ffffffffc020299c:	07100593          	li	a1,113
ffffffffc02029a0:	00002517          	auipc	a0,0x2
ffffffffc02029a4:	7c850513          	addi	a0,a0,1992 # ffffffffc0205168 <etext+0x1448>
ffffffffc02029a8:	f44fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02029ac:	00003697          	auipc	a3,0x3
ffffffffc02029b0:	8c468693          	addi	a3,a3,-1852 # ffffffffc0205270 <etext+0x1550>
ffffffffc02029b4:	00002617          	auipc	a2,0x2
ffffffffc02029b8:	ba460613          	addi	a2,a2,-1116 # ffffffffc0204558 <etext+0x838>
ffffffffc02029bc:	06f00593          	li	a1,111
ffffffffc02029c0:	00002517          	auipc	a0,0x2
ffffffffc02029c4:	7a850513          	addi	a0,a0,1960 # ffffffffc0205168 <etext+0x1448>
ffffffffc02029c8:	f24fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02029cc:	00003697          	auipc	a3,0x3
ffffffffc02029d0:	89468693          	addi	a3,a3,-1900 # ffffffffc0205260 <etext+0x1540>
ffffffffc02029d4:	00002617          	auipc	a2,0x2
ffffffffc02029d8:	b8460613          	addi	a2,a2,-1148 # ffffffffc0204558 <etext+0x838>
ffffffffc02029dc:	06d00593          	li	a1,109
ffffffffc02029e0:	00002517          	auipc	a0,0x2
ffffffffc02029e4:	78850513          	addi	a0,a0,1928 # ffffffffc0205168 <etext+0x1448>
ffffffffc02029e8:	f04fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02029ec:	00003697          	auipc	a3,0x3
ffffffffc02029f0:	86468693          	addi	a3,a3,-1948 # ffffffffc0205250 <etext+0x1530>
ffffffffc02029f4:	00002617          	auipc	a2,0x2
ffffffffc02029f8:	b6460613          	addi	a2,a2,-1180 # ffffffffc0204558 <etext+0x838>
ffffffffc02029fc:	06a00593          	li	a1,106
ffffffffc0202a00:	00002517          	auipc	a0,0x2
ffffffffc0202a04:	76850513          	addi	a0,a0,1896 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202a08:	ee4fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202a0c:	00003697          	auipc	a3,0x3
ffffffffc0202a10:	83468693          	addi	a3,a3,-1996 # ffffffffc0205240 <etext+0x1520>
ffffffffc0202a14:	00002617          	auipc	a2,0x2
ffffffffc0202a18:	b4460613          	addi	a2,a2,-1212 # ffffffffc0204558 <etext+0x838>
ffffffffc0202a1c:	06700593          	li	a1,103
ffffffffc0202a20:	00002517          	auipc	a0,0x2
ffffffffc0202a24:	74850513          	addi	a0,a0,1864 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202a28:	ec4fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202a2c:	00003697          	auipc	a3,0x3
ffffffffc0202a30:	80468693          	addi	a3,a3,-2044 # ffffffffc0205230 <etext+0x1510>
ffffffffc0202a34:	00002617          	auipc	a2,0x2
ffffffffc0202a38:	b2460613          	addi	a2,a2,-1244 # ffffffffc0204558 <etext+0x838>
ffffffffc0202a3c:	06400593          	li	a1,100
ffffffffc0202a40:	00002517          	auipc	a0,0x2
ffffffffc0202a44:	72850513          	addi	a0,a0,1832 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202a48:	ea4fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202a4c:	00002697          	auipc	a3,0x2
ffffffffc0202a50:	7e468693          	addi	a3,a3,2020 # ffffffffc0205230 <etext+0x1510>
ffffffffc0202a54:	00002617          	auipc	a2,0x2
ffffffffc0202a58:	b0460613          	addi	a2,a2,-1276 # ffffffffc0204558 <etext+0x838>
ffffffffc0202a5c:	06100593          	li	a1,97
ffffffffc0202a60:	00002517          	auipc	a0,0x2
ffffffffc0202a64:	70850513          	addi	a0,a0,1800 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202a68:	e84fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202a6c:	00002697          	auipc	a3,0x2
ffffffffc0202a70:	7b468693          	addi	a3,a3,1972 # ffffffffc0205220 <etext+0x1500>
ffffffffc0202a74:	00002617          	auipc	a2,0x2
ffffffffc0202a78:	ae460613          	addi	a2,a2,-1308 # ffffffffc0204558 <etext+0x838>
ffffffffc0202a7c:	05e00593          	li	a1,94
ffffffffc0202a80:	00002517          	auipc	a0,0x2
ffffffffc0202a84:	6e850513          	addi	a0,a0,1768 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202a88:	e64fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202a8c:	00002697          	auipc	a3,0x2
ffffffffc0202a90:	79468693          	addi	a3,a3,1940 # ffffffffc0205220 <etext+0x1500>
ffffffffc0202a94:	00002617          	auipc	a2,0x2
ffffffffc0202a98:	ac460613          	addi	a2,a2,-1340 # ffffffffc0204558 <etext+0x838>
ffffffffc0202a9c:	05b00593          	li	a1,91
ffffffffc0202aa0:	00002517          	auipc	a0,0x2
ffffffffc0202aa4:	6c850513          	addi	a0,a0,1736 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202aa8:	e44fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202aac:	00002697          	auipc	a3,0x2
ffffffffc0202ab0:	4cc68693          	addi	a3,a3,1228 # ffffffffc0204f78 <etext+0x1258>
ffffffffc0202ab4:	00002617          	auipc	a2,0x2
ffffffffc0202ab8:	aa460613          	addi	a2,a2,-1372 # ffffffffc0204558 <etext+0x838>
ffffffffc0202abc:	05800593          	li	a1,88
ffffffffc0202ac0:	00002517          	auipc	a0,0x2
ffffffffc0202ac4:	6a850513          	addi	a0,a0,1704 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202ac8:	e24fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202acc:	00002697          	auipc	a3,0x2
ffffffffc0202ad0:	4ac68693          	addi	a3,a3,1196 # ffffffffc0204f78 <etext+0x1258>
ffffffffc0202ad4:	00002617          	auipc	a2,0x2
ffffffffc0202ad8:	a8460613          	addi	a2,a2,-1404 # ffffffffc0204558 <etext+0x838>
ffffffffc0202adc:	05500593          	li	a1,85
ffffffffc0202ae0:	00002517          	auipc	a0,0x2
ffffffffc0202ae4:	68850513          	addi	a0,a0,1672 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202ae8:	e04fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202aec:	00002697          	auipc	a3,0x2
ffffffffc0202af0:	48c68693          	addi	a3,a3,1164 # ffffffffc0204f78 <etext+0x1258>
ffffffffc0202af4:	00002617          	auipc	a2,0x2
ffffffffc0202af8:	a6460613          	addi	a2,a2,-1436 # ffffffffc0204558 <etext+0x838>
ffffffffc0202afc:	05200593          	li	a1,82
ffffffffc0202b00:	00002517          	auipc	a0,0x2
ffffffffc0202b04:	66850513          	addi	a0,a0,1640 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202b08:	de4fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202b0c <_clock_swap_out_victim>:
ffffffffc0202b0c:	7139                	addi	sp,sp,-64
ffffffffc0202b0e:	f04a                	sd	s2,32(sp)
ffffffffc0202b10:	02853903          	ld	s2,40(a0)
ffffffffc0202b14:	fc06                	sd	ra,56(sp)
ffffffffc0202b16:	f822                	sd	s0,48(sp)
ffffffffc0202b18:	f426                	sd	s1,40(sp)
ffffffffc0202b1a:	ec4e                	sd	s3,24(sp)
ffffffffc0202b1c:	e852                	sd	s4,16(sp)
ffffffffc0202b1e:	e456                	sd	s5,8(sp)
ffffffffc0202b20:	e05a                	sd	s6,0(sp)
ffffffffc0202b22:	0a090f63          	beqz	s2,ffffffffc0202be0 <_clock_swap_out_victim+0xd4>
ffffffffc0202b26:	89aa                	mv	s3,a0
ffffffffc0202b28:	8a2e                	mv	s4,a1
ffffffffc0202b2a:	4a89                	li	s5,2
ffffffffc0202b2c:	0000d497          	auipc	s1,0xd
ffffffffc0202b30:	65448493          	addi	s1,s1,1620 # ffffffffc0210180 <curr_ptr>
ffffffffc0202b34:	4b05                	li	s6,1
ffffffffc0202b36:	e649                	bnez	a2,ffffffffc0202bc0 <_clock_swap_out_victim+0xb4>
ffffffffc0202b38:	00893403          	ld	s0,8(s2)
ffffffffc0202b3c:	e080                	sd	s0,0(s1)
ffffffffc0202b3e:	00891b63          	bne	s2,s0,ffffffffc0202b54 <_clock_swap_out_victim+0x48>
ffffffffc0202b42:	a8b1                	j	ffffffffc0202b9e <_clock_swap_out_victim+0x92>
ffffffffc0202b44:	6098                	ld	a4,0(s1)
ffffffffc0202b46:	fbf7f793          	andi	a5,a5,-65
ffffffffc0202b4a:	e11c                	sd	a5,0(a0)
ffffffffc0202b4c:	6700                	ld	s0,8(a4)
ffffffffc0202b4e:	e080                	sd	s0,0(s1)
ffffffffc0202b50:	04890763          	beq	s2,s0,ffffffffc0202b9e <_clock_swap_out_victim+0x92>
ffffffffc0202b54:	680c                	ld	a1,16(s0)
ffffffffc0202b56:	0189b503          	ld	a0,24(s3)
ffffffffc0202b5a:	4601                	li	a2,0
ffffffffc0202b5c:	d71fd0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0202b60:	611c                	ld	a5,0(a0)
ffffffffc0202b62:	0407f713          	andi	a4,a5,64
ffffffffc0202b66:	ff79                	bnez	a4,ffffffffc0202b44 <_clock_swap_out_victim+0x38>
ffffffffc0202b68:	00093603          	ld	a2,0(s2)
ffffffffc0202b6c:	00893683          	ld	a3,8(s2)
ffffffffc0202b70:	609c                	ld	a5,0(s1)
ffffffffc0202b72:	fd040413          	addi	s0,s0,-48
ffffffffc0202b76:	008a3023          	sd	s0,0(s4)
ffffffffc0202b7a:	e614                	sd	a3,8(a2)
ffffffffc0202b7c:	6798                	ld	a4,8(a5)
ffffffffc0202b7e:	e290                	sd	a2,0(a3)
ffffffffc0202b80:	01273023          	sd	s2,0(a4)
ffffffffc0202b84:	0127b423          	sd	s2,8(a5)
ffffffffc0202b88:	00e93423          	sd	a4,8(s2)
ffffffffc0202b8c:	00f93023          	sd	a5,0(s2)
ffffffffc0202b90:	6398                	ld	a4,0(a5)
ffffffffc0202b92:	679c                	ld	a5,8(a5)
ffffffffc0202b94:	e71c                	sd	a5,8(a4)
ffffffffc0202b96:	e398                	sd	a4,0(a5)
ffffffffc0202b98:	0329b423          	sd	s2,40(s3)
ffffffffc0202b9c:	a039                	j	ffffffffc0202baa <_clock_swap_out_victim+0x9e>
ffffffffc0202b9e:	016a8463          	beq	s5,s6,ffffffffc0202ba6 <_clock_swap_out_victim+0x9a>
ffffffffc0202ba2:	4a85                	li	s5,1
ffffffffc0202ba4:	bf51                	j	ffffffffc0202b38 <_clock_swap_out_victim+0x2c>
ffffffffc0202ba6:	000a3023          	sd	zero,0(s4)
ffffffffc0202baa:	70e2                	ld	ra,56(sp)
ffffffffc0202bac:	7442                	ld	s0,48(sp)
ffffffffc0202bae:	74a2                	ld	s1,40(sp)
ffffffffc0202bb0:	7902                	ld	s2,32(sp)
ffffffffc0202bb2:	69e2                	ld	s3,24(sp)
ffffffffc0202bb4:	6a42                	ld	s4,16(sp)
ffffffffc0202bb6:	6aa2                	ld	s5,8(sp)
ffffffffc0202bb8:	6b02                	ld	s6,0(sp)
ffffffffc0202bba:	4501                	li	a0,0
ffffffffc0202bbc:	6121                	addi	sp,sp,64
ffffffffc0202bbe:	8082                	ret
ffffffffc0202bc0:	00002697          	auipc	a3,0x2
ffffffffc0202bc4:	70068693          	addi	a3,a3,1792 # ffffffffc02052c0 <etext+0x15a0>
ffffffffc0202bc8:	00002617          	auipc	a2,0x2
ffffffffc0202bcc:	99060613          	addi	a2,a2,-1648 # ffffffffc0204558 <etext+0x838>
ffffffffc0202bd0:	02d00593          	li	a1,45
ffffffffc0202bd4:	00002517          	auipc	a0,0x2
ffffffffc0202bd8:	59450513          	addi	a0,a0,1428 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202bdc:	d10fd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202be0:	00002697          	auipc	a3,0x2
ffffffffc0202be4:	6d068693          	addi	a3,a3,1744 # ffffffffc02052b0 <etext+0x1590>
ffffffffc0202be8:	00002617          	auipc	a2,0x2
ffffffffc0202bec:	97060613          	addi	a2,a2,-1680 # ffffffffc0204558 <etext+0x838>
ffffffffc0202bf0:	02c00593          	li	a1,44
ffffffffc0202bf4:	00002517          	auipc	a0,0x2
ffffffffc0202bf8:	57450513          	addi	a0,a0,1396 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202bfc:	cf0fd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202c00 <_clock_map_swappable>:
ffffffffc0202c00:	1101                	addi	sp,sp,-32
ffffffffc0202c02:	e426                	sd	s1,8(sp)
ffffffffc0202c04:	7504                	ld	s1,40(a0)
ffffffffc0202c06:	ec06                	sd	ra,24(sp)
ffffffffc0202c08:	e822                	sd	s0,16(sp)
ffffffffc0202c0a:	e04a                	sd	s2,0(sp)
ffffffffc0202c0c:	cc85                	beqz	s1,ffffffffc0202c44 <_clock_map_swappable+0x44>
ffffffffc0202c0e:	622c                	ld	a1,64(a2)
ffffffffc0202c10:	6d08                	ld	a0,24(a0)
ffffffffc0202c12:	8432                	mv	s0,a2
ffffffffc0202c14:	03060913          	addi	s2,a2,48
ffffffffc0202c18:	4601                	li	a2,0
ffffffffc0202c1a:	cb3fd0ef          	jal	ra,ffffffffc02008cc <get_pte>
ffffffffc0202c1e:	6118                	ld	a4,0(a0)
ffffffffc0202c20:	6094                	ld	a3,0(s1)
ffffffffc0202c22:	87aa                	mv	a5,a0
ffffffffc0202c24:	04076713          	ori	a4,a4,64
ffffffffc0202c28:	e398                	sd	a4,0(a5)
ffffffffc0202c2a:	0124b023          	sd	s2,0(s1)
ffffffffc0202c2e:	0126b423          	sd	s2,8(a3)
ffffffffc0202c32:	fc04                	sd	s1,56(s0)
ffffffffc0202c34:	60e2                	ld	ra,24(sp)
ffffffffc0202c36:	f814                	sd	a3,48(s0)
ffffffffc0202c38:	6442                	ld	s0,16(sp)
ffffffffc0202c3a:	64a2                	ld	s1,8(sp)
ffffffffc0202c3c:	6902                	ld	s2,0(sp)
ffffffffc0202c3e:	4501                	li	a0,0
ffffffffc0202c40:	6105                	addi	sp,sp,32
ffffffffc0202c42:	8082                	ret
ffffffffc0202c44:	00002697          	auipc	a3,0x2
ffffffffc0202c48:	68c68693          	addi	a3,a3,1676 # ffffffffc02052d0 <etext+0x15b0>
ffffffffc0202c4c:	00002617          	auipc	a2,0x2
ffffffffc0202c50:	90c60613          	addi	a2,a2,-1780 # ffffffffc0204558 <etext+0x838>
ffffffffc0202c54:	45f5                	li	a1,29
ffffffffc0202c56:	00002517          	auipc	a0,0x2
ffffffffc0202c5a:	51250513          	addi	a0,a0,1298 # ffffffffc0205168 <etext+0x1448>
ffffffffc0202c5e:	c8efd0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0202c62 <default_init>:
ffffffffc0202c62:	0000d797          	auipc	a5,0xd
ffffffffc0202c66:	52678793          	addi	a5,a5,1318 # ffffffffc0210188 <free_area>
ffffffffc0202c6a:	e79c                	sd	a5,8(a5)
ffffffffc0202c6c:	e39c                	sd	a5,0(a5)
ffffffffc0202c6e:	0007a823          	sw	zero,16(a5)
ffffffffc0202c72:	8082                	ret

ffffffffc0202c74 <default_nr_free_pages>:
ffffffffc0202c74:	0000d517          	auipc	a0,0xd
ffffffffc0202c78:	52456503          	lwu	a0,1316(a0) # ffffffffc0210198 <free_area+0x10>
ffffffffc0202c7c:	8082                	ret

ffffffffc0202c7e <default_check>:
ffffffffc0202c7e:	715d                	addi	sp,sp,-80
ffffffffc0202c80:	e0a2                	sd	s0,64(sp)
ffffffffc0202c82:	0000d417          	auipc	s0,0xd
ffffffffc0202c86:	50640413          	addi	s0,s0,1286 # ffffffffc0210188 <free_area>
ffffffffc0202c8a:	641c                	ld	a5,8(s0)
ffffffffc0202c8c:	e486                	sd	ra,72(sp)
ffffffffc0202c8e:	fc26                	sd	s1,56(sp)
ffffffffc0202c90:	f84a                	sd	s2,48(sp)
ffffffffc0202c92:	f44e                	sd	s3,40(sp)
ffffffffc0202c94:	f052                	sd	s4,32(sp)
ffffffffc0202c96:	ec56                	sd	s5,24(sp)
ffffffffc0202c98:	e85a                	sd	s6,16(sp)
ffffffffc0202c9a:	e45e                	sd	s7,8(sp)
ffffffffc0202c9c:	e062                	sd	s8,0(sp)
ffffffffc0202c9e:	2c878763          	beq	a5,s0,ffffffffc0202f6c <default_check+0x2ee>
ffffffffc0202ca2:	4481                	li	s1,0
ffffffffc0202ca4:	4901                	li	s2,0
ffffffffc0202ca6:	fe87b703          	ld	a4,-24(a5)
ffffffffc0202caa:	8b09                	andi	a4,a4,2
ffffffffc0202cac:	2c070463          	beqz	a4,ffffffffc0202f74 <default_check+0x2f6>
ffffffffc0202cb0:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202cb4:	679c                	ld	a5,8(a5)
ffffffffc0202cb6:	2905                	addiw	s2,s2,1
ffffffffc0202cb8:	9cb9                	addw	s1,s1,a4
ffffffffc0202cba:	fe8796e3          	bne	a5,s0,ffffffffc0202ca6 <default_check+0x28>
ffffffffc0202cbe:	89a6                	mv	s3,s1
ffffffffc0202cc0:	bd1fd0ef          	jal	ra,ffffffffc0200890 <nr_free_pages>
ffffffffc0202cc4:	71351863          	bne	a0,s3,ffffffffc02033d4 <default_check+0x756>
ffffffffc0202cc8:	4505                	li	a0,1
ffffffffc0202cca:	af3fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202cce:	8a2a                	mv	s4,a0
ffffffffc0202cd0:	44050263          	beqz	a0,ffffffffc0203114 <default_check+0x496>
ffffffffc0202cd4:	4505                	li	a0,1
ffffffffc0202cd6:	ae7fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202cda:	89aa                	mv	s3,a0
ffffffffc0202cdc:	70050c63          	beqz	a0,ffffffffc02033f4 <default_check+0x776>
ffffffffc0202ce0:	4505                	li	a0,1
ffffffffc0202ce2:	adbfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202ce6:	8aaa                	mv	s5,a0
ffffffffc0202ce8:	4a050663          	beqz	a0,ffffffffc0203194 <default_check+0x516>
ffffffffc0202cec:	2b3a0463          	beq	s4,s3,ffffffffc0202f94 <default_check+0x316>
ffffffffc0202cf0:	2aaa0263          	beq	s4,a0,ffffffffc0202f94 <default_check+0x316>
ffffffffc0202cf4:	2aa98063          	beq	s3,a0,ffffffffc0202f94 <default_check+0x316>
ffffffffc0202cf8:	000a2783          	lw	a5,0(s4)
ffffffffc0202cfc:	2a079c63          	bnez	a5,ffffffffc0202fb4 <default_check+0x336>
ffffffffc0202d00:	0009a783          	lw	a5,0(s3)
ffffffffc0202d04:	2a079863          	bnez	a5,ffffffffc0202fb4 <default_check+0x336>
ffffffffc0202d08:	411c                	lw	a5,0(a0)
ffffffffc0202d0a:	2a079563          	bnez	a5,ffffffffc0202fb4 <default_check+0x336>
ffffffffc0202d0e:	0000d797          	auipc	a5,0xd
ffffffffc0202d12:	38a7b783          	ld	a5,906(a5) # ffffffffc0210098 <pages>
ffffffffc0202d16:	40fa0733          	sub	a4,s4,a5
ffffffffc0202d1a:	870d                	srai	a4,a4,0x3
ffffffffc0202d1c:	00003597          	auipc	a1,0x3
ffffffffc0202d20:	c2c5b583          	ld	a1,-980(a1) # ffffffffc0205948 <error_string+0x38>
ffffffffc0202d24:	02b70733          	mul	a4,a4,a1
ffffffffc0202d28:	00003617          	auipc	a2,0x3
ffffffffc0202d2c:	c2863603          	ld	a2,-984(a2) # ffffffffc0205950 <nbase>
ffffffffc0202d30:	0000d697          	auipc	a3,0xd
ffffffffc0202d34:	3286b683          	ld	a3,808(a3) # ffffffffc0210058 <npage>
ffffffffc0202d38:	06b2                	slli	a3,a3,0xc
ffffffffc0202d3a:	9732                	add	a4,a4,a2
ffffffffc0202d3c:	0732                	slli	a4,a4,0xc
ffffffffc0202d3e:	28d77b63          	bgeu	a4,a3,ffffffffc0202fd4 <default_check+0x356>
ffffffffc0202d42:	40f98733          	sub	a4,s3,a5
ffffffffc0202d46:	870d                	srai	a4,a4,0x3
ffffffffc0202d48:	02b70733          	mul	a4,a4,a1
ffffffffc0202d4c:	9732                	add	a4,a4,a2
ffffffffc0202d4e:	0732                	slli	a4,a4,0xc
ffffffffc0202d50:	4cd77263          	bgeu	a4,a3,ffffffffc0203214 <default_check+0x596>
ffffffffc0202d54:	40f507b3          	sub	a5,a0,a5
ffffffffc0202d58:	878d                	srai	a5,a5,0x3
ffffffffc0202d5a:	02b787b3          	mul	a5,a5,a1
ffffffffc0202d5e:	97b2                	add	a5,a5,a2
ffffffffc0202d60:	07b2                	slli	a5,a5,0xc
ffffffffc0202d62:	30d7f963          	bgeu	a5,a3,ffffffffc0203074 <default_check+0x3f6>
ffffffffc0202d66:	4505                	li	a0,1
ffffffffc0202d68:	00043c03          	ld	s8,0(s0)
ffffffffc0202d6c:	00843b83          	ld	s7,8(s0)
ffffffffc0202d70:	01042b03          	lw	s6,16(s0)
ffffffffc0202d74:	e400                	sd	s0,8(s0)
ffffffffc0202d76:	e000                	sd	s0,0(s0)
ffffffffc0202d78:	0000d797          	auipc	a5,0xd
ffffffffc0202d7c:	4207a023          	sw	zero,1056(a5) # ffffffffc0210198 <free_area+0x10>
ffffffffc0202d80:	a3dfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202d84:	2c051863          	bnez	a0,ffffffffc0203054 <default_check+0x3d6>
ffffffffc0202d88:	4585                	li	a1,1
ffffffffc0202d8a:	8552                	mv	a0,s4
ffffffffc0202d8c:	ac3fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202d90:	4585                	li	a1,1
ffffffffc0202d92:	854e                	mv	a0,s3
ffffffffc0202d94:	abbfd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202d98:	4585                	li	a1,1
ffffffffc0202d9a:	8556                	mv	a0,s5
ffffffffc0202d9c:	ab3fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202da0:	4818                	lw	a4,16(s0)
ffffffffc0202da2:	478d                	li	a5,3
ffffffffc0202da4:	28f71863          	bne	a4,a5,ffffffffc0203034 <default_check+0x3b6>
ffffffffc0202da8:	4505                	li	a0,1
ffffffffc0202daa:	a13fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202dae:	89aa                	mv	s3,a0
ffffffffc0202db0:	26050263          	beqz	a0,ffffffffc0203014 <default_check+0x396>
ffffffffc0202db4:	4505                	li	a0,1
ffffffffc0202db6:	a07fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202dba:	8aaa                	mv	s5,a0
ffffffffc0202dbc:	3a050c63          	beqz	a0,ffffffffc0203174 <default_check+0x4f6>
ffffffffc0202dc0:	4505                	li	a0,1
ffffffffc0202dc2:	9fbfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202dc6:	8a2a                	mv	s4,a0
ffffffffc0202dc8:	38050663          	beqz	a0,ffffffffc0203154 <default_check+0x4d6>
ffffffffc0202dcc:	4505                	li	a0,1
ffffffffc0202dce:	9effd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202dd2:	36051163          	bnez	a0,ffffffffc0203134 <default_check+0x4b6>
ffffffffc0202dd6:	4585                	li	a1,1
ffffffffc0202dd8:	854e                	mv	a0,s3
ffffffffc0202dda:	a75fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202dde:	641c                	ld	a5,8(s0)
ffffffffc0202de0:	20878a63          	beq	a5,s0,ffffffffc0202ff4 <default_check+0x376>
ffffffffc0202de4:	4505                	li	a0,1
ffffffffc0202de6:	9d7fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202dea:	30a99563          	bne	s3,a0,ffffffffc02030f4 <default_check+0x476>
ffffffffc0202dee:	4505                	li	a0,1
ffffffffc0202df0:	9cdfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202df4:	2e051063          	bnez	a0,ffffffffc02030d4 <default_check+0x456>
ffffffffc0202df8:	481c                	lw	a5,16(s0)
ffffffffc0202dfa:	2a079d63          	bnez	a5,ffffffffc02030b4 <default_check+0x436>
ffffffffc0202dfe:	854e                	mv	a0,s3
ffffffffc0202e00:	4585                	li	a1,1
ffffffffc0202e02:	01843023          	sd	s8,0(s0)
ffffffffc0202e06:	01743423          	sd	s7,8(s0)
ffffffffc0202e0a:	01642823          	sw	s6,16(s0)
ffffffffc0202e0e:	a41fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202e12:	4585                	li	a1,1
ffffffffc0202e14:	8556                	mv	a0,s5
ffffffffc0202e16:	a39fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202e1a:	4585                	li	a1,1
ffffffffc0202e1c:	8552                	mv	a0,s4
ffffffffc0202e1e:	a31fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202e22:	4515                	li	a0,5
ffffffffc0202e24:	999fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202e28:	89aa                	mv	s3,a0
ffffffffc0202e2a:	26050563          	beqz	a0,ffffffffc0203094 <default_check+0x416>
ffffffffc0202e2e:	651c                	ld	a5,8(a0)
ffffffffc0202e30:	8385                	srli	a5,a5,0x1
ffffffffc0202e32:	8b85                	andi	a5,a5,1
ffffffffc0202e34:	54079063          	bnez	a5,ffffffffc0203374 <default_check+0x6f6>
ffffffffc0202e38:	4505                	li	a0,1
ffffffffc0202e3a:	00043b03          	ld	s6,0(s0)
ffffffffc0202e3e:	00843a83          	ld	s5,8(s0)
ffffffffc0202e42:	e000                	sd	s0,0(s0)
ffffffffc0202e44:	e400                	sd	s0,8(s0)
ffffffffc0202e46:	977fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202e4a:	50051563          	bnez	a0,ffffffffc0203354 <default_check+0x6d6>
ffffffffc0202e4e:	09098a13          	addi	s4,s3,144
ffffffffc0202e52:	8552                	mv	a0,s4
ffffffffc0202e54:	458d                	li	a1,3
ffffffffc0202e56:	01042b83          	lw	s7,16(s0)
ffffffffc0202e5a:	0000d797          	auipc	a5,0xd
ffffffffc0202e5e:	3207af23          	sw	zero,830(a5) # ffffffffc0210198 <free_area+0x10>
ffffffffc0202e62:	9edfd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202e66:	4511                	li	a0,4
ffffffffc0202e68:	955fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202e6c:	4c051463          	bnez	a0,ffffffffc0203334 <default_check+0x6b6>
ffffffffc0202e70:	0989b783          	ld	a5,152(s3)
ffffffffc0202e74:	8385                	srli	a5,a5,0x1
ffffffffc0202e76:	8b85                	andi	a5,a5,1
ffffffffc0202e78:	48078e63          	beqz	a5,ffffffffc0203314 <default_check+0x696>
ffffffffc0202e7c:	0a89a703          	lw	a4,168(s3)
ffffffffc0202e80:	478d                	li	a5,3
ffffffffc0202e82:	48f71963          	bne	a4,a5,ffffffffc0203314 <default_check+0x696>
ffffffffc0202e86:	450d                	li	a0,3
ffffffffc0202e88:	935fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202e8c:	8c2a                	mv	s8,a0
ffffffffc0202e8e:	46050363          	beqz	a0,ffffffffc02032f4 <default_check+0x676>
ffffffffc0202e92:	4505                	li	a0,1
ffffffffc0202e94:	929fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202e98:	42051e63          	bnez	a0,ffffffffc02032d4 <default_check+0x656>
ffffffffc0202e9c:	418a1c63          	bne	s4,s8,ffffffffc02032b4 <default_check+0x636>
ffffffffc0202ea0:	4585                	li	a1,1
ffffffffc0202ea2:	854e                	mv	a0,s3
ffffffffc0202ea4:	9abfd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202ea8:	458d                	li	a1,3
ffffffffc0202eaa:	8552                	mv	a0,s4
ffffffffc0202eac:	9a3fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202eb0:	0089b783          	ld	a5,8(s3)
ffffffffc0202eb4:	04898c13          	addi	s8,s3,72
ffffffffc0202eb8:	8385                	srli	a5,a5,0x1
ffffffffc0202eba:	8b85                	andi	a5,a5,1
ffffffffc0202ebc:	3c078c63          	beqz	a5,ffffffffc0203294 <default_check+0x616>
ffffffffc0202ec0:	0189a703          	lw	a4,24(s3)
ffffffffc0202ec4:	4785                	li	a5,1
ffffffffc0202ec6:	3cf71763          	bne	a4,a5,ffffffffc0203294 <default_check+0x616>
ffffffffc0202eca:	008a3783          	ld	a5,8(s4)
ffffffffc0202ece:	8385                	srli	a5,a5,0x1
ffffffffc0202ed0:	8b85                	andi	a5,a5,1
ffffffffc0202ed2:	3a078163          	beqz	a5,ffffffffc0203274 <default_check+0x5f6>
ffffffffc0202ed6:	018a2703          	lw	a4,24(s4)
ffffffffc0202eda:	478d                	li	a5,3
ffffffffc0202edc:	38f71c63          	bne	a4,a5,ffffffffc0203274 <default_check+0x5f6>
ffffffffc0202ee0:	4505                	li	a0,1
ffffffffc0202ee2:	8dbfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202ee6:	36a99763          	bne	s3,a0,ffffffffc0203254 <default_check+0x5d6>
ffffffffc0202eea:	4585                	li	a1,1
ffffffffc0202eec:	963fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202ef0:	4509                	li	a0,2
ffffffffc0202ef2:	8cbfd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202ef6:	32aa1f63          	bne	s4,a0,ffffffffc0203234 <default_check+0x5b6>
ffffffffc0202efa:	4589                	li	a1,2
ffffffffc0202efc:	953fd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202f00:	4585                	li	a1,1
ffffffffc0202f02:	8562                	mv	a0,s8
ffffffffc0202f04:	94bfd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202f08:	4515                	li	a0,5
ffffffffc0202f0a:	8b3fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202f0e:	89aa                	mv	s3,a0
ffffffffc0202f10:	48050263          	beqz	a0,ffffffffc0203394 <default_check+0x716>
ffffffffc0202f14:	4505                	li	a0,1
ffffffffc0202f16:	8a7fd0ef          	jal	ra,ffffffffc02007bc <alloc_pages>
ffffffffc0202f1a:	2c051d63          	bnez	a0,ffffffffc02031f4 <default_check+0x576>
ffffffffc0202f1e:	481c                	lw	a5,16(s0)
ffffffffc0202f20:	2a079a63          	bnez	a5,ffffffffc02031d4 <default_check+0x556>
ffffffffc0202f24:	4595                	li	a1,5
ffffffffc0202f26:	854e                	mv	a0,s3
ffffffffc0202f28:	01742823          	sw	s7,16(s0)
ffffffffc0202f2c:	01643023          	sd	s6,0(s0)
ffffffffc0202f30:	01543423          	sd	s5,8(s0)
ffffffffc0202f34:	91bfd0ef          	jal	ra,ffffffffc020084e <free_pages>
ffffffffc0202f38:	641c                	ld	a5,8(s0)
ffffffffc0202f3a:	00878963          	beq	a5,s0,ffffffffc0202f4c <default_check+0x2ce>
ffffffffc0202f3e:	ff87a703          	lw	a4,-8(a5)
ffffffffc0202f42:	679c                	ld	a5,8(a5)
ffffffffc0202f44:	397d                	addiw	s2,s2,-1
ffffffffc0202f46:	9c99                	subw	s1,s1,a4
ffffffffc0202f48:	fe879be3          	bne	a5,s0,ffffffffc0202f3e <default_check+0x2c0>
ffffffffc0202f4c:	26091463          	bnez	s2,ffffffffc02031b4 <default_check+0x536>
ffffffffc0202f50:	46049263          	bnez	s1,ffffffffc02033b4 <default_check+0x736>
ffffffffc0202f54:	60a6                	ld	ra,72(sp)
ffffffffc0202f56:	6406                	ld	s0,64(sp)
ffffffffc0202f58:	74e2                	ld	s1,56(sp)
ffffffffc0202f5a:	7942                	ld	s2,48(sp)
ffffffffc0202f5c:	79a2                	ld	s3,40(sp)
ffffffffc0202f5e:	7a02                	ld	s4,32(sp)
ffffffffc0202f60:	6ae2                	ld	s5,24(sp)
ffffffffc0202f62:	6b42                	ld	s6,16(sp)
ffffffffc0202f64:	6ba2                	ld	s7,8(sp)
ffffffffc0202f66:	6c02                	ld	s8,0(sp)
ffffffffc0202f68:	6161                	addi	sp,sp,80
ffffffffc0202f6a:	8082                	ret
ffffffffc0202f6c:	4981                	li	s3,0
ffffffffc0202f6e:	4481                	li	s1,0
ffffffffc0202f70:	4901                	li	s2,0
ffffffffc0202f72:	b3b9                	j	ffffffffc0202cc0 <default_check+0x42>
ffffffffc0202f74:	00002697          	auipc	a3,0x2
ffffffffc0202f78:	e6468693          	addi	a3,a3,-412 # ffffffffc0204dd8 <etext+0x10b8>
ffffffffc0202f7c:	00001617          	auipc	a2,0x1
ffffffffc0202f80:	5dc60613          	addi	a2,a2,1500 # ffffffffc0204558 <etext+0x838>
ffffffffc0202f84:	0bd00593          	li	a1,189
ffffffffc0202f88:	00002517          	auipc	a0,0x2
ffffffffc0202f8c:	38050513          	addi	a0,a0,896 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0202f90:	95cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202f94:	00002697          	auipc	a3,0x2
ffffffffc0202f98:	3ec68693          	addi	a3,a3,1004 # ffffffffc0205380 <etext+0x1660>
ffffffffc0202f9c:	00001617          	auipc	a2,0x1
ffffffffc0202fa0:	5bc60613          	addi	a2,a2,1468 # ffffffffc0204558 <etext+0x838>
ffffffffc0202fa4:	08a00593          	li	a1,138
ffffffffc0202fa8:	00002517          	auipc	a0,0x2
ffffffffc0202fac:	36050513          	addi	a0,a0,864 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0202fb0:	93cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202fb4:	00002697          	auipc	a3,0x2
ffffffffc0202fb8:	3f468693          	addi	a3,a3,1012 # ffffffffc02053a8 <etext+0x1688>
ffffffffc0202fbc:	00001617          	auipc	a2,0x1
ffffffffc0202fc0:	59c60613          	addi	a2,a2,1436 # ffffffffc0204558 <etext+0x838>
ffffffffc0202fc4:	08b00593          	li	a1,139
ffffffffc0202fc8:	00002517          	auipc	a0,0x2
ffffffffc0202fcc:	34050513          	addi	a0,a0,832 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0202fd0:	91cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202fd4:	00002697          	auipc	a3,0x2
ffffffffc0202fd8:	41468693          	addi	a3,a3,1044 # ffffffffc02053e8 <etext+0x16c8>
ffffffffc0202fdc:	00001617          	auipc	a2,0x1
ffffffffc0202fe0:	57c60613          	addi	a2,a2,1404 # ffffffffc0204558 <etext+0x838>
ffffffffc0202fe4:	08d00593          	li	a1,141
ffffffffc0202fe8:	00002517          	auipc	a0,0x2
ffffffffc0202fec:	32050513          	addi	a0,a0,800 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0202ff0:	8fcfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0202ff4:	00002697          	auipc	a3,0x2
ffffffffc0202ff8:	47c68693          	addi	a3,a3,1148 # ffffffffc0205470 <etext+0x1750>
ffffffffc0202ffc:	00001617          	auipc	a2,0x1
ffffffffc0203000:	55c60613          	addi	a2,a2,1372 # ffffffffc0204558 <etext+0x838>
ffffffffc0203004:	0a600593          	li	a1,166
ffffffffc0203008:	00002517          	auipc	a0,0x2
ffffffffc020300c:	30050513          	addi	a0,a0,768 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203010:	8dcfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203014:	00002697          	auipc	a3,0x2
ffffffffc0203018:	30c68693          	addi	a3,a3,780 # ffffffffc0205320 <etext+0x1600>
ffffffffc020301c:	00001617          	auipc	a2,0x1
ffffffffc0203020:	53c60613          	addi	a2,a2,1340 # ffffffffc0204558 <etext+0x838>
ffffffffc0203024:	09f00593          	li	a1,159
ffffffffc0203028:	00002517          	auipc	a0,0x2
ffffffffc020302c:	2e050513          	addi	a0,a0,736 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203030:	8bcfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203034:	00002697          	auipc	a3,0x2
ffffffffc0203038:	42c68693          	addi	a3,a3,1068 # ffffffffc0205460 <etext+0x1740>
ffffffffc020303c:	00001617          	auipc	a2,0x1
ffffffffc0203040:	51c60613          	addi	a2,a2,1308 # ffffffffc0204558 <etext+0x838>
ffffffffc0203044:	09d00593          	li	a1,157
ffffffffc0203048:	00002517          	auipc	a0,0x2
ffffffffc020304c:	2c050513          	addi	a0,a0,704 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203050:	89cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203054:	00002697          	auipc	a3,0x2
ffffffffc0203058:	3f468693          	addi	a3,a3,1012 # ffffffffc0205448 <etext+0x1728>
ffffffffc020305c:	00001617          	auipc	a2,0x1
ffffffffc0203060:	4fc60613          	addi	a2,a2,1276 # ffffffffc0204558 <etext+0x838>
ffffffffc0203064:	09800593          	li	a1,152
ffffffffc0203068:	00002517          	auipc	a0,0x2
ffffffffc020306c:	2a050513          	addi	a0,a0,672 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203070:	87cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203074:	00002697          	auipc	a3,0x2
ffffffffc0203078:	3b468693          	addi	a3,a3,948 # ffffffffc0205428 <etext+0x1708>
ffffffffc020307c:	00001617          	auipc	a2,0x1
ffffffffc0203080:	4dc60613          	addi	a2,a2,1244 # ffffffffc0204558 <etext+0x838>
ffffffffc0203084:	08f00593          	li	a1,143
ffffffffc0203088:	00002517          	auipc	a0,0x2
ffffffffc020308c:	28050513          	addi	a0,a0,640 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203090:	85cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203094:	00002697          	auipc	a3,0x2
ffffffffc0203098:	41468693          	addi	a3,a3,1044 # ffffffffc02054a8 <etext+0x1788>
ffffffffc020309c:	00001617          	auipc	a2,0x1
ffffffffc02030a0:	4bc60613          	addi	a2,a2,1212 # ffffffffc0204558 <etext+0x838>
ffffffffc02030a4:	0c500593          	li	a1,197
ffffffffc02030a8:	00002517          	auipc	a0,0x2
ffffffffc02030ac:	26050513          	addi	a0,a0,608 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02030b0:	83cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030b4:	00002697          	auipc	a3,0x2
ffffffffc02030b8:	ed468693          	addi	a3,a3,-300 # ffffffffc0204f88 <etext+0x1268>
ffffffffc02030bc:	00001617          	auipc	a2,0x1
ffffffffc02030c0:	49c60613          	addi	a2,a2,1180 # ffffffffc0204558 <etext+0x838>
ffffffffc02030c4:	0ac00593          	li	a1,172
ffffffffc02030c8:	00002517          	auipc	a0,0x2
ffffffffc02030cc:	24050513          	addi	a0,a0,576 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02030d0:	81cfd0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030d4:	00002697          	auipc	a3,0x2
ffffffffc02030d8:	37468693          	addi	a3,a3,884 # ffffffffc0205448 <etext+0x1728>
ffffffffc02030dc:	00001617          	auipc	a2,0x1
ffffffffc02030e0:	47c60613          	addi	a2,a2,1148 # ffffffffc0204558 <etext+0x838>
ffffffffc02030e4:	0aa00593          	li	a1,170
ffffffffc02030e8:	00002517          	auipc	a0,0x2
ffffffffc02030ec:	22050513          	addi	a0,a0,544 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02030f0:	ffdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02030f4:	00002697          	auipc	a3,0x2
ffffffffc02030f8:	39468693          	addi	a3,a3,916 # ffffffffc0205488 <etext+0x1768>
ffffffffc02030fc:	00001617          	auipc	a2,0x1
ffffffffc0203100:	45c60613          	addi	a2,a2,1116 # ffffffffc0204558 <etext+0x838>
ffffffffc0203104:	0a900593          	li	a1,169
ffffffffc0203108:	00002517          	auipc	a0,0x2
ffffffffc020310c:	20050513          	addi	a0,a0,512 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203110:	fddfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203114:	00002697          	auipc	a3,0x2
ffffffffc0203118:	20c68693          	addi	a3,a3,524 # ffffffffc0205320 <etext+0x1600>
ffffffffc020311c:	00001617          	auipc	a2,0x1
ffffffffc0203120:	43c60613          	addi	a2,a2,1084 # ffffffffc0204558 <etext+0x838>
ffffffffc0203124:	08600593          	li	a1,134
ffffffffc0203128:	00002517          	auipc	a0,0x2
ffffffffc020312c:	1e050513          	addi	a0,a0,480 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203130:	fbdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203134:	00002697          	auipc	a3,0x2
ffffffffc0203138:	31468693          	addi	a3,a3,788 # ffffffffc0205448 <etext+0x1728>
ffffffffc020313c:	00001617          	auipc	a2,0x1
ffffffffc0203140:	41c60613          	addi	a2,a2,1052 # ffffffffc0204558 <etext+0x838>
ffffffffc0203144:	0a300593          	li	a1,163
ffffffffc0203148:	00002517          	auipc	a0,0x2
ffffffffc020314c:	1c050513          	addi	a0,a0,448 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203150:	f9dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203154:	00002697          	auipc	a3,0x2
ffffffffc0203158:	20c68693          	addi	a3,a3,524 # ffffffffc0205360 <etext+0x1640>
ffffffffc020315c:	00001617          	auipc	a2,0x1
ffffffffc0203160:	3fc60613          	addi	a2,a2,1020 # ffffffffc0204558 <etext+0x838>
ffffffffc0203164:	0a100593          	li	a1,161
ffffffffc0203168:	00002517          	auipc	a0,0x2
ffffffffc020316c:	1a050513          	addi	a0,a0,416 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203170:	f7dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203174:	00002697          	auipc	a3,0x2
ffffffffc0203178:	1cc68693          	addi	a3,a3,460 # ffffffffc0205340 <etext+0x1620>
ffffffffc020317c:	00001617          	auipc	a2,0x1
ffffffffc0203180:	3dc60613          	addi	a2,a2,988 # ffffffffc0204558 <etext+0x838>
ffffffffc0203184:	0a000593          	li	a1,160
ffffffffc0203188:	00002517          	auipc	a0,0x2
ffffffffc020318c:	18050513          	addi	a0,a0,384 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203190:	f5dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203194:	00002697          	auipc	a3,0x2
ffffffffc0203198:	1cc68693          	addi	a3,a3,460 # ffffffffc0205360 <etext+0x1640>
ffffffffc020319c:	00001617          	auipc	a2,0x1
ffffffffc02031a0:	3bc60613          	addi	a2,a2,956 # ffffffffc0204558 <etext+0x838>
ffffffffc02031a4:	08800593          	li	a1,136
ffffffffc02031a8:	00002517          	auipc	a0,0x2
ffffffffc02031ac:	16050513          	addi	a0,a0,352 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02031b0:	f3dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031b4:	00002697          	auipc	a3,0x2
ffffffffc02031b8:	44468693          	addi	a3,a3,1092 # ffffffffc02055f8 <etext+0x18d8>
ffffffffc02031bc:	00001617          	auipc	a2,0x1
ffffffffc02031c0:	39c60613          	addi	a2,a2,924 # ffffffffc0204558 <etext+0x838>
ffffffffc02031c4:	0f200593          	li	a1,242
ffffffffc02031c8:	00002517          	auipc	a0,0x2
ffffffffc02031cc:	14050513          	addi	a0,a0,320 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02031d0:	f1dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031d4:	00002697          	auipc	a3,0x2
ffffffffc02031d8:	db468693          	addi	a3,a3,-588 # ffffffffc0204f88 <etext+0x1268>
ffffffffc02031dc:	00001617          	auipc	a2,0x1
ffffffffc02031e0:	37c60613          	addi	a2,a2,892 # ffffffffc0204558 <etext+0x838>
ffffffffc02031e4:	0e700593          	li	a1,231
ffffffffc02031e8:	00002517          	auipc	a0,0x2
ffffffffc02031ec:	12050513          	addi	a0,a0,288 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02031f0:	efdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02031f4:	00002697          	auipc	a3,0x2
ffffffffc02031f8:	25468693          	addi	a3,a3,596 # ffffffffc0205448 <etext+0x1728>
ffffffffc02031fc:	00001617          	auipc	a2,0x1
ffffffffc0203200:	35c60613          	addi	a2,a2,860 # ffffffffc0204558 <etext+0x838>
ffffffffc0203204:	0e500593          	li	a1,229
ffffffffc0203208:	00002517          	auipc	a0,0x2
ffffffffc020320c:	10050513          	addi	a0,a0,256 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203210:	eddfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203214:	00002697          	auipc	a3,0x2
ffffffffc0203218:	1f468693          	addi	a3,a3,500 # ffffffffc0205408 <etext+0x16e8>
ffffffffc020321c:	00001617          	auipc	a2,0x1
ffffffffc0203220:	33c60613          	addi	a2,a2,828 # ffffffffc0204558 <etext+0x838>
ffffffffc0203224:	08e00593          	li	a1,142
ffffffffc0203228:	00002517          	auipc	a0,0x2
ffffffffc020322c:	0e050513          	addi	a0,a0,224 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203230:	ebdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203234:	00002697          	auipc	a3,0x2
ffffffffc0203238:	38468693          	addi	a3,a3,900 # ffffffffc02055b8 <etext+0x1898>
ffffffffc020323c:	00001617          	auipc	a2,0x1
ffffffffc0203240:	31c60613          	addi	a2,a2,796 # ffffffffc0204558 <etext+0x838>
ffffffffc0203244:	0df00593          	li	a1,223
ffffffffc0203248:	00002517          	auipc	a0,0x2
ffffffffc020324c:	0c050513          	addi	a0,a0,192 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203250:	e9dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203254:	00002697          	auipc	a3,0x2
ffffffffc0203258:	34468693          	addi	a3,a3,836 # ffffffffc0205598 <etext+0x1878>
ffffffffc020325c:	00001617          	auipc	a2,0x1
ffffffffc0203260:	2fc60613          	addi	a2,a2,764 # ffffffffc0204558 <etext+0x838>
ffffffffc0203264:	0dd00593          	li	a1,221
ffffffffc0203268:	00002517          	auipc	a0,0x2
ffffffffc020326c:	0a050513          	addi	a0,a0,160 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203270:	e7dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203274:	00002697          	auipc	a3,0x2
ffffffffc0203278:	2fc68693          	addi	a3,a3,764 # ffffffffc0205570 <etext+0x1850>
ffffffffc020327c:	00001617          	auipc	a2,0x1
ffffffffc0203280:	2dc60613          	addi	a2,a2,732 # ffffffffc0204558 <etext+0x838>
ffffffffc0203284:	0db00593          	li	a1,219
ffffffffc0203288:	00002517          	auipc	a0,0x2
ffffffffc020328c:	08050513          	addi	a0,a0,128 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203290:	e5dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203294:	00002697          	auipc	a3,0x2
ffffffffc0203298:	2b468693          	addi	a3,a3,692 # ffffffffc0205548 <etext+0x1828>
ffffffffc020329c:	00001617          	auipc	a2,0x1
ffffffffc02032a0:	2bc60613          	addi	a2,a2,700 # ffffffffc0204558 <etext+0x838>
ffffffffc02032a4:	0da00593          	li	a1,218
ffffffffc02032a8:	00002517          	auipc	a0,0x2
ffffffffc02032ac:	06050513          	addi	a0,a0,96 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02032b0:	e3dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032b4:	00002697          	auipc	a3,0x2
ffffffffc02032b8:	28468693          	addi	a3,a3,644 # ffffffffc0205538 <etext+0x1818>
ffffffffc02032bc:	00001617          	auipc	a2,0x1
ffffffffc02032c0:	29c60613          	addi	a2,a2,668 # ffffffffc0204558 <etext+0x838>
ffffffffc02032c4:	0d500593          	li	a1,213
ffffffffc02032c8:	00002517          	auipc	a0,0x2
ffffffffc02032cc:	04050513          	addi	a0,a0,64 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02032d0:	e1dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032d4:	00002697          	auipc	a3,0x2
ffffffffc02032d8:	17468693          	addi	a3,a3,372 # ffffffffc0205448 <etext+0x1728>
ffffffffc02032dc:	00001617          	auipc	a2,0x1
ffffffffc02032e0:	27c60613          	addi	a2,a2,636 # ffffffffc0204558 <etext+0x838>
ffffffffc02032e4:	0d400593          	li	a1,212
ffffffffc02032e8:	00002517          	auipc	a0,0x2
ffffffffc02032ec:	02050513          	addi	a0,a0,32 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02032f0:	dfdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02032f4:	00002697          	auipc	a3,0x2
ffffffffc02032f8:	22468693          	addi	a3,a3,548 # ffffffffc0205518 <etext+0x17f8>
ffffffffc02032fc:	00001617          	auipc	a2,0x1
ffffffffc0203300:	25c60613          	addi	a2,a2,604 # ffffffffc0204558 <etext+0x838>
ffffffffc0203304:	0d300593          	li	a1,211
ffffffffc0203308:	00002517          	auipc	a0,0x2
ffffffffc020330c:	00050513          	mv	a0,a0
ffffffffc0203310:	dddfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203314:	00002697          	auipc	a3,0x2
ffffffffc0203318:	1d468693          	addi	a3,a3,468 # ffffffffc02054e8 <etext+0x17c8>
ffffffffc020331c:	00001617          	auipc	a2,0x1
ffffffffc0203320:	23c60613          	addi	a2,a2,572 # ffffffffc0204558 <etext+0x838>
ffffffffc0203324:	0d200593          	li	a1,210
ffffffffc0203328:	00002517          	auipc	a0,0x2
ffffffffc020332c:	fe050513          	addi	a0,a0,-32 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203330:	dbdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203334:	00002697          	auipc	a3,0x2
ffffffffc0203338:	19c68693          	addi	a3,a3,412 # ffffffffc02054d0 <etext+0x17b0>
ffffffffc020333c:	00001617          	auipc	a2,0x1
ffffffffc0203340:	21c60613          	addi	a2,a2,540 # ffffffffc0204558 <etext+0x838>
ffffffffc0203344:	0d100593          	li	a1,209
ffffffffc0203348:	00002517          	auipc	a0,0x2
ffffffffc020334c:	fc050513          	addi	a0,a0,-64 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203350:	d9dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203354:	00002697          	auipc	a3,0x2
ffffffffc0203358:	0f468693          	addi	a3,a3,244 # ffffffffc0205448 <etext+0x1728>
ffffffffc020335c:	00001617          	auipc	a2,0x1
ffffffffc0203360:	1fc60613          	addi	a2,a2,508 # ffffffffc0204558 <etext+0x838>
ffffffffc0203364:	0cb00593          	li	a1,203
ffffffffc0203368:	00002517          	auipc	a0,0x2
ffffffffc020336c:	fa050513          	addi	a0,a0,-96 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203370:	d7dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203374:	00002697          	auipc	a3,0x2
ffffffffc0203378:	14468693          	addi	a3,a3,324 # ffffffffc02054b8 <etext+0x1798>
ffffffffc020337c:	00001617          	auipc	a2,0x1
ffffffffc0203380:	1dc60613          	addi	a2,a2,476 # ffffffffc0204558 <etext+0x838>
ffffffffc0203384:	0c600593          	li	a1,198
ffffffffc0203388:	00002517          	auipc	a0,0x2
ffffffffc020338c:	f8050513          	addi	a0,a0,-128 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203390:	d5dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203394:	00002697          	auipc	a3,0x2
ffffffffc0203398:	24468693          	addi	a3,a3,580 # ffffffffc02055d8 <etext+0x18b8>
ffffffffc020339c:	00001617          	auipc	a2,0x1
ffffffffc02033a0:	1bc60613          	addi	a2,a2,444 # ffffffffc0204558 <etext+0x838>
ffffffffc02033a4:	0e400593          	li	a1,228
ffffffffc02033a8:	00002517          	auipc	a0,0x2
ffffffffc02033ac:	f6050513          	addi	a0,a0,-160 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02033b0:	d3dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033b4:	00002697          	auipc	a3,0x2
ffffffffc02033b8:	25468693          	addi	a3,a3,596 # ffffffffc0205608 <etext+0x18e8>
ffffffffc02033bc:	00001617          	auipc	a2,0x1
ffffffffc02033c0:	19c60613          	addi	a2,a2,412 # ffffffffc0204558 <etext+0x838>
ffffffffc02033c4:	0f300593          	li	a1,243
ffffffffc02033c8:	00002517          	auipc	a0,0x2
ffffffffc02033cc:	f4050513          	addi	a0,a0,-192 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02033d0:	d1dfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033d4:	00002697          	auipc	a3,0x2
ffffffffc02033d8:	a1468693          	addi	a3,a3,-1516 # ffffffffc0204de8 <etext+0x10c8>
ffffffffc02033dc:	00001617          	auipc	a2,0x1
ffffffffc02033e0:	17c60613          	addi	a2,a2,380 # ffffffffc0204558 <etext+0x838>
ffffffffc02033e4:	0c000593          	li	a1,192
ffffffffc02033e8:	00002517          	auipc	a0,0x2
ffffffffc02033ec:	f2050513          	addi	a0,a0,-224 # ffffffffc0205308 <etext+0x15e8>
ffffffffc02033f0:	cfdfc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02033f4:	00002697          	auipc	a3,0x2
ffffffffc02033f8:	f4c68693          	addi	a3,a3,-180 # ffffffffc0205340 <etext+0x1620>
ffffffffc02033fc:	00001617          	auipc	a2,0x1
ffffffffc0203400:	15c60613          	addi	a2,a2,348 # ffffffffc0204558 <etext+0x838>
ffffffffc0203404:	08700593          	li	a1,135
ffffffffc0203408:	00002517          	auipc	a0,0x2
ffffffffc020340c:	f0050513          	addi	a0,a0,-256 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203410:	cddfc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0203414 <default_free_pages>:
ffffffffc0203414:	1141                	addi	sp,sp,-16
ffffffffc0203416:	e406                	sd	ra,8(sp)
ffffffffc0203418:	14058a63          	beqz	a1,ffffffffc020356c <default_free_pages+0x158>
ffffffffc020341c:	00359693          	slli	a3,a1,0x3
ffffffffc0203420:	96ae                	add	a3,a3,a1
ffffffffc0203422:	068e                	slli	a3,a3,0x3
ffffffffc0203424:	96aa                	add	a3,a3,a0
ffffffffc0203426:	87aa                	mv	a5,a0
ffffffffc0203428:	02d50263          	beq	a0,a3,ffffffffc020344c <default_free_pages+0x38>
ffffffffc020342c:	6798                	ld	a4,8(a5)
ffffffffc020342e:	8b05                	andi	a4,a4,1
ffffffffc0203430:	10071e63          	bnez	a4,ffffffffc020354c <default_free_pages+0x138>
ffffffffc0203434:	6798                	ld	a4,8(a5)
ffffffffc0203436:	8b09                	andi	a4,a4,2
ffffffffc0203438:	10071a63          	bnez	a4,ffffffffc020354c <default_free_pages+0x138>
ffffffffc020343c:	0007b423          	sd	zero,8(a5)
ffffffffc0203440:	0007a023          	sw	zero,0(a5)
ffffffffc0203444:	04878793          	addi	a5,a5,72
ffffffffc0203448:	fed792e3          	bne	a5,a3,ffffffffc020342c <default_free_pages+0x18>
ffffffffc020344c:	2581                	sext.w	a1,a1
ffffffffc020344e:	cd0c                	sw	a1,24(a0)
ffffffffc0203450:	00850893          	addi	a7,a0,8
ffffffffc0203454:	4789                	li	a5,2
ffffffffc0203456:	40f8b02f          	amoor.d	zero,a5,(a7)
ffffffffc020345a:	0000d697          	auipc	a3,0xd
ffffffffc020345e:	d2e68693          	addi	a3,a3,-722 # ffffffffc0210188 <free_area>
ffffffffc0203462:	4a98                	lw	a4,16(a3)
ffffffffc0203464:	669c                	ld	a5,8(a3)
ffffffffc0203466:	02050613          	addi	a2,a0,32
ffffffffc020346a:	9db9                	addw	a1,a1,a4
ffffffffc020346c:	ca8c                	sw	a1,16(a3)
ffffffffc020346e:	0ad78863          	beq	a5,a3,ffffffffc020351e <default_free_pages+0x10a>
ffffffffc0203472:	fe078713          	addi	a4,a5,-32
ffffffffc0203476:	0006b803          	ld	a6,0(a3)
ffffffffc020347a:	4581                	li	a1,0
ffffffffc020347c:	00e56a63          	bltu	a0,a4,ffffffffc0203490 <default_free_pages+0x7c>
ffffffffc0203480:	6798                	ld	a4,8(a5)
ffffffffc0203482:	06d70263          	beq	a4,a3,ffffffffc02034e6 <default_free_pages+0xd2>
ffffffffc0203486:	87ba                	mv	a5,a4
ffffffffc0203488:	fe078713          	addi	a4,a5,-32
ffffffffc020348c:	fee57ae3          	bgeu	a0,a4,ffffffffc0203480 <default_free_pages+0x6c>
ffffffffc0203490:	c199                	beqz	a1,ffffffffc0203496 <default_free_pages+0x82>
ffffffffc0203492:	0106b023          	sd	a6,0(a3)
ffffffffc0203496:	6398                	ld	a4,0(a5)
ffffffffc0203498:	e390                	sd	a2,0(a5)
ffffffffc020349a:	e710                	sd	a2,8(a4)
ffffffffc020349c:	f51c                	sd	a5,40(a0)
ffffffffc020349e:	f118                	sd	a4,32(a0)
ffffffffc02034a0:	02d70063          	beq	a4,a3,ffffffffc02034c0 <default_free_pages+0xac>
ffffffffc02034a4:	ff872803          	lw	a6,-8(a4)
ffffffffc02034a8:	fe070593          	addi	a1,a4,-32
ffffffffc02034ac:	02081613          	slli	a2,a6,0x20
ffffffffc02034b0:	9201                	srli	a2,a2,0x20
ffffffffc02034b2:	00361793          	slli	a5,a2,0x3
ffffffffc02034b6:	97b2                	add	a5,a5,a2
ffffffffc02034b8:	078e                	slli	a5,a5,0x3
ffffffffc02034ba:	97ae                	add	a5,a5,a1
ffffffffc02034bc:	02f50f63          	beq	a0,a5,ffffffffc02034fa <default_free_pages+0xe6>
ffffffffc02034c0:	7518                	ld	a4,40(a0)
ffffffffc02034c2:	00d70f63          	beq	a4,a3,ffffffffc02034e0 <default_free_pages+0xcc>
ffffffffc02034c6:	4d0c                	lw	a1,24(a0)
ffffffffc02034c8:	fe070693          	addi	a3,a4,-32
ffffffffc02034cc:	02059613          	slli	a2,a1,0x20
ffffffffc02034d0:	9201                	srli	a2,a2,0x20
ffffffffc02034d2:	00361793          	slli	a5,a2,0x3
ffffffffc02034d6:	97b2                	add	a5,a5,a2
ffffffffc02034d8:	078e                	slli	a5,a5,0x3
ffffffffc02034da:	97aa                	add	a5,a5,a0
ffffffffc02034dc:	04f68863          	beq	a3,a5,ffffffffc020352c <default_free_pages+0x118>
ffffffffc02034e0:	60a2                	ld	ra,8(sp)
ffffffffc02034e2:	0141                	addi	sp,sp,16
ffffffffc02034e4:	8082                	ret
ffffffffc02034e6:	e790                	sd	a2,8(a5)
ffffffffc02034e8:	f514                	sd	a3,40(a0)
ffffffffc02034ea:	6798                	ld	a4,8(a5)
ffffffffc02034ec:	f11c                	sd	a5,32(a0)
ffffffffc02034ee:	02d70563          	beq	a4,a3,ffffffffc0203518 <default_free_pages+0x104>
ffffffffc02034f2:	8832                	mv	a6,a2
ffffffffc02034f4:	4585                	li	a1,1
ffffffffc02034f6:	87ba                	mv	a5,a4
ffffffffc02034f8:	bf41                	j	ffffffffc0203488 <default_free_pages+0x74>
ffffffffc02034fa:	4d1c                	lw	a5,24(a0)
ffffffffc02034fc:	0107883b          	addw	a6,a5,a6
ffffffffc0203500:	ff072c23          	sw	a6,-8(a4)
ffffffffc0203504:	57f5                	li	a5,-3
ffffffffc0203506:	60f8b02f          	amoand.d	zero,a5,(a7)
ffffffffc020350a:	7110                	ld	a2,32(a0)
ffffffffc020350c:	751c                	ld	a5,40(a0)
ffffffffc020350e:	852e                	mv	a0,a1
ffffffffc0203510:	e61c                	sd	a5,8(a2)
ffffffffc0203512:	6718                	ld	a4,8(a4)
ffffffffc0203514:	e390                	sd	a2,0(a5)
ffffffffc0203516:	b775                	j	ffffffffc02034c2 <default_free_pages+0xae>
ffffffffc0203518:	e290                	sd	a2,0(a3)
ffffffffc020351a:	873e                	mv	a4,a5
ffffffffc020351c:	b761                	j	ffffffffc02034a4 <default_free_pages+0x90>
ffffffffc020351e:	60a2                	ld	ra,8(sp)
ffffffffc0203520:	e390                	sd	a2,0(a5)
ffffffffc0203522:	e790                	sd	a2,8(a5)
ffffffffc0203524:	f51c                	sd	a5,40(a0)
ffffffffc0203526:	f11c                	sd	a5,32(a0)
ffffffffc0203528:	0141                	addi	sp,sp,16
ffffffffc020352a:	8082                	ret
ffffffffc020352c:	ff872783          	lw	a5,-8(a4)
ffffffffc0203530:	fe870693          	addi	a3,a4,-24
ffffffffc0203534:	9dbd                	addw	a1,a1,a5
ffffffffc0203536:	cd0c                	sw	a1,24(a0)
ffffffffc0203538:	57f5                	li	a5,-3
ffffffffc020353a:	60f6b02f          	amoand.d	zero,a5,(a3)
ffffffffc020353e:	6314                	ld	a3,0(a4)
ffffffffc0203540:	671c                	ld	a5,8(a4)
ffffffffc0203542:	60a2                	ld	ra,8(sp)
ffffffffc0203544:	e69c                	sd	a5,8(a3)
ffffffffc0203546:	e394                	sd	a3,0(a5)
ffffffffc0203548:	0141                	addi	sp,sp,16
ffffffffc020354a:	8082                	ret
ffffffffc020354c:	00002697          	auipc	a3,0x2
ffffffffc0203550:	0d468693          	addi	a3,a3,212 # ffffffffc0205620 <etext+0x1900>
ffffffffc0203554:	00001617          	auipc	a2,0x1
ffffffffc0203558:	00460613          	addi	a2,a2,4 # ffffffffc0204558 <etext+0x838>
ffffffffc020355c:	05000593          	li	a1,80
ffffffffc0203560:	00002517          	auipc	a0,0x2
ffffffffc0203564:	da850513          	addi	a0,a0,-600 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203568:	b85fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc020356c:	00002697          	auipc	a3,0x2
ffffffffc0203570:	0ac68693          	addi	a3,a3,172 # ffffffffc0205618 <etext+0x18f8>
ffffffffc0203574:	00001617          	auipc	a2,0x1
ffffffffc0203578:	fe460613          	addi	a2,a2,-28 # ffffffffc0204558 <etext+0x838>
ffffffffc020357c:	04d00593          	li	a1,77
ffffffffc0203580:	00002517          	auipc	a0,0x2
ffffffffc0203584:	d8850513          	addi	a0,a0,-632 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203588:	b65fc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020358c <default_alloc_pages>:
ffffffffc020358c:	c959                	beqz	a0,ffffffffc0203622 <default_alloc_pages+0x96>
ffffffffc020358e:	0000d597          	auipc	a1,0xd
ffffffffc0203592:	bfa58593          	addi	a1,a1,-1030 # ffffffffc0210188 <free_area>
ffffffffc0203596:	0105a803          	lw	a6,16(a1)
ffffffffc020359a:	862a                	mv	a2,a0
ffffffffc020359c:	02081793          	slli	a5,a6,0x20
ffffffffc02035a0:	9381                	srli	a5,a5,0x20
ffffffffc02035a2:	00a7ee63          	bltu	a5,a0,ffffffffc02035be <default_alloc_pages+0x32>
ffffffffc02035a6:	87ae                	mv	a5,a1
ffffffffc02035a8:	a801                	j	ffffffffc02035b8 <default_alloc_pages+0x2c>
ffffffffc02035aa:	ff87a703          	lw	a4,-8(a5)
ffffffffc02035ae:	02071693          	slli	a3,a4,0x20
ffffffffc02035b2:	9281                	srli	a3,a3,0x20
ffffffffc02035b4:	00c6f763          	bgeu	a3,a2,ffffffffc02035c2 <default_alloc_pages+0x36>
ffffffffc02035b8:	679c                	ld	a5,8(a5)
ffffffffc02035ba:	feb798e3          	bne	a5,a1,ffffffffc02035aa <default_alloc_pages+0x1e>
ffffffffc02035be:	4501                	li	a0,0
ffffffffc02035c0:	8082                	ret
ffffffffc02035c2:	0007b883          	ld	a7,0(a5)
ffffffffc02035c6:	0087b303          	ld	t1,8(a5)
ffffffffc02035ca:	fe078513          	addi	a0,a5,-32
ffffffffc02035ce:	00060e1b          	sext.w	t3,a2
ffffffffc02035d2:	0068b423          	sd	t1,8(a7)
ffffffffc02035d6:	01133023          	sd	a7,0(t1)
ffffffffc02035da:	02d67b63          	bgeu	a2,a3,ffffffffc0203610 <default_alloc_pages+0x84>
ffffffffc02035de:	00361693          	slli	a3,a2,0x3
ffffffffc02035e2:	96b2                	add	a3,a3,a2
ffffffffc02035e4:	068e                	slli	a3,a3,0x3
ffffffffc02035e6:	96aa                	add	a3,a3,a0
ffffffffc02035e8:	41c7073b          	subw	a4,a4,t3
ffffffffc02035ec:	ce98                	sw	a4,24(a3)
ffffffffc02035ee:	00868613          	addi	a2,a3,8
ffffffffc02035f2:	4709                	li	a4,2
ffffffffc02035f4:	40e6302f          	amoor.d	zero,a4,(a2)
ffffffffc02035f8:	0088b703          	ld	a4,8(a7)
ffffffffc02035fc:	02068613          	addi	a2,a3,32
ffffffffc0203600:	0105a803          	lw	a6,16(a1)
ffffffffc0203604:	e310                	sd	a2,0(a4)
ffffffffc0203606:	00c8b423          	sd	a2,8(a7)
ffffffffc020360a:	f698                	sd	a4,40(a3)
ffffffffc020360c:	0316b023          	sd	a7,32(a3)
ffffffffc0203610:	41c8083b          	subw	a6,a6,t3
ffffffffc0203614:	0105a823          	sw	a6,16(a1)
ffffffffc0203618:	5775                	li	a4,-3
ffffffffc020361a:	17a1                	addi	a5,a5,-24
ffffffffc020361c:	60e7b02f          	amoand.d	zero,a4,(a5)
ffffffffc0203620:	8082                	ret
ffffffffc0203622:	1141                	addi	sp,sp,-16
ffffffffc0203624:	00002697          	auipc	a3,0x2
ffffffffc0203628:	ff468693          	addi	a3,a3,-12 # ffffffffc0205618 <etext+0x18f8>
ffffffffc020362c:	00001617          	auipc	a2,0x1
ffffffffc0203630:	f2c60613          	addi	a2,a2,-212 # ffffffffc0204558 <etext+0x838>
ffffffffc0203634:	02f00593          	li	a1,47
ffffffffc0203638:	00002517          	auipc	a0,0x2
ffffffffc020363c:	cd050513          	addi	a0,a0,-816 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203640:	e406                	sd	ra,8(sp)
ffffffffc0203642:	aabfc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0203646 <default_init_memmap>:
ffffffffc0203646:	1141                	addi	sp,sp,-16
ffffffffc0203648:	e406                	sd	ra,8(sp)
ffffffffc020364a:	c5f9                	beqz	a1,ffffffffc0203718 <default_init_memmap+0xd2>
ffffffffc020364c:	00359693          	slli	a3,a1,0x3
ffffffffc0203650:	96ae                	add	a3,a3,a1
ffffffffc0203652:	068e                	slli	a3,a3,0x3
ffffffffc0203654:	96aa                	add	a3,a3,a0
ffffffffc0203656:	87aa                	mv	a5,a0
ffffffffc0203658:	00d50f63          	beq	a0,a3,ffffffffc0203676 <default_init_memmap+0x30>
ffffffffc020365c:	6798                	ld	a4,8(a5)
ffffffffc020365e:	8b05                	andi	a4,a4,1
ffffffffc0203660:	cf49                	beqz	a4,ffffffffc02036fa <default_init_memmap+0xb4>
ffffffffc0203662:	0007ac23          	sw	zero,24(a5)
ffffffffc0203666:	0007b423          	sd	zero,8(a5)
ffffffffc020366a:	0007a023          	sw	zero,0(a5)
ffffffffc020366e:	04878793          	addi	a5,a5,72
ffffffffc0203672:	fed795e3          	bne	a5,a3,ffffffffc020365c <default_init_memmap+0x16>
ffffffffc0203676:	2581                	sext.w	a1,a1
ffffffffc0203678:	cd0c                	sw	a1,24(a0)
ffffffffc020367a:	4789                	li	a5,2
ffffffffc020367c:	00850713          	addi	a4,a0,8
ffffffffc0203680:	40f7302f          	amoor.d	zero,a5,(a4)
ffffffffc0203684:	0000d697          	auipc	a3,0xd
ffffffffc0203688:	b0468693          	addi	a3,a3,-1276 # ffffffffc0210188 <free_area>
ffffffffc020368c:	4a98                	lw	a4,16(a3)
ffffffffc020368e:	669c                	ld	a5,8(a3)
ffffffffc0203690:	02050613          	addi	a2,a0,32
ffffffffc0203694:	9db9                	addw	a1,a1,a4
ffffffffc0203696:	ca8c                	sw	a1,16(a3)
ffffffffc0203698:	04d78a63          	beq	a5,a3,ffffffffc02036ec <default_init_memmap+0xa6>
ffffffffc020369c:	fe078713          	addi	a4,a5,-32
ffffffffc02036a0:	0006b803          	ld	a6,0(a3)
ffffffffc02036a4:	4581                	li	a1,0
ffffffffc02036a6:	00e56a63          	bltu	a0,a4,ffffffffc02036ba <default_init_memmap+0x74>
ffffffffc02036aa:	6798                	ld	a4,8(a5)
ffffffffc02036ac:	02d70263          	beq	a4,a3,ffffffffc02036d0 <default_init_memmap+0x8a>
ffffffffc02036b0:	87ba                	mv	a5,a4
ffffffffc02036b2:	fe078713          	addi	a4,a5,-32
ffffffffc02036b6:	fee57ae3          	bgeu	a0,a4,ffffffffc02036aa <default_init_memmap+0x64>
ffffffffc02036ba:	c199                	beqz	a1,ffffffffc02036c0 <default_init_memmap+0x7a>
ffffffffc02036bc:	0106b023          	sd	a6,0(a3)
ffffffffc02036c0:	6398                	ld	a4,0(a5)
ffffffffc02036c2:	60a2                	ld	ra,8(sp)
ffffffffc02036c4:	e390                	sd	a2,0(a5)
ffffffffc02036c6:	e710                	sd	a2,8(a4)
ffffffffc02036c8:	f51c                	sd	a5,40(a0)
ffffffffc02036ca:	f118                	sd	a4,32(a0)
ffffffffc02036cc:	0141                	addi	sp,sp,16
ffffffffc02036ce:	8082                	ret
ffffffffc02036d0:	e790                	sd	a2,8(a5)
ffffffffc02036d2:	f514                	sd	a3,40(a0)
ffffffffc02036d4:	6798                	ld	a4,8(a5)
ffffffffc02036d6:	f11c                	sd	a5,32(a0)
ffffffffc02036d8:	00d70663          	beq	a4,a3,ffffffffc02036e4 <default_init_memmap+0x9e>
ffffffffc02036dc:	8832                	mv	a6,a2
ffffffffc02036de:	4585                	li	a1,1
ffffffffc02036e0:	87ba                	mv	a5,a4
ffffffffc02036e2:	bfc1                	j	ffffffffc02036b2 <default_init_memmap+0x6c>
ffffffffc02036e4:	60a2                	ld	ra,8(sp)
ffffffffc02036e6:	e290                	sd	a2,0(a3)
ffffffffc02036e8:	0141                	addi	sp,sp,16
ffffffffc02036ea:	8082                	ret
ffffffffc02036ec:	60a2                	ld	ra,8(sp)
ffffffffc02036ee:	e390                	sd	a2,0(a5)
ffffffffc02036f0:	e790                	sd	a2,8(a5)
ffffffffc02036f2:	f51c                	sd	a5,40(a0)
ffffffffc02036f4:	f11c                	sd	a5,32(a0)
ffffffffc02036f6:	0141                	addi	sp,sp,16
ffffffffc02036f8:	8082                	ret
ffffffffc02036fa:	00002697          	auipc	a3,0x2
ffffffffc02036fe:	f4e68693          	addi	a3,a3,-178 # ffffffffc0205648 <etext+0x1928>
ffffffffc0203702:	00001617          	auipc	a2,0x1
ffffffffc0203706:	e5660613          	addi	a2,a2,-426 # ffffffffc0204558 <etext+0x838>
ffffffffc020370a:	45d9                	li	a1,22
ffffffffc020370c:	00002517          	auipc	a0,0x2
ffffffffc0203710:	bfc50513          	addi	a0,a0,-1028 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203714:	9d9fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203718:	00002697          	auipc	a3,0x2
ffffffffc020371c:	f0068693          	addi	a3,a3,-256 # ffffffffc0205618 <etext+0x18f8>
ffffffffc0203720:	00001617          	auipc	a2,0x1
ffffffffc0203724:	e3860613          	addi	a2,a2,-456 # ffffffffc0204558 <etext+0x838>
ffffffffc0203728:	45cd                	li	a1,19
ffffffffc020372a:	00002517          	auipc	a0,0x2
ffffffffc020372e:	bde50513          	addi	a0,a0,-1058 # ffffffffc0205308 <etext+0x15e8>
ffffffffc0203732:	9bbfc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0203736 <swapfs_init>:
ffffffffc0203736:	1141                	addi	sp,sp,-16
ffffffffc0203738:	4505                	li	a0,1
ffffffffc020373a:	e406                	sd	ra,8(sp)
ffffffffc020373c:	a11fc0ef          	jal	ra,ffffffffc020014c <ide_device_valid>
ffffffffc0203740:	cd01                	beqz	a0,ffffffffc0203758 <swapfs_init+0x22>
ffffffffc0203742:	4505                	li	a0,1
ffffffffc0203744:	a0ffc0ef          	jal	ra,ffffffffc0200152 <ide_device_size>
ffffffffc0203748:	60a2                	ld	ra,8(sp)
ffffffffc020374a:	810d                	srli	a0,a0,0x3
ffffffffc020374c:	0000d797          	auipc	a5,0xd
ffffffffc0203750:	9ea7b223          	sd	a0,-1564(a5) # ffffffffc0210130 <max_swap_offset>
ffffffffc0203754:	0141                	addi	sp,sp,16
ffffffffc0203756:	8082                	ret
ffffffffc0203758:	00002617          	auipc	a2,0x2
ffffffffc020375c:	f5060613          	addi	a2,a2,-176 # ffffffffc02056a8 <default_pmm_manager+0x38>
ffffffffc0203760:	45b5                	li	a1,13
ffffffffc0203762:	00002517          	auipc	a0,0x2
ffffffffc0203766:	f6650513          	addi	a0,a0,-154 # ffffffffc02056c8 <default_pmm_manager+0x58>
ffffffffc020376a:	983fc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc020376e <swapfs_read>:
ffffffffc020376e:	1141                	addi	sp,sp,-16
ffffffffc0203770:	e406                	sd	ra,8(sp)
ffffffffc0203772:	00855793          	srli	a5,a0,0x8
ffffffffc0203776:	c3a5                	beqz	a5,ffffffffc02037d6 <swapfs_read+0x68>
ffffffffc0203778:	0000d717          	auipc	a4,0xd
ffffffffc020377c:	9b873703          	ld	a4,-1608(a4) # ffffffffc0210130 <max_swap_offset>
ffffffffc0203780:	04e7fb63          	bgeu	a5,a4,ffffffffc02037d6 <swapfs_read+0x68>
ffffffffc0203784:	0000d617          	auipc	a2,0xd
ffffffffc0203788:	91463603          	ld	a2,-1772(a2) # ffffffffc0210098 <pages>
ffffffffc020378c:	8d91                	sub	a1,a1,a2
ffffffffc020378e:	4035d613          	srai	a2,a1,0x3
ffffffffc0203792:	00002597          	auipc	a1,0x2
ffffffffc0203796:	1b65b583          	ld	a1,438(a1) # ffffffffc0205948 <error_string+0x38>
ffffffffc020379a:	02b60633          	mul	a2,a2,a1
ffffffffc020379e:	0037959b          	slliw	a1,a5,0x3
ffffffffc02037a2:	00002797          	auipc	a5,0x2
ffffffffc02037a6:	1ae7b783          	ld	a5,430(a5) # ffffffffc0205950 <nbase>
ffffffffc02037aa:	0000d717          	auipc	a4,0xd
ffffffffc02037ae:	8ae73703          	ld	a4,-1874(a4) # ffffffffc0210058 <npage>
ffffffffc02037b2:	963e                	add	a2,a2,a5
ffffffffc02037b4:	00c61793          	slli	a5,a2,0xc
ffffffffc02037b8:	83b1                	srli	a5,a5,0xc
ffffffffc02037ba:	0632                	slli	a2,a2,0xc
ffffffffc02037bc:	02e7f963          	bgeu	a5,a4,ffffffffc02037ee <swapfs_read+0x80>
ffffffffc02037c0:	60a2                	ld	ra,8(sp)
ffffffffc02037c2:	0000d797          	auipc	a5,0xd
ffffffffc02037c6:	8ce7b783          	ld	a5,-1842(a5) # ffffffffc0210090 <va_pa_offset>
ffffffffc02037ca:	46a1                	li	a3,8
ffffffffc02037cc:	963e                	add	a2,a2,a5
ffffffffc02037ce:	4505                	li	a0,1
ffffffffc02037d0:	0141                	addi	sp,sp,16
ffffffffc02037d2:	987fc06f          	j	ffffffffc0200158 <ide_read_secs>
ffffffffc02037d6:	86aa                	mv	a3,a0
ffffffffc02037d8:	00002617          	auipc	a2,0x2
ffffffffc02037dc:	f0860613          	addi	a2,a2,-248 # ffffffffc02056e0 <default_pmm_manager+0x70>
ffffffffc02037e0:	45d1                	li	a1,20
ffffffffc02037e2:	00002517          	auipc	a0,0x2
ffffffffc02037e6:	ee650513          	addi	a0,a0,-282 # ffffffffc02056c8 <default_pmm_manager+0x58>
ffffffffc02037ea:	903fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc02037ee:	86b2                	mv	a3,a2
ffffffffc02037f0:	06a00593          	li	a1,106
ffffffffc02037f4:	00001617          	auipc	a2,0x1
ffffffffc02037f8:	c3c60613          	addi	a2,a2,-964 # ffffffffc0204430 <etext+0x710>
ffffffffc02037fc:	00001517          	auipc	a0,0x1
ffffffffc0203800:	c2450513          	addi	a0,a0,-988 # ffffffffc0204420 <etext+0x700>
ffffffffc0203804:	8e9fc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc0203808 <swapfs_write>:
ffffffffc0203808:	1141                	addi	sp,sp,-16
ffffffffc020380a:	e406                	sd	ra,8(sp)
ffffffffc020380c:	00855793          	srli	a5,a0,0x8
ffffffffc0203810:	c3a5                	beqz	a5,ffffffffc0203870 <swapfs_write+0x68>
ffffffffc0203812:	0000d717          	auipc	a4,0xd
ffffffffc0203816:	91e73703          	ld	a4,-1762(a4) # ffffffffc0210130 <max_swap_offset>
ffffffffc020381a:	04e7fb63          	bgeu	a5,a4,ffffffffc0203870 <swapfs_write+0x68>
ffffffffc020381e:	0000d617          	auipc	a2,0xd
ffffffffc0203822:	87a63603          	ld	a2,-1926(a2) # ffffffffc0210098 <pages>
ffffffffc0203826:	8d91                	sub	a1,a1,a2
ffffffffc0203828:	4035d613          	srai	a2,a1,0x3
ffffffffc020382c:	00002597          	auipc	a1,0x2
ffffffffc0203830:	11c5b583          	ld	a1,284(a1) # ffffffffc0205948 <error_string+0x38>
ffffffffc0203834:	02b60633          	mul	a2,a2,a1
ffffffffc0203838:	0037959b          	slliw	a1,a5,0x3
ffffffffc020383c:	00002797          	auipc	a5,0x2
ffffffffc0203840:	1147b783          	ld	a5,276(a5) # ffffffffc0205950 <nbase>
ffffffffc0203844:	0000d717          	auipc	a4,0xd
ffffffffc0203848:	81473703          	ld	a4,-2028(a4) # ffffffffc0210058 <npage>
ffffffffc020384c:	963e                	add	a2,a2,a5
ffffffffc020384e:	00c61793          	slli	a5,a2,0xc
ffffffffc0203852:	83b1                	srli	a5,a5,0xc
ffffffffc0203854:	0632                	slli	a2,a2,0xc
ffffffffc0203856:	02e7f963          	bgeu	a5,a4,ffffffffc0203888 <swapfs_write+0x80>
ffffffffc020385a:	60a2                	ld	ra,8(sp)
ffffffffc020385c:	0000d797          	auipc	a5,0xd
ffffffffc0203860:	8347b783          	ld	a5,-1996(a5) # ffffffffc0210090 <va_pa_offset>
ffffffffc0203864:	46a1                	li	a3,8
ffffffffc0203866:	963e                	add	a2,a2,a5
ffffffffc0203868:	4505                	li	a0,1
ffffffffc020386a:	0141                	addi	sp,sp,16
ffffffffc020386c:	911fc06f          	j	ffffffffc020017c <ide_write_secs>
ffffffffc0203870:	86aa                	mv	a3,a0
ffffffffc0203872:	00002617          	auipc	a2,0x2
ffffffffc0203876:	e6e60613          	addi	a2,a2,-402 # ffffffffc02056e0 <default_pmm_manager+0x70>
ffffffffc020387a:	45e5                	li	a1,25
ffffffffc020387c:	00002517          	auipc	a0,0x2
ffffffffc0203880:	e4c50513          	addi	a0,a0,-436 # ffffffffc02056c8 <default_pmm_manager+0x58>
ffffffffc0203884:	869fc0ef          	jal	ra,ffffffffc02000ec <__panic>
ffffffffc0203888:	86b2                	mv	a3,a2
ffffffffc020388a:	06a00593          	li	a1,106
ffffffffc020388e:	00001617          	auipc	a2,0x1
ffffffffc0203892:	ba260613          	addi	a2,a2,-1118 # ffffffffc0204430 <etext+0x710>
ffffffffc0203896:	00001517          	auipc	a0,0x1
ffffffffc020389a:	b8a50513          	addi	a0,a0,-1142 # ffffffffc0204420 <etext+0x700>
ffffffffc020389e:	84ffc0ef          	jal	ra,ffffffffc02000ec <__panic>

ffffffffc02038a2 <strlen>:
ffffffffc02038a2:	00054783          	lbu	a5,0(a0)
ffffffffc02038a6:	872a                	mv	a4,a0
ffffffffc02038a8:	4501                	li	a0,0
ffffffffc02038aa:	cb81                	beqz	a5,ffffffffc02038ba <strlen+0x18>
ffffffffc02038ac:	0505                	addi	a0,a0,1
ffffffffc02038ae:	00a707b3          	add	a5,a4,a0
ffffffffc02038b2:	0007c783          	lbu	a5,0(a5)
ffffffffc02038b6:	fbfd                	bnez	a5,ffffffffc02038ac <strlen+0xa>
ffffffffc02038b8:	8082                	ret
ffffffffc02038ba:	8082                	ret

ffffffffc02038bc <strnlen>:
ffffffffc02038bc:	872a                	mv	a4,a0
ffffffffc02038be:	4501                	li	a0,0
ffffffffc02038c0:	e589                	bnez	a1,ffffffffc02038ca <strnlen+0xe>
ffffffffc02038c2:	a811                	j	ffffffffc02038d6 <strnlen+0x1a>
ffffffffc02038c4:	0505                	addi	a0,a0,1
ffffffffc02038c6:	00a58763          	beq	a1,a0,ffffffffc02038d4 <strnlen+0x18>
ffffffffc02038ca:	00a707b3          	add	a5,a4,a0
ffffffffc02038ce:	0007c783          	lbu	a5,0(a5)
ffffffffc02038d2:	fbed                	bnez	a5,ffffffffc02038c4 <strnlen+0x8>
ffffffffc02038d4:	8082                	ret
ffffffffc02038d6:	8082                	ret

ffffffffc02038d8 <strcpy>:
ffffffffc02038d8:	87aa                	mv	a5,a0
ffffffffc02038da:	0005c703          	lbu	a4,0(a1)
ffffffffc02038de:	0785                	addi	a5,a5,1
ffffffffc02038e0:	0585                	addi	a1,a1,1
ffffffffc02038e2:	fee78fa3          	sb	a4,-1(a5)
ffffffffc02038e6:	fb75                	bnez	a4,ffffffffc02038da <strcpy+0x2>
ffffffffc02038e8:	8082                	ret

ffffffffc02038ea <strcmp>:
ffffffffc02038ea:	00054783          	lbu	a5,0(a0)
ffffffffc02038ee:	0005c703          	lbu	a4,0(a1)
ffffffffc02038f2:	cb89                	beqz	a5,ffffffffc0203904 <strcmp+0x1a>
ffffffffc02038f4:	0505                	addi	a0,a0,1
ffffffffc02038f6:	0585                	addi	a1,a1,1
ffffffffc02038f8:	fee789e3          	beq	a5,a4,ffffffffc02038ea <strcmp>
ffffffffc02038fc:	0007851b          	sext.w	a0,a5
ffffffffc0203900:	9d19                	subw	a0,a0,a4
ffffffffc0203902:	8082                	ret
ffffffffc0203904:	4501                	li	a0,0
ffffffffc0203906:	bfed                	j	ffffffffc0203900 <strcmp+0x16>

ffffffffc0203908 <memset>:
ffffffffc0203908:	ca01                	beqz	a2,ffffffffc0203918 <memset+0x10>
ffffffffc020390a:	962a                	add	a2,a2,a0
ffffffffc020390c:	87aa                	mv	a5,a0
ffffffffc020390e:	0785                	addi	a5,a5,1
ffffffffc0203910:	feb78fa3          	sb	a1,-1(a5)
ffffffffc0203914:	fec79de3          	bne	a5,a2,ffffffffc020390e <memset+0x6>
ffffffffc0203918:	8082                	ret

ffffffffc020391a <memcpy>:
ffffffffc020391a:	ca19                	beqz	a2,ffffffffc0203930 <memcpy+0x16>
ffffffffc020391c:	962e                	add	a2,a2,a1
ffffffffc020391e:	87aa                	mv	a5,a0
ffffffffc0203920:	0005c703          	lbu	a4,0(a1)
ffffffffc0203924:	0585                	addi	a1,a1,1
ffffffffc0203926:	0785                	addi	a5,a5,1
ffffffffc0203928:	fee78fa3          	sb	a4,-1(a5)
ffffffffc020392c:	fec59ae3          	bne	a1,a2,ffffffffc0203920 <memcpy+0x6>
ffffffffc0203930:	8082                	ret

ffffffffc0203932 <printnum>:
ffffffffc0203932:	02069813          	slli	a6,a3,0x20
ffffffffc0203936:	7179                	addi	sp,sp,-48
ffffffffc0203938:	02085813          	srli	a6,a6,0x20
ffffffffc020393c:	e052                	sd	s4,0(sp)
ffffffffc020393e:	03067a33          	remu	s4,a2,a6
ffffffffc0203942:	f022                	sd	s0,32(sp)
ffffffffc0203944:	ec26                	sd	s1,24(sp)
ffffffffc0203946:	e84a                	sd	s2,16(sp)
ffffffffc0203948:	f406                	sd	ra,40(sp)
ffffffffc020394a:	e44e                	sd	s3,8(sp)
ffffffffc020394c:	84aa                	mv	s1,a0
ffffffffc020394e:	892e                	mv	s2,a1
ffffffffc0203950:	fff7041b          	addiw	s0,a4,-1
ffffffffc0203954:	2a01                	sext.w	s4,s4
ffffffffc0203956:	03067e63          	bgeu	a2,a6,ffffffffc0203992 <printnum+0x60>
ffffffffc020395a:	89be                	mv	s3,a5
ffffffffc020395c:	00805763          	blez	s0,ffffffffc020396a <printnum+0x38>
ffffffffc0203960:	347d                	addiw	s0,s0,-1
ffffffffc0203962:	85ca                	mv	a1,s2
ffffffffc0203964:	854e                	mv	a0,s3
ffffffffc0203966:	9482                	jalr	s1
ffffffffc0203968:	fc65                	bnez	s0,ffffffffc0203960 <printnum+0x2e>
ffffffffc020396a:	1a02                	slli	s4,s4,0x20
ffffffffc020396c:	020a5a13          	srli	s4,s4,0x20
ffffffffc0203970:	00002797          	auipc	a5,0x2
ffffffffc0203974:	d9078793          	addi	a5,a5,-624 # ffffffffc0205700 <default_pmm_manager+0x90>
ffffffffc0203978:	7402                	ld	s0,32(sp)
ffffffffc020397a:	9a3e                	add	s4,s4,a5
ffffffffc020397c:	000a4503          	lbu	a0,0(s4)
ffffffffc0203980:	70a2                	ld	ra,40(sp)
ffffffffc0203982:	69a2                	ld	s3,8(sp)
ffffffffc0203984:	6a02                	ld	s4,0(sp)
ffffffffc0203986:	85ca                	mv	a1,s2
ffffffffc0203988:	8326                	mv	t1,s1
ffffffffc020398a:	6942                	ld	s2,16(sp)
ffffffffc020398c:	64e2                	ld	s1,24(sp)
ffffffffc020398e:	6145                	addi	sp,sp,48
ffffffffc0203990:	8302                	jr	t1
ffffffffc0203992:	03065633          	divu	a2,a2,a6
ffffffffc0203996:	8722                	mv	a4,s0
ffffffffc0203998:	f9bff0ef          	jal	ra,ffffffffc0203932 <printnum>
ffffffffc020399c:	b7f9                	j	ffffffffc020396a <printnum+0x38>

ffffffffc020399e <vprintfmt>:
ffffffffc020399e:	7119                	addi	sp,sp,-128
ffffffffc02039a0:	f4a6                	sd	s1,104(sp)
ffffffffc02039a2:	f0ca                	sd	s2,96(sp)
ffffffffc02039a4:	ecce                	sd	s3,88(sp)
ffffffffc02039a6:	e8d2                	sd	s4,80(sp)
ffffffffc02039a8:	e4d6                	sd	s5,72(sp)
ffffffffc02039aa:	e0da                	sd	s6,64(sp)
ffffffffc02039ac:	fc5e                	sd	s7,56(sp)
ffffffffc02039ae:	f06a                	sd	s10,32(sp)
ffffffffc02039b0:	fc86                	sd	ra,120(sp)
ffffffffc02039b2:	f8a2                	sd	s0,112(sp)
ffffffffc02039b4:	f862                	sd	s8,48(sp)
ffffffffc02039b6:	f466                	sd	s9,40(sp)
ffffffffc02039b8:	ec6e                	sd	s11,24(sp)
ffffffffc02039ba:	892a                	mv	s2,a0
ffffffffc02039bc:	84ae                	mv	s1,a1
ffffffffc02039be:	8d32                	mv	s10,a2
ffffffffc02039c0:	8a36                	mv	s4,a3
ffffffffc02039c2:	02500993          	li	s3,37
ffffffffc02039c6:	5b7d                	li	s6,-1
ffffffffc02039c8:	00002a97          	auipc	s5,0x2
ffffffffc02039cc:	d6ca8a93          	addi	s5,s5,-660 # ffffffffc0205734 <default_pmm_manager+0xc4>
ffffffffc02039d0:	00002b97          	auipc	s7,0x2
ffffffffc02039d4:	f40b8b93          	addi	s7,s7,-192 # ffffffffc0205910 <error_string>
ffffffffc02039d8:	000d4503          	lbu	a0,0(s10)
ffffffffc02039dc:	001d0413          	addi	s0,s10,1
ffffffffc02039e0:	01350a63          	beq	a0,s3,ffffffffc02039f4 <vprintfmt+0x56>
ffffffffc02039e4:	c121                	beqz	a0,ffffffffc0203a24 <vprintfmt+0x86>
ffffffffc02039e6:	85a6                	mv	a1,s1
ffffffffc02039e8:	0405                	addi	s0,s0,1
ffffffffc02039ea:	9902                	jalr	s2
ffffffffc02039ec:	fff44503          	lbu	a0,-1(s0)
ffffffffc02039f0:	ff351ae3          	bne	a0,s3,ffffffffc02039e4 <vprintfmt+0x46>
ffffffffc02039f4:	00044603          	lbu	a2,0(s0)
ffffffffc02039f8:	02000793          	li	a5,32
ffffffffc02039fc:	4c81                	li	s9,0
ffffffffc02039fe:	4881                	li	a7,0
ffffffffc0203a00:	5c7d                	li	s8,-1
ffffffffc0203a02:	5dfd                	li	s11,-1
ffffffffc0203a04:	05500513          	li	a0,85
ffffffffc0203a08:	4825                	li	a6,9
ffffffffc0203a0a:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0203a0e:	0ff5f593          	andi	a1,a1,255
ffffffffc0203a12:	00140d13          	addi	s10,s0,1
ffffffffc0203a16:	04b56263          	bltu	a0,a1,ffffffffc0203a5a <vprintfmt+0xbc>
ffffffffc0203a1a:	058a                	slli	a1,a1,0x2
ffffffffc0203a1c:	95d6                	add	a1,a1,s5
ffffffffc0203a1e:	4194                	lw	a3,0(a1)
ffffffffc0203a20:	96d6                	add	a3,a3,s5
ffffffffc0203a22:	8682                	jr	a3
ffffffffc0203a24:	70e6                	ld	ra,120(sp)
ffffffffc0203a26:	7446                	ld	s0,112(sp)
ffffffffc0203a28:	74a6                	ld	s1,104(sp)
ffffffffc0203a2a:	7906                	ld	s2,96(sp)
ffffffffc0203a2c:	69e6                	ld	s3,88(sp)
ffffffffc0203a2e:	6a46                	ld	s4,80(sp)
ffffffffc0203a30:	6aa6                	ld	s5,72(sp)
ffffffffc0203a32:	6b06                	ld	s6,64(sp)
ffffffffc0203a34:	7be2                	ld	s7,56(sp)
ffffffffc0203a36:	7c42                	ld	s8,48(sp)
ffffffffc0203a38:	7ca2                	ld	s9,40(sp)
ffffffffc0203a3a:	7d02                	ld	s10,32(sp)
ffffffffc0203a3c:	6de2                	ld	s11,24(sp)
ffffffffc0203a3e:	6109                	addi	sp,sp,128
ffffffffc0203a40:	8082                	ret
ffffffffc0203a42:	87b2                	mv	a5,a2
ffffffffc0203a44:	00144603          	lbu	a2,1(s0)
ffffffffc0203a48:	846a                	mv	s0,s10
ffffffffc0203a4a:	00140d13          	addi	s10,s0,1
ffffffffc0203a4e:	fdd6059b          	addiw	a1,a2,-35
ffffffffc0203a52:	0ff5f593          	andi	a1,a1,255
ffffffffc0203a56:	fcb572e3          	bgeu	a0,a1,ffffffffc0203a1a <vprintfmt+0x7c>
ffffffffc0203a5a:	85a6                	mv	a1,s1
ffffffffc0203a5c:	02500513          	li	a0,37
ffffffffc0203a60:	9902                	jalr	s2
ffffffffc0203a62:	fff44783          	lbu	a5,-1(s0)
ffffffffc0203a66:	8d22                	mv	s10,s0
ffffffffc0203a68:	f73788e3          	beq	a5,s3,ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203a6c:	ffed4783          	lbu	a5,-2(s10)
ffffffffc0203a70:	1d7d                	addi	s10,s10,-1
ffffffffc0203a72:	ff379de3          	bne	a5,s3,ffffffffc0203a6c <vprintfmt+0xce>
ffffffffc0203a76:	b78d                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203a78:	fd060c1b          	addiw	s8,a2,-48
ffffffffc0203a7c:	00144603          	lbu	a2,1(s0)
ffffffffc0203a80:	846a                	mv	s0,s10
ffffffffc0203a82:	fd06069b          	addiw	a3,a2,-48
ffffffffc0203a86:	0006059b          	sext.w	a1,a2
ffffffffc0203a8a:	02d86463          	bltu	a6,a3,ffffffffc0203ab2 <vprintfmt+0x114>
ffffffffc0203a8e:	00144603          	lbu	a2,1(s0)
ffffffffc0203a92:	002c169b          	slliw	a3,s8,0x2
ffffffffc0203a96:	0186873b          	addw	a4,a3,s8
ffffffffc0203a9a:	0017171b          	slliw	a4,a4,0x1
ffffffffc0203a9e:	9f2d                	addw	a4,a4,a1
ffffffffc0203aa0:	fd06069b          	addiw	a3,a2,-48
ffffffffc0203aa4:	0405                	addi	s0,s0,1
ffffffffc0203aa6:	fd070c1b          	addiw	s8,a4,-48
ffffffffc0203aaa:	0006059b          	sext.w	a1,a2
ffffffffc0203aae:	fed870e3          	bgeu	a6,a3,ffffffffc0203a8e <vprintfmt+0xf0>
ffffffffc0203ab2:	f40ddce3          	bgez	s11,ffffffffc0203a0a <vprintfmt+0x6c>
ffffffffc0203ab6:	8de2                	mv	s11,s8
ffffffffc0203ab8:	5c7d                	li	s8,-1
ffffffffc0203aba:	bf81                	j	ffffffffc0203a0a <vprintfmt+0x6c>
ffffffffc0203abc:	fffdc693          	not	a3,s11
ffffffffc0203ac0:	96fd                	srai	a3,a3,0x3f
ffffffffc0203ac2:	00ddfdb3          	and	s11,s11,a3
ffffffffc0203ac6:	00144603          	lbu	a2,1(s0)
ffffffffc0203aca:	2d81                	sext.w	s11,s11
ffffffffc0203acc:	846a                	mv	s0,s10
ffffffffc0203ace:	bf35                	j	ffffffffc0203a0a <vprintfmt+0x6c>
ffffffffc0203ad0:	000a2c03          	lw	s8,0(s4)
ffffffffc0203ad4:	00144603          	lbu	a2,1(s0)
ffffffffc0203ad8:	0a21                	addi	s4,s4,8
ffffffffc0203ada:	846a                	mv	s0,s10
ffffffffc0203adc:	bfd9                	j	ffffffffc0203ab2 <vprintfmt+0x114>
ffffffffc0203ade:	4705                	li	a4,1
ffffffffc0203ae0:	008a0593          	addi	a1,s4,8
ffffffffc0203ae4:	01174463          	blt	a4,a7,ffffffffc0203aec <vprintfmt+0x14e>
ffffffffc0203ae8:	1a088e63          	beqz	a7,ffffffffc0203ca4 <vprintfmt+0x306>
ffffffffc0203aec:	000a3603          	ld	a2,0(s4)
ffffffffc0203af0:	46c1                	li	a3,16
ffffffffc0203af2:	8a2e                	mv	s4,a1
ffffffffc0203af4:	2781                	sext.w	a5,a5
ffffffffc0203af6:	876e                	mv	a4,s11
ffffffffc0203af8:	85a6                	mv	a1,s1
ffffffffc0203afa:	854a                	mv	a0,s2
ffffffffc0203afc:	e37ff0ef          	jal	ra,ffffffffc0203932 <printnum>
ffffffffc0203b00:	bde1                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203b02:	000a2503          	lw	a0,0(s4)
ffffffffc0203b06:	85a6                	mv	a1,s1
ffffffffc0203b08:	0a21                	addi	s4,s4,8
ffffffffc0203b0a:	9902                	jalr	s2
ffffffffc0203b0c:	b5f1                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203b0e:	4705                	li	a4,1
ffffffffc0203b10:	008a0593          	addi	a1,s4,8
ffffffffc0203b14:	01174463          	blt	a4,a7,ffffffffc0203b1c <vprintfmt+0x17e>
ffffffffc0203b18:	18088163          	beqz	a7,ffffffffc0203c9a <vprintfmt+0x2fc>
ffffffffc0203b1c:	000a3603          	ld	a2,0(s4)
ffffffffc0203b20:	46a9                	li	a3,10
ffffffffc0203b22:	8a2e                	mv	s4,a1
ffffffffc0203b24:	bfc1                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203b26:	00144603          	lbu	a2,1(s0)
ffffffffc0203b2a:	4c85                	li	s9,1
ffffffffc0203b2c:	846a                	mv	s0,s10
ffffffffc0203b2e:	bdf1                	j	ffffffffc0203a0a <vprintfmt+0x6c>
ffffffffc0203b30:	85a6                	mv	a1,s1
ffffffffc0203b32:	02500513          	li	a0,37
ffffffffc0203b36:	9902                	jalr	s2
ffffffffc0203b38:	b545                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203b3a:	00144603          	lbu	a2,1(s0)
ffffffffc0203b3e:	2885                	addiw	a7,a7,1
ffffffffc0203b40:	846a                	mv	s0,s10
ffffffffc0203b42:	b5e1                	j	ffffffffc0203a0a <vprintfmt+0x6c>
ffffffffc0203b44:	4705                	li	a4,1
ffffffffc0203b46:	008a0593          	addi	a1,s4,8
ffffffffc0203b4a:	01174463          	blt	a4,a7,ffffffffc0203b52 <vprintfmt+0x1b4>
ffffffffc0203b4e:	14088163          	beqz	a7,ffffffffc0203c90 <vprintfmt+0x2f2>
ffffffffc0203b52:	000a3603          	ld	a2,0(s4)
ffffffffc0203b56:	46a1                	li	a3,8
ffffffffc0203b58:	8a2e                	mv	s4,a1
ffffffffc0203b5a:	bf69                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203b5c:	03000513          	li	a0,48
ffffffffc0203b60:	85a6                	mv	a1,s1
ffffffffc0203b62:	e03e                	sd	a5,0(sp)
ffffffffc0203b64:	9902                	jalr	s2
ffffffffc0203b66:	85a6                	mv	a1,s1
ffffffffc0203b68:	07800513          	li	a0,120
ffffffffc0203b6c:	9902                	jalr	s2
ffffffffc0203b6e:	0a21                	addi	s4,s4,8
ffffffffc0203b70:	6782                	ld	a5,0(sp)
ffffffffc0203b72:	46c1                	li	a3,16
ffffffffc0203b74:	ff8a3603          	ld	a2,-8(s4)
ffffffffc0203b78:	bfb5                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203b7a:	000a3403          	ld	s0,0(s4)
ffffffffc0203b7e:	008a0713          	addi	a4,s4,8
ffffffffc0203b82:	e03a                	sd	a4,0(sp)
ffffffffc0203b84:	14040263          	beqz	s0,ffffffffc0203cc8 <vprintfmt+0x32a>
ffffffffc0203b88:	0fb05763          	blez	s11,ffffffffc0203c76 <vprintfmt+0x2d8>
ffffffffc0203b8c:	02d00693          	li	a3,45
ffffffffc0203b90:	0cd79163          	bne	a5,a3,ffffffffc0203c52 <vprintfmt+0x2b4>
ffffffffc0203b94:	00044783          	lbu	a5,0(s0)
ffffffffc0203b98:	0007851b          	sext.w	a0,a5
ffffffffc0203b9c:	cf85                	beqz	a5,ffffffffc0203bd4 <vprintfmt+0x236>
ffffffffc0203b9e:	00140a13          	addi	s4,s0,1
ffffffffc0203ba2:	05e00413          	li	s0,94
ffffffffc0203ba6:	000c4563          	bltz	s8,ffffffffc0203bb0 <vprintfmt+0x212>
ffffffffc0203baa:	3c7d                	addiw	s8,s8,-1
ffffffffc0203bac:	036c0263          	beq	s8,s6,ffffffffc0203bd0 <vprintfmt+0x232>
ffffffffc0203bb0:	85a6                	mv	a1,s1
ffffffffc0203bb2:	0e0c8e63          	beqz	s9,ffffffffc0203cae <vprintfmt+0x310>
ffffffffc0203bb6:	3781                	addiw	a5,a5,-32
ffffffffc0203bb8:	0ef47b63          	bgeu	s0,a5,ffffffffc0203cae <vprintfmt+0x310>
ffffffffc0203bbc:	03f00513          	li	a0,63
ffffffffc0203bc0:	9902                	jalr	s2
ffffffffc0203bc2:	000a4783          	lbu	a5,0(s4)
ffffffffc0203bc6:	3dfd                	addiw	s11,s11,-1
ffffffffc0203bc8:	0a05                	addi	s4,s4,1
ffffffffc0203bca:	0007851b          	sext.w	a0,a5
ffffffffc0203bce:	ffe1                	bnez	a5,ffffffffc0203ba6 <vprintfmt+0x208>
ffffffffc0203bd0:	01b05963          	blez	s11,ffffffffc0203be2 <vprintfmt+0x244>
ffffffffc0203bd4:	3dfd                	addiw	s11,s11,-1
ffffffffc0203bd6:	85a6                	mv	a1,s1
ffffffffc0203bd8:	02000513          	li	a0,32
ffffffffc0203bdc:	9902                	jalr	s2
ffffffffc0203bde:	fe0d9be3          	bnez	s11,ffffffffc0203bd4 <vprintfmt+0x236>
ffffffffc0203be2:	6a02                	ld	s4,0(sp)
ffffffffc0203be4:	bbd5                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203be6:	4705                	li	a4,1
ffffffffc0203be8:	008a0c93          	addi	s9,s4,8
ffffffffc0203bec:	01174463          	blt	a4,a7,ffffffffc0203bf4 <vprintfmt+0x256>
ffffffffc0203bf0:	08088d63          	beqz	a7,ffffffffc0203c8a <vprintfmt+0x2ec>
ffffffffc0203bf4:	000a3403          	ld	s0,0(s4)
ffffffffc0203bf8:	0a044d63          	bltz	s0,ffffffffc0203cb2 <vprintfmt+0x314>
ffffffffc0203bfc:	8622                	mv	a2,s0
ffffffffc0203bfe:	8a66                	mv	s4,s9
ffffffffc0203c00:	46a9                	li	a3,10
ffffffffc0203c02:	bdcd                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203c04:	000a2783          	lw	a5,0(s4)
ffffffffc0203c08:	4719                	li	a4,6
ffffffffc0203c0a:	0a21                	addi	s4,s4,8
ffffffffc0203c0c:	41f7d69b          	sraiw	a3,a5,0x1f
ffffffffc0203c10:	8fb5                	xor	a5,a5,a3
ffffffffc0203c12:	40d786bb          	subw	a3,a5,a3
ffffffffc0203c16:	02d74163          	blt	a4,a3,ffffffffc0203c38 <vprintfmt+0x29a>
ffffffffc0203c1a:	00369793          	slli	a5,a3,0x3
ffffffffc0203c1e:	97de                	add	a5,a5,s7
ffffffffc0203c20:	639c                	ld	a5,0(a5)
ffffffffc0203c22:	cb99                	beqz	a5,ffffffffc0203c38 <vprintfmt+0x29a>
ffffffffc0203c24:	86be                	mv	a3,a5
ffffffffc0203c26:	00002617          	auipc	a2,0x2
ffffffffc0203c2a:	b0a60613          	addi	a2,a2,-1270 # ffffffffc0205730 <default_pmm_manager+0xc0>
ffffffffc0203c2e:	85a6                	mv	a1,s1
ffffffffc0203c30:	854a                	mv	a0,s2
ffffffffc0203c32:	0ce000ef          	jal	ra,ffffffffc0203d00 <printfmt>
ffffffffc0203c36:	b34d                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203c38:	00002617          	auipc	a2,0x2
ffffffffc0203c3c:	ae860613          	addi	a2,a2,-1304 # ffffffffc0205720 <default_pmm_manager+0xb0>
ffffffffc0203c40:	85a6                	mv	a1,s1
ffffffffc0203c42:	854a                	mv	a0,s2
ffffffffc0203c44:	0bc000ef          	jal	ra,ffffffffc0203d00 <printfmt>
ffffffffc0203c48:	bb41                	j	ffffffffc02039d8 <vprintfmt+0x3a>
ffffffffc0203c4a:	00002417          	auipc	s0,0x2
ffffffffc0203c4e:	ace40413          	addi	s0,s0,-1330 # ffffffffc0205718 <default_pmm_manager+0xa8>
ffffffffc0203c52:	85e2                	mv	a1,s8
ffffffffc0203c54:	8522                	mv	a0,s0
ffffffffc0203c56:	e43e                	sd	a5,8(sp)
ffffffffc0203c58:	c65ff0ef          	jal	ra,ffffffffc02038bc <strnlen>
ffffffffc0203c5c:	40ad8dbb          	subw	s11,s11,a0
ffffffffc0203c60:	01b05b63          	blez	s11,ffffffffc0203c76 <vprintfmt+0x2d8>
ffffffffc0203c64:	67a2                	ld	a5,8(sp)
ffffffffc0203c66:	00078a1b          	sext.w	s4,a5
ffffffffc0203c6a:	3dfd                	addiw	s11,s11,-1
ffffffffc0203c6c:	85a6                	mv	a1,s1
ffffffffc0203c6e:	8552                	mv	a0,s4
ffffffffc0203c70:	9902                	jalr	s2
ffffffffc0203c72:	fe0d9ce3          	bnez	s11,ffffffffc0203c6a <vprintfmt+0x2cc>
ffffffffc0203c76:	00044783          	lbu	a5,0(s0)
ffffffffc0203c7a:	00140a13          	addi	s4,s0,1
ffffffffc0203c7e:	0007851b          	sext.w	a0,a5
ffffffffc0203c82:	d3a5                	beqz	a5,ffffffffc0203be2 <vprintfmt+0x244>
ffffffffc0203c84:	05e00413          	li	s0,94
ffffffffc0203c88:	bf39                	j	ffffffffc0203ba6 <vprintfmt+0x208>
ffffffffc0203c8a:	000a2403          	lw	s0,0(s4)
ffffffffc0203c8e:	b7ad                	j	ffffffffc0203bf8 <vprintfmt+0x25a>
ffffffffc0203c90:	000a6603          	lwu	a2,0(s4)
ffffffffc0203c94:	46a1                	li	a3,8
ffffffffc0203c96:	8a2e                	mv	s4,a1
ffffffffc0203c98:	bdb1                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203c9a:	000a6603          	lwu	a2,0(s4)
ffffffffc0203c9e:	46a9                	li	a3,10
ffffffffc0203ca0:	8a2e                	mv	s4,a1
ffffffffc0203ca2:	bd89                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203ca4:	000a6603          	lwu	a2,0(s4)
ffffffffc0203ca8:	46c1                	li	a3,16
ffffffffc0203caa:	8a2e                	mv	s4,a1
ffffffffc0203cac:	b5a1                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203cae:	9902                	jalr	s2
ffffffffc0203cb0:	bf09                	j	ffffffffc0203bc2 <vprintfmt+0x224>
ffffffffc0203cb2:	85a6                	mv	a1,s1
ffffffffc0203cb4:	02d00513          	li	a0,45
ffffffffc0203cb8:	e03e                	sd	a5,0(sp)
ffffffffc0203cba:	9902                	jalr	s2
ffffffffc0203cbc:	6782                	ld	a5,0(sp)
ffffffffc0203cbe:	8a66                	mv	s4,s9
ffffffffc0203cc0:	40800633          	neg	a2,s0
ffffffffc0203cc4:	46a9                	li	a3,10
ffffffffc0203cc6:	b53d                	j	ffffffffc0203af4 <vprintfmt+0x156>
ffffffffc0203cc8:	03b05163          	blez	s11,ffffffffc0203cea <vprintfmt+0x34c>
ffffffffc0203ccc:	02d00693          	li	a3,45
ffffffffc0203cd0:	f6d79de3          	bne	a5,a3,ffffffffc0203c4a <vprintfmt+0x2ac>
ffffffffc0203cd4:	00002417          	auipc	s0,0x2
ffffffffc0203cd8:	a4440413          	addi	s0,s0,-1468 # ffffffffc0205718 <default_pmm_manager+0xa8>
ffffffffc0203cdc:	02800793          	li	a5,40
ffffffffc0203ce0:	02800513          	li	a0,40
ffffffffc0203ce4:	00140a13          	addi	s4,s0,1
ffffffffc0203ce8:	bd6d                	j	ffffffffc0203ba2 <vprintfmt+0x204>
ffffffffc0203cea:	00002a17          	auipc	s4,0x2
ffffffffc0203cee:	a2fa0a13          	addi	s4,s4,-1489 # ffffffffc0205719 <default_pmm_manager+0xa9>
ffffffffc0203cf2:	02800513          	li	a0,40
ffffffffc0203cf6:	02800793          	li	a5,40
ffffffffc0203cfa:	05e00413          	li	s0,94
ffffffffc0203cfe:	b565                	j	ffffffffc0203ba6 <vprintfmt+0x208>

ffffffffc0203d00 <printfmt>:
ffffffffc0203d00:	715d                	addi	sp,sp,-80
ffffffffc0203d02:	02810313          	addi	t1,sp,40
ffffffffc0203d06:	f436                	sd	a3,40(sp)
ffffffffc0203d08:	869a                	mv	a3,t1
ffffffffc0203d0a:	ec06                	sd	ra,24(sp)
ffffffffc0203d0c:	f83a                	sd	a4,48(sp)
ffffffffc0203d0e:	fc3e                	sd	a5,56(sp)
ffffffffc0203d10:	e0c2                	sd	a6,64(sp)
ffffffffc0203d12:	e4c6                	sd	a7,72(sp)
ffffffffc0203d14:	e41a                	sd	t1,8(sp)
ffffffffc0203d16:	c89ff0ef          	jal	ra,ffffffffc020399e <vprintfmt>
ffffffffc0203d1a:	60e2                	ld	ra,24(sp)
ffffffffc0203d1c:	6161                	addi	sp,sp,80
ffffffffc0203d1e:	8082                	ret
