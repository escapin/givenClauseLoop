package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;


public class InferenceRules {
	
	public static Clause binaryResolution(Clause c1, Clause c2){
		Map<Variable, Term> sigma;
		for(Literal l1: c1.getLiterals())
			for(Literal l2: c2.getLitMap().get(l1.sign()? "~": "" + l1.getSymbol())) 
				// iter on all the opposite predicate in the second clause c2
				if( (sigma=Unifier.findMGU(l1.getArgs(), l2.getArgs(), false)) != null){
					Clause newClause = new Clause();
					Set<Variable> vars=new HashSet<Variable>();
					Literal lTemp;
					for(Literal l3: c1.getLiterals())
						if(l1!=l3){
							lTemp=Substitution.substitute(l3, sigma);
							vars.addAll(findVariables(lTemp.getArgs()));
							newClause.addLiteral(lTemp);
						}	
					for(Literal l4: c1.getLiterals())
						if(l2!=l4){
							lTemp=Substitution.substitute(l4, sigma);
							vars.addAll(findVariables(lTemp.getArgs()));
							newClause.addLiteral(lTemp);
						}
					newClause.setVariables(vars);
					return newClause;
				}
		return null;
	}
	
	
	
	public static Clause factorisation(Clause c){
		return null;
	}

	public static Collection<Variable> findVariables(Clause c){
		Set<Variable> vars=new HashSet<Variable>();
		for(Literal lit: c.getLiterals())
			vars.addAll(findVariables(lit.getArgs()));
		return vars;
	}
	
	private static Set<Variable> findVariables(List<Term> arg){
		Set<Variable> vars= new HashSet<Variable>();
		for(Term t: arg)
			if(t instanceof Variable)
				vars.add((Variable)t);
			else if(t instanceof Function)
				vars.addAll(findVariables(((Function) t).getArgs()));
		return vars;
	}
}
