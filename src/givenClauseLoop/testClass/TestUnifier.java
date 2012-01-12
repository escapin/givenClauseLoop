package givenClauseLoop.testClass;

import java.util.*;

import givenClauseLoop.bean.*;
import givenClauseLoop.parser.*;

public class TestUnifier {

	public static void main(String[] args) throws Exception{
		
		/* CLASH
		String	arg1="f(X), Y, g(Y)",
				arg2="g(X), Z, g(X)";
		 */
		/* OCCUR CHECK */
		String	arg1="Y, Z, X ",
				arg2="Z, g(X), a";
		
		List<Term>[] lar=new List[2];
		lar=Parser.getArguments(arg1, arg2, true);
		/**
		for(Term t: lar[0])
			System.out.println(t);
		System.out.println();
		for(Term t: lar[1])
			System.out.println(t);
		System.out.println();
		*/
		
		givenClauseLoop.core.Unifier u = new givenClauseLoop.core.Unifier();
		Map<Variable, Term> sigma=u.unify(lar[0], lar[1]);
		Term t;
		System.out.println("MOST GENERAL UNIFIER:");
		if(sigma==null)
			System.out.println("Fail to unify.");
		else if(sigma.size()==0)
			System.out.println("The substitution is empty.");
		else
			for(Variable v: sigma.keySet()){
				t=sigma.get(v);
				System.out.println(v.toString() + "  <--  " + t.toString());
			}

	}

}
