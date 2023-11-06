//Write a program in Java to implement a Calculator with simple arithmetic operations such as 
//add, subtract, multiply, divide, factorial etc. using switch case and other simple java statements. 
//The objective of this assignment is to learn Constants, Variables, and Data Types, Operators and 
//Expressions, Decision making statements in Java. 

package exp1;
import java.util.*;

public class exp2 {
		
	static void add(int a, int b) {
		int res = a+b;
		System.out.println(a+" + "+b+" = "+res);
		
	}
	
	static void sub(int a, int b) {
		int res = a-b;
		System.out.println(a+" - "+b+" = "+res);
		
	}
	
	static void mul(int a, int b) {
		int res = a*b;
		System.out.println(a+" x "+b+" = "+res);
		
	}
	
	static void div(int a, int b) {
		try {
			float res = (float) a/(float) b;
			System.out.println(a+" / "+b+" = "+res);
		}
		catch(ArithmeticException e) {
			System.out.println("Cannot divide by zero");
			System.out.println(e);
		}
	}
	
	static int fact(int n) {
		if(n<0) {
			System.out.println("Enter numbers greater than 1");
			return 0;
		}
		if(n==0 || n==1) {
			return 1;
		}
		else {
			return n*fact(n-1);
		}
	}
	public static void main(String[] args) {
		Scanner obj = new Scanner(System.in);
		
		System.out.println("Enter 1st number: ");
 		int a = obj.nextInt();
 		System.out.println("Enter 2nd number: ");
 		int b = obj.nextInt();
 		int ch;
		do {
			System.out.println("______Calculator______");
			System.out.println("1. Addition");
			System.out.println("2. Subtraction");
			System.out.println("3. Multiplication");
			System.out.println("4. Division");
			System.out.println("5. Factorial");
			System.out.println("_____Press 0 to exit_____");
		
			System.out.println("Enter choice number: ");
			ch = obj.nextInt();
		
			switch(ch) {
			case 1: add(a,b);
		 			break;
		 		
			case 2: sub(a,b);
 					break;
		 		
			case 3: mul(a,b);
					break;
				
			case 4: div(a,b);
					break;
				
			case 5: System.out.println("Enter a number: ");
					int n = obj.nextInt();
					System.out.println("Factorial of "+n+" is "+fact(n));
					break;
				
			default: System.out.println("Exiting from Calculator");
		 
			}
		}while(ch!=0);

	}

}
