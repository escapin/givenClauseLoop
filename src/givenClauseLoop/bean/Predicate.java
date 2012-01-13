package givenClauseLoop.bean;

import java.util.List;

public class Predicate extends FOLNode {

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
	
	/**
	 * Two Predicates are equals iff they have 
	 * the same signature and the same term inside.
	 */
	public boolean equals(Object obj){
		if(this == obj)
			return true;
		if(obj instanceof Predicate){
			Predicate p = (Predicate) obj;
			if(this.isPositive()==p.isPositive() && this.getSymbol()==p.getSymbol() && this.nArgs()==p.nArgs()){
				boolean same=true;
				for(int i=0; same && i<this.nArgs(); i++)
					same = this.getArgs().get(i).equals(p.getArgs().get(i));
				return same;
			}
		}
		return false;
	}
}
