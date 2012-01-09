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
		Map<String, FOLNode> elements=new HashMap<String, FOLNode>();
		try{
			//PARSING
			formulae=Parser.parsing(input, elements);
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
		while(!formulae.isEmpty()){
			System.out.println(formulae.poll());
		}
	}
}