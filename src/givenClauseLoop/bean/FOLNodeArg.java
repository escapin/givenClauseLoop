package givenClauseLoop.bean;

import java.util.List;

public interface FOLNodeArg{
	
	public void setArgs(List<Term> args);
	
	public List<Term> getArgs();
	
	public int nArgs();
}
