package givenClauseLoop.testClass;

import java.util.*;

public class NullTest {
	
	public static void main(String[] args){
		
		List<Integer> l = new LinkedList<Integer>();
		l.add(new Integer(10));
		System.out.println(l);
		Boolean b = new Boolean(false);
		makeNull(l, b);
		if(l!=null)
			System.out.println("makeNull does not make it null");
		else
			System.out.println("makeNull makes it null");
		
		if(b.booleanValue())
			System.out.println("makeNull makes b true");
		else
			System.out.println("makeNull does not make b true");
		
	}
	
	private static void makeNull(Object o, Boolean b){
		o=null;
		b=Boolean.TRUE;
	}
}
