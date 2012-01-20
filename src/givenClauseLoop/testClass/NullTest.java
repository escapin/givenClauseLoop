package givenClauseLoop.testClass;

import java.util.*;

public class NullTest {
	
	public static void main(String[] args){
		
		List<Integer> l = new LinkedList<Integer>();
		l.add(new Integer(10));
		System.out.println(l);
		makeNull(l);
		if(l!=null)
			System.out.println("makeNull does not make it null");
		else
			System.out.println("makeNull makes it null");
	}
	
	private static void makeNull(Object o){
		o=null;
	}
}
