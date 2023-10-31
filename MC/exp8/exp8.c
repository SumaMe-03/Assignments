#include <p18f4550.h>
void myMsDelay(unsigned int time);
void main(void) {
	TRISCbits.TRISC2 = 0;
	TRISD = 0;
	PR2 = 0xBA;
	CCP1CON = 0x0C;
	T2CON = 0x07;
	PORTDbits.RD5 = 1;
	PORTDbits.RD6 = 0;
	while (1) {
	// For 20%
	CCPR1L = 0x25;
	CCP1CONbits.DC1B0 = 0;
	CCP1CONbits.DC1B1 = 1;
	myMsDelay(3000);
	// For 40%
	CCPR1L = 0x4A;
	CCP1CONbits.DC1B0 = 1;
	CCP1CONbits.DC1B1 = 1;
	myMsDelay(3000);
	// For 60%
	CCPR1L = 0x70;
	CCP1CONbits.DC1B0 = 1;
	CCP1CONbits.DC1B1 = 0;
	myMsDelay(3000);
	// For 80%
	CCPR1L = 0x95;
	CCP1CONbits.DC1B0 = 1;
	CCP1CONbits.DC1B1 = 1;
	myMsDelay(3000);
	}
}
void myMsDelay(unsigned int time) {
	unsigned int i, j;
	for (i = 0; i < time; i++) {
		for (j = 0; j < 710; j++) {
		}
	}
}