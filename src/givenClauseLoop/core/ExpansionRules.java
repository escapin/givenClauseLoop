package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;


public class ExpansionRules {
	
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
		Set<Literal> lMap;
		for(Literal l1: c1.getLiterals())
			if( (lMap=c2.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
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
		Set<Literal> lMap; 
		Map<Literal, Literal> alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
		for(Literal l1: c.getLiterals())
			if( (lMap=c.getLitMap().get( (l1.sign()? "": "~") + l1.getSymbol()) ) != null)
				for(Literal l2: lMap)
					// iters on all the predicates with than name in this clause
					if( l1!=l2 && alreadyFactorised.get(l2)!=l1 && 
						(sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs(), true)) != null){
						/*
						System.out.println(c);
						StringBuffer s = new StringBuffer();
						for(Variable v : sigma.keySet())
							s.append( v + "<--" + sigma.get(v) + " , ");
						System.out.println(s);
						System.out.println("\t" + createFactor(c, l2, sigma) + "\n");
						*/
						factors.add(createFactor(c, l2, sigma));
						alreadyFactorised.put(l1, l2);
					}
		return factors;
	}
	
	/**
	 * Create a new clause that it is the factor of the clause inserted as input.
	 * The new clause will have one literal less than the clause inserted as input.
	 * 
	 * @param c the clause from which find the factor 
	 * @param lit the literal of c clause that will not be considered
	 * @param sigma the substitution
	 * @return a new clause that is the factor of c clause
	 */
	public static Clause createFactor(Clause c, Literal lit, Map<Variable, Term> sigma){
		if(c.getLiterals().contains(lit)){
			// change the Codomain of the substitution in a such way to have fresh variables 
			Map<Variable, Variable> varMap = new HashMap<Variable, Variable>();
			for(Variable v: sigma.keySet())
				sigma.put(v, sigma.get(v).clone(varMap));
			// create a new clause that becomes the factor
			Clause newClause = new Clause();
			for(Literal l1: c.getLiterals())
				if(l1!=lit)
					newClause.addLiteral(Substitution.substitute(l1, sigma, varMap));
			return newClause;
		}
		return null;
	}
	
	/**
	 * Create a new clause that it is the binary resolvent of the two clauses c1, c2 inserted as input.
	 * The new clause will have two literal less than the union of literals of the two clauses.
	 * 
	 * @param c1 the first clause
	 * @param l1 the first clause's literal that will not be considered
	 * @param c2 the second clause
	 * @param l2 the second clause's literal that will not be considered
	 * @param sigma the substitution
	 * @return a new clause that is the binary resolvent of c1, c2 clauses
	 */
	public static Clause createResolvent(Clause c1, Literal l1, Clause c2, Literal l2, Map<Variable, Term> sigma){
		// change the Codomain of the substitution in a such way to have fresh variables 
		Map<Variable, Variable> varMap = new HashMap<Variable, Variable>();
		for(Variable v: sigma.keySet())
			sigma.put(v, sigma.get(v).clone(varMap));
		// create a new clause that becomes the factor
		Clause newClause = new Clause();
		for(Literal l3: c1.getLiterals())
			if(l1!=l3)
				newClause.addLiteral(Substitution.substitute(l3, sigma, varMap));
		for(Literal l4: c2.getLiterals())
			if(l2!=l4)
				newClause.addLiteral(Substitution.substitute(l4, sigma, varMap));
		return newClause;
	}
}
