package givenClauseLoop.bean;

import givenClauseLoop.core.Clause;

public class InfoLoop {
	
	public int clausesRead;
	public int clausesGenerated;
	
	
	public int nResolutions;
	public int nFactorisations;
	public int nSubsumptions;
	public int nSimplifications;
	public int nTautology;
	
	public EnumClass.LoopResult res;
	
	public Clause	c1, c2;
	
	public EnumClass.Rule rule;
	
	public EnumClass.LoopType loopType;
	
	public InfoLoop(){
		clausesRead=0;
		nResolutions=0;
		nFactorisations=0;
		nSubsumptions=0;
		nSimplifications=0;
		nTautology=0;
		res=EnumClass.LoopResult.TIME_EXPIRED;
		loopType=EnumClass.LoopType.OTTER_LOOP;
		c1=null;
		c2=null;
	}

}
