#include <p18f4550.h>
extern void _startup(void);
void timer_isr(void);
#pragma code RESET_INTERRUPT_VECTOR = 0X1000

void reset (void){
	_asm
		goto _startup
	_endasm
}
#pragma code

void main(void){
	ADCON1 = 0X0F;
	INTCON2bits.RBPU = 0;
	TRISBbits.TRISB0 = 0;
	PORTBbits.RB0 = 0;
	T0CON = 0X03;
	TMR0H = 0X6D;
	TMR0L = 0x26;
	
	INTCONbits.TMR0IF = 0;
	INTCONbits.TMR0IE = 1;
	INTCONbits.GIE = 1;
	T0CONbits.TMR0ON = 1;
	while(1);
}

#pragma code HIGH_INTERRUPR_VECTOR = 0X1008
void high_ISR(void){
	_asm
		goto timer_isr
	_endasm
}

#pragma code

#pragma interrupt timer_isr
void timer_isr(void){
	TMR0H = 0X6D;
	TMR0L = 0X26;
	PORTBbits.RB0 = ~PORTBbits.RB0;
	INTCONbits.TMR0IF = 0;
} 