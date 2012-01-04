package givenClauseLoop;

import java.io.*;
import givenClauseLoop.parser.*;

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