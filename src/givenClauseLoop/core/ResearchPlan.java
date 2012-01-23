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
		//selected = new LinkedList<Clause>();
		selected = new HashSet<Clause>();
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
			
			if(opt.peakGivenRatio>0 && i%opt.peakGivenRatio==0){
				givenClause= oldest.iterator().next(); // the oldest one 
				oldest.remove(givenClause);
				toBeSelected.remove(givenClause);
			} else {
				givenClause=((Queue<Clause>) toBeSelected).poll();
				if(opt.peakGivenRatio>0)
					oldest.remove(givenClause);
			}
			
			if(opt.researchStrategy==EnumClass.researchStrategy.EXP_BEFORE)
				selected.add(givenClause);
			//selected.add(Clause) givenClause.clone());
			
			System.out.print("\r" + i + ")      \t" + toBeSelected.size() + "......................." + selected.size() + "      ");
			
			// FIND FACTORS
			if(findFactors(givenClause))
				return info;
			
			// FIND BINARY RESOLVENTS
			if(opt.researchStrategy==EnumClass.researchStrategy.EXP_BEFORE){
				if(findExpResolvents(givenClause))
					return info;
			} else {
				if(findContrResolvents(givenClause))
					return info;
			}
			
			if(opt.researchStrategy!=EnumClass.researchStrategy.EXP_BEFORE)
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
	
	
	private static boolean findExpResolvents(Clause givenClause){
		Queue<Clause> resolvents= new LinkedList<Clause>();
		Clause cNew;
		for(Clause cSel: selected)
			if(givenClause!=cSel){
				Set<Literal> lMap;
				for(Literal l1: givenClause.getLiterals())
					if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
						for(Literal l2: lMap){
							cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
							if(cNew!=null){
								if(cNew.isEmpty()){
									info.c1=givenClause;
									info.c2=cSel;
									info.rule=EnumClass.Rule.BINARY_RESOLUTION;
									info.res = EnumClass.LoopResult.UNSAT;
									return true;
								}
								resolvents.add(cNew);
							}	
						}
			}
		
		Set<Clause> toBeRemoved = new HashSet<Clause>();
		Clause c1;
		for(Iterator<Clause> iter1=resolvents.iterator(); iter1.hasNext(); ){
			do{
				c1=iter1.next();
			}while(toBeRemoved.contains(c1) && iter1.hasNext());
			if(toBeRemoved.contains(c1) && !iter1.hasNext())
				break;
			if(c1.isTautology()){
				info.nTautology++;
				iter1.remove();
			} 
			else {
				c1=contractionRules(c1, resolvents, toBeRemoved, null, null);
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
			}
		}
		for(Clause c: toBeRemoved)
			resolvents.remove(c);
				
				
		for(Clause c: resolvents)
			if(!c.isTautology()){
				c=contractionRules(c, selected, null, null, null); // CONTRACTION RULES with selected
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
				if(c!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
					c=contractionRules(c, toBeSelected, null, null, null); 
					// CONTRACTION RULES with toBeSelected									
					if(info.res==EnumClass.LoopResult.UNSAT)
						return true;
				}
				if(c!=null){
					toBeSelected.add(c);
					if(opt.peakGivenRatio>0)
						oldest.add(c);
				} 
			} else
				info.nTautology++;
		
		return false;	
	}
	
	
	
	private static boolean findContrResolvents(Clause givenClause){
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
						lRm= new HashSet<Literal>();
						
						for(Iterator<Literal> iter=lSet.iterator(); !toBeRemoved.contains(cSel) && iter.hasNext();){
							do{
								l2=iter.next();
							}while( (notToBeConsidered=lRm.contains(l2)) && iter.hasNext());
							if(notToBeConsidered && !iter.hasNext()) // last element but it has not to be considered
								break;
							
							cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
							if(cNew!=null){ // a binary resolvent has been found
								info.nResolutions++;
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
	
	
	/**
	 * Applies the contraction rules subsumption and clauses' simplification.
	 * The last three parameter must be set to null if you are not iterating on the 'clauseCollection' collection;
	 * otherwise after the execution of this method you have to delete the clauses that are in toBeRemoved from 'clauseSet' 
	 * and the literals that are in lRm from lSet. It happens when you are applying the binary resolution and, consequently, 
	 * you are iterating on 'select' collection.   
	 * 
	 * @param cNew clause with which the contractionRules should be applied. If it has to be removed, it will became null.
	 * @param clauseSet	 set with which we have to applies the contraction rules
	 * @param toBeRemoved set of clauses that will have to be removed in the calling method
	 * @param lSet	set of literals in which the calling method is iterating
	 * @param lRm	set of literals contained in lSet that the calling method will have to remove from lSet	
	 * @return cNew if this clause has to be added to toBeSelected, null otherwise
	 */
	private static Clause contractionRules(Clause cNew, Collection<Clause> clauseCollection, 
			Set<Clause> toBeRemoved, Set<Literal> lSet, Set<Literal> lRm){
		if(cNew!=null){
			Clause 	cSel=new Clause(),
					cTemp;
			Literal l;
			boolean notToBeConsidered=false;
			
			for(Iterator<Clause> iter = clauseCollection.iterator(); iter.hasNext(); ){
				do{
					cSel=iter.next();
				}while(toBeRemoved!=null && (notToBeConsidered=toBeRemoved.contains(cSel)) && iter.hasNext());
				if(toBeRemoved!=null && notToBeConsidered && !iter.hasNext()) 
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
						iter.remove(); 	// Removes from the clauseCollection Queue the last element returned by the iterator
										// is like clauseCollection.remove(cSel);
						if(clauseCollection==toBeSelected && opt.peakGivenRatio>0)
							oldest.remove(cSel);
					}
				} 
			}		
		}
		return cNew;
	}
}
