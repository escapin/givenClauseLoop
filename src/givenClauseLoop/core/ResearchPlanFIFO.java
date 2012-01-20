package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.bean.LoopResult;
import givenClauseLoop.bean.LoopType;
import givenClauseLoop.bean.RuleEmptyClause;

import java.util.*;

public class ResearchPlanFIFO {
	
	public static InfoLoop info;

	public static InfoLoop givenClauseLoop(NavigableSet<Clause> toBeSelected, LoopType lType){
		LinkedList<Clause> selected = new LinkedList<Clause>();
		
		LinkedList<Clause> list = new LinkedList<Clause>();
		for(Clause c: toBeSelected)
			list.add(c);
		
		Clause givenClause,
				cNew;
		Set<Literal> lMap;
		Set<Clause>	 toBeRemoved;
		Map<Literal, Literal> alreadyFactorised;
		
		
		
		info = new InfoLoop();
		info.clausesGenerated=list.size();
		
		Iterator<Clause> iter = list.iterator();
		while(iter.hasNext()){
			givenClause = iter.next();
			if(givenClause.isEmpty())
				iter.remove();
			else if(givenClause.isTautology()){
				info.nTautology++;
				iter.remove();
			}
		}
				
		
		System.out.println("ITERS\tTO BE SELECTED" + "\t\t" + "SELECTED");
		int i=0;
		while(!list.isEmpty()){ // GIVEN CLAUSE LOOP
			givenClause=list.removeFirst();
			selected.add(givenClause);
			
			i++;
			System.out.print("\r" + i + ")  " + toBeSelected.size() + ".........................." + selected.size() + "      ");
			/*
			if(list.size()==9 && selected.size()==10){
				System.out.println("\nTO BE SELECTED\n");
				Iterator<Clause> it1 = list.iterator();
				Iterator<Clause> it2 = selected.iterator();
				while(it1.hasNext())
					System.out.println(it1.next());
				System.out.println("\n\nSELECTED\n");
				while(it2.hasNext())
					System.out.println(it2.next());
				System.out.println("\n\n");
			}
			// "\r" backspace
		
			System.out.print(list.size() + "\t");
			if(i%15==0)
				System.out.println();
			i++;
			*/
			
			// FIND FACTORS
			alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
			for(Literal l1: givenClause.getLiterals())
				if( (lMap=givenClause.getLitMap().get( (l1.sign()? "": "~") + l1.getSymbol()) ) != null)
					for(Literal l2: lMap){
						cNew=ExpansionRules.factorisation(givenClause, l1, l2, alreadyFactorised);
						if(cNew!=null){ // a factor has been found
							info.nFactorisations++;
							info.clausesGenerated++;
							if(!cNew.isTautology()){	
								// CONTRACTION RULES
								if(contractionRules(cNew, selected))
									return info;
								if(lType==LoopType.OTTER_LOOP && contractionRules(cNew, list))
										return info;
								if(cNew!=null)
									list.add(cNew);		
							}
							else
								info.nTautology++;
						}
					}	
				
			// FIND BINARY RESOLVENTS
			toBeRemoved = new HashSet<Clause>();
			for(Clause cSel: selected)
				if(givenClause!=cSel && !toBeRemoved.contains(cSel))
					for(Literal l1: givenClause.getLiterals())
						if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
							for(Literal l2: lMap){
								cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
								if(cNew!=null){ // a binary resolvent has been found
									info.nResolutions++;
									info.clausesGenerated++;
									if(cNew.isEmpty()){
										info.c1=givenClause;
										info.c2=cSel;
										info.rule=RuleEmptyClause.BINARY_RESOLUTION;
										info.res = LoopResult.UNSAT;
										return info;
									}
									if(!cNew.isTautology()){
										// CONTRACTION RULES
										if(contractionRules(cNew, selected, toBeRemoved))
											return info;
										if(lType==LoopType.OTTER_LOOP && contractionRules(cNew, list))
											return info;
										if(cNew!=null)
											list.add(cNew);
									}
									else
										info.nTautology++;
								}		
							}
				for(Clause rmCl: toBeRemoved)
					selected.remove(rmCl);
		} // END OF GIVEN CLAUSE LOOP
		
		//info.clausesNotSelected = (list.isEmpty())? 0: info.clausesGenerated - selected.size();
		info.res = (list.isEmpty())? LoopResult.SAT : LoopResult.TIME_EXPIRED;
		return info;
	}
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	 */
	private static boolean contractionRules(Clause cNew, List<Clause> clauseSet){
		if(cNew!=null){
			Iterator<Clause> iter = clauseSet.iterator();
			Clause 	cSel,
					cTemp;
			Literal l;
			while(iter.hasNext()){
				cSel=iter.next();
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
						return true;
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
					return false;
				}
			}
		}
		return false;
	}
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	 */
	private static boolean contractionRules(Clause cNew, List<Clause> clauseSet, Set<Clause> toBeRemoved){
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
							return true;
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
							return true;
						}
					}
					// SUBSUMPTIONS
					if(cNew.subsumes(cSel)){
						info.nSubsumptions++;
						toBeRemoved.add(cSel);
					} else if (cSel.subsumes(cNew)){
						info.nSubsumptions++;
						cNew=null; // cNew does not have to be considered
						return false;
					}
				}
		}
		return false;
	}
}
