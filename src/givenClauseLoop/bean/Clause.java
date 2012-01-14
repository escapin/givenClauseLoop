package givenClauseLoop.bean;

import java.util.*;
import givenClauseLoop.core.Unifier;


/**
 * @author Enrico Scapin
 *
 */
public class Clause implements Comparable<Clause>{
	Set<Predicate> literals;
	Map<String, Variable> variables;
	int symNumber;
	int litNumber;
	
	public Clause(Set<Predicate> literals, Map<String, Variable> variables, int symNumber){
		this.literals=literals;
		this.variables=variables;
		this.symNumber=symNumber;
	}
	
	public Set<Predicate> getAtoms(){
		return literals;
	}

	
	/*
	 * The set of variables of that formula
	 * 
	 * @return the variables' set
	 */
	public Map<String, Variable> getVariables(){
		return variables;
	}


	public int nSymbol(){
		return symNumber;
	}

	public int nLiteral(){
		return literals.size();
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer();
		for(Predicate p: literals)
			s.append(p.toString() + " | ");
		s.delete(s.length()-3, s.length());
		return s.toString();
	}
	
	/**
	 * Return true iff this clause is a tautology, i.e.
	 *  P | ~P | subCluause
	 * 
	 * @return true if is a tautology, false otherwise
	 */
	public boolean isTautology(){
		for(Predicate p1: literals)
			for(Predicate p2: literals)
				if(p1!=p2 && p1.isOpposite(p2))
					return true;
		return false;
	}
	
	public boolean subsumes(Clause c){
		if(this.nLiteral()<=c.nLiteral()){
			boolean predFound;
			for(Predicate p1: literals){
				predFound=false;
				for(Predicate p2: c.getAtoms())
					if(p1.getSymbol().equals(p2.getSymbol()) && p1.isPositive()==p2.isPositive() &&
						Unifier.findLeftSubst(p1.getArgs(), p2.getArgs(), false)!=null){
						predFound=true;
						break; // Predicate Found!
					}
				if(!predFound)
					return false;
			}
			return true;
		}
		return false;
	}

	/**
	 * Inconsistent with equality.
	 * Compare respect the number of symbols in these two formulae.
	 *
	 *@see java.lang.Comparable#compareTo ( )
	 *
	 */
	public int compareTo(Clause f){
		return this.nSymbol()-f.nSymbol();
	}
	/**
	 * The equals() and hashCode() methods are inherited from object,
	 * since every time we create a new Clause object, it must be different
	 * from the others.
	 */
}