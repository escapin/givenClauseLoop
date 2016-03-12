# Description:

A theorem prover, based on the "Given Clause Loop" methodology,
allowing to assert whether a set of clauses in the First Order Logic is
*satisfiable* or not.
It accepts clauses in _Conjunctive Normal Form_ (CNF) based on the CNF
fragment without equality of the TPTP syntax.
	 * http://www.tptp.org
	 * http://www.cs.miami.edu/~tptp/TPTP/SyntaxBNF.html

There are two deletion strategies, each of them based on that one
implemented in to two well-known theorem provers: 
	* Otter	http://www.cs.unm.edu/~mccune/otter/ 
	* E 	http://www4.informatik.tu-muenchen.de/~schulz/E/E.html


# Usage:

```
java -jar givenClauseLoop.jar [-fifo | -best | -bestN] [-o | -e] [-timeN] [-contr | -exp] filePath
```
or

```
java -jar givenClauseLoop.jar -man
```			

Default usage:
```
java -jar givenClauseLoop.jar filePath
```
is like
```
java -jar givenClauseLoop.jar -best -o -contr filePath
```

# Options:

-fifo	the given clause is the oldest for insertion sort
-best	the given clause is the least one where the order is defined by symbols' number in each clause
-bestN	such as above but with a number N that represents the Peak Given Ration: each N iterations 
		the given clause is not the least one but the oldest one

-o	based on Otter theorem prover, aims at keeping the union of To-be-selected and Already-selected inter-reduced
-e	based on E theorem prover, aims at keeping only Already-selected inter-reduced

-timeN	if specified, it allows to stop the execution of the given clause loop also if the correct result has not been found

-contr	every time a new clause is generated applying binary resolution, checks if it is possible to apply a contraction rule 
		(tautology, subsumption, clauses' simplification) with the clause in To-be-selected and Already-selected
-exp	creates all the binary resolvents from the given clause and all the clauses in Already-selected, and then try to apply 
		contraction rules (tautology, subsumption, clauses' simplification)

-man	print this manual and exit

filePath the path of the file in which there are the clauses that have to be analysed (the only mandatory option)
