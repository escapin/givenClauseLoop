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
		Variable newVar=varMap.get(this);	
		if(!varMap.containsKey(this)){ 
			// variable never found before
			newVar=new Variable(this.getSymbol());
			varMap.put(this, newVar);	
		}
		return newVar;
	}
	
	public String toString(){
		//String s = "" + this.hashCode();
		String s = "" + Integer.toHexString(System.identityHashCode(this));
		s= s.length()>3? s.substring(s.length()-3, s.length()): s;
		return symbol + "@" + s;
	}
}
