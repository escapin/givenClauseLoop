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
		Set<Literal> setLit;
		for(Literal l1: literals)
			if( (setLit = litMap.get(l1.sign()? "~": "" + l1.getSymbol()) ) != null ) // the opposite
				for(Literal l2: setLit)
					if(l1!=l2 && l1.isOpposite(l2))
					return true;
		return false;
	}
	
	public boolean subsumes(Clause c){
		if(!(this == c) && this.nLiterals()<=c.nLiterals()){
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
			AbstractQueue<Clause> Uset = new PriorityQueue<Clause>();
			Uset.add(this);
			return checkSubsumption(Uset, c);
		}
		return false;
	}	
		
	private boolean checkSubsumption(AbstractQueue<Clause> Uset, Clause c){
		if(Uset==null || Uset.size()==0)
			return false;
		else if(emptyClause(Uset))
			return true;
		else {
			AbstractQueue<Clause> Uset1 = new PriorityQueue<Clause>();
			Set<Literal> lMap;
			Map<Variable, Term> sigma;
			Clause cNew;
			for(Clause c1: Uset){
				for(Literal l1: c1.getLiterals())
					if( (lMap=c.getLitMap().get(l1.sign()? "": "~" + l1.getSymbol())) != null )
						for(Literal l2: lMap)
							if( (sigma=Unifier.findLeftSubst(l1.getArgs(), l2.getArgs(), false)) != null){
								if( (cNew=InferenceRules.createFactor(c1, l1, sigma)).nLiterals() == 0 )
									return true;
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
	
	private boolean emptyClause(AbstractQueue<Clause> clSet){
		for(Clause c: clSet)
			if(c.nLiterals()==0)
				return true;
		return false;
	}
	
	public boolean simplify(Literal l1){
		Set<Literal> setLit;
		if ( (setLit = litMap.get( l1.sign()? "~": "" + l1.getSymbol()) ) != null) // the opposite
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