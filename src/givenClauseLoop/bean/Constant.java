package givenClauseLoop.bean;

import java.util.Map;

public class Constant extends Term {

	public Constant(String name){
		this.name=name;
	}
	
	public boolean equals(Object obj){
		return ( this==obj || ( obj instanceof Constant && this.getName().equals(((Constant) obj).getName()) ) );
	}
	
	public Term clone(Map<Variable, Variable> varMap){
		return this;
	}
}