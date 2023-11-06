package exp1;
import java.util.Scanner; 
class Rectangle {
	Scanner obj = new Scanner(System.in); 
	  
	 public double length, width, area; 
	 public String color; 
	  
	 public void get_length() { 
	  System.out.println("Enter the lenght of Rectangle in cm: "); 
	  length=obj.nextDouble(); 
	 } 
	  
	 public void get_width() { 
	  System.out.println("Enter the width of the rectangle in cm: "); 
	  width=obj.nextDouble(); 
	 } 
	  
	 public double get_area() { 
	  area=length*width; 
	  return area; 
	 } 
	  
	 public String get_color() { 
	 System.out.println("Enter the color of Rectangle: "); 
	 color=obj.next(); 
	  return color; 
	 } 
	  
	 public void display() { 
	  System.out.println("Length of Rectangle: "+length); 
	  System.out.println("Width of Rectangle: "+width); 
	  System.out.println("Color of Rectangle: "+color); 
	 } 	
}

public class Exp3{ 
	public static void main(String args[]) { 
		Rectangle r1= new Rectangle(); 
		Rectangle r2= new Rectangle(); 
   
		System.out.println("Enter details of 1st Rectangle: "); 
		r1.get_length(); 
		r1.get_width(); 
		r1.get_color(); 
   
		System.out.println("Enter details of 2nd Rectangle: "); 
		r2.get_length(); 
		r2.get_width(); 
		r2.get_color(); 
   
		if(r1.get_area()==r2.get_area()&& r1.get_color().equals(r2.get_color())) { 
			System.out.println("Matched Rectangles"); 
			System.out.println("The areas of these Rectangles is: "+r1.get_area()); 
		} 
		else { 
			System.out.println("Rectangles Not Matched"); 
		} 
	} 
} 