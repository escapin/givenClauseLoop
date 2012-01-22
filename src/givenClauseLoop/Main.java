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
		
		String filePath=args[1];
		StringBuffer input= new StringBuffer();
		try{
			BufferedReader in = new BufferedReader(new FileReader(filePath));
			String s;
			while((s=in.readLine())!=null)
				input.append(s + "\n");
		}catch (FileNotFoundException e){
			System.out.println("Can not open file. Maybe path is wrong or file does not exist."); 
		}catch (IOException e){
			throw new IOException("Failed to open the file.");
		}
		
		int i;
		String fileName = ((i=filePath.lastIndexOf("/"))!=-1)? filePath.substring(i+1) : filePath; 
		System.out.println("FILE: " + fileName);
		Queue<Clause> clauses=new PriorityQueue<Clause>();
		try{
			System.out.println("Parsing...");
			//PARSING
			Parser.parsing(input.toString(), clauses);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		System.out.println(" Found " + clauses.size() + " clauses\n");
		
		
		Queue<Clause> list= new LinkedList<Clause>();
		for(Clause c: clauses)
			list.add(c);
		
		long	loopTime,
				start=System.currentTimeMillis();
		InfoLoop info=ResearchPlan.givenClauseLoop(list, lType);
				loopTime=System.currentTimeMillis()-start;
		
		
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
		System.out.println("\nElapsed clock time:\t" + 
					(int) ((loopTime / 1000) / 60) + "m " + 
					String.format("%.4f", (loopTime/1000d)%60) + "s\t" 
							+ "(" + loopTime + "ms)");
			
	}
}