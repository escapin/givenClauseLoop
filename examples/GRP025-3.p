%--------------------------------------------------------------------------
% File     : GRP025-3 : TPTP v5.3.0. Bugfixed v1.2.1.
% Domain   : Group Theory (Named groups)
% Problem  : All groups of order 2 are isomorphic
% Version  : [MOW76] axioms : Incomplete.
%            Theorem formulation : Does not prove full generality.
% English  : If G1 has exactly two elements and G2 has exactly two
%            elements, then there exists an isomorphism [a one-to-one and
%            onto homomorphism] between them.

% Refs     : [MOW76] McCharen et al. (1976), Problems and Experiments for a
% Source   : [ANL]
% Names    : order2.ver3.in [ANL]

% Status   : Satisfiable
% Rating   : 0.89 v5.3.0, 0.86 v5.0.0, 0.62 v4.1.0, 0.57 v4.0.0, 0.62 v3.5.0, 0.71 v3.4.0, 0.83 v3.2.0, 0.80 v3.1.0, 0.86 v2.7.0, 0.80 v2.6.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :   47 (   2 non-Horn;  25 unit;  36 RR)
%            Number of atoms       :   85 (   0 equality)
%            Maximal clause size   :    4 (   2 average)
%            Number of predicates  :    3 (   0 propositional; 2-4 arity)
%            Number of functors    :   13 (   9 constant; 0-3 arity)
%            Number of variables   :   90 (   0 singleton)
%            Maximal term depth    :    2 (   1 average)
% SPC      : CNF_SAT_RFO_NEQ

% Comments : In order to prove the theorem, the group tables and a
%            particular homomorphism are specified, and the contradiction
%            comes from the fact that this is the actual isomorphism. Not
%            only is this formulation cheating, but also it does not prove
%            the theorem in full generality.
%          : Missing an_isomorphism subsitution axioms.
% Bugfixes : v1.2.1 - Bugfix in GRP006-0.ax.
%--------------------------------------------------------------------------
%----Include the axioms for named groups
%include('Axioms/GRP006-0.ax').
%--------------------------------------------------------------------------
cnf(reflexivity,axiom,
    ( equalish(X,X) )).

cnf(symmetry,axiom,
    ( ~ equalish(X,Y)
    | equalish(Y,X) )).

cnf(transitivity,axiom,
    ( ~ equalish(X,Y)
    | ~ equalish(Y,Z)
    | equalish(X,Z) )).

cnf(product_substitution1,axiom,
    ( ~ equalish(Xg,Yg)
    | ~ product(Xg,X,Y,Z)
    | product(Yg,X,Y,Z) )).

cnf(product_substitution2,axiom,
    ( ~ equalish(X,Y)
    | ~ product(Xg,X,Z,W)
    | product(Xg,Y,Z,W) )).

cnf(product_substitution3,axiom,
    ( ~ equalish(X,Y)
    | ~ product(Xg,W,X,Z)
    | product(Xg,W,Y,Z) )).

cnf(product_substitution4,axiom,
    ( ~ equalish(X,Y)
    | ~ product(Xg,W,Z,X)
    | product(Xg,W,Z,Y) )).

cnf(multiply_substitution1,axiom,
    ( ~ equalish(Xg,Yg)
    | equalish(multiply(Xg,X,Y),multiply(Yg,X,Y)) )).

cnf(multiply_substitution2,axiom,
    ( ~ equalish(X,Y)
    | equalish(multiply(Xg,X,Z),multiply(Xg,Y,Z)) )).

cnf(multiply_substitution3,axiom,
    ( ~ equalish(X,Y)
    | equalish(multiply(Xg,Z,X),multiply(Xg,Z,Y)) )).

cnf(inverse_substitution1,axiom,
    ( ~ equalish(Xg,Yg)
    | equalish(inverse(Xg,X),inverse(Yg,X)) )).

cnf(inverse_substitution2,axiom,
    ( ~ equalish(X,Y)
    | equalish(inverse(Xg,X),inverse(Xg,Y)) )).

cnf(group_member_substitution1,axiom,
    ( ~ equalish(Xg,Yg)
    | ~ group_member(X,Xg)
    | group_member(X,Yg) )).

cnf(group_member_substitution2,axiom,
    ( ~ equalish(X,Y)
    | ~ group_member(X,Xg)
    | group_member(Y,Xg) )).

cnf(identity_substitution,axiom,
    ( ~ equalish(Xg,Yg)
    | equalish(identity_for(Xg),identity_for(Yg)) )).

cnf(identity_in_group,axiom,
    ( group_member(identity_for(Xg),Xg) )).

cnf(left_identity,axiom,
    ( product(Xg,identity_for(Xg),X,X) )).

cnf(right_identity,axiom,
    ( product(Xg,X,identity_for(Xg),X) )).

cnf(inverse_in_group,axiom,
    ( ~ group_member(X,Xg)
    | group_member(inverse(Xg,X),Xg) )).

cnf(left_inverse,axiom,
    ( product(Xg,inverse(Xg,X),X,identity_for(Xg)) )).

cnf(right_inverse,axiom,
    ( product(Xg,X,inverse(Xg,X),identity_for(Xg)) )).

%----These axioms are called closure or totality in some axiomatisations
cnf(total_function1_1,axiom,
    ( ~ group_member(X,Xg)
    | ~ group_member(Y,Xg)
    | product(Xg,X,Y,multiply(Xg,X,Y)) )).

cnf(total_function1_2,axiom,
    ( ~ group_member(X,Xg)
    | ~ group_member(Y,Xg)
    | group_member(multiply(Xg,X,Y),Xg) )).

%----This axiom is called well_definedness in some axiomatisations
cnf(total_function2,axiom,
    ( ~ product(Xg,X,Y,Z)
    | ~ product(Xg,X,Y,W)
    | equalish(W,Z) )).

cnf(associativity1,axiom,
    ( ~ product(Xg,X,Y,Xy)
    | ~ product(Xg,Y,Z,Yz)
    | ~ product(Xg,Xy,Z,Xyz)
    | product(Xg,X,Yz,Xyz) )).

cnf(associativity2,axiom,
    ( ~ product(Xg,X,Y,Xy)
    | ~ product(Xg,Y,Z,Yz)
    | ~ product(Xg,X,Yz,Xyz)
    | product(Xg,Xy,Z,Xyz) )).

%----Definition of the two groups
cnf(a_member_of_group1,hypothesis,
    ( group_member(a,g1) )).

cnf(b_member_of_group1,hypothesis,
    ( group_member(b,g1) )).

cnf(c_member_of_group2,hypothesis,
    ( group_member(c,g2) )).

cnf(d_member_of_group2,hypothesis,
    ( group_member(d,g2) )).

cnf(a_and_b_only_members_of_group1,hypothesis,
    ( ~ group_member(X,g1)
    | equalish(X,a)
    | equalish(X,b) )).

cnf(c_and_d_only_members_of_group2,hypothesis,
    ( ~ group_member(X,g2)
    | equalish(X,c)
    | equalish(X,d) )).

cnf(a_times_a_is_a,hypothesis,
    ( product(g1,a,a,a) )).

cnf(a_times_b_is_b,hypothesis,
    ( product(g1,a,b,b) )).

cnf(b_times_a_is_b,hypothesis,
    ( product(g1,b,a,b) )).

cnf(b_times_b_is_a,hypothesis,
    ( product(g1,b,b,a) )).

cnf(c_times_c_is_c,hypothesis,
    ( product(g2,c,c,c) )).

cnf(c_times_d_is_d,hypothesis,
    ( product(g2,c,d,d) )).

cnf(d_times_c_is_d,hypothesis,
    ( product(g2,d,c,d) )).

cnf(d_times_d_is_c,hypothesis,
    ( product(g2,d,d,c) )).

%----Definition of the isomorphism
cnf(a_maps_to_c,hypothesis,
    ( equalish(an_isomorphism(a),c) )).

cnf(b_maps_to_d,hypothesis,
    ( equalish(an_isomorphism(b),d) )).

%----Denial that the isomorphism is indeed one
cnf(d1_member_of_group1,hypothesis,
    ( group_member(d1,g1) )).

cnf(d2_member_of_group1,hypothesis,
    ( group_member(d2,g1) )).

cnf(d3_member_of_group1,hypothesis,
    ( group_member(d3,g1) )).

cnf(d1_times_d2_is_d3,hypothesis,
    ( product(g1,d1,d2,d3) )).

cnf(prove_product_holds_in_group2,negated_conjecture,
    ( ~ product(g2,an_isomorphism(d1),an_isomorphism(d2),an_isomorphism(d3)) )).

%--------------------------------------------------------------------------

