package exp1;
import java.util.Scanner;

public class Fact{
	Fact(){
		Scanner obj = new Scanner(System.in);
		System.out.println("Enter a number: ");
		int n = obj.nextInt();
		
		
		System.out.println("The factorial of "+n+" is: "+calc_fact(n));
		System.out.println("Using Recursive factorial method");
		System.out.println("The factorial of "+n+" is: "+rec_fact(n));
	}
	static int calc_fact(int n){
		int fact = 1;
		if(n==0) {
			return fact;
		}
		else {
			for(int i = 1;i<=n;i++) {
				fact = fact*i;
			}
			return fact;
		}
	}
	
	static int rec_fact(int n) {
		if(n == 0) {
			return 1;
		}
		else {
			return n*rec_fact(n-1);
		}
	}	
}