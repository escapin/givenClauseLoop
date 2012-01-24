%--------------------------------------------------------------------------
% File     : NLP065-1 : TPTP v5.3.0. Released v2.4.0.
% Domain   : Natural Language Processing
% Problem  : A man comes out of the bathroom, problem 7
% Version  : [Bos00b] axioms.
% English  : Eliminating logically equivalent interpretations in the statement
%            "A man comes out of the bathroom with a magnum in his hand.
%            The man fires six shots from his canon."

% Refs     : [Bos00a] Bos (2000), DORIS: Discourse Oriented Representation a
%            [Bos00b] Bos (2000), Applied Theorem Proving - Natural Language
% Source   : [TPTP]
% Names    :

% Status   : Satisfiable
% Rating   : 0.22 v5.3.0, 0.14 v5.0.0, 0.12 v4.1.0, 0.14 v4.0.0, 0.12 v3.5.0, 0.14 v3.4.0, 0.17 v3.2.0, 0.40 v3.1.0, 0.29 v2.7.0, 0.40 v2.6.0, 0.50 v2.5.0, 0.00 v2.4.0
% Syntax   : Number of clauses     :   40 (  10 non-Horn;   2 unit;  19 RR)
%            Number of atoms       :  150 (   0 equality)
%            Maximal clause size   :   11 (   4 average)
%            Number of predicates  :   19 (   1 propositional; 0-3 arity)
%            Number of functors    :   16 (   6 constant; 0-3 arity)
%            Number of variables   :  153 (  60 singleton)
%            Maximal term depth    :    2 (   1 average)
% SPC      : CNF_SAT_RFO_NEQ

% Comments : Created from NLP065+1.p using FLOTTER
%--------------------------------------------------------------------------
cnf(clause1,negated_conjecture,
    ( actual_world(skc58) )).

cnf(clause2,negated_conjecture,
    ( actual_world(skc6) )).

cnf(clause3,negated_conjecture,
    ( ssSkC0
    | six(skc58,skc59) )).

cnf(clause4,negated_conjecture,
    ( ssSkC0
    | group(skc58,skc59) )).

cnf(clause5,negated_conjecture,
    ( ssSkC0
    | male(skc58,skc60) )).

cnf(clause6,negated_conjecture,
    ( ~ ssSkC0
    | six(skc6,skc7) )).

cnf(clause7,negated_conjecture,
    ( ~ ssSkC0
    | group(skc6,skc7) )).

cnf(clause8,negated_conjecture,
    ( ~ ssSkC0
    | male(skc6,skc8) )).

cnf(clause9,negated_conjecture,
    ( ssSkC0
    | ssSkP1(skc60,skc59,skc58) )).

cnf(clause10,negated_conjecture,
    ( ~ ssSkC0
    | ssSkP0(skc7,skc8,skc6) )).

cnf(clause11,negated_conjecture,
    ( ~ member(skc58,U,skc59)
    | ssSkC0
    | shot(skc58,U) )).

cnf(clause12,negated_conjecture,
    ( ~ member(skc6,U,skc7)
    | ~ ssSkC0
    | shot(skc6,U) )).

cnf(clause13,negated_conjecture,
    ( ssSkP0(U,V,W)
    | cannon(W,skf19(W,X,Y)) )).

cnf(clause14,negated_conjecture,
    ( ssSkP0(U,V,W)
    | member(W,skf16(U,W,X),U) )).

cnf(clause15,negated_conjecture,
    ( ssSkP0(U,V,W)
    | of(W,skf19(W,V,X),V) )).

cnf(clause16,negated_conjecture,
    ( ssSkP1(U,V,W)
    | member(W,skf26(U,W,V),V) )).

cnf(clause17,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | cannon(U,skf22(U,Y,Z)) )).

cnf(clause18,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | event(U,skf20(U,Y,Z)) )).

cnf(clause19,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | present(U,skf20(U,Y,Z)) )).

cnf(clause20,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | nonreflexive(U,skf20(U,Y,Z)) )).

cnf(clause21,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | fire(U,skf20(U,Y,Z)) )).

cnf(clause22,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | man(U,skf21(U,Y,Z)) )).

cnf(clause23,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | of(U,skf22(U,X,Y),X) )).

cnf(clause24,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | patient(U,skf20(U,V,Y),V) )).

cnf(clause25,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | from_loc(U,skf20(U,V,X),skf22(U,X,V)) )).

cnf(clause26,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ ssSkP1(X,W,U)
    | agent(U,skf20(U,Y,Z),skf21(U,Z,Y)) )).

cnf(clause27,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | nonreflexive(U,skf12(U,Z,X1)) )).

cnf(clause28,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | fire(U,skf12(U,Z,X1)) )).

cnf(clause29,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | man(U,skf13(U,Z,X1)) )).

cnf(clause30,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | event(U,skf12(U,Z,X1)) )).

cnf(clause31,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | present(U,skf12(U,Z,X1)) )).

cnf(clause32,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | from_loc(U,skf12(U,X,Z),X) )).

cnf(clause33,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | patient(U,skf12(U,X,V),V) )).

cnf(clause34,negated_conjecture,
    ( ~ six(U,V)
    | ~ group(U,V)
    | ~ ssSkP0(V,W,U)
    | ~ male(U,W)
    | ~ actual_world(U)
    | ssSkC0
    | member(U,skf28(U,V),V) )).

cnf(clause35,negated_conjecture,
    ( ~ six(U,V)
    | ~ group(U,V)
    | ~ shot(U,skf28(U,W))
    | ~ ssSkP0(V,X,U)
    | ~ male(U,X)
    | ~ actual_world(U)
    | ssSkC0 )).

cnf(clause36,negated_conjecture,
    ( ~ six(U,V)
    | ~ group(U,V)
    | ~ ssSkP1(W,V,U)
    | ~ male(U,W)
    | ~ actual_world(U)
    | ~ ssSkC0
    | member(U,skf11(U,V),V) )).

cnf(clause37,negated_conjecture,
    ( ~ six(U,V)
    | ~ group(U,V)
    | ~ shot(U,skf11(U,W))
    | ~ ssSkP1(X,V,U)
    | ~ male(U,X)
    | ~ actual_world(U)
    | ~ ssSkC0 )).

cnf(clause38,negated_conjecture,
    ( ~ member(U,V,W)
    | ~ cannon(U,X)
    | ~ of(U,X,Y)
    | ~ ssSkP0(W,Y,U)
    | agent(U,skf12(U,Z,X1),skf13(U,X1,Z)) )).

cnf(clause39,negated_conjecture,
    ( ~ event(U,V)
    | ~ patient(U,V,skf16(W,U,X))
    | ~ present(U,V)
    | ~ nonreflexive(U,V)
    | ~ fire(U,V)
    | ~ from_loc(U,V,skf19(U,X,W))
    | ~ agent(U,V,Y)
    | ~ man(U,Y)
    | ssSkP0(W,X,U) )).

cnf(clause40,negated_conjecture,
    ( ~ agent(U,V,W)
    | ~ man(U,W)
    | ~ fire(U,V)
    | ~ nonreflexive(U,V)
    | ~ present(U,V)
    | ~ patient(U,V,skf26(X,U,Y))
    | ~ event(U,V)
    | ~ of(U,Z,X)
    | ~ cannon(U,Z)
    | ~ from_loc(U,V,Z)
    | ssSkP1(X,X1,U) )).

%--------------------------------------------------------------------------
