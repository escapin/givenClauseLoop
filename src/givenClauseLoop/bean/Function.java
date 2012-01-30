package givenClauseLoop.bean;

import java.util.*;

public class Function extends Term implements FOLNodeArg {

	/**
	 * The arguments of this predicate/function
	 */
	private List<Term> args=null;
	
	public Function(String name, List<Term> args){
		super.name=name;
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
			if(this.getName().equals(f.getName()) && this.nArgs()==f.nArgs()){
				for(int i=0; i<this.nArgs(); i++)
					if( !(this.getArgs().get(i).equals(f.getArgs().get(i))) )
						return false;
				return true;
			}
		}
		return false;
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer(name + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return s.toString();
	}
	
	public Term clone(Map<Variable, Variable> varMap){
		List<Term> newArgs = new LinkedList<Term>();
		for(Term t: this.getArgs())
			newArgs.add(t.clone(varMap));
		return new Function(this.getName(), newArgs);
	}
}
