package givenClauseLoop.bean;

public class Variable extends Term{

	public Variable(String symbol){
		this.symbol=symbol;
	}

	/**
	 * Two variable are equals iff they are the same.
	 * 
	 * @see givenClauseLoop.bean.FOLNode#equals(java.lang.Object)
	 */
	public boolean equals(Object obj){
		return this == obj;
	}
}
