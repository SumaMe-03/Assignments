#include <reg51.h>

void MSDelay(unsigned int t){
	unsigned int i,j;
	for(i=0;i<t;i++);
	for(j=0;j<1275;j++);
}

void main(void){
	unsigned int x;
	//count = 90/(1.8*4)
		for( x=0; x<12;x++){
			P1=0X06;
			MSDelay(100);
			P1=0X0C;
			MSDelay(100); 
			P1=0X09;
			MSDelay(100);
			P1=0X03;
			MSDelay(100);
		}
	}