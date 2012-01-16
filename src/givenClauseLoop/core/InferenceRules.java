package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;


public class InferenceRules {
	
	/**
	 * Generates all the binary resolvents of two clauses.
	 *  
	 * @param c1 the first clause
	 * @param c2 the second clause
	 * @return set of all the binary resolvents
	 */
	public static AbstractQueue<Clause> binaryResolution(Clause c1, Clause c2){
		AbstractQueue<Clause> resolvents= new PriorityQueue<Clause>();
		Map<Variable, Term> sigma;
		Collection<Literal> lMap;
		for(Literal l1: c1.getLiterals())
			if( (lMap=c2.getLitMap().get(l1.sign()? "~": "" + l1.getSymbol())) != null )
			for(Literal l2: lMap) 
				// iter on all the opposite predicate in the second clause c2
				if( (sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs(), false)) != null)
					resolvents.add(createResolvent(c1, l1, c2, l2, sigma));
		return resolvents;
	}
	
	/**
	 * Generates all the factors of the clause.
	 *  
	 * @param c 
	 * @return set of all the factors
	 */
	public static AbstractQueue<Clause> factorisation(Clause c){
		AbstractQueue<Clause> factors= new PriorityQueue<Clause>();
		Map<Variable, Term> sigma;
		Collection<Literal> lMap; 
		for(Literal l1: c.getLiterals())
			if( (lMap=c.getLitMap().get(l1.sign()? "": "~" + l1.getSymbol())) != null )
				for(Literal l2: lMap)
					// iters on all the predicates with than name in this clause
					if( (sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs(), true)) != null)
						factors.add(createFactor(c, l2, sigma));
		return factors;
	}
	
	private static Clause createResolvent(Clause c1, Literal l1, Clause c2, Literal l2, Map<Variable, Term> sigma){
		Clause newClause = new Clause();
		Set<Variable> vars=new HashSet<Variable>();
		Literal lTemp;
		for(Literal l3: c1.getLiterals())
			if(l1!=l3){
				lTemp=Substitution.substitute(l3, sigma);
				vars.addAll(findVariables(lTemp.getArgs()));
				newClause.addLiteral(lTemp);
			}	
		for(Literal l4: c1.getLiterals())
			if(l2!=l4){
				lTemp=Substitution.substitute(l4, sigma);
				vars.addAll(findVariables(lTemp.getArgs()));
				newClause.addLiteral(lTemp);
			}
		newClause.setVariables(vars);
		return newClause;
	}
	
	private static Clause createFactor(Clause c, Literal lit, Map<Variable, Term> sigma){
		Clause newClause = new Clause();
		Set<Variable> vars=new HashSet<Variable>();
		Literal lTemp;
		for(Literal l1: c.getLiterals())
			if(l1!=lit){
				lTemp=Substitution.substitute(l1, sigma);
				vars.addAll(findVariables(lTemp.getArgs()));
				newClause.addLiteral(lTemp);
			}	
		newClause.setVariables(vars);
		return newClause;
	}

	public static Collection<Variable> findVariables(Clause c){
		Set<Variable> vars=new HashSet<Variable>();
		for(Literal lit: c.getLiterals())
			vars.addAll(findVariables(lit.getArgs()));
		return vars;
	}
	
	private static Set<Variable> findVariables(List<Term> arg){
		Set<Variable> vars= new HashSet<Variable>();
		for(Term t: arg)
			if(t instanceof Variable)
				vars.add((Variable)t);
			else if(t instanceof Function)
				vars.addAll(findVariables(((Function) t).getArgs()));
		return vars;
	}
}
