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
			symNumber += t.nSymbols();
		}
	}
	
	public List<Term> getArgs(){
		return args;
	}
	
	public int nArgs(){
		return args.size();
	}
	
	/**
	 * Two Functions are equals iff they have 
	 * the same signature and the same term inside.
	 */
	public boolean equals(Object obj){
		if(this == obj)
			return true;
		if(obj instanceof Function){
			Function f = (Function) obj;
			if(this.getSymbol().equals(f.getSymbol()) && this.nArgs()==f.nArgs()){
				boolean same=true;
				for(int i=0; same && i<this.nArgs(); i++)
					same = this.getArgs().get(i).equals(f.getArgs().get(i));
				return same;
			}
		}
		return false;
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer(symbol + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return s.toString();
	}
}
