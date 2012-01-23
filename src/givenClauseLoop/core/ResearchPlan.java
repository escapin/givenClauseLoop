package givenClauseLoop.core;

import givenClauseLoop.bean.*;

import java.util.*;

public class ResearchPlan {
	
	private static InfoLoop info;
	private static CommandOptions opt;
	private static Collection<Clause> toBeSelected;
	private static Collection<Clause> selected;
	private static Collection<Clause>  oldest;
	
	public static InfoLoop givenClauseLoop(Queue<Clause> toBeSel, CommandOptions option, InfoLoop infoLoop){
		toBeSelected = toBeSel;
		opt=option;
		info = infoLoop;
		selected = new LinkedList<Clause>();
		//selected = new HashSet<Clause>();
		//selected = new LinkedHashSet<Clause>();
		info.clausesGenerated=toBeSelected.size();
		info.loopType=opt.loopType;
		
		if(opt.peakGivenRatio>0)
			oldest = new LinkedHashSet<Clause>(); 
		
		Clause givenClause;
		for(Iterator<Clause> iter = toBeSelected.iterator(); iter.hasNext(); ){
			givenClause = iter.next();
			if(givenClause.isTautology()){
				info.nTautology++;
				iter.remove();
			} else if (opt.peakGivenRatio>0)
				oldest.add(givenClause);
		}
		
		int i=0;
		System.out.println("ITERS\t\tTO BE SELECTED" + "\t\t" + "SELECTED");
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			i++;
			System.out.print("\r" + i + ")      \t" + toBeSelected.size() + "......................" + selected.size() + "      ");			
			
			if(opt.peakGivenRatio>0 && i%opt.peakGivenRatio==0){
				givenClause= oldest.iterator().next(); // the oldest one 
				oldest.remove(givenClause);
				toBeSelected.remove(givenClause);
			} else {
				givenClause=((Queue<Clause>) toBeSelected).poll();
				if(opt.peakGivenRatio>0)
					oldest.remove(givenClause);
			}
				
			// FIND FACTORS
			if(findFactors(givenClause))
				return info;
			// FIND BINARY RESOLVENTS
			if(findResolvents(givenClause))
				return info;
			
			selected.add(givenClause);
			
		} // END OF GIVEN CLAUSE LOOP
		
		info.res = EnumClass.LoopResult.SAT;
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
						if(!cNew.isTautology()){	
							
							cNew=contractionRules(cNew, selected, null, null, null); // CONTRACTION RULES with selected
							if(info.res==EnumClass.LoopResult.UNSAT)
								return true;
							if(cNew!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
								cNew=contractionRules(cNew, toBeSelected, null, null, null); // CONTRACTION RULES with toBeSelected									
								if(info.res==EnumClass.LoopResult.UNSAT)
									return true;
							}
							if(cNew!=null){
								toBeSelected.add(cNew);
								if(opt.peakGivenRatio>0)
									oldest.add(cNew);
							}	
						} else
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
			if(cSel!=givenClause && !toBeRemoved.contains(cSel))
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
								//System.out.println("\t" + cNew);
								if(cNew.isEmpty()){
									info.c1=givenClause;
									info.c2=cSel;
									info.rule=EnumClass.Rule.BINARY_RESOLUTION;
									info.res = EnumClass.LoopResult.UNSAT;
									return true;
								}
								
								if(!cNew.isTautology()){
									cNew=contractionRules(cNew, selected, toBeRemoved, lSet, lRm); // CONTRACTION RULES with selected
									if(info.res==EnumClass.LoopResult.UNSAT)
										return true;
									if(cNew!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
										cNew=contractionRules(cNew, toBeSelected, null, null, null); 
										// CONTRACTION RULES with toBeSelected									
										if(info.res==EnumClass.LoopResult.UNSAT)
											return true;
									}
									if(cNew!=null){
										toBeSelected.add(cNew);
										if(opt.peakGivenRatio>0)
											oldest.add(cNew);
									}
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
						info.rule=EnumClass.Rule.SIMPLIFICATION;
						info.res = EnumClass.LoopResult.UNSAT;
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
						info.res = EnumClass.LoopResult.UNSAT;
						info.rule=EnumClass.Rule.SIMPLIFICATION;
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
					if(toBeRemoved!=null)
						toBeRemoved.add(cSel);
					else {
						iter.remove(); 	// Removes from the clauseSet Queue the last element returned by the iterator
										// is like clauseSet.remove(cSel);
						if(clauseSet==toBeSelected && opt.peakGivenRatio>0)
							oldest.remove(cSel);
					}
				} 
			}		
		}
		return cNew;
	}
}
