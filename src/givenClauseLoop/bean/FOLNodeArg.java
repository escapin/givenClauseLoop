package givenClauseLoop.bean;

import java.util.List;

public abstract class FOLNodeArg implements FOLNode{
	
	/**
	 * The name of the FOL symbol
	 */
	protected String symbol;
	
	/**
	 * The number of the symbols in this node
	 * (at least is one)
	 */
	protected int symNumber=1;
	
	/**
	 * The arguments of this predicate/function
	 */
	protected List<Term> args=null;
	
	
	public String getSymbol(){
		return symbol;
	}
	
	public int getSymNumber(){
		return symNumber;
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
}
