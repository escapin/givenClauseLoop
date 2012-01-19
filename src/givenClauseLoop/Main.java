package givenClauseLoop;

import java.io.*;
import java.util.*;
import givenClauseLoop.parser.*;
import givenClauseLoop.bean.*;
import givenClauseLoop.core.*;

public class Main {

	/**
	 * @param args
	 */
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
		NavigableSet<Clause> clauses=null;
		try{
			//PARSING
			clauses= Parser.parsing(input);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		
		/*
		for(String k: el.keySet())
			System.out.println(el.get(k));
			
		if(el.size()==0)
			System.out.println("Equals to 0");
		if(el.size()!=0)
			System.out.println("Not Equals to 0");
		*/
		
		// print the formulae
		
		StringBuffer s;
		for(Clause c: clauses){
			System.out.println(c);
			s = new StringBuffer();
			for(Variable v: c.findVariables())
				s.append(v.toString() + "  ");
			System.out.println(s);
		}
		Iterator<Clause> iter1 = clauses.iterator();
		Iterator<Clause> iter2 = clauses.iterator();
		System.out.println("\n" + ((iter1==iter2)? "true" : "false"));
		Clause c1, c2;
		while(iter1.hasNext()){
			c1=iter1.next();
			iter2 = clauses.iterator();
			while(iter2.hasNext()){
				c2=iter2.next();
				System.out.println(c1 + "\t" + c2);
			}
		}
			
		/*
		InfoLoop info=ResearchPlan.OtterLoop(clauses);
		if(info.res==LoopResult.SAT)
			System.out.println("SAT");
		else
			System.out.println("UNSAT");
		*/
	}
}