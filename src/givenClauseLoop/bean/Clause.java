package givenClauseLoop.bean;

<<<<<<< HEAD
import java.util.Set;
=======
import java.util.*;
import givenClauseLoop.core.Unifier;
>>>>>>> variable

/**
 * @author Enrico Scapin
 *
 */
public class Clause implements Comparable<Clause>{
	Set<Predicate> atoms;
<<<<<<< HEAD
	int symNumber;
	int litNumber;
	
	public Clause(Set<Predicate> atoms, int symNumber, int litNumber){
		this.atoms=atoms;
		this.symNumber=symNumber;
		this.litNumber=litNumber;
=======
	Map<String, Variable>  variables;
	int symNumber;
	
	public Clause(Set<Predicate> atoms, Map<String, Variable> variables, int symNumber){
		this.atoms=atoms;
		this.variables=variables;
		this.symNumber=symNumber;
>>>>>>> variable
	}
	
	public Set<Predicate> getAtoms(){
		return atoms;
	}
<<<<<<< HEAD
=======
	
	/*
	 * The set of variables of that formula
	 * 
	 * @return the variables' set
	 */
	public Map<String, Variable> getVariables(){
		return variables;
	}
>>>>>>> variable

	public int getSymNumber(){
		return symNumber;
	}

	public int getLitNumber(){
<<<<<<< HEAD
		return litNumber;
=======
		return atoms.size();
>>>>>>> variable
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer();
		for(Predicate p: atoms)
			s.append(p.toString() + " | ");
		s.delete(s.length()-3, s.length());
		return s.toString();
	}
<<<<<<< HEAD
=======
	
	/**
	 * Return true iff this clause is a tautology, i.e.
	 *  P | ~P | subCluause
	 * 
	 * @return true if is a tautology, false otherwise
	 */
	public boolean isTautology(){
		for(Predicate p1: atoms)
			for(Predicate p2: atoms)
				if(p1!=p2 && p1.isOpposite(p2))
					return true;
		return false;
	}
	
	public boolean subsumes(Clause c){
		if(this.getLitNumber()<=c.getLitNumber()){
			boolean predFound;
			for(Predicate p1: atoms){
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
	
	
>>>>>>> variable
	/**
	 * Inconsistent with equality.
	 * Compare respect the number of symbols in these two formulae.
	 *
	 *@see java.lang.Comparable#compareTo ( )
	 *
	 */
	public int compareTo(Clause f){
		return this.symNumber-f.getSymNumber();
	}
	/**
	 * The equals() and hashCode() methods are inherited from object,
<<<<<<< HEAD
	 * since every time we create a new CNFformula object, it must be different
=======
	 * since every time we create a new Clause object, it must be different
>>>>>>> variable
	 * from the others.
	 */
}