#include <reg51.h>
void MSDelay(unsigned int itime){
	unsigned int i,j;
	for(i=0;i<itime;i++){
		for(j=0;j<1275;j++);
	}
}

void main(void){
	unsigned int s;
	for(s='A';s<='Z';s++){
			P1=(s);
			MSDelay(2000);
		}
}