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
	public int nSymbols(){
		return symNumber;
	}
	
	/**
	 * @return the string that represents that object
	 */
	public String toString(){
		return symbol;
	}
	
	public boolean equals(Object o){
		if(this instanceof Literal){
			return ((Literal) this).equals(o);
		} else if(this instanceof Constant)
			return ((Constant) this).equals(o);
		else if(this instanceof Variable){
			return ((Variable) this).equals(o);
		} else{ // if(this instanceof Function){
			return ((Function) this).equals(o);
		}
	}
}
