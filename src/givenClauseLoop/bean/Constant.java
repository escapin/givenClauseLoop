package givenClauseLoop.bean;

import java.util.Map;

public class Constant extends Term {

	public Constant(String symbol){
		this.symbol=symbol;
	}
	
	public boolean equal(Object obj){
		return ( this==obj || ( obj instanceof Constant && this.getSymbol().equals(((Constant) obj).getSymbol()) ) );
	}
	
	public Term clone(Map<Variable, Variable> varMap){
		return this;
	}
}