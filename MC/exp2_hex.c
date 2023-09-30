#include <reg51.h>
void MSDelay(unsigned int itime){
	unsigned int i,j;
	for(i=0;i<itime;i++){
		for(j=0;j<1275;j++);
	}
}

void main(void){
	unsigned int s;
	for(s=0;s<=255;s++){
			P1=(s);
			MSDelay(1000);
		}
}