/**
 * 
 */
package givenClauseLoop.bean;


/**
 * @author Enrico Scapin
 *
 */
public abstract class FOLNode{
	
	/**
	 * The name of the FOL symbol
	 */
	protected String name;
	
	/**
	 * The number of the symbols in this node
	 * (at least is one)
	 */
	protected int symNumber=1;
	
	/**
	 * 
	 * @return the symbol name
	 */
	public String getName(){
		return name;
	}
	
	/**
	 * The number of symbols in that node
	 * @return symNumber the number of symbols in that node
	 */
	public int nSymbols(){
		return symNumber;
	}
	
	/**
	 * @return the string that represents that object
	 */
	public String toString(){
		return name;
	}
	
}
