package givenClauseLoop.bean;

public class CommandOptions {

	public EnumClass.clauseStrategy clauseStrategy;
	public int peakGivenRatio;
	public EnumClass.LoopType loopType;
	public long timeOut;
	public EnumClass.researchStrategy researchStrategy;
	public String filePath;
	
	public CommandOptions(){
		clauseStrategy = EnumClass.clauseStrategy.MIN_QUEUE;
		peakGivenRatio = 0;
		loopType = EnumClass.LoopType.OTTER_LOOP;
		timeOut=0; // infinite
		researchStrategy=EnumClass.researchStrategy.CONTR_BEFORE;
		filePath="";
	}
}

