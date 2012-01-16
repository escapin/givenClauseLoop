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
		return new Literal(lit.getSymbol(), lit.sign(), substitute(lit.getArgs(), sigma));
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
		for(Variable v: sigma.keySet())
			for(Term t: args)
				newArgs.add(substitute(v, sigma.get(v), t));
		return newArgs;
	}
	
	/**
	 * Substitute with the term 'substitution' all the occurrences of variable 'v' in term 'toSubstitute'.
	 * @param v
	 * @param substitution
	 * @param toSubstitute
	 * @return
	 */
	public static Term substitute(Variable v, Term substitution, Term toSubstitute){
		if(toSubstitute instanceof Constant)
			return toSubstitute;
		 else if(toSubstitute instanceof Variable) 
			return (toSubstitute.equals(v))? substitution : toSubstitute;
		 else {  //if(toSubstitute instanceof Function){
			List<Term> args=new LinkedList<Term>();
			Term t;
			boolean newObj=false; // true iff a new function must be created
			for(Term tArg: ((Function)toSubstitute).getArgs()){
				newObj = ((t=substitute(v, substitution, tArg)) != tArg) | newObj;
				/*
				 * t=substitute(v, substitution, tArg);
				 * if (!newObj)	
				 * 	newObj= t != tArg;
				 */
				args.add(t);
			}
			if(newObj){ // true iff a new function must be created
				return new Function(toSubstitute.getSymbol(), args);
			}
			else
				return toSubstitute;
		}
	}
}
