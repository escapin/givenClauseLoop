package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.bean.Variable;


/**
 * @author Enrico Scapin
 *
 */
public class Clause implements Comparable<Clause>{
	/**
	 * Set of the clause's predicates
	 */
	Collection<Literal> literals;
	
	/**
	 * Map of the clause's variables 
	 */
	Collection<Variable> variables;
	
	/**
	 * Map that matches a predicate name (sign + symbol) with 
	 * a set of all the literals with that name.
	 * This allows to implement the inference rule more efficiently 
	 */
	Map<String, Collection<Literal>> litMap;
	
	int symNumber;
	
	public Clause(){
		literals=new HashSet<Literal>();
		litMap=new HashMap<String, Collection<Literal>>();
		symNumber=0;
	}
	
	public void setVariables(Collection<Variable> setVar){
		variables=setVar;
	}
	
	public void addLiteral(Literal l){
		literals.add(l);
		symNumber+=l.nSymbols();
		String signature = ((l.sign())? "": "~") + l.getSymbol();
		Collection<Literal> setLit = litMap.get(signature);
		if(setLit==null){ // we have to create a new set
			setLit=new HashSet<Literal>();
			litMap.put(signature, setLit);
		} /* else{ // checking for tautology
			 for(Predicate l1: setLit)
				 if(l.isOpposite(l1))
					 isTautology=true;
			}*/	
		setLit.add(l);
	}
	
	public Map<String, Collection<Literal>> getLitMap(){
		return litMap;
	}
	
	public Collection<Literal> getLiterals(){
		return literals;
	}

	
	/*
	 * The set of variables of that formula
	 * 
	 * @return the variables' set
	 */
	public Collection<Variable> getVariables(){
		return variables;
	}

	 public int nSymbols(){
		return symNumber;
	}

	public int nLiterals(){
		return literals.size();
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer();
		for(Literal p: literals)
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
		Collection<Literal> setLit;
		for(Literal l1: literals){
			setLit = litMap.get( ((l1.sign())? "~": "") + l1.getSymbol() ); // the opposite
			for(Literal l2: setLit)
				if(l1!=l2 && l1.isOpposite(l2))
					return true;
		}
		return false;
	}
	
	public boolean subsumes(Clause D){
		return false;
	}
	/*
		// INIZIO ALGORITMO CHANG LEE pag 95
		if(!(this == D) && this.nLiterals()<=D.nLiterals()){
			Map<Variable, Term> theta = new HashMap<Variable, Term>();
			for(String k : D.getVariables().keySet())
				theta.put(D.getVariables().get(k), new Constant("##"));
			Set<Predicate> W = new HashSet<Predicate>();
			Predicate lTemp;
			for(Predicate lit : D.getLiterals()){
				lTemp = new Predicate(lit.getSymbol(), !lit.sign());
				lTemp.setArgs(Substitution.substitute(theta, lit.getArgs()));
				W.add(lTemp);
			}
			
		}
		return false;
	}	
		
	/*	if(this.nLiterals()<=c.nLiterals()){
			boolean predFound;
			Set<Predicate> setLit;
			for(Predicate l1: this.getLiterals()){
				setLit=c.getLitMap().get( ((l1.sign())? "": "~") + l1.getSymbol() );
				predFound=false;
				for(Predicate l2: setLit)
					if(Unifier.findLeftSubst(l1.getArgs(), l2.getArgs(), false)!=null){
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
	*/
	
	public boolean simplify(Literal l1){
		Collection<Literal> setLit = litMap.get( ((l1.sign())? "~": "") + l1.getSymbol() ); // the opposite
		for(Literal l2: setLit)
			if(Unifier.findLeftSubst(l1.getArgs(), l2.getArgs(), false)!= null){
				literals.remove(l2);
				setLit.remove(l2);
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
		return this.nSymbols()-f.nSymbols();
	}
	/**
	 * The equals() and hashCode() methods are inherited from object,
	 * since every time we create a new Clause object, it must be different
	 * from the others.
	 */
}