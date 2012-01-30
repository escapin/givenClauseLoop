package givenClauseLoop.testClass;

import java.util.*;

import givenClauseLoop.TPTPparser.*;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.core.*;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.*;

public class TestResolutionRule {

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
		Queue<Clause> clauses=new PriorityQueue<Clause>();
		try{
			//PARSING
			TPTPparser.parsing(input, clauses);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		
		System.out.println("clauses: " + clauses.size());
		for(Clause c: clauses)
			System.out.println(c);
		
		/*
		StringBuffer s;
		for(Clause c: clauses){
			System.out.println(c);
			s = new StringBuffer("\t");
			for(Variable v: c.findVariables())
				s.append(v.toString() + "  ");
			System.out.println(s);
		}
		*/
		System.out.print("\n\n");
		System.out.println("RESOLUTION:");
		Collection<Clause> qNew=new PriorityQueue<Clause>();
		Clause cNew;
		Map<Clause, Clause> alreadyConsidered = new HashMap<Clause, Clause>();
		for(Clause givenClause: clauses)
			for(Clause cSel: clauses)
				if(givenClause!=cSel && alreadyConsidered.get(cSel)!=givenClause){
					alreadyConsidered.put(givenClause, cSel);
					System.out.println("\n" + givenClause + "\t\t" +  cSel + 
		"\n---------------------------------------------------------------------------------------------------------------------------------");
					Set<Literal> lMap;
					for(Literal l1: givenClause.getLiterals())
						if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getName()) ) != null )
							for(Literal l2: lMap){
								cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
								System.out.print("\t" + cNew);
								if(cNew.isEmpty())
									System.out.println("\tEMPTY");
								else
									System.out.println();
								qNew.add(cNew);
							}
						
				}
		
		System.out.println("\n");
		for(Clause c1: clauses)
			for(Clause c3: qNew)
				if(c1.subsumes(c3))
					System.out.println(c1 + "  subsumes " + c3);
				else if(c3.subsumes(c1))
					System.out.println(c1 + "  subsumes " + c3);
		
	}
}


