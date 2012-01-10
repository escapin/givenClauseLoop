package givenClauseLoop.bean;

import java.util.List;

public class Function extends Term implements FOLNodeArg {

	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Function(String symbol){
		super.symbol=symbol;
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
		return s.toString();
	}
}
