package givenClauseLoop.bean;

import java.util.List;

public class Literal extends FOLNode {

	private boolean sign;
	
	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Literal(String symbol, boolean sign){
		super.symbol=symbol;
		this.sign=sign;
		if(!sign)	// because also the negation symbol "~" must be counted
			symNumber++;
	}
	
	public boolean sign(){
		return sign;
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
	
	public String toString(){
		StringBuffer s = new StringBuffer(symbol + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return sign? s.toString() : "~" + s.toString();
	}
	
	/**
	 * Two Predicates are equals iff they have 
	 * the same signature and the same term inside.
	 */
	public boolean equals(Object obj){
		if(this == obj)
			return true;
		if(obj instanceof Literal){
			Literal p = (Literal) obj;
			if(this.getSymbol().equals(p.getSymbol()) && this.sign()==p.sign() && this.nArgs()==p.nArgs()){
				boolean same=true;
				for(int i=0; same && i<this.nArgs(); i++)
					same = this.getArgs().get(i).equals(p.getArgs().get(i));
				return same;
			}
		}
		return false;
	}
	
	/**
	 * Two predicate are opposite  
	 * 
	 * @param p
	 * @return
	 */
	public boolean isOpposite(Literal p){
		if(this.getSymbol().equals(p.getSymbol()) && this.sign()!=p.sign() && this.nArgs()==p.nArgs()){
			boolean opposite=true;
			for(int i=0; opposite && i<this.nArgs(); i++)
				opposite = this.getArgs().get(i).equals(p.getArgs().get(i));
			return opposite;
		}
		return false;
	}
}
