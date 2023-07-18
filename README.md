## ARM-thumb Bare-metal Assembly
A collection of bare-metal assembly code for the NXP LPC824 using the GNU compiler toolchain. 

### Motivation
As an instructor who has been teaching embedded systems programming over 25 years, I always started out with some assembly programming to give an insight into the inner workings of the particular microcontroller in use. As devices with an ARM core became widely available, I found it necessary to move into this realm. The code examples presented target the LPC824 by NXP, hence, are based on the <b>thumb</b> instruction set. Pseudo instructions are avoided for educational purposes. Examples were tested on the LPCXpresso824-MAX board by NXP.

### Code Examples

1. <b>blink</b>: The classic blink example as the first test. The code blinks the RED LED (of the RGB LED) on the  LPCXpresso824-MAX. Timing is done by a simple delay loop.
2. <b>blink3LED</b>: An extension to the <b>blink</b> example which cycles though the RED, GREEN, and BLUE LEDs.
3. <b>uart</b>: The code initializes USART0 in 8N1 UART mode at 9600 bps, and continuously transmits "A".

## Credits
This project is based on the work by Frank Duignan
- [Bare metal programming of the LPC824 from NXP](https://eleceng.dit.ie/frank/arm/BareMetalLPC824/index.html)

