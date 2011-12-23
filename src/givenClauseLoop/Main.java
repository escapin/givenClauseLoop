package givenClauseLoop;

import java.io.*;

public class Main {

	/**
	 * @param args
	 */
	public static void main(String[] args) throws FileNotFoundException, IOException, Exception{
		String input=args[0];
		try{
			BufferedReader in = new BufferedReader(new FileReader(input));
			System.out.println("Input interpreted as path of a file with the formula inside.");
			input="";
			String s;
			while((s=in.readLine())!=null)
				input+=s + "\n";
		}catch (FileNotFoundException e){
			System.out.println("Can not open file. Maybe path is wrong or file does not exist."); 
			System.out.println("Try to interpret the input string as a formula.");
		}catch (IOException e){
			throw new IOException("Failed to open the file");
		}
		//System.out.println(input);
		try{
			//PARSING
			Parser.parsing(input, new String());
		}catch(Throwable e){
			System.out.println(e.getMessage());
		}
	}
}