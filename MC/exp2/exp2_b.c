//LED chasing

#include <reg51.h>
void MSDelay(unsigned int itime){
	unsigned int i,j;
 	for(i=0;i<itime;i++);
	for(j=0;j<1275;j++);
}

void main(void){
	unsigned int z;
	while(1){
		P1=0X00;
		for(z=0;z<8;z++){
			MSDelay(500);
			P1=P1<<1;
		}
	}
}
