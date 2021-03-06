package givenClauseLoop.testClass;

import givenClauseLoop.TPTPparser.*;
import givenClauseLoop.bean.*;
import givenClauseLoop.core.Clause;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class TestContractionRules {

	
	public static void main(String[] args) throws FileNotFoundException, IOException, Exception{
		String input=args[0];
		try{
			BufferedReader in = new BufferedReader(new FileReader(input));
			input="";
			String s;
			while((s=in.readLine())!=null)
				input+=s + "\n";
		}catch (FileNotFoundException e){
			System.out.println("Can not open file. Maybe path is wrong or file does not exist."); 
		}catch (IOException e){
			throw new IOException("Failed to open the file.");
		}
		//System.out.println(input);
		Queue<Clause> clauses=new PriorityQueue<Clause>();
		try{
			//PARSING
			TPTPparser.parsing(input, clauses);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		
		StringBuffer s;
		for(Clause c: clauses){
			System.out.println(c);
			s = new StringBuffer("\t");
			for(Variable v: c.findVariables())
				s.append(v.toString() + "  ");
			System.out.println(s);
		}
		
		System.out.println("\nTAUTOLOGY: ");
		for(Clause c: clauses)
			if(c.isTautology())
				System.out.println(c);
		
		System.out.println("\nSUBSUMPTION: ");
		for(Clause c1: clauses)
			for(Clause c2: clauses)
				if(c1.subsumes(c2))
					System.out.println(c1 + "  subsumes  " + c2);
		
		System.out.println("\nSEMPLIFICATION:");
		Literal lit=null;
		for(Clause c1: clauses)
			for(Clause c2: clauses){
				if( !(c1.simplify(c2, false)).isEmpty()){
					System.out.println(c2 + "  simplifies  " + c1 + (c1.nLiterals()>0? " | " : "") + lit);
					c1.addLiteral(lit);
				}
			}
		
		
	}
}
