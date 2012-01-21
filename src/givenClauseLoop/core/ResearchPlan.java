package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.bean.LoopResult;
import givenClauseLoop.bean.LoopType;
import givenClauseLoop.bean.RuleEmptyClause;

import java.util.*;

public class ResearchPlan {
	
	private static InfoLoop info;
	private static NavigableSet<Clause> toBeSelected;
	private static NavigableSet<Clause> selected;
	
	static boolean flag=false;
	
	public static InfoLoop givenClauseLoop(NavigableSet<Clause> toBeSel, LoopType lType){
		info = new InfoLoop();
		toBeSelected = toBeSel;
		selected = new TreeSet<Clause>();
		info.clausesGenerated=toBeSelected.size();
		info.loopType=lType;
		
		Clause givenClause;
		
		Iterator<Clause> iter = toBeSelected.iterator();
		while(iter.hasNext()){
			givenClause = iter.next();
			if(givenClause.isEmpty())
				iter.remove();
			else if(givenClause.isTautology()){
				info.nTautology++;
				iter.remove();
			}
		}		
		
		/*
		if(toBeSelected.size()==9 && selected.size()==10){
			System.out.println("\nTO BE SELECTED\n");
			Iterator<Clause> it1 = toBeSelected.iterator();
			Iterator<Clause> it2 = selected.iterator();
			while(it1.hasNext())
				System.out.println(it1.next());
			System.out.println("\n\nSELECTED\n");
			while(it2.hasNext())
				System.out.println(it2.next());
			System.out.println("\n\n");
		}
		// "\r" backspace
	
		System.out.print(toBeSelected.size() + "\t");
		if(i%15==0)
			System.out.println();
		i++;
		*/
		
		
		System.out.println("ITERS\tTO BE SELECTED" + "\t\t" + "SELECTED");
		int i=0;
		
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			i++;
			System.out.print("\r" + i + ")  " + toBeSelected.size() + ".........................." + selected.size() + "      ");
			
			givenClause=toBeSelected.pollFirst();
			selected.add(givenClause);
			
			flag=false;
			
			// FIND FACTORS
			if(findFactors(givenClause))
				return info;
			// FIND BINARY RESOLVENTS
			if(findResolvents(givenClause))
				return info;
			
			if(flag){
				System.out.println("\nTO BE SELECTED OUT:");
				for(Clause c: selected)
					System.out.println(c);
				System.out.println("\n\n");
				
				System.out.println("\nSELECTED OUT:");
				for(Clause c: selected)
					System.out.println(c);
				System.out.println("\n");
				
				flag=false;
			}
			
			
		} // END OF GIVEN CLAUSE LOOP
		
		//info.clausesNotSelected = (toBeSelected.isEmpty())? 0: info.clausesGenerated - selected.size();
		info.res = (toBeSelected.isEmpty())? LoopResult.SAT : LoopResult.TIME_EXPIRED;
		return info;
	}
	
	
	private static boolean findFactors(Clause givenClause){
		Clause cNew;
		Set<Literal> lMap;
		Map<Literal, Literal> alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
		for(Literal l1: givenClause.getLiterals())
			if( (lMap=givenClause.getLitMap().get( (l1.sign()? "": "~") + l1.getSymbol()) ) != null)
				for(Literal l2: lMap){
					cNew=ExpansionRules.factorisation(givenClause, l1, l2, alreadyFactorised);
					if(cNew!=null){ // a factor has been found
						info.nFactorisations++;
						info.clausesGenerated++;
						if(!cNew.isTautology()){	
							cNew=contractionRules(cNew, selected, null); // CONTRACTION RULES with selected
							if(info.res==LoopResult.UNSAT)
								return true;
							if(cNew!=null && info.loopType==LoopType.OTTER_LOOP){
								cNew=contractionRules(cNew, toBeSelected, null); // CONTRACTION RULES with toBeSelected									
								if(info.res==LoopResult.UNSAT)
									return true;
							}
							if(cNew!=null)
								toBeSelected.add(cNew);		
						}
						else
							info.nTautology++;
					}
				}
		return false;
	}
	
	private static boolean findResolvents(Clause givenClause){
		Clause cNew;
		Set<Clause> toBeRemoved = new HashSet<Clause>();
		Set<Literal> lMap;
		for(Clause cSel: selected)
			if(givenClause!=cSel && !toBeRemoved.contains(cSel))
				for(Literal l1: givenClause.getLiterals())
					if( !toBeRemoved.contains(cSel) && (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
						for(Literal l2: lMap){
							cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
							if(cNew!=null){ // a binary resolvent has been found
								info.nResolutions++;
								info.clausesGenerated++;
								//System.out.println("\t" + cNew);
								if(cNew.isEmpty()){
									info.c1=givenClause;
									info.c2=cSel;
									info.rule=RuleEmptyClause.BINARY_RESOLUTION;
									info.res = LoopResult.UNSAT;
									return true;
								}
								if(!cNew.isTautology()){
									cNew=contractionRules(cNew, selected, toBeRemoved); // CONTRACTION RULES with selected
									if(info.res==LoopResult.UNSAT)
										return true;
									if(cNew!=null && info.loopType==LoopType.OTTER_LOOP){
										cNew=contractionRules(cNew, toBeSelected, null); // CONTRACTION RULES with toBeSelected									
										if(info.res==LoopResult.UNSAT)
											return true;
									}
									if(cNew!=null)
										toBeSelected.add(cNew);
								} else
									info.nTautology++;
							}
						}
		for(Clause rmCl: toBeRemoved){
			//System.out.println(rmCl);
			selected.remove(rmCl);
		}
		return false;	
	}
	
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	 */
	private static Clause contractionRules(Clause cNew, NavigableSet<Clause> clauseSet, Set<Clause> toBeRemoved){
		if(cNew!=null){
			Iterator<Clause> iter = clauseSet.iterator();
			Clause 	cSel=new Clause(),
					cTemp;
			Literal l;
			boolean notToBeConsidered=false;
			while(iter.hasNext()){
				do{
					cSel=iter.next();
				}while(toBeRemoved!=null && (notToBeConsidered=toBeRemoved.contains(cSel)) && iter.hasNext());
				if(notToBeConsidered && !iter.hasNext()) // if this element have not to be considered but there isn't other after
					return cNew;
				
				// SIMPLIFICATIONS
				if((l=cNew.simplify(cSel))!=null){
					info.nSimplifications++;
					if(cNew.isEmpty()){ // empty clause generated
						info.c1=cSel;
						cTemp=new Clause();
						cTemp.addLiteral(l);
						info.c2=cTemp;
						info.rule=RuleEmptyClause.SIMPLIFICATION;
						info.res = LoopResult.UNSAT;
						return cNew;
					}
				} else if((l=cSel.simplify(cNew))!=null){
					info.nSimplifications++;
					if(cSel.isEmpty()){	// empty clause generated
						info.c1=cNew;
						cTemp=new Clause();
						cTemp.addLiteral(l);
						info.c2=cTemp;
						info.res = LoopResult.UNSAT;
						info.rule=RuleEmptyClause.SIMPLIFICATION;
						return cNew;
					}
				}
				// SUBSUMPTIONS
				if (cSel.subsumes(cNew)){
					//System.out.println("\n" + cSel + " subsumes " + cNew);
					info.nSubsumptions++;
					return null;
				} else if(cNew.subsumes(cSel)){
					info.nSubsumptions++;
					if(toBeRemoved!=null)
						toBeRemoved.add(cSel);
					else{
						iter.remove(); 	// Removes from the clauseSet collection the last element returned by the iterator
										// is like clauseSet.remove(cSel);
						System.out.println("\n\n" + cNew + " SUBSUMES " + cSel + "\n\n");
						flag=true;
					}
						//if(clauseSet.contains(cSel))
						//System.out.println("\n" + cSel + "\t REMOVED");
					//if(toBeRemoved!=null && toBeRemoved.contains(cSel))
					//	System.out.println("toBeRemoved contains " + cSel);
				}
			}
			if(flag){
				System.out.println("\n");
				for(Clause c: clauseSet)
					System.out.println(c);
				System.out.println("\n\n" + cNew);
			}
		}
		return cNew;
	}
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	
	private static Clause contractionRules(Clause cNew, NavigableSet<Clause> clauseSet, Set<Clause> toBeRemoved){
		if(cNew!=null){
			for(Clause cSel: clauseSet)
				if(!toBeRemoved.contains(cSel)){
					Literal l;
					Clause cTemp;
					// SIMPLIFICATIONS
					if((l=cNew.simplify(cSel))!=null){
						info.nSimplifications++;
						if(cNew.isEmpty()){ // empty clause generated
							info.c1=cSel;
							cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=RuleEmptyClause.SIMPLIFICATION;
							info.res = LoopResult.UNSAT;
							return cNew;
						}
					} else if((l=cSel.simplify(cNew))!=null){
						info.nSimplifications++;
						if(cSel.isEmpty()){	// empty clause generated
							info.c1=cNew;
							cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=RuleEmptyClause.SIMPLIFICATION;
							info.res = LoopResult.UNSAT;
							return cNew;
						}
					}
					// SUBSUMPTIONS
					if(cNew.subsumes(cSel)){
						info.nSubsumptions++;
						toBeRemoved.add(cSel);
					} else if (cSel.subsumes(cNew)){
						info.nSubsumptions++;
						return null;
					}
				}
		}
		return cNew;
	}
	 */
	
	
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
