package givenClauseLoop.core;

import givenClauseLoop.bean.*;

import java.util.*;

public class ResearchPlan {
	
	private static InfoLoop info;
	private static CommandOptions opt;
	private static Clause givenClause;
	
	private static Collection<Literal> litGCrm;
	
	private static Collection<Clause> toBeSelected;
	private static Collection<Clause> alreadySelected;
	private static Collection<Clause>  oldest;
	
	public static InfoLoop givenClauseLoop(Queue<Clause> toBeSel, CommandOptions option, InfoLoop infoLoop){
		toBeSelected = toBeSel;
		opt=option;
		info = infoLoop;
		litGCrm = new HashSet<Literal>();
		alreadySelected = new LinkedList<Clause>();
		//alreadySelected = new HashSet<Clause>();
		//alreadySelected = new LinkedHashSet<Clause>();
		info.clausesGenerated=toBeSelected.size();
		info.loopType=opt.loopType;
		
		if(opt.peakGivenRatio>0)
			oldest = new LinkedHashSet<Clause>(); 
		
		for(Iterator<Clause> iter = toBeSelected.iterator(); iter.hasNext(); ){
			givenClause = iter.next();
			if(givenClause.isTautology()){
				info.nTautology++;
				iter.remove();
			} else if (opt.peakGivenRatio>0)
				oldest.add(givenClause);
		}
		
		int i=0;
		System.out.println("ITERS\t\tTO BE SELECTED" + "\t\t" + "ALREADY SELECTED");
		info.res=EnumClass.LoopResult.TIME_EXPIRED;
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
			
			alreadySelected.add(givenClause);
			litGCrm.clear();
			
			System.out.print("\r" + i + ")      \t" + toBeSelected.size() + "......................." + alreadySelected.size() + "      ");
			
			
			if(opt.researchStrategy==EnumClass.researchStrategy.EXP_BEFORE){
				if(findExpansionBefore(givenClause))
					return info;
			} else{
			// FIND FACTORS
				if(findFactors(givenClause))
					return info;
				if(findResolvents(givenClause))
					return info;
			}
			
		} // END OF GIVEN CLAUSE LOOP
		info.res = EnumClass.LoopResult.SAT;
		return info;
	}
	
	
	private static boolean findExpansionBefore(Clause givenClause){
		Queue<Clause> results= new LinkedList<Clause>();
		
		results=ExpansionRules.factorisation(givenClause);
		info.nFactorisations += results.size();
		Clause cNew;
		for(Clause cSel: alreadySelected)
			if(givenClause!=cSel){
				Set<Literal> lMap;
				for(Literal l1: givenClause.getLiterals())
					if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
						for(Literal l2: lMap){
							cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
							if(cNew!=null){
								info.nResolutions++;
								if(cNew.isEmpty()){
									info.c1=givenClause;
									info.c2=cSel;
									info.rule=EnumClass.Rule.BINARY_RESOLUTION;
									info.res = EnumClass.LoopResult.UNSAT;
									return true;
								}
								results.add(cNew);
							}	
						}
			}
		
		Set<Clause> toBeRemoved = new HashSet<Clause>();
		Clause c1;
		boolean toBeRem=false,
						next=false;
		for(Iterator<Clause> iter1=results.iterator(); iter1.hasNext(); ){
			do{
				c1=iter1.next();
			}while((toBeRem=toBeRemoved.contains(c1)) && (next=iter1.hasNext()));
			if(toBeRem && !next)
				break;
			if(c1.isTautology()){
				info.nTautology++;
				iter1.remove();
			} 
			else {
				c1=contractionRules(c1, results, toBeRemoved, null, null);
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
			}
		}
		for(Clause c: toBeRemoved)
			results.remove(c);
				
		for(Clause c: results)
			if(!c.isTautology()){
				c=contractionRules(c, alreadySelected, null, null, null); // CONTRACTION RULES with alreadySelected
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
				if(c!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
					c=contractionRules(c, toBeSelected, null, null, null); 
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
							
							cNew=contractionRules(cNew, alreadySelected, null, null, null); // CONTRACTION RULES with alreadySelected
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
		Literal l1, l2;
		boolean notToBeConsidered=false;
		for(Clause cSel: alreadySelected)
			if(cSel!=givenClause && !toBeRemoved.contains(cSel))
				for(Iterator<Literal> iterGiven = givenClause.getLiterals().iterator(); iterGiven.hasNext();){
					do{
						l1=iterGiven.next();
					}while(litGCrm.contains(l1) && iterGiven.hasNext());
					if(litGCrm.contains(l1) && !iterGiven.hasNext())
						break;
					
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
									cNew=contractionRules(cNew, alreadySelected, toBeRemoved, lSet, lRm); // CONTRACTION RULES with alreadySelected
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
				}
		for(Literal l: litGCrm)
			givenClause.literals.remove(l);
		for(Clause rmCl: toBeRemoved)
			alreadySelected.remove(rmCl);
		
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
			boolean notToBeConsidered=false,
							next=false;
			
			for(Iterator<Clause> iter = clauseCollection.iterator(); iter.hasNext(); ){
				do{
					cSel=iter.next();
				}while(toBeRemoved!=null && (notToBeConsidered=toBeRemoved.contains(cSel)) && (next=iter.hasNext()));
				if(toBeRemoved!=null && notToBeConsidered && !next) 
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
				} else if( (l=cSel.simplify(cNew, false))!=null){
					info.nSimplifications++;
					if(cSel==givenClause)
						litGCrm.add(l);
					else
						cSel.getLiterals().remove(l);
					
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
					else{
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
	
	
	
	
	/*
	private static boolean findExpFactRes(Clause givenClause){
		Queue<Clause> results=ExpansionRules.factorisation(givenClause);
		Clause cNew;
		for(Clause cSel: alreadySelected)
			if(givenClause!=cSel){
				Set<Literal> lMap;
				for(Literal l1: givenClause.getLiterals())
					if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getSymbol()) ) != null )
						for(Literal l2: lMap){
							cNew=ExpansionRules.binaryResolution(givenClause, l1, cSel, l2);
							if(cNew!=null){
								info.nResolutions++;
								if(cNew.isEmpty()){
									info.c1=givenClause;
									info.c2=cSel;
									info.rule=EnumClass.Rule.BINARY_RESOLUTION;
									info.res = EnumClass.LoopResult.UNSAT;
									return true;
								}
								results.add(cNew);
							}	
						}
			}
		for(Iterator<Clause> iter=results.iterator(); iter.hasNext();){
			cNew=iter.next();
			if(cNew.isTautology()){
				info.nTautology++;
				iter.remove();
			}
		}
		
		Literal l;
		for(Clause c1: results)
			for(Clause c2: results)
				if(c1!=c2){ 
					if((l=c1.simplify(c2, false))!=null){
						info.nSimplifications++;
						if(c1.isEmpty()){ // empty clause generated
							info.c1=c2;
							Clause cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					}
				}
		
		for(Clause c1: results)
			for(Clause c2: toBeSelected)
				if(c1!=c2){ 
					if((l=c1.simplify(c2, false))!=null){
						info.nSimplifications++;
						if(c1.isEmpty()){ // empty clause generated
							info.c1=c2;
							Clause cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					} else if((l=c2.simplify(c1, false))!=null){
						info.nSimplifications++;
						if(c2.isEmpty()){ // empty clause generated
							info.c1=c1;
							Clause cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					}	
				}
		for(Clause c1: results)
			for(Clause c2: alreadySelected)
				if(c1!=c2){ 
					if((l=c1.simplify(c2, false))!=null){
						info.nSimplifications++;
						if(c1.isEmpty()){ // empty clause generated
							info.c1=c2;
							Clause cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					} else if((l=c2.simplify(c1, false))!=null){
						info.nSimplifications++;
						if(c2.isEmpty()){ // empty clause generated
							info.c1=c1;
							Clause cTemp=new Clause();
							cTemp.addLiteral(l);
							info.c2=cTemp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					}	
				}
		
		Queue<Clause> tmp1 = new PriorityQueue<Clause>();
		Set<Clause> tmpSubsumed = new HashSet<Clause>();
		
		for(Clause c1: results){
			for(Clause c2: results){
				if(c1!=c2){ 
					if(!tmpSubsumed.contains(c1) && !tmpSubsumed.contains(c1) && c2.subsumes(c1)){
						info.nSubsumptions++;
						tmpSubsumed.add(c1);
					}
				}
			}
			if(!tmpSubsumed.contains(c1))
				tmp1.add(c1);
		}
		results.clear();
		results.addAll(tmp1);
		tmp1.clear();
		
		for(Clause c1: results){
			for(Clause c2: toBeSelected){
				if(c1!=c2){ 
					if(!tmpSubsumed.contains(c1) && !tmpSubsumed.contains(c1) && c2.subsumes(c1)){
						info.nSubsumptions++;
						tmpSubsumed.add(c1);
					}
				}
			}
			if(!tmpSubsumed.contains(c1))
				tmp1.add(c1);
		}
		results.clear();
		results.addAll(tmp1);
		tmp1.clear();
		
		
		for(Clause c1: results){
			for(Clause c2: alreadySelected){
				if(c1!=c2){ 
					if(!tmpSubsumed.contains(c1) && !tmpSubsumed.contains(c1) && c2.subsumes(c1)){
						info.nSubsumptions++;
						tmpSubsumed.add(c1);
					}
				}
			}
			if(!tmpSubsumed.contains(c1))
				tmp1.add(c1);
		}
		results.clear();
		results.addAll(tmp1);
		tmp1.clear();
		
		
		
		
		return false;
	}
	*/

