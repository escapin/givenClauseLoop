package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.LoopResult;
import java.util.*;

public class ResearchPlan {
	
	private static InfoLoop info;
	
	private static NavigableSet<Clause> toBeSelected,
										selected;
	
	private static Clause cSelected;
	private static boolean remClauseFromSelected;
	private static Iterator<Clause> itSelected,
									itNewClauses;

	public static InfoLoop OtterLoop(NavigableSet<Clause> inputClauses){
		toBeSelected = inputClauses;
		selected = new TreeSet<Clause>();
		info = new InfoLoop();
		cSelected = new Clause();
		remClauseFromSelected=false;
		
		info.clausesGenerated=toBeSelected.size();
		
		NavigableSet<Clause> newClauses;
		Clause givenClause;
		
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			givenClause=toBeSelected.pollFirst();
			/*
			if(givenClause.isEmpty()){
				info.res = LoopResult.UNSAT;
				return info;
			}
			*/
			if(givenClause.isTautology()) // TAUTOLOGY
				info.nTautology++;
			else {
				selected.add(givenClause);
				
				// APPLIED FACTORISATION
				newClauses=ExpansionRules.factorisation(givenClause);
				info.nFactorisations += newClauses.size();
				info.clausesGenerated += newClauses.size(); 
				// CONTRACTION RULES
				if(contractionRules(newClauses))
					return info;
				
				// ADD CLAUSES GENERATED in TO_BE_SELECTED
				if(newClauses.size()!=0)
					toBeSelected.addAll(newClauses);
				
				// APPLIED BINARY_RESOLUTION
				itSelected=selected.iterator();
				
				while(itSelected.hasNext()){
					if(!remClauseFromSelected)
						cSelected=itSelected.next();
					remClauseFromSelected=false;
					
					newClauses=ExpansionRules.binaryResolution(givenClause, cSelected);
					info.nResolutions += newClauses.size();
					info.clausesGenerated += newClauses.size();
					// CONTRACTION RULES
					if(contractionRules(newClauses))
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
	
	/**
	 * 
	 * @param newClauses
	 * @param toBeSelected
	 * @param selected
	 * @return true if the empty clause if found, false otherwise
	 */
	private static boolean contractionRules(NavigableSet<Clause> newClauses){
		Iterator<Clause> iter=newClauses.iterator();
		Clause	cNew=new Clause();
		boolean clauseRemoved=false;
		while(iter.hasNext()){
			if(!clauseRemoved)
				cNew = iter.next();
			//System.out.println(cNew);
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
				if( (clauseRemoved=simplSubsRules(cNew, selected)) )
					cNew=remClauseGetNext(cNew, newClauses, iter);
				if(info.res==LoopResult.UNSAT)
					return true;
				else {
					// CONTRACTION RULES with TO_BE_SELECTED QUEUE
					if( (clauseRemoved=simplSubsRules(cNew, toBeSelected)) )
							cNew=remClauseGetNext(cNew, newClauses, iter);
					if(info.res==LoopResult.UNSAT)
						return true;
				}
			}
		}
		return false;
	}
	
	/**
	 * 
	 * @param cNew
	 * @param newClauses
	 * @param clauseSet
	 * @return true if cNew has to be removed, false otherwise
	 */
	private static boolean simplSubsRules(Clause cNew,  NavigableSet<Clause> clauseSet){
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
					if(cSel==cSelected)
						remClauseFromSelected=true;
					cSel=remClauseGetNext(cSel, clauseSet, iter);
					if(remClauseFromSelected)
						cSelected=cSel;
					clauseRemoved=true;
			} else if (cSel.subsumes(cNew)){
				info.nSubsumptions++;
				return true;
			}
		}
		return false;
	}
	
	
	private static Clause remClauseGetNext(Clause c, NavigableSet<Clause> set, Iterator<Clause> iter){
		Clause cNext = (iter.hasNext())? iter.next(): c;
		// if we have to remove this element, we have to find the next one before 
		set.remove(c);
		return cNext;
	}
}
