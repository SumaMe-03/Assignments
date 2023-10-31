#include <p18f4550.h>
#include "vector_relocate.h"
#define ctrl PORTE
#define LCD_DATA PORTD
#define rs PORTEbits.RE0
#define rw PORTEbits.RE1
#define en PORTEbits.RE2

void init_LCD(void);
void LCD_command(unsigned char data);
void LCD_data(unsigned char data);
void LCD_write_string(static char *str);
void msdelay(unsigned int time);

void main(void){
	char var1[] = "World cup winner";
	char var2[] = "india";
	INTCON2bits.RBPU = 0;

	ADCON1 = 0X0F;
	TRISD = 0X00;
	TRISE = 0X00;

	init_LCD();
	msdelay(15);

	LCD_write_string(var1);
	msdelay(15);

	LCD_command(0XCD);
	LCD_write_string(var2);
	while(1);
}

void msdelay(unsigned int time){
	unsigned int i,j;
	for(i=0;i<time;i++){
		for(j =0;j<710;j++){}
	}
}

void init_LCD(void){
	LCD_command(0X38);
	msdelay(15);
	LCD_command(0X01);
	msdelay(15);
	LCD_command(0X0E);
	msdelay(15);
	LCD_command(0X80);
	msdelay(15);
}

void LCD_command (unsigned char cmd){
 	LCD_DATA = cmd;
	rs = 0;
	rw = 0;
	en = 1;
	msdelay(15);
	en = 0;	
}
void LCD_data(unsigned char data){
	LCD_DATA = data;
	rs = 1;
	rw = 0;
	en = 1;
	msdelay(15);
	en = 0;
}

void LCD_write_string (static char *str){
	int i = 0;
	while(str[i]!='\0'){
		LCD_data(str[i]); 
		msdelay(15);
		i++;
	}
}