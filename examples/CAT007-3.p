%--------------------------------------------------------------------------
% File     : CAT007-3 : TPTP v5.3.0. Released v1.0.0.
% Domain   : Category Theory
% Problem  : If domain(x) = codomain(y) then xy is defined
% Version  : [Sco79] axioms : Reduced > Complete.
% English  :

% Refs     : [MOW76] McCharen et al. (1976), Problems and Experiments for a
%          : [Sco79] Scott (1979), Identity and Existence in Intuitionist L
% Source   : [ANL]
% Names    : p7.ver3.in [ANL]

% Status   : Unsatisfiable
% Rating   : 0.00 v2.0.0
% Syntax   : Number of clauses     :   12 (   2 non-Horn;   5 unit;   9 RR)
%            Number of atoms       :   23 (   0 equality)
%            Maximal clause size   :    3 (   2 average)
%            Number of predicates  :    2 (   0 propositional; 1-2 arity)
%            Number of functors    :    6 (   2 constant; 0-2 arity)
%            Number of variables   :   15 (   0 singleton)
%            Maximal term depth    :    2 (   1 average)
% SPC      : CNF_UNS_RFO_NEQ_NHN

% Comments : In Scott's axiom system, this is an axiom; but
%            it is dependant, vis. proof included.
%          : Axioms simplified by Art Quaife.
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

%----Supply the axioms upon which it is dependant.

%----Category theory axioms
cnf(domain_has_elements,axiom,
    ( ~ there_exists(domain(X))
    | there_exists(X) )).

cnf(domain_codomain_composition2,axiom,
    ( ~ there_exists(domain(X))
    | ~ equalish(domain(X),codomain(Y))
    | there_exists(compose(X,Y)) )).

%----Axiom of indiscernibles
cnf(indiscernibles1,axiom,
    ( there_exists(f1(X,Y))
    | equalish(X,Y) )).

cnf(indiscernibles2,axiom,
    ( equalish(X,f1(X,Y))
    | equalish(Y,f1(X,Y))
    | equalish(X,Y) )).

cnf(indiscernibles3,axiom,
    ( ~ equalish(X,f1(X,Y))
    | ~ equalish(Y,f1(X,Y))
    | equalish(X,Y) )).

cnf(domain_of_c2_exists,hypothesis,
    ( there_exists(domain(c2)) )).

cnf(domain_of_c1_exists,hypothesis,
    ( there_exists(domain(c1)) )).

cnf(domain_of_c2_equals_codomain_of_c1,hypothesis,
    ( equalish(domain(c2),codomain(c1)) )).

cnf(prove_c1_c2_is_defined,negated_conjecture,
    ( ~ there_exists(compose(c2,c1)) )).
