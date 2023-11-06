package exp1;
import java.util.*;
public class prime_nos {
	prime_nos(){
		Scanner obj = new Scanner(System.in);
		System.out.println("Enter no of prime numbers to display: ");
		int n = obj.nextInt();
		
		int num = 2;
		int count = 0;
		
		while(count<n) {
			if(isPrime(num)) {
				System.out.print(num+" ");
				count++;
			}
			num++;
		}
		System.out.println();
	}
	public static boolean isPrime(int num) {
        if (num <= 1) {
        	System.out.println("Enter a number greater than 1");
            return false;
        }
        if (num <= 3) {
            return true;
        }
        if (num % 2 == 0 || num % 3 == 0) {
            return false;
        }
        for (int i = 5; i * i <= num; i += 6) { //check divisibility for numbers in the form of 6k+1
            if (num % i == 0 || num % (i + 2) == 0) {
                return false;
            }
        }
        return true;
    }
}