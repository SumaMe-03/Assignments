package exp1;
import java.util.*;
public class sum_avg {
	sum_avg(){
		int n;
		int sum=0;
		int temp;
		Scanner obj = new Scanner(System.in);
		
		System.out.println("Enter the number of inputs: ");
		n = obj.nextInt();
		
		for(int i =0; i<n;i++) {
			System.out.print("Enter "+i+1+"th number: ");
			temp = obj.nextInt();
			sum+=temp;
		}
		System.out.println();
		
		System.out.println("Sum of "+n+" numbers is: "+sum);
		
		float avg = (float)sum/(float)n;
		
		System.out.println("Average of "+n+" numbers is: "+avg);
	}
}