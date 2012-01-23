%--------------------------------------------------------------------------
% File     : ALG001-2 : TPTP v5.3.0. Released v1.0.0.
% Domain   : General Algebra
% Problem  : The composition of homomorphisms is a homomorphism
% Version  : [BL+86] axioms.
% English  :

% Refs     : [BL+86] Boyer et al. (1986), Set Theory in First-Order Logic:
%          : [Wos88] Wos (1988), Automated Reasoning - 33 Basic Research Pr
% Source   : [BL+86]
% Names    : Problem 221-223 [BL+86]
%          : Test Problem 15 [Wos88]
%          : Composition of Homomorphisms [Wos88]

% Status   : Unknown
% Rating   : 1.00 v2.0.0
% Syntax   : Number of clauses     :  144 (  20 non-Horn;  14 unit; 121 RR)
%            Number of atoms       :  358 (  47 equality)
%            Maximal clause size   :    8 (   2 average)
%            Number of predicates  :   14 (   0 propositional; 1-5 arity)
%            Number of functors    :   67 (  14 constant; 0-5 arity)
%            Number of variables   :  320 (  28 singleton)
%            Maximal term depth    :    4 (   1 average)
% SPC      : CNF_UNK_NUE

% Comments :
%--------------------------------------------------------------------------
%----Include Godel's set axioms
include('Axioms/SET003-0.ax').
%--------------------------------------------------------------------------
cnf(one_homomorphism,hypothesis,
    ( homomorphism(f60,f62,f63,f64,f65) )).

cnf(another_homomorphism,hypothesis,
    ( homomorphism(f61,f64,f65,f66,f67) )).

cnf(prove_composition_is_a_homomorphism,negated_conjecture,
    ( ~ homomorphism(compose(f60,f61),f62,f63,f66,f67) )).

%--------------------------------------------------------------------------
