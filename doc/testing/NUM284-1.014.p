henry@VGN:~/workspace/givenClauseLoop/bin$ java givenClauseLoop.Main  -exp ../examples/NUM284-1.014.p 
FILE: NUM284-1.014.p
Parsing...
 Found 6 clauses

Given Clause Loop parameters:
	loop type:		Otter
	selection strategy:	best visit first (min priority queue)
	peak given ratio:	not inserted
	research strategy:	expansion rules before
	time out:		infinite

Executing Given Clause Loop...
ITERATION	TO BE SELECTED		ALREADY SELECTED
16)             20.......................16      

Result: OUT OF MEMORY

Clause generated: 45
	Factors: 4
	Binary resolvents: 41
Tautologies:		0
Subsumptions:		4
Simplifications:	1

Elapsed clock time:	3m 9,9100s	(189910ms)
henry@VGN:~/workspace/givenClauseLoop/bin$ java givenClauseLoop.Main  ../examples/NUM284-1.014.p 
FILE: NUM284-1.014.p
Parsing...
 Found 6 clauses

Given Clause Loop parameters:
	loop type:		Otter
	selection strategy:	best visit first (min priority queue)
	peak given ratio:	not inserted
	research strategy:	contraction rules before
	time out:		infinite

Executing Given Clause Loop...
ITERATION	TO BE SELECTED		ALREADY SELECTED
142)            46.......................59      

Result: UNSATISFIABLE
Simplification: 
	[sum(X@bc4,s(s(n0)),s(s(X@892)))]  simplifies  [~sum(s(n0),s(s(n0)),s(s(s(s(s(s(s(s(s(s(s(s(s(s(n0)))))))))))))))]

Clause generated: 1992
	Factors: 43
	Binary resolvents: 1949
Tautologies:		0
Subsumptions:		1892
Simplifications:	267

Elapsed clock time:	0m 25,0750s	(25075ms)
henry@VGN:~/workspace/givenClauseLoop/bin$ 
