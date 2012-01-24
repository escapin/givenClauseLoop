package givenClauseLoop.core;

import java.util.*;

import givenClauseLoop.bean.*;


/**
 * @author Enrico Scapin
 *
 */
public class Clause implements Comparable<Clause>{
	/**
	 * Set of the clause's predicates
	 */
	Set<Literal> literals;
	
	
	/**
	 * Map that matches a predicate name (sign + symbol) with 
	 * a set of all the literals with that name.
	 * This allows to implement the inference rule more efficiently 
	 */
	Map<String, Set<Literal>> litMap;
	
	int symNumber;
	
	public Clause(){
		literals=new HashSet<Literal>();
		litMap=new HashMap<String, Set<Literal>>();
		symNumber=0;
	}
	
	public void addLiteral(Literal l){
		if(l!=null){
			literals.add(l);
			symNumber+=l.nSymbols();
			String signature = ((l.sign())? "": "~") + l.getSymbol();
			Set<Literal> setLit = litMap.get(signature);
			if(setLit==null){ // we have to create a new set
				setLit=new HashSet<Literal>();
				litMap.put(signature, setLit);
			}
			setLit.add(l);
		}
	}
	
	public Map<String, Set<Literal>> getLitMap(){
		return litMap;
	}
	
	public Set<Literal> getLiterals(){
		return literals;
	}

	public int nSymbols(){
		return symNumber;
	}

	public int nLiterals(){
		return literals.size();
	}
	
	public Set<Variable> findVariables(){
		Set<Variable> vars=new HashSet<Variable>();
		for(Literal lit: this.getLiterals())
			vars.addAll(findVariables(lit.getArgs()));
		return vars;
	}
	
	private Set<Variable> findVariables(List<Term> arg){
		Set<Variable> vars= new HashSet<Variable>();
		for(Term t: arg)
			if(t instanceof Variable)
				vars.add((Variable)t);
			else if(t instanceof Function)
				vars.addAll(findVariables(((Function) t).getArgs()));
		return vars;
	}
	
	public boolean isEmpty(){
		return literals.size()==0;
	}
	
	/**
	 * Return true iff this clause is a tautology, i.e.
	 *  P | ~P | subCluause
	 * 
	 * @return true if is a tautology, false otherwise
	 */
	public boolean isTautology(){
		Set<Literal> setLit;
		for(Literal l1: literals)
			if( (setLit = litMap.get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null ) // the opposite
				for(Literal l2: setLit)
					if(l1!=l2 && l1.isOpposite(l2))
						return true;
		return false;
	}
	
	public boolean subsumes(Clause c){
		if(this!=c && this.nLiterals()>0 && this.nLiterals()<=c.nLiterals()){
			Collection<Clause> Uset = new PriorityQueue<Clause>();
			Uset.add(this);
			return checkSubsumptionQueue(Uset, c);
		}
		return false;
	}	
	
	private boolean checkSubsumptionSort(Collection<Clause> Uset, Clause c){
		//List<Clause> Uset1 = new ArrayList<Clause>();
		Set<Literal> lMap;
		Map<Variable, Term> sigma;
		Clause cNew;
		for(List<Clause> Uset1 = new ArrayList<Clause>(); !Uset.isEmpty(); Uset1.clear()){
			Collections.sort((List<Clause>) Uset);
			for(Clause cUset: Uset){	
				for(Literal lUset: cUset.getLiterals())
					if( (lMap=c.getLitMap().get( (lUset.sign()? "": "~") + lUset.getSymbol()) ) != null )
						for(Literal lOth: lMap)
							if( (sigma=Unifier.findLeftSubst(lUset.getArgs(), lOth.getArgs())) != null){
								if( (cNew=ExpansionRules.createFactor(cUset, lUset, sigma)).isEmpty() )
									return true;
								Uset1.add(cNew);
							}
			}
			Uset.clear();
			Uset.addAll(Uset1);
		}
		return false;
	}
	
	private boolean checkSubsumptionQueue(Collection<Clause> Uset, Clause c){
		Collection<Clause> Uset1 = new LinkedList<Clause>();
		Set<Literal> lMap;
		Map<Variable, Term> sigma;
		Clause cUset, cNew;
		while(!Uset.isEmpty()){
			while(!Uset.isEmpty()){
				cUset= ((Queue<Clause>) Uset).poll();
			//for(Clause cUset: Uset){	
				for(Literal lUset: cUset.getLiterals())
					if( (lMap=c.getLitMap().get( (lUset.sign()? "": "~") + lUset.getSymbol()) ) != null )
						for(Literal lOth: lMap)
							if( (sigma=Unifier.findLeftSubst(lUset.getArgs(), lOth.getArgs())) != null){
								if( (cNew=ExpansionRules.createFactor(cUset, lUset, sigma)).isEmpty() )
									return true;
								Uset1.add(cNew);
							}
			}
			Uset.addAll(Uset1);
			Uset1.clear();
		}
		return false;
	}
	
	
	/**
	 * Application of inference rule:
	 * 
	 * 		L' | C , L
	 * 	   ----------------
	 * 		    C, L
	 * if Lσ = ~L
	 * N.B. The c input clause must have only one literal.
	 * 
	 * @param c the clause that should simplify this clause
	 * @param rmFromLitMap it should be true iff this literal has to be removed also from litMap
	 * @return the literal deleted if a simplification was made, null otherwise.
	 */
	public Literal simplify(Clause c, boolean rmFromLitMap){
		if(this!=c && c.nLiterals()==1){
			Set<Literal> setLit;
			for(Literal lOth: c.getLiterals()) // only one literal
				if ( (setLit = litMap.get( (lOth.sign()? "~": "") + lOth.getSymbol()) ) != null) // the opposite
					for(Literal lThis: setLit) // literal of this clause that have the same name of l1
						if(Unifier.findLeftSubst(lOth.getArgs(), lThis.getArgs())!= null){ // lOth σ = ~lThis
							literals.remove(lThis);
							if(rmFromLitMap)
								setLit.remove(lThis);
							return lThis;
						}
		}
		return null;
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
	/*
	public int compareTo(Clause f){
		if(this.equals(f))
			return 0;
		int rank=this.nSymbols()-f.nSymbols();
		if(rank==0){
			return -1;
		}
		return rank;
	}
	*/
	public boolean equals(Object o){
		return this==o;
	}
	
	
	/**
	 * Clone this clause and all the objects inside (apart from constants).
	 * 
	 * @return a new Clause with different objects inside apart from constants
	 * 
	 */
	public Object clone(){
		Clause cNew = new Clause();
		Map<Variable, Variable> varMap = new HashMap<Variable, Variable>();
		for(Literal l: this.getLiterals())
			cNew.addLiteral(l.clone(varMap));
		return cNew;
	}
	
	public String toString(){
		return literals.toString();
	}
}

/*
private boolean checkSubsumptionOLD(Collection<Clause> Uset, Clause c){
	if(Uset==null || Uset.size()==0)
		return false;
	else if(emptyClause(Uset))
		return true;
	else {
		Collection<Clause> Uset1 = new HashSet<Clause>();
		Set<Literal> lMap;
		Map<Variable, Term> sigma;
		Clause cNew;
		for(Clause cUset: Uset){
			for(Literal lUset: cUset.getLiterals())
				if( (lMap=c.getLitMap().get( (lUset.sign()? "": "~") + lUset.getSymbol()) ) != null )
					for(Literal lOth: lMap)
						if( (sigma=Unifier.findLeftSubst(lUset.getArgs(), lOth.getArgs())) != null){
							if( (cNew=ExpansionRules.createFactor(cUset, lUset, sigma)).isEmpty() )
								return true;
							Uset1.add(cNew);
						}
		}
		return checkSubsumption(Uset1, c);
	}
	
}

private boolean emptyClause(Collection<Clause> clSet){
	for(Clause c: clSet)
		if(c.isEmpty())
			return true;
	return false;
}
*/