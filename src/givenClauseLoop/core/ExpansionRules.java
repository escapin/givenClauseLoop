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
	public static Queue<Clause> binaryResolution(Clause c1, Clause c2){
		Queue<Clause> resolvents= new PriorityQueue<Clause>();
		Clause cNew;
		if(c1!=c2){
			Set<Literal> lMap;
			for(Literal l1: c1.getLiterals())
				if( (lMap=c2.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
					for(Literal l2: lMap){
						cNew=binaryResolution(c1, l1, c2, l2);
						if(cNew!=null)
							resolvents.add(cNew);
					}
		}
		return resolvents;
	}
	
	/**
	 * Generates a binary resolvent of two clauses.
	 *  
	 * @param c1 the first clause
	 * @param l1 the first clause's literal with which we should find a M.G.U. 
	 * @param c2 the second clause
	 * @param l2 the second clause's literal with which we should find a M.G.U
	 * @return the binary resolvent if a M.G.U. is found, null otherwise
	 */
	public static Clause binaryResolution(Clause c1, Literal l1, Clause c2, Literal l2){
		if(c1!=c2){
			Map<Variable, Term> sigma;
			if( (sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs())) != null)
			{
				/*System.out.println(l1 + "\t\t" + l2);
				for(Variable v: sigma.keySet())
					System.out.println(v + " <-- " + sigma.get(v));
				System.out.println();*/
				return createResolvent(c1, l1, c2, l2, sigma);			
			}
				
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
	 * @return a new clause that it is the binary resolvent of c1, c2 clauses
	 */
	public static Clause createResolvent(Clause c1, Literal l1, Clause c2, Literal l2, Map<Variable, Term> sigma){
		// change the Codomain of the substitution in a such way to have fresh variables 
		Map<Variable, Variable> varMap = new HashMap<Variable, Variable>();
		for(Variable v: sigma.keySet())
			sigma.put(v, sigma.get(v).clone(varMap));
		// create a new clause that becomes the factor
		Clause newClause = new Clause();
		for(Literal l3: c1.getLiterals())
			if(l3!=l1)
				newClause.addLiteral(Substitution.substitute(l3, sigma, varMap));
		for(Literal l4: c2.getLiterals())
			if(l4!=l2)
				newClause.addLiteral(Substitution.substitute(l4, sigma, varMap));
		return newClause;
	}
	
	
	/**
	 * Generates all the factors of the clause.
	 *  
	 * @param c 
	 * @return set of all the factors
	 */
	public static Queue<Clause> factorisation(Clause c){
		Queue<Clause> factors= new PriorityQueue<Clause>();
		Clause cNew;
		Set<Literal> lMap; 
		Map<Literal, Literal> alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
		for(Literal l1: c.getLiterals())
			if( (lMap=c.getLitMap().get( (l1.sign()? "": "~") + l1.getSymbol()) ) != null)
				for(Literal l2: lMap){
					cNew=factorisation(c, l1, l2, alreadyFactorised);
					if(cNew!=null){
						factors.add(cNew);
					}
				}
					
		return factors;
	}
	
	/**
	 * 
	 * @param c the clause from which you should generate a new factor
	 * @param l1 the first clause's literal with which we should find a M.G.U.
	 * @param l2 the second clause's literal with which we should find a M.G.U.
	 * @param alreadyFactorised
	 * @return a new factor if it can be found with l1 and l2, null otherwise
	 */
	public static Clause factorisation(Clause c, Literal l1, Literal l2, Map<Literal, Literal> alreadyFactorised){
		Map<Variable, Term> sigma;
		// iter on all the predicates with than name in this clause
		if( l1!=l2 && alreadyFactorised.get(l2)!=l1 && 
			(sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs())) != null){
			/*
			System.out.println(c);
			StringBuffer s = new StringBuffer();
			for(Variable v : sigma.keySet())
				s.append( v + "<--" + sigma.get(v) + " , ");
			System.out.println(s);
			System.out.println("\t" + createFactor(c, l2, sigma) + "\n");
			*/
			alreadyFactorised.put(l1, l2);
			return createFactor(c, l2, sigma);
		}
		return null;
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
			// change the co-domain of the substitution in a such way to have fresh variables 
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
	
	
}
