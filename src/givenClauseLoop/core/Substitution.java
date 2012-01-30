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
	 * @param varMap map that matches each old variable with the corresponding new one already created
	 * @return new literal that is the result of the substitution sigma
	 * applied to the literal inserted in input  
	 */
	public static Literal substitute(Literal lit, Map<Variable, Term> sigma, Map<Variable, Variable> varMap){
		return new Literal(lit.getName(), lit.sign(), substitute(lit.getArgs(), sigma, varMap));
	}
	
	
	/**
	 * Given a substitution σ and a list of terms, it applies σ to 
	 * that list. If one o more fixed elements will be created, they
	 * will be added to fixEl map.
	 * It return a new object List<Term> with the term substituted.
	 *  
	 * @param args 	the list of terms
	 * @param sigma the substitution
	 * @param varMap map that matches each old variable with the corresponding new one  already created
	 * @return a new List<Term> in which the substitution has been applied
	*/ 
	private static List<Term> substitute(List<Term> args, Map<Variable, Term> sigma, Map<Variable, Variable> varMap){
		List<Term> newArgs=new ArrayList<Term>(args.size());
		for(Term t: args)
			newArgs.add(substitute(t, sigma, varMap));
		return newArgs;
	}
	
	/**
	 * Given a substitution σ and a term, it applies σ to 
	 * that term.
	 * It return a new object Term with the term substituted.
	 *  
	 * @param toSubstitute term to whom you apply the substitution
	 * @param sigma the substitution
	 * @param varMap map that matches each old variable with the corresponding new one  already created
	 * @return a new List<Term> in which the substitution has been applied
	 */
	public static Term substitute(Term toSubstitute, Map<Variable, Term> sigma, Map<Variable, Variable> varMap){
		if (toSubstitute instanceof Constant)
			return toSubstitute;
		else if (toSubstitute instanceof Variable){
			Term tNew;
			return ((tNew=sigma.get((Variable) toSubstitute))!=null)? tNew : toSubstitute.clone(varMap); 
		}
		else //if(toSubstitute instanceof Function){
			return new Function(toSubstitute.getName(), substitute(((Function) toSubstitute).getArgs(), sigma, varMap));
	}
}
