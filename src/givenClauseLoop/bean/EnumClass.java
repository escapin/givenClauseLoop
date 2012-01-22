package givenClauseLoop.bean;

public class EnumClass{
	public static enum LoopType {
		OTTER_LOOP,
		E_LOOP
	}

	public static enum LoopResult{
		SAT,
		UNSAT,
		TIME_EXPIRED
	}
	
	public static enum Rule {
		BINARY_RESOLUTION,
		SIMPLIFICATION
	}
	
	public static enum clauseStrategy{
		FIFO,
		MIN_QUEUE
	}
	
	public static enum researchStrategy{
		EXP_BEFORE,
		CONTR_BEFORE
	}
}