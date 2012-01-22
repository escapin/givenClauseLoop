%--------------------------------------------------------------------------
% File     : GRP123-7.005 : TPTP v5.3.0. Released v1.2.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : (3,2,1) conjugate orthogonality
% Version  : [Sla93] axioms : Augmented.
%            Theorem formulation : Uses a second group.
% English  : If ab=xy and a*b = x*y then a=x and b=y, where c*b=a iff ab=c.
%            Generate the multiplication table for the specified quasi-
%            group with 5 elements.

% Refs     : [FSB93] Fujita et al. (1993), Automatic Generation of Some Res
%          : [Sla93] Slaney (1993), Email to G. Sutcliffe
%          : [SFS95] Slaney et al. (1995), Automated Reasoning and Exhausti
% Source   : [TPTP]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v5.0.0, 0.29 v4.1.0, 0.25 v4.0.1, 0.00 v3.4.0, 0.20 v3.3.0, 0.00 v3.2.0, 0.33 v3.1.0, 0.50 v2.5.0, 0.60 v2.4.0, 0.67 v2.2.0, 1.00 v2.1.0
% Syntax   : Number of clauses     :   51 (   2 non-Horn;  41 unit;  49 RR)
%            Number of atoms       :   79 (   0 equality)
%            Maximal clause size   :    7 (   2 average)
%            Number of predicates  :    7 (   0 propositional; 1-3 arity)
%            Number of functors    :    5 (   5 constant; 0-0 arity)
%            Number of variables   :   37 (   0 singleton)
%            Maximal term depth    :    1 (   1 average)
% SPC      : CNF_SAT_EPR

% Comments : [SFS93]'s axiomatization has been modified for this.
%          : Substitution axioms are not needed, as any positive equality
%            literals should resolve on negative ones directly.
%          : Version 7 has simple isomorphism avoidance (as mentioned in
%            [FSB93])
%          : tptp2X: -f tptp -s5 GRP123-7.g
%--------------------------------------------------------------------------
cnf(e_1_then_e_2,axiom,
    ( next(e_1,e_2) )).

cnf(e_2_then_e_3,axiom,
    ( next(e_2,e_3) )).

cnf(e_3_then_e_4,axiom,
    ( next(e_3,e_4) )).

cnf(e_4_then_e_5,axiom,
    ( next(e_4,e_5) )).

cnf(e_2_greater_e_1,axiom,
    ( greater(e_2,e_1) )).

cnf(e_3_greater_e_1,axiom,
    ( greater(e_3,e_1) )).

cnf(e_4_greater_e_1,axiom,
    ( greater(e_4,e_1) )).

cnf(e_5_greater_e_1,axiom,
    ( greater(e_5,e_1) )).

cnf(e_3_greater_e_2,axiom,
    ( greater(e_3,e_2) )).

cnf(e_4_greater_e_2,axiom,
    ( greater(e_4,e_2) )).

cnf(e_5_greater_e_2,axiom,
    ( greater(e_5,e_2) )).

cnf(e_4_greater_e_3,axiom,
    ( greater(e_4,e_3) )).

cnf(e_5_greater_e_3,axiom,
    ( greater(e_5,e_3) )).

cnf(e_5_greater_e_4,axiom,
    ( greater(e_5,e_4) )).

cnf(no_redundancy,axiom,
    ( ~ product(X,e_1,Y)
    | ~ next(X,X1)
    | ~ greater(Y,X1) )).

cnf(element_1,axiom,
    ( group_element(e_1) )).

cnf(element_2,axiom,
    ( group_element(e_2) )).

cnf(element_3,axiom,
    ( group_element(e_3) )).

cnf(element_4,axiom,
    ( group_element(e_4) )).

cnf(element_5,axiom,
    ( group_element(e_5) )).

cnf(e_1_is_not_e_2,axiom,
    ( ~ equalish(e_1,e_2) )).

cnf(e_1_is_not_e_3,axiom,
    ( ~ equalish(e_1,e_3) )).

cnf(e_1_is_not_e_4,axiom,
    ( ~ equalish(e_1,e_4) )).

cnf(e_1_is_not_e_5,axiom,
    ( ~ equalish(e_1,e_5) )).

cnf(e_2_is_not_e_1,axiom,
    ( ~ equalish(e_2,e_1) )).

cnf(e_2_is_not_e_3,axiom,
    ( ~ equalish(e_2,e_3) )).

cnf(e_2_is_not_e_4,axiom,
    ( ~ equalish(e_2,e_4) )).

cnf(e_2_is_not_e_5,axiom,
    ( ~ equalish(e_2,e_5) )).

cnf(e_3_is_not_e_1,axiom,
    ( ~ equalish(e_3,e_1) )).

cnf(e_3_is_not_e_2,axiom,
    ( ~ equalish(e_3,e_2) )).

cnf(e_3_is_not_e_4,axiom,
    ( ~ equalish(e_3,e_4) )).

cnf(e_3_is_not_e_5,axiom,
    ( ~ equalish(e_3,e_5) )).

cnf(e_4_is_not_e_1,axiom,
    ( ~ equalish(e_4,e_1) )).

cnf(e_4_is_not_e_2,axiom,
    ( ~ equalish(e_4,e_2) )).

cnf(e_4_is_not_e_3,axiom,
    ( ~ equalish(e_4,e_3) )).

cnf(e_4_is_not_e_5,axiom,
    ( ~ equalish(e_4,e_5) )).

cnf(e_5_is_not_e_1,axiom,
    ( ~ equalish(e_5,e_1) )).

cnf(e_5_is_not_e_2,axiom,
    ( ~ equalish(e_5,e_2) )).

cnf(e_5_is_not_e_3,axiom,
    ( ~ equalish(e_5,e_3) )).

cnf(e_5_is_not_e_4,axiom,
    ( ~ equalish(e_5,e_4) )).

cnf(product1_total_function1,axiom,
    ( ~ group_element(X)
    | ~ group_element(Y)
    | product1(X,Y,e_1)
    | product1(X,Y,e_2)
    | product1(X,Y,e_3)
    | product1(X,Y,e_4)
    | product1(X,Y,e_5) )).

cnf(product1_total_function2,axiom,
    ( ~ product1(X,Y,W)
    | ~ product1(X,Y,Z)
    | equalish(W,Z) )).

cnf(product1_right_cancellation,axiom,
    ( ~ product1(X,W,Y)
    | ~ product1(X,Z,Y)
    | equalish(W,Z) )).

cnf(product1_left_cancellation,axiom,
    ( ~ product1(W,Y,X)
    | ~ product1(Z,Y,X)
    | equalish(W,Z) )).

cnf(product1_idempotence,axiom,
    ( product1(X,X,X) )).

cnf(product2_total_function1,axiom,
    ( ~ group_element(X)
    | ~ group_element(Y)
    | product2(X,Y,e_1)
    | product2(X,Y,e_2)
    | product2(X,Y,e_3)
    | product2(X,Y,e_4)
    | product2(X,Y,e_5) )).

cnf(product2_total_function2,axiom,
    ( ~ product2(X,Y,W)
    | ~ product2(X,Y,Z)
    | equalish(W,Z) )).

cnf(product2_right_cancellation,axiom,
    ( ~ product2(X,W,Y)
    | ~ product2(X,Z,Y)
    | equalish(W,Z) )).

cnf(product2_left_cancellation,axiom,
    ( ~ product2(W,Y,X)
    | ~ product2(Z,Y,X)
    | equalish(W,Z) )).

cnf(product2_idempotence,axiom,
    ( product2(X,X,X) )).

cnf(qg1a,negated_conjecture,
    ( ~ product1(X,Y,Z1)
    | ~ product1(Z1,Y,Z2)
    | product2(Z2,X,Y) )).

%--------------------------------------------------------------------------
