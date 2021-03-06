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
	private static Collection<Clause> simplified;
	
	public static InfoLoop givenClauseLoop(Collection<Clause> toBeSel, CommandOptions option, InfoLoop infoLoop){
		toBeSelected = toBeSel;
		opt=option;
		info = infoLoop;
		simplified=new HashSet<Clause>();
		litGCrm = new HashSet<Literal>();
		//alreadySelected = new LinkedList<Clause>();
		//alreadySelected = new HashSet<Clause>();
		alreadySelected = new LinkedHashSet<Clause>();
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
		System.out.println("ITERATION\tTO BE SELECTED" + "\t\t" + "ALREADY SELECTED");
		info.res=EnumClass.LoopResult.TIME_EXPIRED;
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			i++;
			
			if(opt.peakGivenRatio>0 && i%opt.peakGivenRatio==0){
				givenClause= oldest.iterator().next(); // the oldest one 
				oldest.remove(givenClause);
				toBeSelected.remove(givenClause);
			} else {
				if(toBeSelected instanceof Queue)
					givenClause=((Queue<Clause>) toBeSelected).poll();
				else{
					givenClause=toBeSelected.iterator().next();
					toBeSelected.remove(givenClause);
				}
				if(opt.peakGivenRatio>0)
					oldest.remove(givenClause);
			}
			
			litGCrm.clear();
			
			alreadySelected.add(givenClause);
			
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
		Collection<Clause> results; //= new LinkedList<Clause>();
		
		results= ExpansionRules.factorisation(givenClause);
		info.nFactorisations += results.size();
		Clause cNew;
		for(Clause cSel: alreadySelected)
			if(givenClause!=cSel){
				Set<Literal> lMap;
				for(Literal l1: givenClause.getLiterals())
					if( (lMap=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getName()) ) != null )
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
		
		// MAINTAINED results to inter-reduced
		Clause c1, c2;
		Set<Literal> lSet;
		Collection<Clause> toBeRm = new HashSet<Clause>();
		Object[] resToArray = results.toArray(); 
		int k=0;
		for(Iterator<Clause> iterR=results.iterator(); iterR.hasNext();){
			do
				c1=iterR.next();
			while(toBeRm.contains(c1) && iterR.hasNext());
			if(toBeRm.contains(c1) && !iterR.hasNext())
				break;
			
			if(!c1.isTautology()){
				for(int j=k+1; j<resToArray.length; j++){
					c2= (Clause) resToArray[j];
					if(!(lSet=c1.simplify(c2, false)).isEmpty()){
						info.nSimplifications++;
						if(c1.isEmpty()){
							info.c1=c2;
							Clause cTmp=new Clause();
							for(Literal l: lSet)
								cTmp.addLiteral(l);
							info.c2=cTmp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					}
					else if(!(lSet=c2.simplify(c1, false)).isEmpty()){
						info.nSimplifications++;
						if(c2.isEmpty()){
							info.c1=c1;
							Clause cTmp=new Clause();
							for(Literal l: lSet)
								cTmp.addLiteral(l);
							info.c2=cTmp;
							info.rule=EnumClass.Rule.SIMPLIFICATION;
							info.res = EnumClass.LoopResult.UNSAT;
							return true;
						}
					}
					if(c2.subsumes(c1)){
						info.nSubsumptions++;
						iterR.remove();
						break;
					} else if(c1.subsumes(c2)){
						info.nSubsumptions++;
						toBeRm.add(c2);
					}
				}
			} else
				info.nTautology++;
			k++;
		}
		for(Clause c: toBeRm)
			results.remove(c);
		
		// clearing all the clauses simplified
		simplified.clear();	
		for(Clause c: results)
			if(!c.isTautology()){
				c=contractionRules(c, alreadySelected, null); // CONTRACTION RULES with alreadySelected
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
				if(c!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
					c=contractionRules(c, toBeSelected, null); 
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

		if(manageSimplified(simplified))
			return true;
		//toBeSelected.addAll(simplified);
		return false;	
	}
	
	
	private static boolean findFactors(Clause givenClause){
		Clause cNew;
		Set<Literal> lMap;
		Map<Literal, Literal> alreadyFactorised = new HashMap<Literal, Literal>(); // in order to avoid double factorisations
		// clearing all the clauses simplified
		simplified.clear();
		for(Literal l1: givenClause.getLiterals())
			if( (lMap=givenClause.getLitMap().get( (l1.sign()? "": "~") + l1.getName()) ) != null)
				for(Literal l2: lMap){
					cNew=ExpansionRules.factorisation(givenClause, l1, l2, alreadyFactorised);
					if(cNew!=null){ // a factor has been found
						info.nFactorisations++;
						if(!cNew.isTautology()){	
							
							cNew=contractionRules(cNew, alreadySelected, null); // CONTRACTION RULES with alreadySelected
							if(info.res==EnumClass.LoopResult.UNSAT)
								return true;
							if(cNew!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
								cNew=contractionRules(cNew, toBeSelected, null); // CONTRACTION RULES with toBeSelected									
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
		if(manageSimplified(simplified))
			return true;
		//toBeSelected.addAll(simplified);
		return false;
	}
	
	
	private static boolean findResolvents(Clause givenClause){
		Clause cNew;
		Set<Clause> toBeRemoved = new HashSet<Clause>();
		Set<Literal>	lSet;
		Literal l1;
		// clearing all the clauses simplified
		simplified.clear();
		for(Clause cSel: alreadySelected)
			if(cSel!=givenClause && !toBeRemoved.contains(cSel))
				for(Iterator<Literal> iterGiven = givenClause.getLiterals().iterator(); iterGiven.hasNext();){
					do{
						l1=iterGiven.next();
					}while(litGCrm.contains(l1) && iterGiven.hasNext());
					if(litGCrm.contains(l1) && !iterGiven.hasNext())
						break;
					
					if(!toBeRemoved.contains(cSel) && (lSet=cSel.getLitMap().get( (l1.sign()? "~": "") + l1.getName()) ) != null ){
						
						for(Literal l2: lSet){
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
									cNew=contractionRules(cNew, alreadySelected, toBeRemoved); // CONTRACTION RULES with alreadySelected
									if(info.res==EnumClass.LoopResult.UNSAT)
										return true;
									if(cNew!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
										cNew=contractionRules(cNew, toBeSelected, null); 
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
					}
				}
		for(Literal l: litGCrm)
			givenClause.literals.remove(l);
		for(Clause rmCl: toBeRemoved)
			alreadySelected.remove(rmCl);
		
		if(manageSimplified(simplified))
			return true;
		//toBeSelected.addAll(simplified);
		
		return false;	
	}
	
	private static boolean manageSimplified(Collection<Clause> simplified){
		Clause cNew;
		while(!simplified.isEmpty()){
			cNew=simplified.iterator().next();
			simplified.remove(cNew);
			cNew=contractionRules(cNew, alreadySelected, null); // CONTRACTION RULES with alreadySelected
			if(info.res==EnumClass.LoopResult.UNSAT)
				return true;
			if(cNew!=null && info.loopType==EnumClass.LoopType.OTTER_LOOP){
				cNew=contractionRules(cNew, toBeSelected, null); 
				// CONTRACTION RULES with toBeSelected									
				if(info.res==EnumClass.LoopResult.UNSAT)
					return true;
			}
			if(cNew!=null){
				toBeSelected.add(cNew);
				if(opt.peakGivenRatio>0)
					oldest.add(cNew);
			}
		}
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
	private static Clause contractionRules(Clause cNew, Collection<Clause> clauseCollection, Set<Clause> toBeRemoved){
		if(cNew!=null){
			Clause 	cSel=new Clause(),
					cTemp;
			Set<Literal> litSim;
			boolean notToBeConsidered=false,
							next=false,
							cSelSimplified=false;
			
			for(Iterator<Clause> iter = clauseCollection.iterator(); iter.hasNext(); ){
				do{
					cSel=iter.next();
				}while(toBeRemoved!=null && (notToBeConsidered=toBeRemoved.contains(cSel)) && (next=iter.hasNext()));
				if(toBeRemoved!=null && notToBeConsidered && !next) 
					// if this element have not to be considered but there isn't other after
					return cNew;
				
				cSelSimplified=false;
				// SIMPLIFICATIONS
				if(!(litSim=cNew.simplify(cSel, true)).isEmpty()){
					info.nSimplifications++;
					if(cNew.isEmpty()){ // empty clause generated
						info.c1=cSel;
						cTemp=new Clause();
						for(Literal l: litSim)
							cTemp.addLiteral(l);
						info.c2=cTemp;
						info.rule=EnumClass.Rule.SIMPLIFICATION;
						info.res = EnumClass.LoopResult.UNSAT;
						return cNew;
					}
				} else if( !(litSim=cSel.simplify(cNew, false)).isEmpty()){
					cSelSimplified=true;
					info.nSimplifications++;
					for(Literal l: litSim){
						if(cSel==givenClause)
							litGCrm.add(l);
						else
							cSel.getLiterals().remove(l);
						/*
						if(lSet!=null && lRm!=null && lSet.contains(l))
							lRm.add(l);
						else // this literal must be removed from support set too
						*/
					}
					if(cSel.isEmpty() || (cSel==givenClause && givenClause.nLiterals()==litSim.size())){	// empty clause generated
						info.c1=cNew;
						if(cSel==givenClause)
							info.c2=givenClause;
						else {
							cTemp=new Clause();
							for(Literal l: litSim)
								cTemp.addLiteral(l);
							info.c2=cTemp;
						}
						info.res = EnumClass.LoopResult.UNSAT;
						info.rule=EnumClass.Rule.SIMPLIFICATION;
						return cNew;
					}
					if(toBeRemoved!=null)
						toBeRemoved.add(cSel);
					else
						iter.remove(); 	// Removes from the clauseCollection Queue the last element returned by the iterator
														// is like clauseCollection.remove(cSel);
					simplified.add(cSel);
				}
				if(!cSelSimplified){
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
		}
		return cNew;
	}
}	

/*
	simplified.clear();
	Set<Literal> litSim;
	if(info.loopType==EnumClass.LoopType.E_LOOP){
		Clause cSel;
		for(Iterator<Clause> iter=alreadySelected.iterator(); iter.hasNext();){
			cSel=iter.next();
			if(givenClause.subsumes(cSel)){
				info.nSubsumptions++;
				iter.remove();
			}
			else if(!(litSim=cSel.simplify(givenClause, false)).isEmpty()){
				info.nSimplifications++;
				if(cSel.isEmpty()){ // empty clause generated
					info.c1=cSel;
					Clause cTemp=new Clause();
					for(Literal l: litSim)
						cTemp.addLiteral(l);
					info.c2=cTemp;
					info.rule=EnumClass.Rule.SIMPLIFICATION;
					info.res = EnumClass.LoopResult.UNSAT;
					return info;
				}
				iter.remove();
				simplified.add(cSel);
			}	
		}
	}
	toBeSelected.addAll(simplified);

// clearing all the clauses simplified
		simplified.clear();
		Clause c;
		Set<Literal> litSim;
		boolean resultRm=false;
		for(Iterator<Clause> iter=results.iterator(); iter.hasNext();){
			c=iter.next();
			if(!c.isTautology()){
				if(info.loopType==EnumClass.LoopType.OTTER_LOOP){
					c=contractionRules(c, alreadySelected, null); // CONTRACTION RULES with alreadySelected
					if(info.res==EnumClass.LoopResult.UNSAT)
						return true;
					if(c!=null){
						c=contractionRules(c, toBeSelected, null); 
						if(info.res==EnumClass.LoopResult.UNSAT)
							return true;
					}
					if(c!=null){
						toBeSelected.add(c);
						if(opt.peakGivenRatio>0)
							oldest.add(c);
					}
				} else{ // LoopType.E_LOOP
					resultRm=false;
					for(Clause cSel: alreadySelected){
						if(cSel.subsumes(c)){
							info.nSubsumptions++;
							iter.remove();
							resultRm=true;
							break;
						} else if(!(litSim=c.simplify(cSel, false)).isEmpty()){
							info.nSimplifications++;
							if(c.isEmpty()){ // empty clause generated
								info.c1=cSel;
								Clause cTemp=new Clause();
								for(Literal l: litSim)
									cTemp.addLiteral(l);
								info.c2=cTemp;
								info.rule=EnumClass.Rule.SIMPLIFICATION;
								info.res = EnumClass.LoopResult.UNSAT;
								return true;
							}
							iter.remove();	
							simplified.add(c);
							resultRm=true;
							break;
						}
					}
					if(!resultRm){
						toBeSelected.add(c);
						if(opt.peakGivenRatio>0)
							oldest.add(c);
					}
				}
			} else {
				info.nTautology++;
				iter.remove();
			}
		}
		
		if(info.loopType==EnumClass.LoopType.E_LOOP)
			toBeSelected.addAll(simplified);
		else if(manageSimplified(simplified))
			return true;
		//toBeSelected.addAll(simplified);
		return false;	 
 */

