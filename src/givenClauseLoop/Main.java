package givenClauseLoop;

import java.io.*;
import java.util.*;
import givenClauseLoop.parser.*;
import givenClauseLoop.bean.*;

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
		AbstractQueue<CNFformula> formulae=null;
		Map<String, FixedElement> fixEl=new HashMap<String, FixedElement>();
		try{
			//PARSING
			formulae= Parser.parsing(input, fixEl);
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
		CNFformula f;
		StringBuffer s;
		while(!formulae.isEmpty()){
			f=formulae.poll();
			System.out.println(f);
			s = new StringBuffer();
			for(String key: f.getVariables().keySet())
				s.append(f.getVariables().get(key).toString() + "  ");
			System.out.println(s);
		}
	}
}