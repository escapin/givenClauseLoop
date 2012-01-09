package givenClauseLoop.bean;

public class Variable implements Term {

	/**
	 * The name of the FOL symbol
	 */
	private String symbol;
	
	/**
	 * The number of the symbols in this node
	 * (at least is one)
	 */
	private int symNumber=1;
	
	public Variable(String symbol){
		this.symbol=symbol;
	}
	
	@Override
	public String getSymbol(){
		return symbol;
	}
	
	@Override
	public int getSymNumber(){
		return symNumber;
	}
	
	public String toString(){
		return symbol;
	}
}
