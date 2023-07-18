	.syntax unified
	.arch armv6-m
	.thumb

	.section .vectors,"ax",%progbits
	.word 0x10002000
	.word _start+1
	.text
	.global _start
_start:
	bl   init_GPIO
	bl   init_CLOCK
	bl   init_UART0
	bl   init_MRT0
	ldr  r5, TXDAT0
	movs r6, #65
main:
	ldr  r2, MRT0STAT
	ldr  r3, [r2]
	movs r4, #1
	ands r3, r4
	beq  no_int
	str  r3, [r2]
	ldr  r2, GPIONOT0
	ldr  r3, PINS
	str  r3, [r2]
	str  r6, [r5]
no_int:
	b main
	.align 2
GPIONOT0: .word 0xA0002300	/* GPIO bit toggle register */
GPIO:	  .word 0xA0000000	/* GPIO port base */
TXDAT0:   .word 0x4006401C
MRT0STAT: .word 0x4000400C

init_GPIO:
	ldr  r2, DIR0
	ldr  r3, PINS
	str  r3, [r2]
	mov  pc, lr		/* return to caller */
	.align 2
DIR0:	.word 0xA0002000	/* IOCON base address */
PINS:	.word 0x00001000	/* bit 12 OUTPUT */

init_CLOCK:
	ldr  r2, SYSAHBCLKCTRL
	ldr  r4, CLKSETUP
	ldr  r3, [r2]
	orrs r3, r4
	str  r3, [r2]		/* enable the clock to USART0 and MRT */
	mov  pc, lr		/* return to caller */
	.align 2
SYSAHBCLKCTRL: .word 0x40048080
CLKSETUP:      .word 0x00004400 /* USART0:14 MRT:10*/

init_UART0:
	ldr  r2, PINASSIGN0
	ldr  r3, TX4RX0
	str  r3, [r2]		/* USART0 pin assignment */
	ldr  r2, UARTCLKDIV
	movs r3, #1
	strb r3, [r2]		/* 12 MHz / 1 */
	ldr  r2, BRG0
	movs r3, #77
	str  r3, [r2]		/* 12 MHz/(16*78) = 9600 */
	ldr  r2, CFG0
	movs r3, #5
	str  r3, [r2]		/* enable USART0, 8N1 */
	mov  pc, lr		/* return to caller */
	.align 2
PINASSIGN0:    .word 0x4000C000
TX4RX0:        .word 0xFFFF0004 /* RX p0  TX P4 */
UARTCLKDIV:    .word 0x40048094 /* 5.6.15 USART clock divider register */
BRG0:          .word 0x40064020	/* 13.6.9 USART0 Baud Rate Generator register */
CFG0:          .word 0x40064000 /* 13.6.1 USART Configuration register */

init_MRT0:
	ldr  r2, MRTBASE
	ldr  r3, INTVAL0
	str  r3, [r2, 0x00]	/* set MRT0 period to 0.5 sec */
#	movs r3, #1
#	str  r3, [r2, 0x08]	/* enable MRT0 interrupt - seems to be not needed */
	mov  pc, lr		/* return to caller */
	.align 2
MRTBASE:	.word 0x40004000
INTVAL0:	.word 5999999   /* +0x8000 */

delay:
	ldr  r7, DELAY
delayloop:
	nop
	nop
	subs r7, r7, #1
	bne  delayloop
	mov  pc, lr		/* return to caller */
	.align 2
DELAY:	.word 500000
	.end
