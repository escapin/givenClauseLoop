package givenClauseLoop.core;

import givenClauseLoop.bean.InfoLoop;
import givenClauseLoop.bean.LoopResult;
import java.util.*;

public class ResearchPlan {

	public static InfoLoop OtterLoop(AbstractQueue<Clause> toBeSelected){
		AbstractQueue<Clause> selected = new PriorityQueue<Clause>();
		InfoLoop info = new InfoLoop();
		info.clausesGenerated=toBeSelected.size();
		
		AbstractQueue<Clause> newClauses;
		Clause givenClause;
		
		while(!toBeSelected.isEmpty()){ // GIVEN CLAUSE LOOP
			givenClause=toBeSelected.poll();
			if(!givenClause.isEmpty())
				if(givenClause.isTautology())
					info.nTautology++;
				else {
					selected.add(givenClause);
					
					// APPLIED FACTORISATION
					newClauses=ExpansionRules.factorisation(givenClause);
					info.nFactorisations += newClauses.size();
					info.clausesGenerated += newClauses.size(); 
					
					// CONTRACTION RULES with SELECTED QUEUE
					for(Clause cNew: newClauses)
						if(cNew.isEmpty()) // empty clause generated
							return returnUNSAT(info);
						else if(cNew.isTautology()){
							info.nTautology++;
							newClauses.remove(cNew);
						} else{
							for(Clause cSel: selected)
								// SIMPLIFICATIONS
								if(cNew.simplify(cSel)!=null){
									info.nSemplifications++;
									if(cNew.isEmpty())
										return returnUNSAT(info);
									selected.remove(cSel);
								} else if(cSel.simplify(cNew)!=null){
									info.nSemplifications++;
									if(cSel.isEmpty())
										return returnUNSAT(info);
									newClauses.remove(cNew);
								// SUBSUMPTIONS
								} else if(cNew.subsumes(cSel)){
									info.nSubsumptions++;
									selected.remove(cSel);
								} else if (cSel.subsumes(cNew)){
									info.nSubsumptions++;
									newClauses.remove(cNew);
								}
						}
				}
		}
		
		//info.clausesNotSelected = (toBeSelected.isEmpty())? 0: info.clausesGenerated - selected.size();
		info.res = (toBeSelected.isEmpty())? LoopResult.SAT : LoopResult.TIME_EXPIRED;
		return info;
	}
	
	private static InfoLoop returnUNSAT(InfoLoop info){
		info.res = LoopResult.UNSAT;
		return info;
	}
	public static void Eloop(AbstractQueue<Clause> toBeSelected){
		
	}
}
