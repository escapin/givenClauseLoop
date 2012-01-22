package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.Literal;
import givenClauseLoop.bean.LoopResult;
import givenClauseLoop.bean.LoopType;
import givenClauseLoop.bean.RuleEmptyClause;


import java.util.*;

public class ResearchPlan {
	
	private static InfoLoop info;
	private static Collection<Clause> toBeSelected;
	private static Collection<Clause> selected;
	
	public static InfoLoop givenClauseLoop(Queue<Clause> toBeSel, LoopType lType){
		info = new InfoLoop();
		toBeSelected = toBeSel;
		selected = new HashSet<Clause>();
		//selected = new LinkedHashSet<Clause>();
		
		info.clausesGenerated=toBeSelected.size();
		info.loopType=lType;
		
		Clause givenClause;
		
		for(Iterator<Clause> iter = toBeSelected.iterator(); iter.hasNext(); ){
			givenClause = iter.next();
			if(givenClause.isTautology()){
				info.nTautology++;
				iter.remove();
			}
		}		
		
		System.out.println("ITERS\t\tTO BE SELECTED" + "\t\t" + "SELECTED");
		int i=0;
		
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			i++;
			System.out.print("\r" + i + ")      \t" + toBeSelected.size() + "......................" + selected.size() + "      ");			
			
			givenClause=((Queue<Clause>) toBeSelected).poll();
			selected.add(givenClause);

			// FIND FACTORS
			if(findFactors(givenClause))
				return info;
			// FIND BINARY RESOLVENTS
			if(findResolvents(givenClause))
				return info;
			
			
		} // END OF GIVEN CLAUSE LOOP
		
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
							
							cNew=contractionRules(cNew, selected, null, null, null); // CONTRACTION RULES with selected
							if(info.res==LoopResult.UNSAT)
								return true;
							if(cNew!=null && info.loopType==LoopType.OTTER_LOOP){
								cNew=contractionRules(cNew, toBeSelected, null, null, null); // CONTRACTION RULES with toBeSelected									
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
		Set<Literal>	lSet, 
						lRm = new HashSet<Literal>();
		Literal l2;
		boolean notToBeConsidered=false;
		for(Clause cSel: selected)
			if(givenClause!=cSel && !toBeRemoved.contains(cSel))
				for(Literal l1: givenClause.getLiterals())
					if(!toBeRemoved.contains(cSel) && (lSet=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null ){
						lRm.clear();
						
						for(Iterator<Literal> iter=lSet.iterator(); !toBeRemoved.contains(cSel) && iter.hasNext();){
							do{
								l2=iter.next();
							}while( (notToBeConsidered=lRm.contains(l2)) && iter.hasNext());
							if(notToBeConsidered && !iter.hasNext()) // last element but it has not to be considered
								break;
							
							/*
							System.out.println("\nGIVEN CLAUSE: ");
							System.out.println("\t" + givenClause);
							System.out.println("SELECTED CLAUSE: ");
							System.out.println("\t" + cSel + "\n");
							*/
							
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
									cNew=contractionRules(cNew, selected, toBeRemoved, lSet, lRm); // CONTRACTION RULES with selected
									if(info.res==LoopResult.UNSAT)
										return true;
									if(cNew!=null && info.loopType==LoopType.OTTER_LOOP){
										cNew=contractionRules(cNew, toBeSelected, null, null, null); 
										// CONTRACTION RULES with toBeSelected									
										if(info.res==LoopResult.UNSAT)
											return true;
									}
									
									if(cNew!=null)
										toBeSelected.add(cNew);
								} else
									info.nTautology++;
							}
						}
						for(Literal l: lRm)
							lSet.remove(l);
					}
						
		for(Clause rmCl: toBeRemoved)
			selected.remove(rmCl);
		
		return false;	
	}
	
	/*
	System.out.println("TO BE REMOVED OUTSIDE: ");
	for(Clause c: toBeRemoved)
		System.out.println("\t" + c);
	*/
	
	/*
	for(Clause rmCl: toBeRemoved)
		if(selected.contains(rmCl))
			System.out.println("not removed");
		else
			System.out.println("\t" + rmCl + "   REMOVED!!!");
	
	System.out.println("TO BE SELECTED: ");
	System.out.println("\t" + toBeSelected);
	System.out.println("SELECTED: ");
	System.out.println("\t" + selected + "\n");
	*/
	
	
	/**
	 * 
	 * @param cNew the clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet
	 * @return true if the empty clause is found, false otherwise
	 */
	private static Clause contractionRules(Clause cNew, Collection<Clause> clauseSet, 
			Set<Clause> toBeRemoved, Set<Literal> lSet, Set<Literal> lRm){
		if(cNew!=null){
			Clause 	cSel=new Clause(),
					cTemp;
			Literal l;
			boolean notToBeConsidered=false;
			for(Iterator<Clause> iter = clauseSet.iterator(); iter.hasNext(); ){
				do{
					cSel=iter.next();
				}while(toBeRemoved!=null && (notToBeConsidered=toBeRemoved.contains(cSel)) && iter.hasNext());
				if(notToBeConsidered && !iter.hasNext()) 
					// if this element have not to be considered but there isn't other after
					return cNew;
				
				// SIMPLIFICATIONS
				if((l=cNew.simplify(cSel, true))!=null){
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
				} else if((l=cSel.simplify(cNew, false))!=null){
					info.nSimplifications++;
					if(lSet!=null && lRm!=null && lSet.contains(l))
						lRm.add(l);
					else // this literal must be removed from support set too
						cSel.getLitMap().get(( (l.sign()? "": "~") + l.getSymbol())).remove(l); 
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
					info.nSubsumptions++;
					return null;
				} else if(cNew.subsumes(cSel)){
					info.nSubsumptions++;
					//System.out.println("\n" + cSel + " subsumes " + cNew);
					if(toBeRemoved!=null){
						toBeRemoved.add(cSel);
						/*System.out.println("\nTO BE REMOVED INSIDE: ");
						for(Clause c: toBeRemoved)
							System.out.println("\t" + c);*/
					}else
						iter.remove(); 	// Removes from the clauseSet Queue the last element returned by the iterator
										// is like clauseSet.remove(cSel);	
				} 
			}		
		}
		return cNew;
	}
}
