package givenClauseLoop.bean;

import java.util.List;

public class Predicate extends FOLNode implements FOLNodeArg, FixedElement {

	private boolean isPositive;
	
	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Predicate(String symbol, boolean isPositive){
		super.symbol=symbol;
		this.isPositive=isPositive;
		if(!isPositive)	// because also the negation symbol "~" must be counted
			symNumber++;
	}
	
	public boolean isPositive(){
		return isPositive;
	}
	
	public void setArgs(List<Term> args){
		this.args=args;
		for(Term t: this.args){
			symNumber += t.getSymNumber();
		}
	}
	
	public List<Term> getArgs(){
		return args;
	}
	
	public int nArgs(){
		return args.size();
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer(symbol + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return isPositive? s.toString() : "~" + s.toString();
	}
	
}
