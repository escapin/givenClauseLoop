package givenClauseLoop;

import java.io.*;
import java.util.*;

import givenClauseLoop.TPTPparser.TPTPparser;
import givenClauseLoop.CommandLineParser.CommandLineParser;
import givenClauseLoop.bean.*;
import givenClauseLoop.core.*;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws FileNotFoundException, IOException, Exception{
		CommandOptions opt = null;
		try{
			opt = CommandLineParser.parsing(args);
			StringBuffer input= new StringBuffer();
			try{
				BufferedReader in = new BufferedReader(new FileReader(opt.filePath));
				String s;
				while((s=in.readLine())!=null)
					input.append(s + "\n");
				
				int i;
				String fileName = ((i=opt.filePath.lastIndexOf("/"))!=-1)? opt.filePath.substring(i+1) : opt.filePath; 
				
				System.out.println("FILE: " + fileName);
				Queue<Clause> clauses =  
					(opt.clauseStrategy==EnumClass.clauseStrategy.FIFO)? new LinkedList<Clause>() : new PriorityQueue<Clause>();
				
				try{
					System.out.println("Parsing...");
					//PARSING
					TPTPparser.parsing(input.toString(), clauses);
					
					System.out.println(" Found " + clauses.size() + " clauses\n");
					
					
					long	loopTime,
							start=System.currentTimeMillis();
					InfoLoop info=ResearchPlan.givenClauseLoop(clauses, opt);
							loopTime=System.currentTimeMillis()-start;
					
					
					System.out.println("\n");
					if(info.res==EnumClass.LoopResult.SAT)
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
					
				}catch(Throwable e){
					System.out.println(e.getMessage());
				}
				
			}catch (FileNotFoundException e){
				System.out.println("Can not open file. Maybe path is wrong or file does not exist."); 
			}catch (IOException e){
				throw new IOException("Failed to open the file.");
			}
		}catch(Throwable e){
		System.out.println(e.getMessage());
		}
	}
}