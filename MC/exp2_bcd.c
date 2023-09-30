#include <reg51.h>
void MSDelay(unsigned int itime){
	unsigned int i,j;
	for(i=0;i<itime;i++){
		for(j=0;j<1275;j++);
	}
}

void main(void){
	unsigned int s,z;
	for(s=0;s<=9;s++){
		for(z=0;z<=9;z++){
			P1=(s<<4|z);
			MSDelay(1000);
		}
	}
}