%--------------------------------------------------------------------------
% File     : NUM284-1.014 : TPTP v5.3.0. Released v1.0.0.
% Domain   : Number Theory
% Problem  : Calculation of fibonacci numbers
% Version  : [SETHEO] axioms : Biased.
% English  : Compute the 14th Fibonacci number.

% Refs     :
% Source   : [SETHEO]
% Names    : fib3.lop (Size 3) [SETHEO]
%          : fib4.lop (Size 4) [SETHEO]
%          : fib5.lop (Size 5) [SETHEO]
%          : fib6.lop (Size 6) [SETHEO]
%          : fib9.lop (Size 9) [SETHEO]

% Status   : Unsatisfiable
% Rating   : 0.28 v5.3.0, 0.40 v5.2.0, 0.23 v5.1.0, 0.25 v5.0.0, 0.33 v4.0.1, 0.29 v3.7.0, 0.14 v3.4.0, 0.00 v3.2.0, 0.33 v3.1.0, 0.17 v2.7.0, 0.38 v2.6.0, 0.43 v2.5.0, 0.29 v2.4.0, 0.29 v2.3.0, 0.29 v2.2.1, 0.60 v2.2.0, 0.67 v2.1.0
% Syntax   : Number of clauses     :    6 (   0 non-Horn;   4 unit;   5 RR)
%            Number of atoms       :   12 (   0 equality)
%            Maximal clause size   :    6 (   2 average)
%            Number of predicates  :    2 (   0 propositional; 2-3 arity)
%            Number of functors    :    2 (   1 constant; 0-1 arity)
%            Number of variables   :   11 (   1 singleton)
%            Maximal term depth    :   15 (   2 average)
% SPC      : CNF_UNS_RFO_NEQ_HRN

% Comments : Biased towards SETHEO.
%          : tptp2X: -f tptp -s14 NUM284-1.g
%--------------------------------------------------------------------------
cnf(fibonacci_0,axiom,
    ( fibonacci(n0,s(n0)) )).

cnf(fibonacci_1,axiom,
    ( fibonacci(s(n0),s(n0)) )).

cnf(fibonacci_N,axiom,
    ( ~ sum(N1,s(n0),N)
    | ~ sum(N2,s(s(n0)),N)
    | ~ fibonacci(N1,F1)
    | ~ fibonacci(N2,F2)
    | ~ sum(F1,F2,FN)
    | fibonacci(N,FN) )).

cnf(add_0,axiom,
    ( sum(X,n0,X) )).

cnf(add,axiom,
    ( ~ sum(X,Y,Z)
    | sum(X,s(Y),s(Z)) )).

cnf(prove_fibonacci,negated_conjecture,
    ( ~ fibonacci(s(s(s(s(s(s(s(s(s(s(s(s(s(s(n0)))))))))))))),Result) )).

%--------------------------------------------------------------------------
