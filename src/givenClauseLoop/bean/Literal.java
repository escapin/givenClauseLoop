package givenClauseLoop.bean;

import java.util.*;

public class Literal extends FOLNode implements FOLNodeArg {

	private boolean sign;
	
	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Literal(String name, boolean sign, List<Term> args){
		super.name=name;
		this.sign=sign;
		
		if(args==null)
			this.args=new ArrayList<Term>(0);
		else{
			this.args=args;
			for(Term t: this.args)
				symNumber += t.nSymbols();
		}
	}
	
	public boolean sign(){
		return sign;
	}
	
	
	public List<Term> getArgs(){
		return args;
	}
	
	public int nArgs(){
		return (args==null)? 0 : args.size();
	}
	
	public String toString(){
		if(args.size()==0)
			return sign? name : "~" + name;
		
		StringBuffer s = new StringBuffer(name + "(");
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
			if(this.getName().equals(p.getName()) && this.sign()==p.sign() && this.nArgs()==p.nArgs()){
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
	 * @param lit
	 * @return
	 */
	public boolean isOpposite(Literal lit){
		if(lit!=null && name.equals(lit.getName()) && sign!=lit.sign() && this.nArgs()==lit.nArgs()){
			for(int i=0; i<this.nArgs(); i++)
				if( !( this.getArgs().get(i).equals(lit.getArgs().get(i)) ) )
					return false;		
			return true;
		}
		return false;
	}
	
	public Literal clone(Map<Variable, Variable> varMap){
		List<Term> newArgs=new ArrayList<Term>();
		for(Term t: this.getArgs())
			newArgs.add(t.clone(varMap));
		return new Literal(this.getName(), this.sign(), newArgs);
	}
}
