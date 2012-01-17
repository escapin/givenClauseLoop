package givenClauseLoop.bean;

import java.util.Map;

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
	
	public Term clone(Map<Variable, Variable> varMap){
		Variable newVar;	
		if((newVar=varMap.get(this)) != null) // variable already found
				return newVar;
		else{	// variable never found before
			newVar=new Variable(this.getSymbol());
			varMap.put(this, newVar);
			return newVar;
		}
	}
}
