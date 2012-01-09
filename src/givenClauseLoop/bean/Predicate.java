package givenClauseLoop.bean;

public class Predicate extends FOLNodeArg {

	private boolean isPositive;
	
	public Predicate(String symbol, boolean isPositive){
		super.symbol=symbol;
		this.isPositive=isPositive;
		if(!isPositive)	// because also the negation symbol "~" must be counted
			symNumber++;
	}
	
	public boolean isPositive(){
		return isPositive;
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer();
		s.append(symbol + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return isPositive? s.toString() : "~" + s.toString();
	}
}
