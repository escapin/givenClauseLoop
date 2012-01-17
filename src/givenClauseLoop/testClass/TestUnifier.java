package givenClauseLoop.testClass;

import java.util.*;

import givenClauseLoop.bean.*;
import givenClauseLoop.parser.*;

public class TestUnifier {

	public static void main(String[] args) throws Exception{
		String arg1, arg2;
		/* CLASH
		arg1="f(X), Y, g(Y)";
		arg2="g(X), Z, g(X)";
		 */
		/* OCCUR CHECK */
		arg1="Y, Z, X, f(b) ";
		arg2="Z, g(X), a, f(b)";
		
		arg1="Z, X, L, f(Q) ";
		arg2="Z, g(X), M, f(b)";
		
		arg1="Y, f(X)";
		arg2="a, Y";
		boolean sameClause=true;
		
		List<Term>[] lar=new List[2];
		lar=Parser.getArguments(arg1, arg2, sameClause);
		/**
			for(Term t: lar[0])
				System.out.println(t);
			System.out.println();
			for(Term t: lar[1])
				System.out.println(t);
			System.out.println();
		*/
		
		Map<Variable, Term> sigma=givenClauseLoop.core.Unifier.findMGU(lar[0], lar[1], sameClause);
		//Map<Variable, Term> sigma=givenClauseLoop.core.Unifier.findLeftSubst(lar[0], lar[1], sameClause);
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