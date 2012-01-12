package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;

/**
 * @author Enrico Scapin
 *
 */
public class Unifier {

	public Unifier(){
	}
	
	
	/**
	 * Returns a Map<Variable, Term> representing the substitution (i.e. a set
	 * of variable/term pairs) or null which is used to indicate a failure to
	 * unify.
	 * 
	 * @param arg1 the terms' list of the first predicate
	 * @param arg2 the terms' list of the first predicate 
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	public  Map<Variable, Term> unify(List<Term> arg1, List<Term> arg2){
		Map<Variable, Term> sigma = new HashMap<Variable, Term>();
		sigma = unify(arg1, arg2, sigma);
		return cascadeSubstitution(sigma);
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
	private Map<Variable, Term> unify(List<Term> arg1, List<Term> arg2, Map<Variable, Term> sigma) {
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
	 * @param arg1 the terms' list of the first predicate
	 * @param arg2 the terms' list of the first predicate 
	 * @param sigma the substitution built up so far
	 * @return a Map<Variable, Term> representing the substitution (i.e. a set
	 *         of variable/term pairs) or null which is used to indicate a
	 *         failure to unify.
	 */
	private Map<Variable, Term> unify(Term x, Term y,
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
	private Map<Variable, Term> unifyVar(Variable var, Term x,
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
			/* we cannot simply do 'sigma.put(var, x);'
			 * we must execute the cascadeSubstituion method.
			 * See cascadeSubstitution method's documentation for more explanation.
			 */
			//cascadeSubstitution(var, x, sigma);
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
	private boolean occurCheck(Variable var, Term x, Map<Variable, Term> sigma) {
		if (x instanceof Variable && var.equals(x)) { // (1) you cannot unify the same variable 
			return true;
		} else if (x instanceof Variable && sigma.containsKey(x)) {
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
	 * Sometimes you get a substitution of the form σ = {z ← x, x ← a}
	 * Suppose you were to apply this substitution to p(z,x): the correct result is p(a,a).
	 * The reason is that you need to "cascade" the substitutions; if z takes the value x, 
	 * you need to make sure that you haven't constrained x to be some other value. 
	 * It would be incorrect to write p(x,a).
	 * This has particularly important consequences anytime you are trying to unify two expressions.
	 *
	 * σ = {z ← x, x ← a} must become σ = {z ← a, x ← a}
	 *
	 * @param var	the variable that must be substituted
	 * @param x		the term that must be substituted instead of var
	 * @param sigma	the substitution
	 */
	private Map<Variable, Term> cascadeSubstitution(Map<Variable, Term> sigma){
		if(sigma==null)
			return null;
		Term t1,t2;
		for(Variable v1: sigma.keySet())
			for(Variable v2: sigma.keySet())
				if(!v1.equals(v2)){
					t1=sigma.get(v1);
					t2=sigma.get(v2);
					if(t2 instanceof Variable && t2.equals(v1)){ 
						if(occurCheck(v2, t1, sigma))
							return null;
						else	// subscribe the term of v2 with t1
							sigma.put(v2, t1);					
					} else if(t2 instanceof Function){
						// substitute with t1 all the occurrence of v1 in t2
						sigma.put(v2, Substitution.substitute(v1, t1, t2));
						if(occurCheck(v2, t2, sigma))
							return null;
					}
				}
		return sigma;		
	}
	
	/*
	 Map<Variable, Variable> inverseSigma=new HashMap<Variable, Variable>();
	 private void cascadeSubstitution(Variable var, Term x, Map<Variable, Term> sigma) {
		Variable v;
		if((v=inverseSigma.get(var)) !=null)
			sigma.put(v, x);
		
		if(x instanceof Variable){
			Term t=sigma.get(x);
			if(t!=null) // instead of x, var must get the x's image
				sigma.put(var, t);
			else // there is not 'x' variable in substitution's domain
				sigma.put(var, x);
			inverseSigma.put((Variable) x, var);
		}
		else
			sigma.put(var, x);
		*/
		/*
		for (Variable v : sigma.keySet()) {
			sigma.put(v, _substVisitor.subst(sigma, sigma.get(v)));
		}
		// Ensure Function Terms are correctly updates by passing over them
		// again. Fix for testBadCascadeSubstitution_LCL418_1()
		for (Variable v : sigma.keySet()) {
			Term t = sigma.get(v);
			if (t instanceof Function) {
				sigma.put(v, _substVisitor.subst(sigma, t));
			}
		}
		*/
	//}
}