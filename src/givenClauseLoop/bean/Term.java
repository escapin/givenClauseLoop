package givenClauseLoop.bean;

import java.util.Map;

public abstract class Term extends FOLNode{
	
	public Term clone(Map<Variable, Variable> varMap){
		if(this instanceof Constant)
			return ((Constant) this).clone(varMap);
		else if(this instanceof Variable){
			return ((Variable) this).clone(varMap);
		} else{ // if(this instanceof Function){
			return ((Function) this).clone(varMap);
		}
	}
	
}
