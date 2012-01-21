package givenClauseLoop.bean;

import java.util.*;

public class Literal extends FOLNode implements FOLNodeArg {

	private boolean sign;
	
	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Literal(String symbol, boolean sign, List<Term> args){
		super.symbol=symbol;
		this.sign=sign;
		if(!sign)	// because also the negation symbol "~" must be counted
			symNumber++;
		
		this.args=args;
		for(Term t: this.args){
			symNumber += t.nSymbols();
		}
	}
	
	public boolean sign(){
		return sign;
	}
	
	/**
	public void setArgs(List<Term> args){
		this.args=args;
		for(Term t: this.args){
			symNumber += t.nSymbols();
		}
	}
	*/
	public List<Term> getArgs(){
		return args;
	}
	
	public int nArgs(){
		return (args==null)? 0 : args.size();
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
				for(int i=0; i<this.nArgs(); i++)
					if ( !(this.getArgs().get(i).equals(p.getArgs().get(i)) ) )
						return false;
				return true;
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
		if(p!=null && symbol.equals(p.getSymbol()) && sign!=p.sign() && this.nArgs()==p.nArgs()){
			for(int i=0; i<this.nArgs(); i++)
				if( !( this.getArgs().get(i).equals(p.getArgs().get(i)) ) )
					return false;		
			return true;
		}
		return false;
	}
	
	public Literal clone(Map<Variable, Variable> varMap){
		List<Term> newArgs=new LinkedList<Term>();
		for(Term t: this.getArgs())
			newArgs.add(t.clone(varMap));
		return new Literal(this.getSymbol(), this.sign(), newArgs);
	}
}
