package givenClauseLoop.bean;

import java.util.Set;

/**
 * @author Enrico Scapin
 *
 */
public class CNFformula implements Comparable<CNFformula>{
	Set<FOLNode> atoms;
	int symNumber;
	int litNumber;
	
	public CNFformula(Set<FOLNode> atoms, int symNumber, int litNumber){
		this.atoms=atoms;
		this.symNumber=symNumber;
		this.litNumber=litNumber;
	}
	
	public Set<FOLNode> getAtoms(){
		return atoms;
	}

	public int getSymNumber(){
		return symNumber;
	}

	public int getLitNumber(){
		return litNumber;
	}
	
	/**
	 * Inconsistent with equality.
	 * Compare respect the number of symbols in these two formulae.
	 *
	 *@see java.lang.Comparable#compareTo ( )
	 *
	 */
	public int compareTo(CNFformula f){
		return this.symNumber-f.getSymNumber();
	}
	/**
	 * The equals() and hashCode() methods are inherited from object,
	 * since every time we create a new CNFformula object, it must be different
	 * from the others.
	 */
}