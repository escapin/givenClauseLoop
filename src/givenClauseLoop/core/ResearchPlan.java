package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.bean.LoopResult;
import java.util.*;

public class ResearchPlan {
	
	public static InfoLoop info;

	public static InfoLoop OtterLoop(NavigableSet<Clause> toBeSelected){
		NavigableSet<Clause> selected = new TreeSet<Clause>();
		
		info = new InfoLoop();
		info.clausesGenerated=toBeSelected.size();
		
		NavigableSet<Clause> newClauses;
		Clause givenClause,
			   cNew;
		Set<Literal> lMap;
		Map<Literal, Literal> alreadyFactorised;
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			
			givenClause=toBeSelected.pollFirst();
			
			if(givenClause.isTautology()) // TAUTOLOGY
				info.nTautology++;
			else {
				selected.add(givenClause);
					
				// FIND FACTORS
				alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
				for(Literal l1: givenClause.getLiterals())
					if( (lMap=givenClause.getLitMap().get( (l1.sign()? "": "~") + l1.getSymbol()) ) != null)
						for(Literal l2: lMap){
							cNew=ExpansionRules.factorisation(givenClause, l1, l2, alreadyFactorised);
							if(cNew!=null){ // a factor has been found
								info.nFactorisations++;
								info.clausesGenerated++;
								if(cNew.isEmpty()){
									info.res = LoopResult.UNSAT;
									return info;
								}
								if(!cNew.isTautology()){	
									// CONTRACTION RULES
									if(contractionRules(cNew, selected))
										return info;
									if(contractionRules(cNew, toBeSelected))
										return info;
									if(cNew!=null)
										toBeSelected.add(cNew);
								}
							}
						}	
				
				// FIND BINARY RESOLVENTS
				Set<Clause> toBeRemoved = new HashSet<Clause>();
				for(Clause cSel: selected){
					for(Literal l1: givenClause.getLiterals())
						if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
							for(Literal l2: lMap){
								cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
								if(cNew!=null){
									info.nResolutions++;
									info.clausesGenerated++;
									if(cNew.isEmpty()){
										info.res = LoopResult.UNSAT;
										return info;
									}
									if(!cNew.isTautology()){
										// CONTRACTION RULES
										if(contractionRules(cNew, selected, toBeRemoved)) // ???
											return info;
										if(contractionRules(cNew, toBeSelected))
											return info;
										if(cNew!=null)
											toBeSelected.add(cNew);
									}
								}
									
							}
				}
				for(Clause rmCl: toBeRemoved)
					selected.remove(rmCl);
			}
		}
		//info.clausesNotSelected = (toBeSelected.isEmpty())? 0: info.clausesGenerated - selected.size();
		info.res = (toBeSelected.isEmpty())? LoopResult.SAT : LoopResult.TIME_EXPIRED;
		return info;
	}
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	 */
	private static boolean contractionRules(Clause cNew, NavigableSet<Clause> clauseSet){
		if(cNew!=null){
			Iterator<Clause> iter = clauseSet.iterator();
			Clause cSel;
			while(iter.hasNext()){
				cSel=iter.next();
				// SIMPLIFICATIONS
				if(cNew.simplify(cSel)!=null){
					info.nSimplifications++;
					if(cNew.isEmpty()){ // empty clause generated
						info.res = LoopResult.UNSAT;
						return true;
					}
				} else if(cSel.simplify(cNew)!=null){
					info.nSimplifications++;
					if(cSel.isEmpty()){	// empty clause generated
						info.res = LoopResult.UNSAT;
						return true;
					}
				}
				// SUBSUMPTIONS
				if(cNew.subsumes(cSel)){
					info.nSubsumptions++;
					iter.remove(); 	// Removes from the clauseSet collection the last element returned by the iterator
									// is like clauseSet.remove(cSel);
				} else if (cSel.subsumes(cNew)){
					info.nSubsumptions++;
					cNew=null; // cNew does not have to be considered
				}
			}
		}
		return false;
	}
	
	/*
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
	*/
}
