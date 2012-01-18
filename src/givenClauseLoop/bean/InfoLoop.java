package givenClauseLoop.bean;

public class InfoLoop {
	
	public int clausesRead;
	public int clausesGenerated;
	//public int clausesSelected;
	//public int clausesNotSelected;
	
	public int nResolutions;
	public int nFactorisations;
	public int nSubsumptions;
	public int nSimplifications;
	public int nTautology;
	
	public LoopResult res;
	
	public InfoLoop(){
		clausesRead=0;
		clausesGenerated=0;
		//clausesSelected=0;
		//clausesNotSelected=0;
		nResolutions=0;
		nFactorisations=0;
		nSubsumptions=0;
		nSimplifications=0;
		nTautology=0;
	}

}
