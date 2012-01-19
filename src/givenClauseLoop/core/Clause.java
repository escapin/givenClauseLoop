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
			} /* else{ // checking for tautology
				 for(Predicate l1: setLit)
					 if(l.isOpposite(l1))
						 isTautology=true;
				}*/	
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
		return this.getLiterals().size()==0;
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
		if(this.nLiterals()>0 && this!=c && this.nLiterals()<=c.nLiterals()){
			// STEP 1 Subsumption Algorithm in Chang Lee books page 95
			/*
			Map<Variable, Term> sigma = new HashMap<Variable, Term>();
			for(Variable var : c.getVariables())
				sigma.put(var, new Constant("##"));
			Set<Clause> W = new HashSet<Clause>();
			Clause cTemp;
			for(Literal lit : c.getLiterals()){
				cTemp = new Clause(); 
				cTemp.addLiteral(new Literal(lit.getSymbol(), !lit.sign(), Substitution.substitute(lit.getArgs(), sigma)));
				W.add(cTemp);
			}
			// STEP 2-3-4
			*/
			NavigableSet<Clause> Uset = new TreeSet<Clause>();
			Uset.add(this);
			return checkSubsumption(Uset, c);
		}
		return false;
	}	
	
	private boolean checkSubsumption(NavigableSet<Clause> Uset, Clause c){
		if(Uset==null || Uset.size()==0)
			return false;
		else if(emptyClause(Uset))
			return true;
		else {
			NavigableSet<Clause> Uset1 = new TreeSet<Clause>();
			Set<Literal> lMap;
			Map<Variable, Term> sigma;
			Clause cNew;
			for(Clause cUset: Uset){
				for(Literal lUset: cUset.getLiterals())
					if( (lMap=c.getLitMap().get( (lUset.sign()? "": "~") + lUset.getSymbol()) ) != null )
						for(Literal lOth: lMap)
							if( (sigma=Unifier.findLeftSubst(lUset.getArgs(), lOth.getArgs(), false)) != null){
							/*	System.out.println(cUset);
								System.out.println(lUset + " --> " + lOth);
								for(Variable v: sigma.keySet())
									System.out.println("\t" + v + "<--" + sigma.get(v));
							*/
								if( (cNew=ExpansionRules.createFactor(cUset, lUset, sigma)).nLiterals() == 0 )
									return true;
								//System.out.println(cNew + "\n");
								Uset1.add(cNew);
							}
			}
			return checkSubsumption(Uset1, c);
		}
		/*
		else {
			Set<Clause> U1 = new HashSet<Clause>();
			for(Clause c1: U)
				for(Clause c2: W)
					U1.addAll(InferenceRules.binaryResolution(c1, c2));
			return checkSubsumption(U1, W);
		}
		*/
	}
	
	private boolean emptyClause(NavigableSet<Clause> clSet){
		for(Clause c: clSet)
			if(c.nLiterals()==0)
				return true;
		return false;
	}
	
	/**
	 * Application ofinference rule:
	 * 
	 * 		L' | C , L
	 * 	   ----------------
	 * 		    C, L
	 * if Lσ = ~L'
	 * 
	 * N.B. The c input clause must have only one literal.
	 * 
	 * @param c the clause that should semplify this clause
	 * @return the literal deleted if a semplification was made, null otherwise.
	 */
	public Literal simplify(Clause c){
		if(c.nLiterals()==1){
			Set<Literal> setLit;
			for(Literal lOth: c.getLiterals()) // only one literal
				if ( (setLit = litMap.get( (lOth.sign()? "~": "") + lOth.getSymbol()) ) != null) // the opposite
					for(Literal lThis: setLit) // literal of this clause that have the same name of l1
						if(Unifier.findLeftSubst(lOth.getArgs(), lThis.getArgs(), false)!= null){ // lOth σ = ~lThis
							literals.remove(lThis);
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
	/**
	 * The equals() and hashCode() methods are inherited from object,
	 * since every time we create a new Clause object, it must be different
	 * from the others.
	 */
	
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
		if(literals.size()!=0){
			StringBuffer s = new StringBuffer("[");
			for(Literal p: literals)
				s.append(p.toString() + " | ");
			s.delete(s.length()-3, s.length());
			s.append("]");
			return s.toString();
		}
		return "[]";
			
	}
}