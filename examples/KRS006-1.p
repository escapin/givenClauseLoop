%--------------------------------------------------------------------------
% File     : KRS006-1 : TPTP v5.3.0. Released v2.0.0.
% Domain   : Knowledge Representation
% Problem  : Paramasivam problem T-Box 2b
% Version  : Especial.
% English  : Inconsistent concept definition with disjoint concepts.

% Refs     : [PP95]  Paramasivam & Plaisted (1995), Automated Deduction Tec
% Source   : [PP95]
% Names    : Problem 2(b) [PP95]

% Status   : Satisfiable
% Rating   : 0.00 v3.1.0, 0.14 v2.7.0, 0.00 v2.1.0
% Syntax   : Number of clauses     :   27 (   5 non-Horn;   5 unit;  23 RR)
%            Number of atoms       :   59 (   0 equality)
%            Maximal clause size   :    6 (   2 average)
%            Number of predicates  :    9 (   0 propositional; 1-2 arity)
%            Number of functors    :    9 (   1 constant; 0-1 arity)
%            Number of variables   :   30 (   0 singleton)
%            Maximal term depth    :    2 (   1 average)
% SPC      : CNF_SAT_RFO_NEQ

% Comments : java givenClauseLoop.Main -best -o -time120 -exp KRS006-1.p
%--------------------------------------------------------------------------
cnf(clause_1,negated_conjecture,
    ( e(exist) )).

cnf(clause_2,negated_conjecture,
    ( r1most(exist) )).

cnf(clause_3,negated_conjecture,
    ( r(exist,u4r1(exist)) )).

cnf(clause_4,negated_conjecture,
    ( d(u4r2(exist)) )).

cnf(clause_5,negated_conjecture,
    ( c(u4r1(exist)) )).

cnf(clause_6,axiom,
    ( s2least(X1)
    | ~ c(X1) )).

cnf(clause_7,axiom,
    ( c(X1)
    | ~ s2least(X1) )).

cnf(clause_8,axiom,
    ( ~ s2least(X1)
    | ~ equalish(u1r2(X1),u1r1(X1)) )).

cnf(clause_9,axiom,
    ( s(X1,u1r1(X1))
    | ~ s2least(X1) )).

cnf(clause_10,axiom,
    ( s(X1,u1r2(X1))
    | ~ s2least(X1) )).

cnf(clause_11,axiom,
    ( s2least(X1)
    | equalish(X3,X2)
    | ~ s(X1,X3)
    | ~ s(X1,X2) )).

cnf(clause_12,axiom,
    ( s1most(X1)
    | ~ d(X1) )).

cnf(clause_13,axiom,
    ( d(X1)
    | ~ s1most(X1) )).

cnf(clause_14,axiom,
    ( equalish(X3,X2)
    | ~ s1most(X1)
    | ~ s(X1,X3)
    | ~ s(X1,X2) )).

cnf(clause_15,axiom,
    ( s1most(X1)
    | ~ equalish(u3r2(X1),u3r1(X1)) )).

cnf(clause_16,axiom,
    ( s1most(X1)
    | s(X1,u3r1(X1)) )).

cnf(clause_17,axiom,
    ( s1most(X1)
    | s(X1,u3r2(X1)) )).

cnf(clause_18,axiom,
    ( d(u4r2(X1))
    | ~ e(X1) )).

cnf(clause_19,axiom,
    ( r(X1,u4r2(X1))
    | ~ e(X1) )).

cnf(clause_20,axiom,
    ( c(u4r1(X1))
    | ~ e(X1) )).

cnf(clause_21,axiom,
    ( r(X1,u4r1(X1))
    | ~ e(X1) )).

cnf(clause_22,axiom,
    ( r1most(X1)
    | ~ e(X1) )).

cnf(clause_23,axiom,
    ( e(X1)
    | ~ r1most(X1)
    | ~ r(X1,X2)
    | ~ c(X2)
    | ~ r(X1,X3)
    | ~ d(X3) )).

cnf(clause_24,axiom,
    ( equalish(X3,X2)
    | ~ r1most(X1)
    | ~ r(X1,X3)
    | ~ r(X1,X2) )).

cnf(clause_25,axiom,
    ( r1most(X1)
    | ~ equalish(u5r2(X1),u5r1(X1)) )).

cnf(clause_26,axiom,
    ( r1most(X1)
    | r(X1,u5r1(X1)) )).

cnf(clause_27,axiom,
    ( r1most(X1)
    | r(X1,u5r2(X1)) )).

%--------------------------------------------------------------------------
