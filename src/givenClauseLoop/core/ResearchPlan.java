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
		boolean clauseRemoved;
		for(Clause cNew: newClauses){
			clauseRemoved=false;
			if(cNew.isEmpty()){ // empty clause generated
				info.res = LoopResult.UNSAT;
				return true;
			} else if(cNew.isTautology()){ // TAUTOLOGY
				info.nTautology++;
				newClauses.remove(cNew);
				clauseRemoved=true;
			} else{
				// CONTRACTION RULES with SELECTED QUEUE
				clauseRemoved=simplSubsRules(cNew, selected);
				if(info.res==LoopResult.UNSAT)
					return true;
				if(clauseRemoved)
					newClauses.remove(cNew);
				else {
					// CONTRACTION RULES with TO_BE_SELECTED QUEUE
					clauseRemoved=simplSubsRules(cNew, toBeSelected);
					if(info.res==LoopResult.UNSAT)
						return true;
					if(clauseRemoved)
						newClauses.remove(cNew);
				}
			}
		}
		return false;
	}
	
	private static boolean simplSubsRules(Clause cNew, NavigableSet<Clause> clauseSet){
		//NavigableSet<Clause> newClSet ;
		for(Clause cSel: clauseSet){
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
					clauseSet.remove(cSel);
				} else if (cSel.subsumes(cNew)){
					info.nSubsumptions++;
					return true;
				}
		}
		return false;
	}
}
