	.syntax unified
	.arch armv6-m
	.thumb
	
	.data
	
	.include "ivt.s"
	
	.text
	.global _start
_start:
	bl   init_GPIO
	bl   init_CLOCK
	bl   init_MRT0
	bl   init_INT
	cpsie i
main:
	b main			/* nothing much to do */
	.align 2

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
	str  r3, [r2]		/* enable the clock to MRT */
	mov  pc, lr		/* return to caller */
	.align 2
SYSAHBCLKCTRL: .word 0x40048080
CLKSETUP:      .word 0x00000400 /* MRT:10*/

init_MRT0:
	ldr  r2, MRTBASE
	ldr  r3, INTVAL0
	str  r3, [r2, 0x00]	/* set MRT0 period to 0.5 sec */
	movs r3, #1
	str  r3, [r2, 0x08]	/* enable MRT0 interrupt */
	mov  pc, lr		/* return to caller */
	.align 2
MRTBASE:	.word 0x40004000
INTVAL0:	.word 5999999   /* +0x8000 */

init_INT:
	ldr  r2, ISER0
	ldr  r3, INTS
	str  r3, [r2]		/* enable MRT interrupt */
	mov  pc, lr		/* return to caller */
	.align 2
ISER0:	.word 0xE000E100	/* NVIC interrupt set enable register */
INTS:	.word 0x00000400	/* list of perhipherals to generate an interrupt MRT:10 */

isr_MRT:
	push {r2, r3, r7, lr}
	ldr  r2, GPIONOT0
	ldr  r3, PIN12
	str  r3, [r2]
	ldr  r2, MRT0STAT
	movs r3, #1
	str  r3, [r2]		/* clear MRT int flag */
	ldr  r2, ICPR0
	ldr  r3, MRT
	str  r3, [r2]
	pop  {r2, r3, r7, pc}
	.align 2
GPIONOT0: .word 0xA0002300	/* GPIO bit toggle register */
PIN12:	  .word 0x00001000	/* bit 12 OUTPUT */
ICPR0:    .word 0xE000E280	/* NVIC Interrupt Clear Pending Register */
MRT:	  .word 0x00000400	/* MRT bit 10 */
MRT0STAT: .word 0x4000400C	/* MRT status register Counter 0 */

defaulthandler:
	b    defaulthandler
	.end
