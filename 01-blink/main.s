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
	ldr  r2, GPIO
	movs r3, #0
	movs r4, #1
main:
	strb r3, [r2, 12]
	bl   delay
	strb r4, [r2, 12]
	bl   delay
	b main
	.align 2
GPIO:	.word 0xA0000000	/* GPIO port base */

init_GPIO:
	ldr  r2, DIR0
	ldr  r3, PINS
	str  r3, [r2]
	mov  pc, lr		/* return to caller */
	.align 2
DIR0:	.word 0xA0002000	/* IOCON base address */
PINS:	.word 0x00001000	/* bit 12 OUTPUT */

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
