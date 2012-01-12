package givenClauseLoop.core;

import java.util.*;

import givenClauseLoop.bean.*;

public class Substitution {
	
	/**
	 * Given a substitution σ and a list of terms, it apllies σ to 
	 * that list. If one o more fixed elements will be created, they
	 * will be added to fixEl map.
	 * It return a new object List<Term> with the term substituted.
	 *  
	 * @param sigma the substitution
	 * @param args 	the list of terms
	 * @param fixEl the current map with fixed elements
	 * @return a new List<Term> in which the substitution has been applied
	 */
	public static List<Term> substitute(Map<Variable, Term> sigma, List<Term> args, Map<String, FixedElement> fixEl){
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
	 * @param fixEl
	 * @return
	 */
	public static Term substitute(Variable v, Term substitution, Term toSubstitute){ //, Map<String, FixedElement> fixEl){
		if(toSubstitute instanceof Constant)
			return toSubstitute;
		 else if(toSubstitute instanceof Variable) 
			return (toSubstitute.equals(v))? substitution : toSubstitute;
		 else {  //if(toSubstitute instanceof Function){
			List<Term> args=new LinkedList<Term>();
			for(Term tArg: ((Function)toSubstitute).getArgs())
				args.add(substitute(v, substitution, tArg));
			Function f=new Function(toSubstitute.getSymbol());
			f.setArgs(args);
			return f;
		}	
	}
}
