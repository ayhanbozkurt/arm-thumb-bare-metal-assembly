	.section .vectors,"ax",%progbits
	.word 0x10002000
	.word _start+1
	.word defaulthandler+1	/* NMI */
	.word defaulthandler+1	/* Hard Fault */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word defaulthandler+1	/* SVC */
	.word 0x00000001	/* Reserved */
	.word 0x00000001	/* Reserved */
	.word defaulthandler+1	/* PendSV */
	.word defaulthandler+1	/* SysTick */

	.word defaulthandler+1	/* 0 SPI0_IRQ */
	.word defaulthandler+1	/* 1 SPI1_IRQ */
	.word defaulthandler+1	/* 2 RESERVED */
	.word defaulthandler+1	/* 3 UART0_IRQ */
	.word defaulthandler+1	/* 4 UART1_IRQ */
	.word defaulthandler+1	/* 5 UART2_IRQ */
	.word defaulthandler+1	/* 6 RESERVED */
	.word defaulthandler+1	/* 7 I2C1_IRQ */
	.word defaulthandler+1	/* 8 I2C0_IRQ */
	.word defaulthandler+1	/* 9 SCT_IRQ */
	.word isr_MRT+1		/* 10 MRT_IRQ */
	.word defaulthandler+1	/* 11 CMP_IRQ */
	.word defaulthandler+1	/* 12 WDT_IRQ */
	.word defaulthandler+1	/* 13 BOD_IRQ */
	.word defaulthandler+1	/* 14 FLASH_IRQ */
	.word defaulthandler+1	/* 15 WKT_IRQ */
	.word defaulthandler+1	/* 16 ADC_SEQA_IRQ */
	.word defaulthandler+1	/* 17 ADC_SEQB_IRQ */
	.word defaulthandler+1	/* 18 ADC_THCMP_IRQ */
	.word defaulthandler+1	/* 19 ADC_OVR_IRQ */
	.word defaulthandler+1	/* 20 DMA_IRQ */
	.word defaulthandler+1	/* 21 I2C2_IRQ */
	.word defaulthandler+1	/* 22 I2C3_IRQ */
	.word defaulthandler+1	/* 23 RESERVED */
	.word defaulthandler+1	/* 24 PININT0_IRQ */
	.word defaulthandler+1	/* 25 PININT1_IRQ */
	.word defaulthandler+1	/* 26 PININT2_IRQ */
	.word defaulthandler+1	/* 27 PININT3_IRQ */
	.word defaulthandler+1	/* 28 PININT4_IRQ */
	.word defaulthandler+1	/* 29 PININT5_IRQ */
	.word defaulthandler+1	/* 30 PININT6_IRQ */
	.word defaulthandler+1	/* 31 PININT7_IRQ */
