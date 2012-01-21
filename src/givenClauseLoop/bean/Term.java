package givenClauseLoop.bean;

import java.util.Map;

public abstract class Term extends FOLNode{
	
	/**
	 * Create a new object Term that will be different from the current one apart from 
	 * it is a constant.
	 * 
	 * @param varMap map that matches each old variable with the corresponding new one already created
	 * @return a new Term with the same signature
	 */
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
