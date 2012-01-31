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
			String signature = ((l.sign())? "": "~") + l.getName();
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
			if( (setLit = litMap.get( (l1.sign()? "~": "") + l1.getName()) ) != null ) // the opposite
				for(Literal l2: setLit)
					if(l1!=l2 && l1.isOpposite(l2))
						return true;
		return false;
	}
	
	
	public boolean subsumes(Clause c){
		if(this!=c && this.nLiterals()<=c.nLiterals() && this.compareTo(c)<=0){
			
			for(Literal l: literals)
				if( c.getLitMap().get((l.sign()? "": "~") + l.getName()) == null)
					return false;
			/*
			Map<String, Integer> match = new HashMap<String, Integer>();
			String key;
			Set<Literal> lTmp;
			for(Literal l: literals){
				key =(l.sign()? "": "~") + l.getSymbol();
				lTmp=c.getLitMap().get(key);
				if( lTmp == null || (match.containsKey(key) && lTmp.size()<=match.get(key).intValue()) )
					return false;
				else
					match.put(key, match.containsKey(key)? new Integer(match.get(key).intValue()+1): new Integer(1));
			}
			*/
			
			List<Clause> Uset = new LinkedList<Clause>();
			Uset.add(this);
			return checkSubsumption(Uset, c);
		}
		return false;
	}	
	
	private boolean checkSubsumption(List<Clause> Uset, Clause c){
		Set<Literal> lMap;
		Map<Variable, Term> sigma;
		Clause cNew;
		List<Clause> Uset1=new LinkedList<Clause>();
		while(!Uset.isEmpty()){
			//Uset1=new LinkedList<Clause>();
			for(Clause cSel: Uset)
				for(Literal lSel: cSel.getLiterals())
					if( (lMap=c.getLitMap().get( (lSel.sign()? "": "~") + lSel.getName()) ) != null )
						for(Literal lC: lMap)
							if( (sigma=Unifier.findLeftSubst(lSel.getArgs(), lC.getArgs())) != null){
								if( (cNew=ExpansionRules.createFactor(cSel, lSel, sigma)).isEmpty() )
									return true;
								Uset1.add(cNew);
							}
			Uset.clear();
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
	public Set<Literal> simplify(Clause c, boolean rmFromLit){
		Set<Literal> litToRm=new HashSet<Literal>();
		Literal lThis;
		if(this!=c && c.nLiterals()==1){
			Set<Literal> setLit;
			Literal lOth=c.getLiterals().iterator().next(); // only one literal
			if ( (setLit = litMap.get( (lOth.sign()? "~": "") + lOth.getName()) ) != null) // the opposite
				for(Iterator<Literal> iter1=setLit.iterator(); iter1.hasNext();){
					lThis=iter1.next();
					// literal of this clause that have the same name of l1
					if(Unifier.findLeftSubst(lOth.getArgs(), lThis.getArgs()) != null){ // lOth σ = ~lThis
						//System.out.println("\n" + lOth + "\t" + lThis + "\n");
						symNumber -= lThis.nSymbols();
						iter1.remove();
						if(rmFromLit)
							literals.remove(lThis);
					//System.out.println("\n" + this + "\t" + c + "\n");
					litToRm.add(lThis);
				}
			}
		}
		return litToRm;
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
*/

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