package givenClauseLoop.testClass;

import givenClauseLoop.TPTPparser.*;
import givenClauseLoop.core.Clause;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class TestParser {
	public static void main(String[] args) throws FileNotFoundException, IOException, Exception{
		//String input="";
		//String input="cnf(test, test, ).";
		//String input="cnf(test, test, ()).";
		String input1="	cnf(test, test, (go(f(X2),f(Y2),Z2)) )." +
				"	\n	cnf(test, test, (~go(X2,f(Y2),Z3))  ).";
		
		String input2="	cnf(test, test, (go(f(X2),f(Y2),Z2)) )." +
				"\n		cnf(test, test, (~go(Y1,Y1,g(a))) ).";
		
		//System.out.println(input);
		Queue<Clause> clauses=new PriorityQueue<Clause>();
		try{
			//PARSING
			TPTPparser.parsing(input1, clauses);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		
		System.out.println("clauses: " + clauses.size());
		for(Clause c: clauses)
			System.out.println(c);
	}
}
