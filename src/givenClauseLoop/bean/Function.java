package givenClauseLoop.bean;

public class Function extends FOLNodeArg implements Term {

	public Function(String symbol){
		super.symbol=symbol;
	}
	
	public String toString(){
		StringBuffer s = new StringBuffer(symbol + "(");
		for(Term t: args)
			s.append(t.toString() + ",");
		s.replace(s.length()-1, s.length(), ")");
		return s.toString();
	}
}
