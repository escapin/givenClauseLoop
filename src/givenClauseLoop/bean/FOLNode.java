/**
 * 
 */
package givenClauseLoop.bean;

import java.util.List;

/**
 * @author Enrico Scapin
 *
 */
public class FOLNode implements Comparable<FOLNode>{
	final String name;
	final SymType syty;
	/**
	 * The number of the symbols in this node
	 * (at least is one)
	 */
	private int	symNumber=1;
	
	List<FOLNode> args=null;
	
	
	public FOLNode(String name, SymType syty){
		this.name=name;
		this.syty=syty;
	}
	
	public SymType getSymType(){
		return syty;
	}
	
	public void setArgs(List<FOLNode> args){
		this.args=args;
		for(FOLNode a: args){
			symNumber += a.getSymNumber();
		}
	}
	
	public List<FOLNode> getArgs(){
		return args;
	}
	/**
	 * The number of symbols in that node
	 * @return symNumber the number of symbols in that node
	 */
	public int getSymNumber(){
		return symNumber;
	}
	
	public int compareTo(FOLNode n){
		return 0;
	}
}
