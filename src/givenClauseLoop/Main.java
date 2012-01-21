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
		LoopType lType=LoopType.OTTER_LOOP;
		if(args[0].equals("-o"))
			lType=LoopType.OTTER_LOOP;
		else if(args[0].equals("-e"))
			lType=LoopType.E_LOOP;
		
		String input=args[1];
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
		Queue<Clause> clauses=null;
		try{
			//PARSING
			clauses= Parser.parsing(input);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		
		StringBuffer s;
		for(Clause c: clauses){
			System.out.println(c);
			s = new StringBuffer();
			for(Variable v: c.findVariables())
				s.append(v.toString() + "  ");
			System.out.println(s);
		}
		
		
		System.out.println("\nClauses inserted: " + clauses.size());
		System.out.println();
		
		
		Queue<Clause> list= new LinkedList<Clause>();
		for(Clause c: clauses)
			list.add(c);
		InfoLoop info=ResearchPlan.givenClauseLoop(list, lType);
		System.out.println("\n");
		if(info.res==LoopResult.SAT)
			System.out.println("SAT");
		else{
			System.out.println("UNSAT");
			switch(info.rule){
				case BINARY_RESOLUTION:
					System.out.println("Binary Resolution: ");
					System.out.println("\t" + info.c1 + "\t\t" + info.c2);
					break;
				case SIMPLIFICATION:
					System.out.println("Simplification:");
					System.out.println("\t" + info.c1 + "  simplifies  " + info.c2);
					break;
			}
		}
			
	}
}