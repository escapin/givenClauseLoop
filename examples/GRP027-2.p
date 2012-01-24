%--------------------------------------------------------------------------
% File     : GRP027-2 : TPTP v5.3.0. Bugfixed v1.2.1.
% Domain   : Group Theory (Named groups)
% Problem  : All groups of order 5 are cyclic
% Version  : [MOW76] axioms : Incomplete.
% English  : There exists an element in G that generates all other
%            elements by taking powers of that element.

% Refs     :
% Source   : [ANL]
% Names    : cyclic.ver3.in [ANL]

% Status   : Satisfiable
% Rating   : 0.89 v5.3.0, 0.86 v5.0.0, 0.62 v4.1.0, 0.57 v4.0.0, 0.62 v3.5.0, 0.71 v3.4.0, 0.83 v3.2.0, 0.80 v3.1.0, 0.86 v2.7.0, 0.80 v2.6.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :   39 (   1 non-Horn;  18 unit;  27 RR)
%            Number of atoms       :   78 (   0 equality)
%            Maximal clause size   :    6 (   2 average)
%            Number of predicates  :    3 (   0 propositional; 2-4 arity)
%            Number of functors    :   10 (   6 constant; 0-3 arity)
%            Number of variables   :   95 (   0 singleton)
%            Maximal term depth    :    5 (   1 average)
% SPC      : CNF_SAT_RFO_NEQ

% Comments : This theorem is proven via the fact that any element raised
%            to the power of the group gives the identity element back,
%            and that therefore only powers up to 5 in this case need
%            be investigated.
%          : This version omits 2 substitution axioms
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

%----Elements of the group of order 5
cnf(a_in_group,hypothesis,
    ( group_member(a,g) )).

cnf(b_in_group,hypothesis,
    ( group_member(b,g) )).

cnf(c_in_group,hypothesis,
    ( group_member(c,g) )).

cnf(d_in_group,hypothesis,
    ( group_member(d,g) )).

cnf(i_in_group,hypothesis,
    ( group_member(i,g) )).

cnf(i_is_identity,hypothesis,
    ( equalish(identity_for(g),i) )).

cnf(all_of_group,hypothesis,
    ( ~ group_member(X,g)
    | equalish(X,a)
    | equalish(X,b)
    | equalish(X,c)
    | equalish(X,d)
    | equalish(X,i) )).

cnf(multiplication_to_identity,hypothesis,
    ( equalish(multiply(g,X,multiply(g,X,multiply(g,X,multiply(g,X,X)))),i) )).

cnf(all_multiply_to_identity,hypothesis,
    ( ~ equalish(not_power_of(g,X),X) )).

%----Denial of theorem : For all X in g, there exists a Y such that X<>Y,
%----and X^2<>Y, and X^3<>Y, and X^4<>Y, and X^5<>Y.
cnf(x2_is_not_power,negated_conjecture,
    ( ~ product(g,X,X,not_power_of(g,X)) )).

cnf(x3_is_not_power,negated_conjecture,
    ( ~ product(g,X,multiply(g,X,X),not_power_of(g,X)) )).

cnf(x4_is_not_power,negated_conjecture,
    ( ~ product(g,X,multiply(g,X,multiply(g,X,X)),not_power_of(g,X)) )).

cnf(x5_is_not_power,negated_conjecture,
    ( ~ product(g,X,multiply(g,X,multiply(g,X,multiply(g,X,X))),not_power_of(g,X)) )).

%--------------------------------------------------------------------------
