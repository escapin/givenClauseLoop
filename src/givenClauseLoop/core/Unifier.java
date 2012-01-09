package givenClauseLoop.core;

import java.util.*;
import givenClauseLoop.bean.*;

/**
 * @author Enrico Scapin
 *
 */
public class Unifier {

	private static Map<Variable, Term> sigma;
	
	public Unifier(){
		sigma=new HashMap<Variable, Term>();
	}
	
	public static Map<Variable, Term> unify(List<Term> arg1, List<Term> arg2){
		return sigma;
	}
}
