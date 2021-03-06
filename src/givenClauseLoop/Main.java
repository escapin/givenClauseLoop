package givenClauseLoop;

import java.io.*;
import java.util.*;
import java.util.concurrent.*;

import givenClauseLoop.TPTPparser.TPTPparser;
import givenClauseLoop.CommandLineParser.CommandLineParser;
import givenClauseLoop.bean.*;
import givenClauseLoop.core.*;

public class Main {
	
	private static long	loopTime, start;
	private static CommandOptions opt = null;
	private static Collection<Clause> clauses;
	private static InfoLoop info;

	public static void main(String[] args) throws FileNotFoundException, IOException, RuntimeException, Exception{
		info= new InfoLoop();
		BufferedReader in;
		StringBuffer input;
		String s;
		
		try{
			opt = CommandLineParser.parsing(args);
			if(opt.help){
				in = new BufferedReader(new FileReader("README"));
				input = new StringBuffer();
				while((s=in.readLine())!=null)
						input.append(s + "\n");
				System.out.println(input.deleteCharAt(input.length()-1));
				System.exit(-1);
			}
				
			in = new BufferedReader(new FileReader(opt.filePath));
			input = new StringBuffer();
			while((s=in.readLine())!=null)
					input.append(s + "\n");
				
			int i;
			String fileName = ((i=opt.filePath.lastIndexOf("/"))!=-1)? opt.filePath.substring(i+1) : opt.filePath; 
			System.out.println("FILE: " + fileName);
			
			// creating data structure containing clause
			clauses =  
				(opt.clauseStrategy==EnumClass.clauseStrategy.FIFO)? new LinkedHashSet<Clause>() : new PriorityQueue<Clause>();
				
			System.out.println("Parsing...");
			TPTPparser.parsing(input.toString(), clauses);
					
			System.out.println(" Found " + clauses.size() + " clauses");
			System.out.println("\nGiven Clause Loop parameters:");
			System.out.println("\tloop type:\t\t" 
						+ ((opt.loopType==EnumClass.LoopType.OTTER_LOOP)? "Otter": "E"));
			System.out.println("\tselection strategy:\t" 
					+ ((opt.clauseStrategy==EnumClass.clauseStrategy.FIFO)? "fifo": "best visit first (min priority queue)"));
			System.out.println("\tpeak given ratio:\t" 
					+ ((opt.peakGivenRatio>0)? opt.peakGivenRatio: "not inserted"));
			System.out.println("\tresearch strategy:\t" 
					+ ((opt.researchStrategy==EnumClass.researchStrategy.CONTR_BEFORE)? 
							"contraction rules before": "expansion rules before"));
			System.out.println("\ttime out:\t\t" 
					+ ((opt.timeOut>0)? opt.timeOut + "s": "infinite"));
					
	
			System.out.println("\nExecuting Given Clause Loop...");	
			Callable<Object> task = new Callable<Object>() {
	        	public Object call() {
	        		ResearchPlan.givenClauseLoop(clauses, opt, info);
					return new Object();
	          }
	        };
			
			ExecutorService executor = Executors.newCachedThreadPool();
			start=System.currentTimeMillis();
			FutureTask<Object> future = (FutureTask<Object>) executor.submit(task);
			try{
				//System.out.println(opt.timeOut);
				if(opt.timeOut==0)
					future.get();
				else 
					future.get(opt.timeOut, TimeUnit.SECONDS); // TIME OUT
			} catch (java.util.concurrent.TimeoutException e) {
				loopTime=System.currentTimeMillis()-start;
				executor.shutdownNow();
				future.cancel(true);
				info.res = EnumClass.LoopResult.TIME_EXPIRED;
				printResult();
				System.exit(-1);
			} catch (ExecutionException e){
				loopTime=System.currentTimeMillis()-start;
				executor.shutdownNow();
				future.cancel(true);
				if(e.toString().contains("OutOfMemory"))
					info.res = EnumClass.LoopResult.OUT_OF_MEMORY;
				else{
					System.out.println();
					e.printStackTrace();
				}
				printResult();
				System.exit(-1);
			} finally {
				loopTime=System.currentTimeMillis()-start;
				executor.shutdownNow();
				future.cancel(true);
				printResult();
				System.exit(-1);
			}
			
		}catch (FileNotFoundException e){
				System.out.println("Can not open file. Maybe path is wrong or file does not exist."); 
		}catch (IOException e){
				System.out.println("Failed to open the file: " + opt.filePath);
		}catch(Throwable e){
				//System.out.println(e.getMessage());
				System.out.println(e.getMessage());
			/*	System.out.println("ERROR in command line\nUsage:\n\t" + 
						"java -jar givenClauseLoop.jar [-fifo | -best | -bestN] [-o | -e] [-timeN] [-contr | -exp] filePath\n\t" +
						"java -jar givenClauseLoop.jar -help");
			*/
		}		
	}


	private static void printResult(){
		StringBuffer s = new StringBuffer("\n\nResult: ");
		switch(info.res){
			case SAT:
				s.append("SATISFIABLE\n");
				break;
			case UNSAT:
				s.append("UNSATISFIABLE\n");
				switch(info.rule){
					case BINARY_RESOLUTION:
						s.append("Binary Resolution: \n" +
								"\t" + info.c1 + "\t\t" + info.c2 + "\n");
						break;
					case SIMPLIFICATION:
						s.append("Simplification: \n" +	
								"\t" + info.c1 + "  simplifies  " + info.c2 + "\n");
						break;
				}
				break;
			case TIME_EXPIRED:
				s.append("TIME EXPIRED\n");
				break;
			case OUT_OF_MEMORY:
				s.append("OUT OF MEMORY\n");
				break;
		}
		
		s.append("\nClause generated: " + (info.nFactorisations+info.nResolutions));
		s.append("\n\tFactors: " + info.nFactorisations);
		s.append("\n\tBinary resolvents: " + info.nResolutions);
		s.append("\nTautologies:\t\t" + info.nTautology);
		s.append("\nSubsumptions:\t\t" + info.nSubsumptions);
		s.append("\nSimplifications:\t" + info.nSimplifications);
		
		
		s.append("\n\nElapsed clock time:\t" + 
					(int) ((loopTime / 1000) / 60) + "m " + 
					String.format("%.4f", (loopTime/1000d)%60) + "s\t" 
							+ "(" + loopTime + "ms)");
		System.out.println(s);
	}
}