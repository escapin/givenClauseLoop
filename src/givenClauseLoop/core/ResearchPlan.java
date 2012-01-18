package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.LoopResult;
import java.util.*;

public class ResearchPlan {
	
	public static InfoLoop info;

	public static InfoLoop OtterLoop(NavigableSet<Clause> toBeSelected){
		NavigableSet<Clause> selected = new TreeSet<Clause>();
		info = new InfoLoop();
		info.clausesGenerated=toBeSelected.size();
		
		NavigableSet<Clause> newClauses;
		Clause givenClause;
		
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			givenClause=toBeSelected.pollFirst();
			
			if(!givenClause.isEmpty())
				if(givenClause.isTautology()) // TAUTOLOGY
					info.nTautology++;
				else {
					selected.add(givenClause);
					
					// APPLIED FACTORISATION
					newClauses=ExpansionRules.factorisation(givenClause);
					info.nFactorisations += newClauses.size();
					info.clausesGenerated += newClauses.size(); 
					// CONTRACTION RULES
					if(contractionRules(newClauses, toBeSelected, selected))
						return info;
					
					// ADD CLAUSES GENERATED in TO_BE_SELECTED
					if(newClauses.size()!=0)
						toBeSelected.addAll(newClauses);
					
					// APPLIED BINARY_RESOLUTION
					for(Clause cSel: selected){
						newClauses=ExpansionRules.binaryResolution(givenClause, cSel);
						info.nResolutions += newClauses.size();
						info.clausesGenerated += newClauses.size();
						// CONTRACTION RULES
						if(contractionRules(newClauses, toBeSelected, selected))
							return info;
					}
					// ADD CLAUSES GENERATED in TO_BE_SELECTED
					if(newClauses.size()!=0)
						toBeSelected.addAll(newClauses);
				}
		}
		//info.clausesNotSelected = (toBeSelected.isEmpty())? 0: info.clausesGenerated - selected.size();
		info.res = (toBeSelected.isEmpty())? LoopResult.SAT : LoopResult.TIME_EXPIRED;
		return info;
	}
	
	private static boolean contractionRules(NavigableSet<Clause> newClauses, NavigableSet<Clause> toBeSelected, 
			NavigableSet<Clause> selected){
		Iterator<Clause> iter=newClauses.iterator();
		Clause	cNew=new Clause();
		boolean clauseRemoved=false;
		while(iter.hasNext()){
			if(!clauseRemoved)
				cNew = iter.next();
			
			clauseRemoved=false;
			if(cNew.isEmpty()){ // empty clause generated
				info.res = LoopResult.UNSAT;
				return true;
			} else if(cNew.isTautology()){ // TAUTOLOGY
				info.nTautology++;
				cNew=remClauseGetNext(cNew, newClauses, iter);
				clauseRemoved=true;
			} else{
				// CONTRACTION RULES with SELECTED QUEUE
				clauseRemoved=simplSubsRules(cNew, selected);
				if(info.res==LoopResult.UNSAT)
					return true;
				if(clauseRemoved)
					cNew=remClauseGetNext(cNew, newClauses, iter);
				else {
					// CONTRACTION RULES with TO_BE_SELECTED QUEUE
					clauseRemoved=simplSubsRules(cNew, toBeSelected);
					if(info.res==LoopResult.UNSAT)
						return true;
					if(clauseRemoved)
						cNew=remClauseGetNext(cNew, newClauses, iter);
				}
			}
		}
		return false;
	}
	
	private static boolean simplSubsRules(Clause cNew, NavigableSet<Clause> clauseSet){
		Iterator<Clause> iter=clauseSet.iterator();
		Clause cSel=new Clause();
		boolean clauseRemoved=false;
		while(iter.hasNext()){
			if(!clauseRemoved)
				cSel = iter.next();
			
			clauseRemoved=false;
			// SIMPLIFICATIONS
			if(cNew.simplify(cSel)!=null){
				info.nSimplifications++;
				if(cNew.isEmpty()){ // empty clause generated
					info.res = LoopResult.UNSAT;
					return false;
				}
			} else if(cSel.simplify(cNew)!=null){
				info.nSimplifications++;
				if(cSel.isEmpty()){	// empty clause generated
					info.res = LoopResult.UNSAT;
					return false;
				}
			}
			// SUBSUMPTIONS
			if(cNew.subsumes(cSel)){
				info.nSubsumptions++;
				// if we have to remove this element, we have to find the next one before 
				cSel=remClauseGetNext(cSel, clauseSet, iter);
				clauseRemoved=true;
			} else if (cSel.subsumes(cNew)){
				info.nSubsumptions++;
				return true;
			}
		}
		return false;
	}
	
	private static Clause remClauseGetNext(Clause c, NavigableSet<Clause> set, Iterator<Clause> iter){
		Clause cNext=null;
		// if we have to remove this element, we have to find the next one before 
		if(iter.hasNext())
			cNext = iter.next();
		set.remove(c);
		return cNext;
	}
}
