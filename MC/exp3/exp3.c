//Triangular wave generation 
#include <reg51.h>

void main(void){
	unsigned int z;
	while(1){
		P1=0X00;
		
		for(z=0;z<255;z++){
			P1=z;
		}
		
		for(z=255;z>0;z--){
			P1=z;
		}
	}
}