package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;

/**
 * @author Enrico Scapin
 *
 */
public class Unifier {

	private static Map<FOLNode, FOLNode> sigma;
	
	public Unifier(){
		sigma=new HashMap<FOLNode, FOLNode>();
	}
	
	public static Map<FOLNode, FOLNode> unify(List<FOLNode> x, List<FOLNode> y){
		
	}
}
