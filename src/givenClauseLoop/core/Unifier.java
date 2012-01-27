package givenClauseLoop.core;

import java.util.*;

import givenClauseLoop.bean.*;

/**
 * @author Enrico Scapin
 *
 */
public class Unifier {

	/**
	 * Returns a Map<Variable, Term> representing the most general unifier, MGU (i.e. 
	 * a set of variable/term pairs) or null which is used to indicate a failure to
	 * find MGU.
	 * 
	 * @param arg1 the terms' list of the first predicate
	 * @param arg2 the terms' list of the second predicate 
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to find MGU.
	 */
	public static Map<Variable, Term> findMGU(List<Term> arg1, List<Term> arg2){
		Map<Variable, Term> sigma = new HashMap<Variable, Term>();
		sigma = unify(arg1, arg2, sigma);
		return cascadeSubstitution(sigma);
	}
	
	
	/**
	 * After you have been created the substitution sigma, you need to "cascade" 
	 * this substitution because there should be instances of variables (that are members 
	 * of sigma's domain) that are also in the codomain's terms. In this case you have to
	 * replace all the occurences of these variables with the corresponding term presents
	 * in the substitution.  
	 * 
	 * @param sigma the substitution that must be "cascaded"
	 * @return the cascaded substitution
	 */
	private static Map<Variable, Term> cascadeSubstitution(Map<Variable, Term> sigma){
		if(sigma==null)
			return null;
		Term tNew;
		for(Variable v1: sigma.keySet())
			for(Variable v2: sigma.keySet())
				if(!v1.equals(v2) && v1.equals(sigma.get(v2))){
						tNew=sigma.get(v1);
						if(occurCheck(v2, tNew, sigma))
							return null;
						sigma.put(v2, tNew);
				}
		return sigma;
	}
	
	
	
	/**
	 * Returns a Map<Variable, Term> representing the substitution (i.e. a set
	 * of variable/term pairs) or null which is used to indicate a failure to
	 * unify.
	 * 
	 * @param arg1 the terms' list of the first predicate
	 * @param arg2 the terms' list of the first predicate 
	 * @param sigma the substitution built up so far
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	private static Map<Variable, Term> unify(List<Term> arg1, List<Term> arg2, Map<Variable, Term> sigma) {
		if (sigma == null) {
			return null;
		} else if (arg1.size() != arg2.size()) {
			return null;
		} else if (arg1.size() == 0 && arg2.size() == 0) {
			return sigma;
		} else if (arg1.size() == 1 && arg2.size() == 1) {
			return unify(arg1.get(0), arg2.get(0), sigma);
		} else {
			return unify(arg1.subList(1, arg1.size()), arg2.subList(1, arg2.size()),
					unify(arg1.get(0), arg2.get(0), sigma));
		}
	}
	
	
	/**
	 * Returns a Map<Variable, Term> representing the substitution (i.e. a set
	 * of variable/term pairs) or null which is used to indicate a failure to
	 * unify.
	 * 
	 * @param x a term
	 * @param y a term 
	 * @param sigma the substitution built up so far
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	private static Map<Variable, Term> unify(Term x, Term y,
			Map<Variable, Term> sigma) {
		if (sigma == null) {
			return null;
		} else if (x.equals(y)) {
			// if the two term are equals return the substitution without any modification
			return sigma;
		} else if (x instanceof Variable) {
			// else if VARIABLE?(x) then return UNIFY-VAR(x, y, sigma)
			return unifyVar((Variable) x, y, sigma);
		} else if (y instanceof Variable) {
			// else if VARIABLE?(y) then return UNIFY-VAR(y, x, sigma)
			return unifyVar((Variable) y, x, sigma);
		} else if (x instanceof Function && y instanceof Function) {
			// else if FUNCTION?(x) and FUNCTION?(y) then
			if(x.getSymbol().equals(y.getSymbol()))		// the function's name must be the same
				return unify(((Function) x).getArgs(), ((Function) y).getArgs(), sigma);
			else // CLASH!!!
				return null;
		} else {
			return null;
		}
	}
	
	/**
	 * Makes the unification between a variable and a term if it is possible,
	 * return null otherwise.
	 * The term must not be equal to the variable, otherwise return null!
	 * 
	 * @param var	the variable that will be part of the substitution's domain
	 * @param x		the term that will be the image of var in the substitution
	 * @param sigma	the substitution
	 * @return the substitution
	 */
	private static Map<Variable, Term> unifyVar(Variable var, Term x,
			Map<Variable, Term> sigma) {
		if (sigma.keySet().contains(var)) {
			// if {var/val} belongs to sigma then return UNIFY(val, x, sigma)
			return unify(sigma.get(var), x, sigma);
		} else if (sigma.keySet().contains(x)) {
			// else if {x/val} belongs to sigma then return UNIFY(var, val, sigma)
			return unify(var, sigma.get(x), sigma);
		} else if (occurCheck(var, x, sigma)) { // OCCUR CHECK!!!
			return null;
		} else {
			sigma.put(var, x);
			return sigma;
		}
	}
	
	/**
	 * 
	 * Occur Check happens: (1) if x is equals to y (or a variables' chain makes them equal);
	 * (2) when you should make a substitution between a variable and a term
	 * that contain the same variable at different nested level of a function.
	 * e.g.  var <-- g(var)
	 * If an occur check exists, this method finds it. 
	 * 
	 * @param var	the variable that should be substituted
	 * @param x		the term that should be substituted instead of var
	 * @param sigma	the substitution
	 * @return true if an occur check exists, false otherwise.
	 */
	private static boolean occurCheck(Variable var, Term x, Map<Variable, Term> sigma) {
		if (x instanceof Variable && var.equals(x)) { // (1) you cannot unify the same variable 
			return true;
		} else if (x instanceof Variable && sigma.containsKey(x)){
			// (1) recursion in case of variables' chains
			return occurCheck(var, sigma.get(x), sigma);
		} else if (x instanceof Function) {
			// (2) same var in different nested level of a function
			Function f = (Function) x;
			for (Term t : f.getArgs())
				if (occurCheck(var, t, sigma))
					return true;
		}
		return false;
	}
	
	
	/**
	 * Returns a Map<Variable, Term> representing the left-substitution (i.e. a set
	 * of variable/term pairs) or null which is used to indicate a failure to
	 * unify.
	 *  
	 * @param arg1 the terms' list of the first predicate
	 * @param arg2 the terms' list of the first predicate 
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	public static Map<Variable, Term> findLeftSubst(List<Term> arg1, List<Term> arg2){
		if(arg1==null || arg2==null || arg1.size()!=arg2.size())
			return null;
		else{
			Map<Variable, Term> sigma = new HashMap<Variable, Term>();
			for(int i=0;i<arg1.size();i++)
				sigma=unifyLeft(arg1.get(i), arg2.get(i), sigma);
			return sigma;
		}
	}
	
	
	/**
	 * Returns a Map<Variable, Term> representing the left-substitution (i.e. a set
	 * of variable/term pairs) or null which is used to indicate a failure to
	 * unify.
	 * 
	 * @param x a term
	 * @param y a term 
	 * @param sigma the substitution built up so far
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	private static Map<Variable, Term> unifyLeft(Term x, Term y,
			Map<Variable, Term> sigma) {
		if (sigma == null) {
			return null;
		} else if (x.equals(y)) {
			// if the two term are equals return the substitution without any modification
			return sigma;
		} else if (x instanceof Variable){
			// && !occurCheck((Variable)x, y, sigma) ) {
			//sigma.put((Variable) x, y);
			//return sigma;
			Term t;
			if((t=sigma.get((Variable) x))==null)
				sigma.put((Variable) x, y);
			else if(!t.equals(y))	// you should unify these two term, but the same variable is already used 
				// to unify another term different from y
				return null;
			return sigma;
			
		} else if (x instanceof Function && y instanceof Function) {
			if(x.getSymbol().equals(y.getSymbol())){		// the function's name must be the same
				for(int i=0;i<((Function)x).nArgs();i++)
					sigma=unifyLeft(((Function)x).getArgs().get(i), ((Function)y).getArgs().get(i), sigma);
				return sigma;
			} else // CLASH!!!
				return null;
		} else {
			/* - two different constant
			 * - left(constant) && ( right(variable) || right(function) ) 
			 * - left(function) && ( right(constant) || right(variable) )
			 */
			return null;
		}
	}
	
}



/**


	/*private static Map<Variable, Term> cascadeSubstitution(Map<Variable, Term> sigma){
	if(sigma==null)
		return null;
	
	Term t, t2;
			
	for(Variable v1: sigma.keySet())
		for(Variable v2: sigma.keySet())
			if(!v1.equals(v2)){
				t2=sigma.get(v2);
				t=substitute(v1, sigma.get(v1), t2);
				if(t!=t2){
					if(occurCheck(v2, t, sigma))
						return null;
					sigma.put(v2, t);
				}		
			}
	return sigma;
}

	/**
	 * Substitute with the term 'substitution' all the occurrences of variable 'v' in term 'toSubstitute'.
	 * @param v
	 * @param substitution
	 * @param toSubstitute
	 * @return

	private static Term substitute(Variable v, Term substitution, Term toSubstitute){
		if(toSubstitute instanceof Constant)
			return toSubstitute;
		 else if(toSubstitute instanceof Variable) 
			return (toSubstitute.equals(v))? substitution : toSubstitute;
		 else {  //if(toSubstitute instanceof Function){
			List<Term> newArgs=new ArrayList<Term>(((Function) toSubstitute).nArgs());
			Term tNew;
			boolean newFun=false; // true iff a new function must be created
			for(Term tArg: ((Function)toSubstitute).getArgs()){
				newFun = ((tNew=substitute(v, substitution, tArg)) != tArg) || newFun;
				/*
				 * t=substitute(v, substitution, tArg);
				 * if (!newObj)	
				 * 	newObj= t != tArg;
				 
				newArgs.add(tNew);
			}
			return newFun? new Function(toSubstitute.getSymbol(), newArgs) : toSubstitute;
		}
	}

public static Map<Variable, Term> composition(Map<Variable, Term> sigma, Map<Variable, Term> theta){
if(sigma!=null && theta!=null){
	Map<Variable, Term> composition=new HashMap<Variable, Term>();
	Term tNew;
	for(Variable v: sigma.keySet()){
		tNew=substitute(sigma.get(v), theta);
		if(occurCheck(v, tNew, composition))
			return null;
		if(!v.equals(tNew))
			composition.put(v, tNew);	
	}
	for(Variable v: theta.keySet())
		if(!sigma.containsKey(v))
			composition.put(v, theta.get(v));
	return composition;
}
return null;
}

private static Term substitute(Term toSubstitute, Map<Variable, Term> sigma){
if (toSubstitute instanceof Constant)
	return toSubstitute;
else if (toSubstitute instanceof Variable){
	Term tNew;
	return ((tNew=sigma.get((Variable) toSubstitute))!=null)? tNew : toSubstitute; 
}
else{//if(toSubstitute instanceof Function){
	List<Term> newArgs=new ArrayList<Term>(((Function) toSubstitute).getArgs());
	Term tNew;
	boolean newFun=false; // true iff a new function must be created
	for(Term tArg: ((Function)toSubstitute).getArgs()){
		newFun = ((tNew=substitute(tArg, sigma)) != tArg) || newFun;
		newArgs.add(tNew);
	}
	return newFun? new Function(toSubstitute.getSymbol(), newArgs) : toSubstitute;
}
*/