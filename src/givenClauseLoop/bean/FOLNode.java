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
	protected String symbol;
	
	/**
	 * The number of the symbols in this node
	 * (at least is one)
	 */
	protected int symNumber=1;
	
	/**
	 * 
	 * @return the symbol name
	 */
	public String getSymbol(){
		return symbol;
	}
	
	/**
	 * The number of symbols in that node
	 * @return symNumber the number of symbols in that node
	 */
	public int getSymNumber(){
		return symNumber;
	}
	
	/**
	 * @return the string that represents that object
	 */
	public String toString(){
		return symbol;
	}
	
	/**
	 * Two FOLNode(s) are equals iff the toString() method return two equals string.
	 * 
	 * @return true if the FOLNode are equals, false else
	 */
	public boolean equals(Object obj){
		if(this == obj)
			return true;
		if(obj instanceof FOLNode){
			/* We cannot add this line 'FOLNode n = (FOLNode) obj;'
			 * because the toString() method that must be executed is the method of the real class,
			 * not the method of FOLNode abstract class
			 */
			return this.toString().equals(obj.toString());
		}
		return false;
	}
}
