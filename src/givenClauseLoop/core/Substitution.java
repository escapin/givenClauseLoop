package givenClauseLoop.core;

import java.util.*;

import givenClauseLoop.bean.*;

public class Substitution {
	
	/**
	 * Create a new literal that is the result of the substitution sigma
	 * applied to the literal inserted in input.
	 * 
	 * @param lit the literal to whom we applies the substitution 
	 * @param sigma the substitution
	 * @return new literal that is the result of the substitution sigma
	 * applied to the literal inserted in input  
	 */
	public static Literal substitute(Literal lit, Map<Variable, Term> sigma){
		List<Term> newArgs=new LinkedList<Term>();
		boolean newLit=false; // true iff a new predicate must be created
		Term newTerm;
		for(Term tArg: lit.getArgs()){
			newLit = ( (newTerm=substitute(tArg, sigma)) != tArg ) | newLit;
			newArgs.add(newTerm);
		}
		return newLit? new Literal(lit.getSymbol(), lit.sign(), newArgs) : lit;
	}
	
	/**
	 * Given a substitution σ and a list of terms, it applies σ to 
	 * that list. If one o more fixed elements will be created, they
	 * will be added to fixEl map.
	 * It return a new object List<Term> with the term substituted.
	 *  
	 * @param args 	the list of terms
	 * @param sigma the substitution
	 * @return a new List<Term> in which the substitution has been applied
	 */
	public static List<Term> substitute(List<Term> args, Map<Variable, Term> sigma){
		List<Term> newArgs=new LinkedList<Term>();
		for(Term t: args)
			newArgs.add(substitute(t, sigma));
		return newArgs;
	}
	
	public static Term substitute(Term toSubstitute, Map<Variable, Term> sigma){
		if (toSubstitute instanceof Constant)
			return toSubstitute;
		else if (toSubstitute instanceof Variable){
			Term tNew;
			return ( (tNew=sigma.get((Variable) toSubstitute))==null )? toSubstitute: tNew ; 
		}
		else { //if(toSubstitute instanceof Function){
			List<Term> newArgs=new LinkedList<Term>();
			Term tNew;
			boolean newFun=false; // true iff a new function must be created
			for(Term tArg: ((Function)toSubstitute).getArgs()){
				newFun = ((tNew=substitute(tArg, sigma)) != tArg) | newFun;
				/*
				 * tNew=substitute(tArg, sigma);
				 * if (!newObj)	
				 * 	newObj= (tNew!=tArg);
				 */
				newArgs.add(tNew);
			}
			return newFun? new Function(toSubstitute.getSymbol(), newArgs) : toSubstitute;			
		}
	}
}
