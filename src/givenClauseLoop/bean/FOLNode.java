/**
 * 
 */
package givenClauseLoop.bean;

import java.util.List;

/**
 * @author Enrico Scapin
 *
 */
public class FOLNode{
	final String name;
	final SymType syty;
	List<FOLNode> args=null;
	
	public FOLNode(String name, SymType syty){
		this.name=name;
		this.syty=syty;
	}
	
	public void setArgs(List<FOLNode> args){
		this.args=args;
	}
	public List<FOLNode> getArgs(){
		return args;
	}
}
