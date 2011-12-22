%------------------------------------------------------------------------------
% File     : PLA031-1.016 : TPTP v5.3.0. Released v5.2.0.
% Domain   : Planning
% Problem  : Driver's log k=16
% Version  : Especial.
% English  : A planning domain that involves driving trucks around
%            delivering packages between locations. The complication is
%            that the trucks require drivers who must walk between trucks
%            in order to drive them. The paths for walking and the roads
%            for driving form different maps on the locations.
%            Instances were semi-automatically translated from the basic
%            Strips instances used in the 2002 Planning Competition.

% Refs     : [LF03] Long & Fox (2003), The 3rd International Planning Compe
%          : [NV07a] Navarro (2007), Email to Geoff Sutcliffe
%          : [NV07b] Navarro & Voronkov (2007), Encoding Problems and Reaso
% Source   : [NV07a]
% Names    : driverlog08 [NV07a]

% Status   : Unsatisfiable
% Rating   : 1.00 v5.2.0
% Syntax   : Number of clauses     : 2308 (   0 non-Horn;2128 unit;2308 RR)
%            Number of atoms       : 2618 (   0 equality)
%            Maximal clause size   :    6 (   1 average)
%            Number of predicates  :    4 (   0 propositional; 2-20 arity)
%            Number of functors    :   44 (  44 constant; 0-0 arity)
%            Number of variables   : 3459 (   4 singleton)
%            Maximal term depth    :    1 (   1 average)
% SPC      : CNF_UNS_EPR

% Comments : Only instances 1-4 are within reach of current provers. (2007)
%          : Translated from [LF03] using [NV07b]
%------------------------------------------------------------------------------
cnf(load1,axiom,
    ( ~ s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(truck1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load2,axiom,
    ( s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(truck1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load3,axiom,
    ( ~ s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(truck2,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load4,axiom,
    ( s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(truck2,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load5,axiom,
    ( ~ s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(truck3,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load6,axiom,
    ( s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(truck3,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load7,axiom,
    ( ~ s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(truck4,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load8,axiom,
    ( s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(truck4,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load9,axiom,
    ( ~ s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(truck5,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load10,axiom,
    ( s(L,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(truck5,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load11,axiom,
    ( ~ s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,truck1,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load12,axiom,
    ( s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,truck1,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load13,axiom,
    ( ~ s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,truck2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load14,axiom,
    ( s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,truck2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load15,axiom,
    ( ~ s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,truck3,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load16,axiom,
    ( s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,truck3,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load17,axiom,
    ( ~ s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,truck4,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load18,axiom,
    ( s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,truck4,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load19,axiom,
    ( ~ s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,truck5,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load20,axiom,
    ( s(O1,L,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,truck5,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load21,axiom,
    ( ~ s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,truck1,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load22,axiom,
    ( s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,truck1,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load23,axiom,
    ( ~ s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,truck2,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load24,axiom,
    ( s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,truck2,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load25,axiom,
    ( ~ s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,truck3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load26,axiom,
    ( s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,truck3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load27,axiom,
    ( ~ s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,truck4,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load28,axiom,
    ( s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,truck4,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load29,axiom,
    ( ~ s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,truck5,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load30,axiom,
    ( s(O1,O2,L,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,truck5,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load31,axiom,
    ( ~ s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,truck1,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load32,axiom,
    ( s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,truck1,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load33,axiom,
    ( ~ s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,truck2,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load34,axiom,
    ( s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,truck2,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load35,axiom,
    ( ~ s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,truck3,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load36,axiom,
    ( s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,truck3,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load37,axiom,
    ( ~ s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,truck4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load38,axiom,
    ( s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,truck4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load39,axiom,
    ( ~ s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,truck5,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load40,axiom,
    ( s(O1,O2,O3,L,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,truck5,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load41,axiom,
    ( ~ s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,truck1,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load42,axiom,
    ( s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,truck1,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load43,axiom,
    ( ~ s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,truck2,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load44,axiom,
    ( s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,truck2,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load45,axiom,
    ( ~ s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,truck3,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load46,axiom,
    ( s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,truck3,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load47,axiom,
    ( ~ s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,truck4,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load48,axiom,
    ( s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,truck4,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load49,axiom,
    ( ~ s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,truck5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load50,axiom,
    ( s(O1,O2,O3,O4,L,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,truck5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load51,axiom,
    ( ~ s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,truck1,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load52,axiom,
    ( s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,truck1,O7,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load53,axiom,
    ( ~ s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,truck2,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load54,axiom,
    ( s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,truck2,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load55,axiom,
    ( ~ s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,O5,truck3,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load56,axiom,
    ( s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,truck3,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load57,axiom,
    ( ~ s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,O5,truck4,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load58,axiom,
    ( s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,truck4,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load59,axiom,
    ( ~ s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,O5,truck5,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load60,axiom,
    ( s(O1,O2,O3,O4,O5,L,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,truck5,O7,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load61,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,truck1,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load62,axiom,
    ( s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,truck1,O8,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load63,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,truck2,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load64,axiom,
    ( s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,truck2,O8,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load65,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,truck3,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load66,axiom,
    ( s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,truck3,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load67,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,O5,O6,truck4,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load68,axiom,
    ( s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,truck4,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load69,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,O5,O6,truck5,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load70,axiom,
    ( s(O1,O2,O3,O4,O5,O6,L,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,truck5,O8,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load71,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,truck1,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load72,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,truck1,O9,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load73,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,truck2,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load74,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,truck2,O9,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load75,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,truck3,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load76,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,truck3,O9,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load77,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,truck4,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load78,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,truck4,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load79,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,O5,O6,O7,truck5,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load80,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,L,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,truck5,O9,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load81,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,truck1,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load82,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,truck1,O10,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load83,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,truck2,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load84,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,truck2,O10,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load85,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,truck3,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load86,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,truck3,O10,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load87,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,truck4,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load88,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,truck4,O10,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load89,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,truck5,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load90,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,L,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,truck5,O10,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load91,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck1,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load92,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck1,D1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(load93,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck2,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load94,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck2,D1,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(load95,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck3,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load96,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck3,D1,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(load97,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck4,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load98,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck4,D1,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(load99,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck5,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(load100,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,L,D1,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,truck5,D1,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(board1,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ neq(D2,truck1)
    | ~ neq(D3,truck1)
    | ~ neq(D4,truck1)
    | ~ neq(D5,truck1)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(board2,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck1,D2,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(board3,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ neq(D2,truck2)
    | ~ neq(D3,truck2)
    | ~ neq(D4,truck2)
    | ~ neq(D5,truck2)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck2,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(board4,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck2,D2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(board5,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ neq(D2,truck3)
    | ~ neq(D3,truck3)
    | ~ neq(D4,truck3)
    | ~ neq(D5,truck3)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck3,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board6,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck3,D2,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board7,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ neq(D2,truck4)
    | ~ neq(D3,truck4)
    | ~ neq(D4,truck4)
    | ~ neq(D5,truck4)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck4,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(board8,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck4,D2,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(board9,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ neq(D2,truck5)
    | ~ neq(D3,truck5)
    | ~ neq(D4,truck5)
    | ~ neq(D5,truck5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck5,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(board10,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,L,D2,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck5,D2,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(board11,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ neq(D1,truck1)
    | ~ neq(D3,truck1)
    | ~ neq(D4,truck1)
    | ~ neq(D5,truck1)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck1,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(board12,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck1,D3,D4,D5,L,T2,T3,T4,T5) )).

cnf(board13,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ neq(D1,truck2)
    | ~ neq(D3,truck2)
    | ~ neq(D4,truck2)
    | ~ neq(D5,truck2)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(board14,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck2,D3,D4,D5,T1,L,T3,T4,T5) )).

cnf(board15,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ neq(D1,truck3)
    | ~ neq(D3,truck3)
    | ~ neq(D4,truck3)
    | ~ neq(D5,truck3)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck3,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board16,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck3,D3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board17,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ neq(D1,truck4)
    | ~ neq(D3,truck4)
    | ~ neq(D4,truck4)
    | ~ neq(D5,truck4)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck4,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(board18,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck4,D3,D4,D5,T1,T2,T3,L,T5) )).

cnf(board19,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ neq(D1,truck5)
    | ~ neq(D3,truck5)
    | ~ neq(D4,truck5)
    | ~ neq(D5,truck5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck5,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(board20,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,L,D3,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck5,D3,D4,D5,T1,T2,T3,T4,L) )).

cnf(board21,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,L,T2,T3,T4,T5)
    | ~ neq(D1,truck1)
    | ~ neq(D2,truck1)
    | ~ neq(D4,truck1)
    | ~ neq(D5,truck1)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck1,D4,D5,L,T2,T3,T4,T5) )).

cnf(board22,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck1,D4,D5,L,T2,T3,T4,T5) )).

cnf(board23,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,L,T3,T4,T5)
    | ~ neq(D1,truck2)
    | ~ neq(D2,truck2)
    | ~ neq(D4,truck2)
    | ~ neq(D5,truck2)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck2,D4,D5,T1,L,T3,T4,T5) )).

cnf(board24,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck2,D4,D5,T1,L,T3,T4,T5) )).

cnf(board25,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,L,T4,T5)
    | ~ neq(D1,truck3)
    | ~ neq(D2,truck3)
    | ~ neq(D4,truck3)
    | ~ neq(D5,truck3)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board26,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck3,D4,D5,T1,T2,L,T4,T5) )).

cnf(board27,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,T3,L,T5)
    | ~ neq(D1,truck4)
    | ~ neq(D2,truck4)
    | ~ neq(D4,truck4)
    | ~ neq(D5,truck4)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck4,D4,D5,T1,T2,T3,L,T5) )).

cnf(board28,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck4,D4,D5,T1,T2,T3,L,T5) )).

cnf(board29,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,T3,T4,L)
    | ~ neq(D1,truck5)
    | ~ neq(D2,truck5)
    | ~ neq(D4,truck5)
    | ~ neq(D5,truck5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck5,D4,D5,T1,T2,T3,T4,L) )).

cnf(board30,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,L,D4,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck5,D4,D5,T1,T2,T3,T4,L) )).

cnf(board31,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,L,T2,T3,T4,T5)
    | ~ neq(D1,truck1)
    | ~ neq(D2,truck1)
    | ~ neq(D3,truck1)
    | ~ neq(D5,truck1)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck1,D5,L,T2,T3,T4,T5) )).

cnf(board32,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck1,D5,L,T2,T3,T4,T5) )).

cnf(board33,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,L,T3,T4,T5)
    | ~ neq(D1,truck2)
    | ~ neq(D2,truck2)
    | ~ neq(D3,truck2)
    | ~ neq(D5,truck2)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck2,D5,T1,L,T3,T4,T5) )).

cnf(board34,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck2,D5,T1,L,T3,T4,T5) )).

cnf(board35,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,L,T4,T5)
    | ~ neq(D1,truck3)
    | ~ neq(D2,truck3)
    | ~ neq(D3,truck3)
    | ~ neq(D5,truck3)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck3,D5,T1,T2,L,T4,T5) )).

cnf(board36,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck3,D5,T1,T2,L,T4,T5) )).

cnf(board37,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,T3,L,T5)
    | ~ neq(D1,truck4)
    | ~ neq(D2,truck4)
    | ~ neq(D3,truck4)
    | ~ neq(D5,truck4)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck4,D5,T1,T2,T3,L,T5) )).

cnf(board38,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck4,D5,T1,T2,T3,L,T5) )).

cnf(board39,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,T3,T4,L)
    | ~ neq(D1,truck5)
    | ~ neq(D2,truck5)
    | ~ neq(D3,truck5)
    | ~ neq(D5,truck5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck5,D5,T1,T2,T3,T4,L) )).

cnf(board40,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,L,D5,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck5,D5,T1,T2,T3,T4,L) )).

cnf(board41,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,L,T2,T3,T4,T5)
    | ~ neq(D1,truck1)
    | ~ neq(D2,truck1)
    | ~ neq(D3,truck1)
    | ~ neq(D4,truck1)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck1,L,T2,T3,T4,T5) )).

cnf(board42,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,L,T2,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck1,L,T2,T3,T4,T5) )).

cnf(board43,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,L,T3,T4,T5)
    | ~ neq(D1,truck2)
    | ~ neq(D2,truck2)
    | ~ neq(D3,truck2)
    | ~ neq(D4,truck2)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck2,T1,L,T3,T4,T5) )).

cnf(board44,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,L,T3,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck2,T1,L,T3,T4,T5) )).

cnf(board45,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,L,T4,T5)
    | ~ neq(D1,truck3)
    | ~ neq(D2,truck3)
    | ~ neq(D3,truck3)
    | ~ neq(D4,truck3)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck3,T1,T2,L,T4,T5) )).

cnf(board46,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,L,T4,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck3,T1,T2,L,T4,T5) )).

cnf(board47,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,T3,L,T5)
    | ~ neq(D1,truck4)
    | ~ neq(D2,truck4)
    | ~ neq(D3,truck4)
    | ~ neq(D4,truck4)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck4,T1,T2,T3,L,T5) )).

cnf(board48,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,T3,L,T5)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck4,T1,T2,T3,L,T5) )).

cnf(board49,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,T3,T4,L)
    | ~ neq(D1,truck5)
    | ~ neq(D2,truck5)
    | ~ neq(D3,truck5)
    | ~ neq(D4,truck5)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck5,T1,T2,T3,T4,L) )).

cnf(board50,axiom,
    ( s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,L,T1,T2,T3,T4,L)
    | ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck5,T1,T2,T3,T4,L) )).

cnf(drive1,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck1,D2,D3,D4,D5,S,T2,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck1,D2,D3,D4,D5,D,T2,T3,T4,T5) )).

cnf(drive2,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck2,D2,D3,D4,D5,T1,S,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck2,D2,D3,D4,D5,T1,D,T3,T4,T5) )).

cnf(drive3,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck3,D2,D3,D4,D5,T1,T2,S,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck3,D2,D3,D4,D5,T1,T2,D,T4,T5) )).

cnf(drive4,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck4,D2,D3,D4,D5,T1,T2,T3,S,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck4,D2,D3,D4,D5,T1,T2,T3,D,T5) )).

cnf(drive5,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck5,D2,D3,D4,D5,T1,T2,T3,T4,S)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,truck5,D2,D3,D4,D5,T1,T2,T3,T4,D) )).

cnf(drive6,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck1,D3,D4,D5,S,T2,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck1,D3,D4,D5,D,T2,T3,T4,T5) )).

cnf(drive7,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck2,D3,D4,D5,T1,S,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck2,D3,D4,D5,T1,D,T3,T4,T5) )).

cnf(drive8,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck3,D3,D4,D5,T1,T2,S,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck3,D3,D4,D5,T1,T2,D,T4,T5) )).

cnf(drive9,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck4,D3,D4,D5,T1,T2,T3,S,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck4,D3,D4,D5,T1,T2,T3,D,T5) )).

cnf(drive10,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck5,D3,D4,D5,T1,T2,T3,T4,S)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,truck5,D3,D4,D5,T1,T2,T3,T4,D) )).

cnf(drive11,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck1,D4,D5,S,T2,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck1,D4,D5,D,T2,T3,T4,T5) )).

cnf(drive12,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck2,D4,D5,T1,S,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck2,D4,D5,T1,D,T3,T4,T5) )).

cnf(drive13,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck3,D4,D5,T1,T2,S,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck3,D4,D5,T1,T2,D,T4,T5) )).

cnf(drive14,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck4,D4,D5,T1,T2,T3,S,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck4,D4,D5,T1,T2,T3,D,T5) )).

cnf(drive15,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck5,D4,D5,T1,T2,T3,T4,S)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,truck5,D4,D5,T1,T2,T3,T4,D) )).

cnf(drive16,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck1,D5,S,T2,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck1,D5,D,T2,T3,T4,T5) )).

cnf(drive17,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck2,D5,T1,S,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck2,D5,T1,D,T3,T4,T5) )).

cnf(drive18,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck3,D5,T1,T2,S,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck3,D5,T1,T2,D,T4,T5) )).

cnf(drive19,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck4,D5,T1,T2,T3,S,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck4,D5,T1,T2,T3,D,T5) )).

cnf(drive20,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck5,D5,T1,T2,T3,T4,S)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,truck5,D5,T1,T2,T3,T4,D) )).

cnf(drive21,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck1,S,T2,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck1,D,T2,T3,T4,T5) )).

cnf(drive22,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck2,T1,S,T3,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck2,T1,D,T3,T4,T5) )).

cnf(drive23,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck3,T1,T2,S,T4,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck3,T1,T2,D,T4,T5) )).

cnf(drive24,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck4,T1,T2,T3,S,T5)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck4,T1,T2,T3,D,T5) )).

cnf(drive25,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck5,T1,T2,T3,T4,S)
    | ~ link(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,truck5,T1,T2,T3,T4,D) )).

cnf(walk1,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,S,D2,D3,D4,D5,T1,T2,T3,T4,T5)
    | ~ path(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D,D2,D3,D4,D5,T1,T2,T3,T4,T5) )).

cnf(walk2,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,S,D3,D4,D5,T1,T2,T3,T4,T5)
    | ~ path(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D,D3,D4,D5,T1,T2,T3,T4,T5) )).

cnf(walk3,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,S,D4,D5,T1,T2,T3,T4,T5)
    | ~ path(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D,D4,D5,T1,T2,T3,T4,T5) )).

cnf(walk4,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,S,D5,T1,T2,T3,T4,T5)
    | ~ path(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D,D5,T1,T2,T3,T4,T5) )).

cnf(walk5,axiom,
    ( ~ s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,S,T1,T2,T3,T4,T5)
    | ~ path(S,D)
    | s(O1,O2,O3,O4,O5,O6,O7,O8,O9,O10,D1,D2,D3,D4,D,T1,T2,T3,T4,T5) )).

cnf(neq1,axiom,
    ( ~ neq(truck1,truck1) )).

cnf(neq2,axiom,
    ( neq(truck1,truck2) )).

cnf(neq3,axiom,
    ( neq(truck1,truck3) )).

cnf(neq4,axiom,
    ( neq(truck1,truck4) )).

cnf(neq5,axiom,
    ( neq(truck1,truck5) )).

cnf(neq6,axiom,
    ( neq(truck1,s0) )).

cnf(neq7,axiom,
    ( neq(truck1,s1) )).

cnf(neq8,axiom,
    ( neq(truck1,s2) )).

cnf(neq9,axiom,
    ( neq(truck1,s3) )).

cnf(neq10,axiom,
    ( neq(truck1,s4) )).

cnf(neq11,axiom,
    ( neq(truck1,s5) )).

cnf(neq12,axiom,
    ( neq(truck1,s6) )).

cnf(neq13,axiom,
    ( neq(truck1,s7) )).

cnf(neq14,axiom,
    ( neq(truck1,s8) )).

cnf(neq15,axiom,
    ( neq(truck1,s9) )).

cnf(neq16,axiom,
    ( neq(truck1,s10) )).

cnf(neq17,axiom,
    ( neq(truck1,s11) )).

cnf(neq18,axiom,
    ( neq(truck1,s12) )).

cnf(neq19,axiom,
    ( neq(truck1,s13) )).

cnf(neq20,axiom,
    ( neq(truck1,s14) )).

cnf(neq21,axiom,
    ( neq(truck1,p0_8) )).

cnf(neq22,axiom,
    ( neq(truck1,p1_2) )).

cnf(neq23,axiom,
    ( neq(truck1,p1_5) )).

cnf(neq24,axiom,
    ( neq(truck1,p1_7) )).

cnf(neq25,axiom,
    ( neq(truck1,p3_8) )).

cnf(neq26,axiom,
    ( neq(truck1,p3_12) )).

cnf(neq27,axiom,
    ( neq(truck1,p4_1) )).

cnf(neq28,axiom,
    ( neq(truck1,p4_10) )).

cnf(neq29,axiom,
    ( neq(truck1,p5_9) )).

cnf(neq30,axiom,
    ( neq(truck1,p7_8) )).

cnf(neq31,axiom,
    ( neq(truck1,p7_11) )).

cnf(neq32,axiom,
    ( neq(truck1,p8_4) )).

cnf(neq33,axiom,
    ( neq(truck1,p8_11) )).

cnf(neq34,axiom,
    ( neq(truck1,p9_6) )).

cnf(neq35,axiom,
    ( neq(truck1,p10_0) )).

cnf(neq36,axiom,
    ( neq(truck1,p11_3) )).

cnf(neq37,axiom,
    ( neq(truck1,p11_13) )).

cnf(neq38,axiom,
    ( neq(truck1,p12_7) )).

cnf(neq39,axiom,
    ( neq(truck1,p12_10) )).

cnf(neq40,axiom,
    ( neq(truck1,p13_14) )).

cnf(neq41,axiom,
    ( neq(truck1,p14_0) )).

cnf(neq42,axiom,
    ( neq(truck1,p14_2) )).

cnf(neq43,axiom,
    ( neq(truck1,p14_3) )).

cnf(neq44,axiom,
    ( neq(truck1,p14_6) )).

cnf(neq45,axiom,
    ( neq(truck2,truck1) )).

cnf(neq46,axiom,
    ( ~ neq(truck2,truck2) )).

cnf(neq47,axiom,
    ( neq(truck2,truck3) )).

cnf(neq48,axiom,
    ( neq(truck2,truck4) )).

cnf(neq49,axiom,
    ( neq(truck2,truck5) )).

cnf(neq50,axiom,
    ( neq(truck2,s0) )).

cnf(neq51,axiom,
    ( neq(truck2,s1) )).

cnf(neq52,axiom,
    ( neq(truck2,s2) )).

cnf(neq53,axiom,
    ( neq(truck2,s3) )).

cnf(neq54,axiom,
    ( neq(truck2,s4) )).

cnf(neq55,axiom,
    ( neq(truck2,s5) )).

cnf(neq56,axiom,
    ( neq(truck2,s6) )).

cnf(neq57,axiom,
    ( neq(truck2,s7) )).

cnf(neq58,axiom,
    ( neq(truck2,s8) )).

cnf(neq59,axiom,
    ( neq(truck2,s9) )).

cnf(neq60,axiom,
    ( neq(truck2,s10) )).

cnf(neq61,axiom,
    ( neq(truck2,s11) )).

cnf(neq62,axiom,
    ( neq(truck2,s12) )).

cnf(neq63,axiom,
    ( neq(truck2,s13) )).

cnf(neq64,axiom,
    ( neq(truck2,s14) )).

cnf(neq65,axiom,
    ( neq(truck2,p0_8) )).

cnf(neq66,axiom,
    ( neq(truck2,p1_2) )).

cnf(neq67,axiom,
    ( neq(truck2,p1_5) )).

cnf(neq68,axiom,
    ( neq(truck2,p1_7) )).

cnf(neq69,axiom,
    ( neq(truck2,p3_8) )).

cnf(neq70,axiom,
    ( neq(truck2,p3_12) )).

cnf(neq71,axiom,
    ( neq(truck2,p4_1) )).

cnf(neq72,axiom,
    ( neq(truck2,p4_10) )).

cnf(neq73,axiom,
    ( neq(truck2,p5_9) )).

cnf(neq74,axiom,
    ( neq(truck2,p7_8) )).

cnf(neq75,axiom,
    ( neq(truck2,p7_11) )).

cnf(neq76,axiom,
    ( neq(truck2,p8_4) )).

cnf(neq77,axiom,
    ( neq(truck2,p8_11) )).

cnf(neq78,axiom,
    ( neq(truck2,p9_6) )).

cnf(neq79,axiom,
    ( neq(truck2,p10_0) )).

cnf(neq80,axiom,
    ( neq(truck2,p11_3) )).

cnf(neq81,axiom,
    ( neq(truck2,p11_13) )).

cnf(neq82,axiom,
    ( neq(truck2,p12_7) )).

cnf(neq83,axiom,
    ( neq(truck2,p12_10) )).

cnf(neq84,axiom,
    ( neq(truck2,p13_14) )).

cnf(neq85,axiom,
    ( neq(truck2,p14_0) )).

cnf(neq86,axiom,
    ( neq(truck2,p14_2) )).

cnf(neq87,axiom,
    ( neq(truck2,p14_3) )).

cnf(neq88,axiom,
    ( neq(truck2,p14_6) )).

cnf(neq89,axiom,
    ( neq(truck3,truck1) )).

cnf(neq90,axiom,
    ( neq(truck3,truck2) )).

cnf(neq91,axiom,
    ( ~ neq(truck3,truck3) )).

cnf(neq92,axiom,
    ( neq(truck3,truck4) )).

cnf(neq93,axiom,
    ( neq(truck3,truck5) )).

cnf(neq94,axiom,
    ( neq(truck3,s0) )).

cnf(neq95,axiom,
    ( neq(truck3,s1) )).

cnf(neq96,axiom,
    ( neq(truck3,s2) )).

cnf(neq97,axiom,
    ( neq(truck3,s3) )).

cnf(neq98,axiom,
    ( neq(truck3,s4) )).

cnf(neq99,axiom,
    ( neq(truck3,s5) )).

cnf(neq100,axiom,
    ( neq(truck3,s6) )).

cnf(neq101,axiom,
    ( neq(truck3,s7) )).

cnf(neq102,axiom,
    ( neq(truck3,s8) )).

cnf(neq103,axiom,
    ( neq(truck3,s9) )).

cnf(neq104,axiom,
    ( neq(truck3,s10) )).

cnf(neq105,axiom,
    ( neq(truck3,s11) )).

cnf(neq106,axiom,
    ( neq(truck3,s12) )).

cnf(neq107,axiom,
    ( neq(truck3,s13) )).

cnf(neq108,axiom,
    ( neq(truck3,s14) )).

cnf(neq109,axiom,
    ( neq(truck3,p0_8) )).

cnf(neq110,axiom,
    ( neq(truck3,p1_2) )).

cnf(neq111,axiom,
    ( neq(truck3,p1_5) )).

cnf(neq112,axiom,
    ( neq(truck3,p1_7) )).

cnf(neq113,axiom,
    ( neq(truck3,p3_8) )).

cnf(neq114,axiom,
    ( neq(truck3,p3_12) )).

cnf(neq115,axiom,
    ( neq(truck3,p4_1) )).

cnf(neq116,axiom,
    ( neq(truck3,p4_10) )).

cnf(neq117,axiom,
    ( neq(truck3,p5_9) )).

cnf(neq118,axiom,
    ( neq(truck3,p7_8) )).

cnf(neq119,axiom,
    ( neq(truck3,p7_11) )).

cnf(neq120,axiom,
    ( neq(truck3,p8_4) )).

cnf(neq121,axiom,
    ( neq(truck3,p8_11) )).

cnf(neq122,axiom,
    ( neq(truck3,p9_6) )).

cnf(neq123,axiom,
    ( neq(truck3,p10_0) )).

cnf(neq124,axiom,
    ( neq(truck3,p11_3) )).

cnf(neq125,axiom,
    ( neq(truck3,p11_13) )).

cnf(neq126,axiom,
    ( neq(truck3,p12_7) )).

cnf(neq127,axiom,
    ( neq(truck3,p12_10) )).

cnf(neq128,axiom,
    ( neq(truck3,p13_14) )).

cnf(neq129,axiom,
    ( neq(truck3,p14_0) )).

cnf(neq130,axiom,
    ( neq(truck3,p14_2) )).

cnf(neq131,axiom,
    ( neq(truck3,p14_3) )).

cnf(neq132,axiom,
    ( neq(truck3,p14_6) )).

cnf(neq133,axiom,
    ( neq(truck4,truck1) )).

cnf(neq134,axiom,
    ( neq(truck4,truck2) )).

cnf(neq135,axiom,
    ( neq(truck4,truck3) )).

cnf(neq136,axiom,
    ( ~ neq(truck4,truck4) )).

cnf(neq137,axiom,
    ( neq(truck4,truck5) )).

cnf(neq138,axiom,
    ( neq(truck4,s0) )).

cnf(neq139,axiom,
    ( neq(truck4,s1) )).

cnf(neq140,axiom,
    ( neq(truck4,s2) )).

cnf(neq141,axiom,
    ( neq(truck4,s3) )).

cnf(neq142,axiom,
    ( neq(truck4,s4) )).

cnf(neq143,axiom,
    ( neq(truck4,s5) )).

cnf(neq144,axiom,
    ( neq(truck4,s6) )).

cnf(neq145,axiom,
    ( neq(truck4,s7) )).

cnf(neq146,axiom,
    ( neq(truck4,s8) )).

cnf(neq147,axiom,
    ( neq(truck4,s9) )).

cnf(neq148,axiom,
    ( neq(truck4,s10) )).

cnf(neq149,axiom,
    ( neq(truck4,s11) )).

cnf(neq150,axiom,
    ( neq(truck4,s12) )).

cnf(neq151,axiom,
    ( neq(truck4,s13) )).

cnf(neq152,axiom,
    ( neq(truck4,s14) )).

cnf(neq153,axiom,
    ( neq(truck4,p0_8) )).

cnf(neq154,axiom,
    ( neq(truck4,p1_2) )).

cnf(neq155,axiom,
    ( neq(truck4,p1_5) )).

cnf(neq156,axiom,
    ( neq(truck4,p1_7) )).

cnf(neq157,axiom,
    ( neq(truck4,p3_8) )).

cnf(neq158,axiom,
    ( neq(truck4,p3_12) )).

cnf(neq159,axiom,
    ( neq(truck4,p4_1) )).

cnf(neq160,axiom,
    ( neq(truck4,p4_10) )).

cnf(neq161,axiom,
    ( neq(truck4,p5_9) )).

cnf(neq162,axiom,
    ( neq(truck4,p7_8) )).

cnf(neq163,axiom,
    ( neq(truck4,p7_11) )).

cnf(neq164,axiom,
    ( neq(truck4,p8_4) )).

cnf(neq165,axiom,
    ( neq(truck4,p8_11) )).

cnf(neq166,axiom,
    ( neq(truck4,p9_6) )).

cnf(neq167,axiom,
    ( neq(truck4,p10_0) )).

cnf(neq168,axiom,
    ( neq(truck4,p11_3) )).

cnf(neq169,axiom,
    ( neq(truck4,p11_13) )).

cnf(neq170,axiom,
    ( neq(truck4,p12_7) )).

cnf(neq171,axiom,
    ( neq(truck4,p12_10) )).

cnf(neq172,axiom,
    ( neq(truck4,p13_14) )).

cnf(neq173,axiom,
    ( neq(truck4,p14_0) )).

cnf(neq174,axiom,
    ( neq(truck4,p14_2) )).

cnf(neq175,axiom,
    ( neq(truck4,p14_3) )).

cnf(neq176,axiom,
    ( neq(truck4,p14_6) )).

cnf(neq177,axiom,
    ( neq(truck5,truck1) )).

cnf(neq178,axiom,
    ( neq(truck5,truck2) )).

cnf(neq179,axiom,
    ( neq(truck5,truck3) )).

cnf(neq180,axiom,
    ( neq(truck5,truck4) )).

cnf(neq181,axiom,
    ( ~ neq(truck5,truck5) )).

cnf(neq182,axiom,
    ( neq(truck5,s0) )).

cnf(neq183,axiom,
    ( neq(truck5,s1) )).

cnf(neq184,axiom,
    ( neq(truck5,s2) )).

cnf(neq185,axiom,
    ( neq(truck5,s3) )).

cnf(neq186,axiom,
    ( neq(truck5,s4) )).

cnf(neq187,axiom,
    ( neq(truck5,s5) )).

cnf(neq188,axiom,
    ( neq(truck5,s6) )).

cnf(neq189,axiom,
    ( neq(truck5,s7) )).

cnf(neq190,axiom,
    ( neq(truck5,s8) )).

cnf(neq191,axiom,
    ( neq(truck5,s9) )).

cnf(neq192,axiom,
    ( neq(truck5,s10) )).

cnf(neq193,axiom,
    ( neq(truck5,s11) )).

cnf(neq194,axiom,
    ( neq(truck5,s12) )).

cnf(neq195,axiom,
    ( neq(truck5,s13) )).

cnf(neq196,axiom,
    ( neq(truck5,s14) )).

cnf(neq197,axiom,
    ( neq(truck5,p0_8) )).

cnf(neq198,axiom,
    ( neq(truck5,p1_2) )).

cnf(neq199,axiom,
    ( neq(truck5,p1_5) )).

cnf(neq200,axiom,
    ( neq(truck5,p1_7) )).

cnf(neq201,axiom,
    ( neq(truck5,p3_8) )).

cnf(neq202,axiom,
    ( neq(truck5,p3_12) )).

cnf(neq203,axiom,
    ( neq(truck5,p4_1) )).

cnf(neq204,axiom,
    ( neq(truck5,p4_10) )).

cnf(neq205,axiom,
    ( neq(truck5,p5_9) )).

cnf(neq206,axiom,
    ( neq(truck5,p7_8) )).

cnf(neq207,axiom,
    ( neq(truck5,p7_11) )).

cnf(neq208,axiom,
    ( neq(truck5,p8_4) )).

cnf(neq209,axiom,
    ( neq(truck5,p8_11) )).

cnf(neq210,axiom,
    ( neq(truck5,p9_6) )).

cnf(neq211,axiom,
    ( neq(truck5,p10_0) )).

cnf(neq212,axiom,
    ( neq(truck5,p11_3) )).

cnf(neq213,axiom,
    ( neq(truck5,p11_13) )).

cnf(neq214,axiom,
    ( neq(truck5,p12_7) )).

cnf(neq215,axiom,
    ( neq(truck5,p12_10) )).

cnf(neq216,axiom,
    ( neq(truck5,p13_14) )).

cnf(neq217,axiom,
    ( neq(truck5,p14_0) )).

cnf(neq218,axiom,
    ( neq(truck5,p14_2) )).

cnf(neq219,axiom,
    ( neq(truck5,p14_3) )).

cnf(neq220,axiom,
    ( neq(truck5,p14_6) )).

cnf(neq221,axiom,
    ( neq(s0,truck1) )).

cnf(neq222,axiom,
    ( neq(s0,truck2) )).

cnf(neq223,axiom,
    ( neq(s0,truck3) )).

cnf(neq224,axiom,
    ( neq(s0,truck4) )).

cnf(neq225,axiom,
    ( neq(s0,truck5) )).

cnf(neq226,axiom,
    ( ~ neq(s0,s0) )).

cnf(neq227,axiom,
    ( neq(s0,s1) )).

cnf(neq228,axiom,
    ( neq(s0,s2) )).

cnf(neq229,axiom,
    ( neq(s0,s3) )).

cnf(neq230,axiom,
    ( neq(s0,s4) )).

cnf(neq231,axiom,
    ( neq(s0,s5) )).

cnf(neq232,axiom,
    ( neq(s0,s6) )).

cnf(neq233,axiom,
    ( neq(s0,s7) )).

cnf(neq234,axiom,
    ( neq(s0,s8) )).

cnf(neq235,axiom,
    ( neq(s0,s9) )).

cnf(neq236,axiom,
    ( neq(s0,s10) )).

cnf(neq237,axiom,
    ( neq(s0,s11) )).

cnf(neq238,axiom,
    ( neq(s0,s12) )).

cnf(neq239,axiom,
    ( neq(s0,s13) )).

cnf(neq240,axiom,
    ( neq(s0,s14) )).

cnf(neq241,axiom,
    ( neq(s0,p0_8) )).

cnf(neq242,axiom,
    ( neq(s0,p1_2) )).

cnf(neq243,axiom,
    ( neq(s0,p1_5) )).

cnf(neq244,axiom,
    ( neq(s0,p1_7) )).

cnf(neq245,axiom,
    ( neq(s0,p3_8) )).

cnf(neq246,axiom,
    ( neq(s0,p3_12) )).

cnf(neq247,axiom,
    ( neq(s0,p4_1) )).

cnf(neq248,axiom,
    ( neq(s0,p4_10) )).

cnf(neq249,axiom,
    ( neq(s0,p5_9) )).

cnf(neq250,axiom,
    ( neq(s0,p7_8) )).

cnf(neq251,axiom,
    ( neq(s0,p7_11) )).

cnf(neq252,axiom,
    ( neq(s0,p8_4) )).

cnf(neq253,axiom,
    ( neq(s0,p8_11) )).

cnf(neq254,axiom,
    ( neq(s0,p9_6) )).

cnf(neq255,axiom,
    ( neq(s0,p10_0) )).

cnf(neq256,axiom,
    ( neq(s0,p11_3) )).

cnf(neq257,axiom,
    ( neq(s0,p11_13) )).

cnf(neq258,axiom,
    ( neq(s0,p12_7) )).

cnf(neq259,axiom,
    ( neq(s0,p12_10) )).

cnf(neq260,axiom,
    ( neq(s0,p13_14) )).

cnf(neq261,axiom,
    ( neq(s0,p14_0) )).

cnf(neq262,axiom,
    ( neq(s0,p14_2) )).

cnf(neq263,axiom,
    ( neq(s0,p14_3) )).

cnf(neq264,axiom,
    ( neq(s0,p14_6) )).

cnf(neq265,axiom,
    ( neq(s1,truck1) )).

cnf(neq266,axiom,
    ( neq(s1,truck2) )).

cnf(neq267,axiom,
    ( neq(s1,truck3) )).

cnf(neq268,axiom,
    ( neq(s1,truck4) )).

cnf(neq269,axiom,
    ( neq(s1,truck5) )).

cnf(neq270,axiom,
    ( neq(s1,s0) )).

cnf(neq271,axiom,
    ( ~ neq(s1,s1) )).

cnf(neq272,axiom,
    ( neq(s1,s2) )).

cnf(neq273,axiom,
    ( neq(s1,s3) )).

cnf(neq274,axiom,
    ( neq(s1,s4) )).

cnf(neq275,axiom,
    ( neq(s1,s5) )).

cnf(neq276,axiom,
    ( neq(s1,s6) )).

cnf(neq277,axiom,
    ( neq(s1,s7) )).

cnf(neq278,axiom,
    ( neq(s1,s8) )).

cnf(neq279,axiom,
    ( neq(s1,s9) )).

cnf(neq280,axiom,
    ( neq(s1,s10) )).

cnf(neq281,axiom,
    ( neq(s1,s11) )).

cnf(neq282,axiom,
    ( neq(s1,s12) )).

cnf(neq283,axiom,
    ( neq(s1,s13) )).

cnf(neq284,axiom,
    ( neq(s1,s14) )).

cnf(neq285,axiom,
    ( neq(s1,p0_8) )).

cnf(neq286,axiom,
    ( neq(s1,p1_2) )).

cnf(neq287,axiom,
    ( neq(s1,p1_5) )).

cnf(neq288,axiom,
    ( neq(s1,p1_7) )).

cnf(neq289,axiom,
    ( neq(s1,p3_8) )).

cnf(neq290,axiom,
    ( neq(s1,p3_12) )).

cnf(neq291,axiom,
    ( neq(s1,p4_1) )).

cnf(neq292,axiom,
    ( neq(s1,p4_10) )).

cnf(neq293,axiom,
    ( neq(s1,p5_9) )).

cnf(neq294,axiom,
    ( neq(s1,p7_8) )).

cnf(neq295,axiom,
    ( neq(s1,p7_11) )).

cnf(neq296,axiom,
    ( neq(s1,p8_4) )).

cnf(neq297,axiom,
    ( neq(s1,p8_11) )).

cnf(neq298,axiom,
    ( neq(s1,p9_6) )).

cnf(neq299,axiom,
    ( neq(s1,p10_0) )).

cnf(neq300,axiom,
    ( neq(s1,p11_3) )).

cnf(neq301,axiom,
    ( neq(s1,p11_13) )).

cnf(neq302,axiom,
    ( neq(s1,p12_7) )).

cnf(neq303,axiom,
    ( neq(s1,p12_10) )).

cnf(neq304,axiom,
    ( neq(s1,p13_14) )).

cnf(neq305,axiom,
    ( neq(s1,p14_0) )).

cnf(neq306,axiom,
    ( neq(s1,p14_2) )).

cnf(neq307,axiom,
    ( neq(s1,p14_3) )).

cnf(neq308,axiom,
    ( neq(s1,p14_6) )).

cnf(neq309,axiom,
    ( neq(s2,truck1) )).

cnf(neq310,axiom,
    ( neq(s2,truck2) )).

cnf(neq311,axiom,
    ( neq(s2,truck3) )).

cnf(neq312,axiom,
    ( neq(s2,truck4) )).

cnf(neq313,axiom,
    ( neq(s2,truck5) )).

cnf(neq314,axiom,
    ( neq(s2,s0) )).

cnf(neq315,axiom,
    ( neq(s2,s1) )).

cnf(neq316,axiom,
    ( ~ neq(s2,s2) )).

cnf(neq317,axiom,
    ( neq(s2,s3) )).

cnf(neq318,axiom,
    ( neq(s2,s4) )).

cnf(neq319,axiom,
    ( neq(s2,s5) )).

cnf(neq320,axiom,
    ( neq(s2,s6) )).

cnf(neq321,axiom,
    ( neq(s2,s7) )).

cnf(neq322,axiom,
    ( neq(s2,s8) )).

cnf(neq323,axiom,
    ( neq(s2,s9) )).

cnf(neq324,axiom,
    ( neq(s2,s10) )).

cnf(neq325,axiom,
    ( neq(s2,s11) )).

cnf(neq326,axiom,
    ( neq(s2,s12) )).

cnf(neq327,axiom,
    ( neq(s2,s13) )).

cnf(neq328,axiom,
    ( neq(s2,s14) )).

cnf(neq329,axiom,
    ( neq(s2,p0_8) )).

cnf(neq330,axiom,
    ( neq(s2,p1_2) )).

cnf(neq331,axiom,
    ( neq(s2,p1_5) )).

cnf(neq332,axiom,
    ( neq(s2,p1_7) )).

cnf(neq333,axiom,
    ( neq(s2,p3_8) )).

cnf(neq334,axiom,
    ( neq(s2,p3_12) )).

cnf(neq335,axiom,
    ( neq(s2,p4_1) )).

cnf(neq336,axiom,
    ( neq(s2,p4_10) )).

cnf(neq337,axiom,
    ( neq(s2,p5_9) )).

cnf(neq338,axiom,
    ( neq(s2,p7_8) )).

cnf(neq339,axiom,
    ( neq(s2,p7_11) )).

cnf(neq340,axiom,
    ( neq(s2,p8_4) )).

cnf(neq341,axiom,
    ( neq(s2,p8_11) )).

cnf(neq342,axiom,
    ( neq(s2,p9_6) )).

cnf(neq343,axiom,
    ( neq(s2,p10_0) )).

cnf(neq344,axiom,
    ( neq(s2,p11_3) )).

cnf(neq345,axiom,
    ( neq(s2,p11_13) )).

cnf(neq346,axiom,
    ( neq(s2,p12_7) )).

cnf(neq347,axiom,
    ( neq(s2,p12_10) )).

cnf(neq348,axiom,
    ( neq(s2,p13_14) )).

cnf(neq349,axiom,
    ( neq(s2,p14_0) )).

cnf(neq350,axiom,
    ( neq(s2,p14_2) )).

cnf(neq351,axiom,
    ( neq(s2,p14_3) )).

cnf(neq352,axiom,
    ( neq(s2,p14_6) )).

cnf(neq353,axiom,
    ( neq(s3,truck1) )).

cnf(neq354,axiom,
    ( neq(s3,truck2) )).

cnf(neq355,axiom,
    ( neq(s3,truck3) )).

cnf(neq356,axiom,
    ( neq(s3,truck4) )).

cnf(neq357,axiom,
    ( neq(s3,truck5) )).

cnf(neq358,axiom,
    ( neq(s3,s0) )).

cnf(neq359,axiom,
    ( neq(s3,s1) )).

cnf(neq360,axiom,
    ( neq(s3,s2) )).

cnf(neq361,axiom,
    ( ~ neq(s3,s3) )).

cnf(neq362,axiom,
    ( neq(s3,s4) )).

cnf(neq363,axiom,
    ( neq(s3,s5) )).

cnf(neq364,axiom,
    ( neq(s3,s6) )).

cnf(neq365,axiom,
    ( neq(s3,s7) )).

cnf(neq366,axiom,
    ( neq(s3,s8) )).

cnf(neq367,axiom,
    ( neq(s3,s9) )).

cnf(neq368,axiom,
    ( neq(s3,s10) )).

cnf(neq369,axiom,
    ( neq(s3,s11) )).

cnf(neq370,axiom,
    ( neq(s3,s12) )).

cnf(neq371,axiom,
    ( neq(s3,s13) )).

cnf(neq372,axiom,
    ( neq(s3,s14) )).

cnf(neq373,axiom,
    ( neq(s3,p0_8) )).

cnf(neq374,axiom,
    ( neq(s3,p1_2) )).

cnf(neq375,axiom,
    ( neq(s3,p1_5) )).

cnf(neq376,axiom,
    ( neq(s3,p1_7) )).

cnf(neq377,axiom,
    ( neq(s3,p3_8) )).

cnf(neq378,axiom,
    ( neq(s3,p3_12) )).

cnf(neq379,axiom,
    ( neq(s3,p4_1) )).

cnf(neq380,axiom,
    ( neq(s3,p4_10) )).

cnf(neq381,axiom,
    ( neq(s3,p5_9) )).

cnf(neq382,axiom,
    ( neq(s3,p7_8) )).

cnf(neq383,axiom,
    ( neq(s3,p7_11) )).

cnf(neq384,axiom,
    ( neq(s3,p8_4) )).

cnf(neq385,axiom,
    ( neq(s3,p8_11) )).

cnf(neq386,axiom,
    ( neq(s3,p9_6) )).

cnf(neq387,axiom,
    ( neq(s3,p10_0) )).

cnf(neq388,axiom,
    ( neq(s3,p11_3) )).

cnf(neq389,axiom,
    ( neq(s3,p11_13) )).

cnf(neq390,axiom,
    ( neq(s3,p12_7) )).

cnf(neq391,axiom,
    ( neq(s3,p12_10) )).

cnf(neq392,axiom,
    ( neq(s3,p13_14) )).

cnf(neq393,axiom,
    ( neq(s3,p14_0) )).

cnf(neq394,axiom,
    ( neq(s3,p14_2) )).

cnf(neq395,axiom,
    ( neq(s3,p14_3) )).

cnf(neq396,axiom,
    ( neq(s3,p14_6) )).

cnf(neq397,axiom,
    ( neq(s4,truck1) )).

cnf(neq398,axiom,
    ( neq(s4,truck2) )).

cnf(neq399,axiom,
    ( neq(s4,truck3) )).

cnf(neq400,axiom,
    ( neq(s4,truck4) )).

cnf(neq401,axiom,
    ( neq(s4,truck5) )).

cnf(neq402,axiom,
    ( neq(s4,s0) )).

cnf(neq403,axiom,
    ( neq(s4,s1) )).

cnf(neq404,axiom,
    ( neq(s4,s2) )).

cnf(neq405,axiom,
    ( neq(s4,s3) )).

cnf(neq406,axiom,
    ( ~ neq(s4,s4) )).

cnf(neq407,axiom,
    ( neq(s4,s5) )).

cnf(neq408,axiom,
    ( neq(s4,s6) )).

cnf(neq409,axiom,
    ( neq(s4,s7) )).

cnf(neq410,axiom,
    ( neq(s4,s8) )).

cnf(neq411,axiom,
    ( neq(s4,s9) )).

cnf(neq412,axiom,
    ( neq(s4,s10) )).

cnf(neq413,axiom,
    ( neq(s4,s11) )).

cnf(neq414,axiom,
    ( neq(s4,s12) )).

cnf(neq415,axiom,
    ( neq(s4,s13) )).

cnf(neq416,axiom,
    ( neq(s4,s14) )).

cnf(neq417,axiom,
    ( neq(s4,p0_8) )).

cnf(neq418,axiom,
    ( neq(s4,p1_2) )).

cnf(neq419,axiom,
    ( neq(s4,p1_5) )).

cnf(neq420,axiom,
    ( neq(s4,p1_7) )).

cnf(neq421,axiom,
    ( neq(s4,p3_8) )).

cnf(neq422,axiom,
    ( neq(s4,p3_12) )).

cnf(neq423,axiom,
    ( neq(s4,p4_1) )).

cnf(neq424,axiom,
    ( neq(s4,p4_10) )).

cnf(neq425,axiom,
    ( neq(s4,p5_9) )).

cnf(neq426,axiom,
    ( neq(s4,p7_8) )).

cnf(neq427,axiom,
    ( neq(s4,p7_11) )).

cnf(neq428,axiom,
    ( neq(s4,p8_4) )).

cnf(neq429,axiom,
    ( neq(s4,p8_11) )).

cnf(neq430,axiom,
    ( neq(s4,p9_6) )).

cnf(neq431,axiom,
    ( neq(s4,p10_0) )).

cnf(neq432,axiom,
    ( neq(s4,p11_3) )).

cnf(neq433,axiom,
    ( neq(s4,p11_13) )).

cnf(neq434,axiom,
    ( neq(s4,p12_7) )).

cnf(neq435,axiom,
    ( neq(s4,p12_10) )).

cnf(neq436,axiom,
    ( neq(s4,p13_14) )).

cnf(neq437,axiom,
    ( neq(s4,p14_0) )).

cnf(neq438,axiom,
    ( neq(s4,p14_2) )).

cnf(neq439,axiom,
    ( neq(s4,p14_3) )).

cnf(neq440,axiom,
    ( neq(s4,p14_6) )).

cnf(neq441,axiom,
    ( neq(s5,truck1) )).

cnf(neq442,axiom,
    ( neq(s5,truck2) )).

cnf(neq443,axiom,
    ( neq(s5,truck3) )).

cnf(neq444,axiom,
    ( neq(s5,truck4) )).

cnf(neq445,axiom,
    ( neq(s5,truck5) )).

cnf(neq446,axiom,
    ( neq(s5,s0) )).

cnf(neq447,axiom,
    ( neq(s5,s1) )).

cnf(neq448,axiom,
    ( neq(s5,s2) )).

cnf(neq449,axiom,
    ( neq(s5,s3) )).

cnf(neq450,axiom,
    ( neq(s5,s4) )).

cnf(neq451,axiom,
    ( ~ neq(s5,s5) )).

cnf(neq452,axiom,
    ( neq(s5,s6) )).

cnf(neq453,axiom,
    ( neq(s5,s7) )).

cnf(neq454,axiom,
    ( neq(s5,s8) )).

cnf(neq455,axiom,
    ( neq(s5,s9) )).

cnf(neq456,axiom,
    ( neq(s5,s10) )).

cnf(neq457,axiom,
    ( neq(s5,s11) )).

cnf(neq458,axiom,
    ( neq(s5,s12) )).

cnf(neq459,axiom,
    ( neq(s5,s13) )).

cnf(neq460,axiom,
    ( neq(s5,s14) )).

cnf(neq461,axiom,
    ( neq(s5,p0_8) )).

cnf(neq462,axiom,
    ( neq(s5,p1_2) )).

cnf(neq463,axiom,
    ( neq(s5,p1_5) )).

cnf(neq464,axiom,
    ( neq(s5,p1_7) )).

cnf(neq465,axiom,
    ( neq(s5,p3_8) )).

cnf(neq466,axiom,
    ( neq(s5,p3_12) )).

cnf(neq467,axiom,
    ( neq(s5,p4_1) )).

cnf(neq468,axiom,
    ( neq(s5,p4_10) )).

cnf(neq469,axiom,
    ( neq(s5,p5_9) )).

cnf(neq470,axiom,
    ( neq(s5,p7_8) )).

cnf(neq471,axiom,
    ( neq(s5,p7_11) )).

cnf(neq472,axiom,
    ( neq(s5,p8_4) )).

cnf(neq473,axiom,
    ( neq(s5,p8_11) )).

cnf(neq474,axiom,
    ( neq(s5,p9_6) )).

cnf(neq475,axiom,
    ( neq(s5,p10_0) )).

cnf(neq476,axiom,
    ( neq(s5,p11_3) )).

cnf(neq477,axiom,
    ( neq(s5,p11_13) )).

cnf(neq478,axiom,
    ( neq(s5,p12_7) )).

cnf(neq479,axiom,
    ( neq(s5,p12_10) )).

cnf(neq480,axiom,
    ( neq(s5,p13_14) )).

cnf(neq481,axiom,
    ( neq(s5,p14_0) )).

cnf(neq482,axiom,
    ( neq(s5,p14_2) )).

cnf(neq483,axiom,
    ( neq(s5,p14_3) )).

cnf(neq484,axiom,
    ( neq(s5,p14_6) )).

cnf(neq485,axiom,
    ( neq(s6,truck1) )).

cnf(neq486,axiom,
    ( neq(s6,truck2) )).

cnf(neq487,axiom,
    ( neq(s6,truck3) )).

cnf(neq488,axiom,
    ( neq(s6,truck4) )).

cnf(neq489,axiom,
    ( neq(s6,truck5) )).

cnf(neq490,axiom,
    ( neq(s6,s0) )).

cnf(neq491,axiom,
    ( neq(s6,s1) )).

cnf(neq492,axiom,
    ( neq(s6,s2) )).

cnf(neq493,axiom,
    ( neq(s6,s3) )).

cnf(neq494,axiom,
    ( neq(s6,s4) )).

cnf(neq495,axiom,
    ( neq(s6,s5) )).

cnf(neq496,axiom,
    ( ~ neq(s6,s6) )).

cnf(neq497,axiom,
    ( neq(s6,s7) )).

cnf(neq498,axiom,
    ( neq(s6,s8) )).

cnf(neq499,axiom,
    ( neq(s6,s9) )).

cnf(neq500,axiom,
    ( neq(s6,s10) )).

cnf(neq501,axiom,
    ( neq(s6,s11) )).

cnf(neq502,axiom,
    ( neq(s6,s12) )).

cnf(neq503,axiom,
    ( neq(s6,s13) )).

cnf(neq504,axiom,
    ( neq(s6,s14) )).

cnf(neq505,axiom,
    ( neq(s6,p0_8) )).

cnf(neq506,axiom,
    ( neq(s6,p1_2) )).

cnf(neq507,axiom,
    ( neq(s6,p1_5) )).

cnf(neq508,axiom,
    ( neq(s6,p1_7) )).

cnf(neq509,axiom,
    ( neq(s6,p3_8) )).

cnf(neq510,axiom,
    ( neq(s6,p3_12) )).

cnf(neq511,axiom,
    ( neq(s6,p4_1) )).

cnf(neq512,axiom,
    ( neq(s6,p4_10) )).

cnf(neq513,axiom,
    ( neq(s6,p5_9) )).

cnf(neq514,axiom,
    ( neq(s6,p7_8) )).

cnf(neq515,axiom,
    ( neq(s6,p7_11) )).

cnf(neq516,axiom,
    ( neq(s6,p8_4) )).

cnf(neq517,axiom,
    ( neq(s6,p8_11) )).

cnf(neq518,axiom,
    ( neq(s6,p9_6) )).

cnf(neq519,axiom,
    ( neq(s6,p10_0) )).

cnf(neq520,axiom,
    ( neq(s6,p11_3) )).

cnf(neq521,axiom,
    ( neq(s6,p11_13) )).

cnf(neq522,axiom,
    ( neq(s6,p12_7) )).

cnf(neq523,axiom,
    ( neq(s6,p12_10) )).

cnf(neq524,axiom,
    ( neq(s6,p13_14) )).

cnf(neq525,axiom,
    ( neq(s6,p14_0) )).

cnf(neq526,axiom,
    ( neq(s6,p14_2) )).

cnf(neq527,axiom,
    ( neq(s6,p14_3) )).

cnf(neq528,axiom,
    ( neq(s6,p14_6) )).

cnf(neq529,axiom,
    ( neq(s7,truck1) )).

cnf(neq530,axiom,
    ( neq(s7,truck2) )).

cnf(neq531,axiom,
    ( neq(s7,truck3) )).

cnf(neq532,axiom,
    ( neq(s7,truck4) )).

cnf(neq533,axiom,
    ( neq(s7,truck5) )).

cnf(neq534,axiom,
    ( neq(s7,s0) )).

cnf(neq535,axiom,
    ( neq(s7,s1) )).

cnf(neq536,axiom,
    ( neq(s7,s2) )).

cnf(neq537,axiom,
    ( neq(s7,s3) )).

cnf(neq538,axiom,
    ( neq(s7,s4) )).

cnf(neq539,axiom,
    ( neq(s7,s5) )).

cnf(neq540,axiom,
    ( neq(s7,s6) )).

cnf(neq541,axiom,
    ( ~ neq(s7,s7) )).

cnf(neq542,axiom,
    ( neq(s7,s8) )).

cnf(neq543,axiom,
    ( neq(s7,s9) )).

cnf(neq544,axiom,
    ( neq(s7,s10) )).

cnf(neq545,axiom,
    ( neq(s7,s11) )).

cnf(neq546,axiom,
    ( neq(s7,s12) )).

cnf(neq547,axiom,
    ( neq(s7,s13) )).

cnf(neq548,axiom,
    ( neq(s7,s14) )).

cnf(neq549,axiom,
    ( neq(s7,p0_8) )).

cnf(neq550,axiom,
    ( neq(s7,p1_2) )).

cnf(neq551,axiom,
    ( neq(s7,p1_5) )).

cnf(neq552,axiom,
    ( neq(s7,p1_7) )).

cnf(neq553,axiom,
    ( neq(s7,p3_8) )).

cnf(neq554,axiom,
    ( neq(s7,p3_12) )).

cnf(neq555,axiom,
    ( neq(s7,p4_1) )).

cnf(neq556,axiom,
    ( neq(s7,p4_10) )).

cnf(neq557,axiom,
    ( neq(s7,p5_9) )).

cnf(neq558,axiom,
    ( neq(s7,p7_8) )).

cnf(neq559,axiom,
    ( neq(s7,p7_11) )).

cnf(neq560,axiom,
    ( neq(s7,p8_4) )).

cnf(neq561,axiom,
    ( neq(s7,p8_11) )).

cnf(neq562,axiom,
    ( neq(s7,p9_6) )).

cnf(neq563,axiom,
    ( neq(s7,p10_0) )).

cnf(neq564,axiom,
    ( neq(s7,p11_3) )).

cnf(neq565,axiom,
    ( neq(s7,p11_13) )).

cnf(neq566,axiom,
    ( neq(s7,p12_7) )).

cnf(neq567,axiom,
    ( neq(s7,p12_10) )).

cnf(neq568,axiom,
    ( neq(s7,p13_14) )).

cnf(neq569,axiom,
    ( neq(s7,p14_0) )).

cnf(neq570,axiom,
    ( neq(s7,p14_2) )).

cnf(neq571,axiom,
    ( neq(s7,p14_3) )).

cnf(neq572,axiom,
    ( neq(s7,p14_6) )).

cnf(neq573,axiom,
    ( neq(s8,truck1) )).

cnf(neq574,axiom,
    ( neq(s8,truck2) )).

cnf(neq575,axiom,
    ( neq(s8,truck3) )).

cnf(neq576,axiom,
    ( neq(s8,truck4) )).

cnf(neq577,axiom,
    ( neq(s8,truck5) )).

cnf(neq578,axiom,
    ( neq(s8,s0) )).

cnf(neq579,axiom,
    ( neq(s8,s1) )).

cnf(neq580,axiom,
    ( neq(s8,s2) )).

cnf(neq581,axiom,
    ( neq(s8,s3) )).

cnf(neq582,axiom,
    ( neq(s8,s4) )).

cnf(neq583,axiom,
    ( neq(s8,s5) )).

cnf(neq584,axiom,
    ( neq(s8,s6) )).

cnf(neq585,axiom,
    ( neq(s8,s7) )).

cnf(neq586,axiom,
    ( ~ neq(s8,s8) )).

cnf(neq587,axiom,
    ( neq(s8,s9) )).

cnf(neq588,axiom,
    ( neq(s8,s10) )).

cnf(neq589,axiom,
    ( neq(s8,s11) )).

cnf(neq590,axiom,
    ( neq(s8,s12) )).

cnf(neq591,axiom,
    ( neq(s8,s13) )).

cnf(neq592,axiom,
    ( neq(s8,s14) )).

cnf(neq593,axiom,
    ( neq(s8,p0_8) )).

cnf(neq594,axiom,
    ( neq(s8,p1_2) )).

cnf(neq595,axiom,
    ( neq(s8,p1_5) )).

cnf(neq596,axiom,
    ( neq(s8,p1_7) )).

cnf(neq597,axiom,
    ( neq(s8,p3_8) )).

cnf(neq598,axiom,
    ( neq(s8,p3_12) )).

cnf(neq599,axiom,
    ( neq(s8,p4_1) )).

cnf(neq600,axiom,
    ( neq(s8,p4_10) )).

cnf(neq601,axiom,
    ( neq(s8,p5_9) )).

cnf(neq602,axiom,
    ( neq(s8,p7_8) )).

cnf(neq603,axiom,
    ( neq(s8,p7_11) )).

cnf(neq604,axiom,
    ( neq(s8,p8_4) )).

cnf(neq605,axiom,
    ( neq(s8,p8_11) )).

cnf(neq606,axiom,
    ( neq(s8,p9_6) )).

cnf(neq607,axiom,
    ( neq(s8,p10_0) )).

cnf(neq608,axiom,
    ( neq(s8,p11_3) )).

cnf(neq609,axiom,
    ( neq(s8,p11_13) )).

cnf(neq610,axiom,
    ( neq(s8,p12_7) )).

cnf(neq611,axiom,
    ( neq(s8,p12_10) )).

cnf(neq612,axiom,
    ( neq(s8,p13_14) )).

cnf(neq613,axiom,
    ( neq(s8,p14_0) )).

cnf(neq614,axiom,
    ( neq(s8,p14_2) )).

cnf(neq615,axiom,
    ( neq(s8,p14_3) )).

cnf(neq616,axiom,
    ( neq(s8,p14_6) )).

cnf(neq617,axiom,
    ( neq(s9,truck1) )).

cnf(neq618,axiom,
    ( neq(s9,truck2) )).

cnf(neq619,axiom,
    ( neq(s9,truck3) )).

cnf(neq620,axiom,
    ( neq(s9,truck4) )).

cnf(neq621,axiom,
    ( neq(s9,truck5) )).

cnf(neq622,axiom,
    ( neq(s9,s0) )).

cnf(neq623,axiom,
    ( neq(s9,s1) )).

cnf(neq624,axiom,
    ( neq(s9,s2) )).

cnf(neq625,axiom,
    ( neq(s9,s3) )).

cnf(neq626,axiom,
    ( neq(s9,s4) )).

cnf(neq627,axiom,
    ( neq(s9,s5) )).

cnf(neq628,axiom,
    ( neq(s9,s6) )).

cnf(neq629,axiom,
    ( neq(s9,s7) )).

cnf(neq630,axiom,
    ( neq(s9,s8) )).

cnf(neq631,axiom,
    ( ~ neq(s9,s9) )).

cnf(neq632,axiom,
    ( neq(s9,s10) )).

cnf(neq633,axiom,
    ( neq(s9,s11) )).

cnf(neq634,axiom,
    ( neq(s9,s12) )).

cnf(neq635,axiom,
    ( neq(s9,s13) )).

cnf(neq636,axiom,
    ( neq(s9,s14) )).

cnf(neq637,axiom,
    ( neq(s9,p0_8) )).

cnf(neq638,axiom,
    ( neq(s9,p1_2) )).

cnf(neq639,axiom,
    ( neq(s9,p1_5) )).

cnf(neq640,axiom,
    ( neq(s9,p1_7) )).

cnf(neq641,axiom,
    ( neq(s9,p3_8) )).

cnf(neq642,axiom,
    ( neq(s9,p3_12) )).

cnf(neq643,axiom,
    ( neq(s9,p4_1) )).

cnf(neq644,axiom,
    ( neq(s9,p4_10) )).

cnf(neq645,axiom,
    ( neq(s9,p5_9) )).

cnf(neq646,axiom,
    ( neq(s9,p7_8) )).

cnf(neq647,axiom,
    ( neq(s9,p7_11) )).

cnf(neq648,axiom,
    ( neq(s9,p8_4) )).

cnf(neq649,axiom,
    ( neq(s9,p8_11) )).

cnf(neq650,axiom,
    ( neq(s9,p9_6) )).

cnf(neq651,axiom,
    ( neq(s9,p10_0) )).

cnf(neq652,axiom,
    ( neq(s9,p11_3) )).

cnf(neq653,axiom,
    ( neq(s9,p11_13) )).

cnf(neq654,axiom,
    ( neq(s9,p12_7) )).

cnf(neq655,axiom,
    ( neq(s9,p12_10) )).

cnf(neq656,axiom,
    ( neq(s9,p13_14) )).

cnf(neq657,axiom,
    ( neq(s9,p14_0) )).

cnf(neq658,axiom,
    ( neq(s9,p14_2) )).

cnf(neq659,axiom,
    ( neq(s9,p14_3) )).

cnf(neq660,axiom,
    ( neq(s9,p14_6) )).

cnf(neq661,axiom,
    ( neq(s10,truck1) )).

cnf(neq662,axiom,
    ( neq(s10,truck2) )).

cnf(neq663,axiom,
    ( neq(s10,truck3) )).

cnf(neq664,axiom,
    ( neq(s10,truck4) )).

cnf(neq665,axiom,
    ( neq(s10,truck5) )).

cnf(neq666,axiom,
    ( neq(s10,s0) )).

cnf(neq667,axiom,
    ( neq(s10,s1) )).

cnf(neq668,axiom,
    ( neq(s10,s2) )).

cnf(neq669,axiom,
    ( neq(s10,s3) )).

cnf(neq670,axiom,
    ( neq(s10,s4) )).

cnf(neq671,axiom,
    ( neq(s10,s5) )).

cnf(neq672,axiom,
    ( neq(s10,s6) )).

cnf(neq673,axiom,
    ( neq(s10,s7) )).

cnf(neq674,axiom,
    ( neq(s10,s8) )).

cnf(neq675,axiom,
    ( neq(s10,s9) )).

cnf(neq676,axiom,
    ( ~ neq(s10,s10) )).

cnf(neq677,axiom,
    ( neq(s10,s11) )).

cnf(neq678,axiom,
    ( neq(s10,s12) )).

cnf(neq679,axiom,
    ( neq(s10,s13) )).

cnf(neq680,axiom,
    ( neq(s10,s14) )).

cnf(neq681,axiom,
    ( neq(s10,p0_8) )).

cnf(neq682,axiom,
    ( neq(s10,p1_2) )).

cnf(neq683,axiom,
    ( neq(s10,p1_5) )).

cnf(neq684,axiom,
    ( neq(s10,p1_7) )).

cnf(neq685,axiom,
    ( neq(s10,p3_8) )).

cnf(neq686,axiom,
    ( neq(s10,p3_12) )).

cnf(neq687,axiom,
    ( neq(s10,p4_1) )).

cnf(neq688,axiom,
    ( neq(s10,p4_10) )).

cnf(neq689,axiom,
    ( neq(s10,p5_9) )).

cnf(neq690,axiom,
    ( neq(s10,p7_8) )).

cnf(neq691,axiom,
    ( neq(s10,p7_11) )).

cnf(neq692,axiom,
    ( neq(s10,p8_4) )).

cnf(neq693,axiom,
    ( neq(s10,p8_11) )).

cnf(neq694,axiom,
    ( neq(s10,p9_6) )).

cnf(neq695,axiom,
    ( neq(s10,p10_0) )).

cnf(neq696,axiom,
    ( neq(s10,p11_3) )).

cnf(neq697,axiom,
    ( neq(s10,p11_13) )).

cnf(neq698,axiom,
    ( neq(s10,p12_7) )).

cnf(neq699,axiom,
    ( neq(s10,p12_10) )).

cnf(neq700,axiom,
    ( neq(s10,p13_14) )).

cnf(neq701,axiom,
    ( neq(s10,p14_0) )).

cnf(neq702,axiom,
    ( neq(s10,p14_2) )).

cnf(neq703,axiom,
    ( neq(s10,p14_3) )).

cnf(neq704,axiom,
    ( neq(s10,p14_6) )).

cnf(neq705,axiom,
    ( neq(s11,truck1) )).

cnf(neq706,axiom,
    ( neq(s11,truck2) )).

cnf(neq707,axiom,
    ( neq(s11,truck3) )).

cnf(neq708,axiom,
    ( neq(s11,truck4) )).

cnf(neq709,axiom,
    ( neq(s11,truck5) )).

cnf(neq710,axiom,
    ( neq(s11,s0) )).

cnf(neq711,axiom,
    ( neq(s11,s1) )).

cnf(neq712,axiom,
    ( neq(s11,s2) )).

cnf(neq713,axiom,
    ( neq(s11,s3) )).

cnf(neq714,axiom,
    ( neq(s11,s4) )).

cnf(neq715,axiom,
    ( neq(s11,s5) )).

cnf(neq716,axiom,
    ( neq(s11,s6) )).

cnf(neq717,axiom,
    ( neq(s11,s7) )).

cnf(neq718,axiom,
    ( neq(s11,s8) )).

cnf(neq719,axiom,
    ( neq(s11,s9) )).

cnf(neq720,axiom,
    ( neq(s11,s10) )).

cnf(neq721,axiom,
    ( ~ neq(s11,s11) )).

cnf(neq722,axiom,
    ( neq(s11,s12) )).

cnf(neq723,axiom,
    ( neq(s11,s13) )).

cnf(neq724,axiom,
    ( neq(s11,s14) )).

cnf(neq725,axiom,
    ( neq(s11,p0_8) )).

cnf(neq726,axiom,
    ( neq(s11,p1_2) )).

cnf(neq727,axiom,
    ( neq(s11,p1_5) )).

cnf(neq728,axiom,
    ( neq(s11,p1_7) )).

cnf(neq729,axiom,
    ( neq(s11,p3_8) )).

cnf(neq730,axiom,
    ( neq(s11,p3_12) )).

cnf(neq731,axiom,
    ( neq(s11,p4_1) )).

cnf(neq732,axiom,
    ( neq(s11,p4_10) )).

cnf(neq733,axiom,
    ( neq(s11,p5_9) )).

cnf(neq734,axiom,
    ( neq(s11,p7_8) )).

cnf(neq735,axiom,
    ( neq(s11,p7_11) )).

cnf(neq736,axiom,
    ( neq(s11,p8_4) )).

cnf(neq737,axiom,
    ( neq(s11,p8_11) )).

cnf(neq738,axiom,
    ( neq(s11,p9_6) )).

cnf(neq739,axiom,
    ( neq(s11,p10_0) )).

cnf(neq740,axiom,
    ( neq(s11,p11_3) )).

cnf(neq741,axiom,
    ( neq(s11,p11_13) )).

cnf(neq742,axiom,
    ( neq(s11,p12_7) )).

cnf(neq743,axiom,
    ( neq(s11,p12_10) )).

cnf(neq744,axiom,
    ( neq(s11,p13_14) )).

cnf(neq745,axiom,
    ( neq(s11,p14_0) )).

cnf(neq746,axiom,
    ( neq(s11,p14_2) )).

cnf(neq747,axiom,
    ( neq(s11,p14_3) )).

cnf(neq748,axiom,
    ( neq(s11,p14_6) )).

cnf(neq749,axiom,
    ( neq(s12,truck1) )).

cnf(neq750,axiom,
    ( neq(s12,truck2) )).

cnf(neq751,axiom,
    ( neq(s12,truck3) )).

cnf(neq752,axiom,
    ( neq(s12,truck4) )).

cnf(neq753,axiom,
    ( neq(s12,truck5) )).

cnf(neq754,axiom,
    ( neq(s12,s0) )).

cnf(neq755,axiom,
    ( neq(s12,s1) )).

cnf(neq756,axiom,
    ( neq(s12,s2) )).

cnf(neq757,axiom,
    ( neq(s12,s3) )).

cnf(neq758,axiom,
    ( neq(s12,s4) )).

cnf(neq759,axiom,
    ( neq(s12,s5) )).

cnf(neq760,axiom,
    ( neq(s12,s6) )).

cnf(neq761,axiom,
    ( neq(s12,s7) )).

cnf(neq762,axiom,
    ( neq(s12,s8) )).

cnf(neq763,axiom,
    ( neq(s12,s9) )).

cnf(neq764,axiom,
    ( neq(s12,s10) )).

cnf(neq765,axiom,
    ( neq(s12,s11) )).

cnf(neq766,axiom,
    ( ~ neq(s12,s12) )).

cnf(neq767,axiom,
    ( neq(s12,s13) )).

cnf(neq768,axiom,
    ( neq(s12,s14) )).

cnf(neq769,axiom,
    ( neq(s12,p0_8) )).

cnf(neq770,axiom,
    ( neq(s12,p1_2) )).

cnf(neq771,axiom,
    ( neq(s12,p1_5) )).

cnf(neq772,axiom,
    ( neq(s12,p1_7) )).

cnf(neq773,axiom,
    ( neq(s12,p3_8) )).

cnf(neq774,axiom,
    ( neq(s12,p3_12) )).

cnf(neq775,axiom,
    ( neq(s12,p4_1) )).

cnf(neq776,axiom,
    ( neq(s12,p4_10) )).

cnf(neq777,axiom,
    ( neq(s12,p5_9) )).

cnf(neq778,axiom,
    ( neq(s12,p7_8) )).

cnf(neq779,axiom,
    ( neq(s12,p7_11) )).

cnf(neq780,axiom,
    ( neq(s12,p8_4) )).

cnf(neq781,axiom,
    ( neq(s12,p8_11) )).

cnf(neq782,axiom,
    ( neq(s12,p9_6) )).

cnf(neq783,axiom,
    ( neq(s12,p10_0) )).

cnf(neq784,axiom,
    ( neq(s12,p11_3) )).

cnf(neq785,axiom,
    ( neq(s12,p11_13) )).

cnf(neq786,axiom,
    ( neq(s12,p12_7) )).

cnf(neq787,axiom,
    ( neq(s12,p12_10) )).

cnf(neq788,axiom,
    ( neq(s12,p13_14) )).

cnf(neq789,axiom,
    ( neq(s12,p14_0) )).

cnf(neq790,axiom,
    ( neq(s12,p14_2) )).

cnf(neq791,axiom,
    ( neq(s12,p14_3) )).

cnf(neq792,axiom,
    ( neq(s12,p14_6) )).

cnf(neq793,axiom,
    ( neq(s13,truck1) )).

cnf(neq794,axiom,
    ( neq(s13,truck2) )).

cnf(neq795,axiom,
    ( neq(s13,truck3) )).

cnf(neq796,axiom,
    ( neq(s13,truck4) )).

cnf(neq797,axiom,
    ( neq(s13,truck5) )).

cnf(neq798,axiom,
    ( neq(s13,s0) )).

cnf(neq799,axiom,
    ( neq(s13,s1) )).

cnf(neq800,axiom,
    ( neq(s13,s2) )).

cnf(neq801,axiom,
    ( neq(s13,s3) )).

cnf(neq802,axiom,
    ( neq(s13,s4) )).

cnf(neq803,axiom,
    ( neq(s13,s5) )).

cnf(neq804,axiom,
    ( neq(s13,s6) )).

cnf(neq805,axiom,
    ( neq(s13,s7) )).

cnf(neq806,axiom,
    ( neq(s13,s8) )).

cnf(neq807,axiom,
    ( neq(s13,s9) )).

cnf(neq808,axiom,
    ( neq(s13,s10) )).

cnf(neq809,axiom,
    ( neq(s13,s11) )).

cnf(neq810,axiom,
    ( neq(s13,s12) )).

cnf(neq811,axiom,
    ( ~ neq(s13,s13) )).

cnf(neq812,axiom,
    ( neq(s13,s14) )).

cnf(neq813,axiom,
    ( neq(s13,p0_8) )).

cnf(neq814,axiom,
    ( neq(s13,p1_2) )).

cnf(neq815,axiom,
    ( neq(s13,p1_5) )).

cnf(neq816,axiom,
    ( neq(s13,p1_7) )).

cnf(neq817,axiom,
    ( neq(s13,p3_8) )).

cnf(neq818,axiom,
    ( neq(s13,p3_12) )).

cnf(neq819,axiom,
    ( neq(s13,p4_1) )).

cnf(neq820,axiom,
    ( neq(s13,p4_10) )).

cnf(neq821,axiom,
    ( neq(s13,p5_9) )).

cnf(neq822,axiom,
    ( neq(s13,p7_8) )).

cnf(neq823,axiom,
    ( neq(s13,p7_11) )).

cnf(neq824,axiom,
    ( neq(s13,p8_4) )).

cnf(neq825,axiom,
    ( neq(s13,p8_11) )).

cnf(neq826,axiom,
    ( neq(s13,p9_6) )).

cnf(neq827,axiom,
    ( neq(s13,p10_0) )).

cnf(neq828,axiom,
    ( neq(s13,p11_3) )).

cnf(neq829,axiom,
    ( neq(s13,p11_13) )).

cnf(neq830,axiom,
    ( neq(s13,p12_7) )).

cnf(neq831,axiom,
    ( neq(s13,p12_10) )).

cnf(neq832,axiom,
    ( neq(s13,p13_14) )).

cnf(neq833,axiom,
    ( neq(s13,p14_0) )).

cnf(neq834,axiom,
    ( neq(s13,p14_2) )).

cnf(neq835,axiom,
    ( neq(s13,p14_3) )).

cnf(neq836,axiom,
    ( neq(s13,p14_6) )).

cnf(neq837,axiom,
    ( neq(s14,truck1) )).

cnf(neq838,axiom,
    ( neq(s14,truck2) )).

cnf(neq839,axiom,
    ( neq(s14,truck3) )).

cnf(neq840,axiom,
    ( neq(s14,truck4) )).

cnf(neq841,axiom,
    ( neq(s14,truck5) )).

cnf(neq842,axiom,
    ( neq(s14,s0) )).

cnf(neq843,axiom,
    ( neq(s14,s1) )).

cnf(neq844,axiom,
    ( neq(s14,s2) )).

cnf(neq845,axiom,
    ( neq(s14,s3) )).

cnf(neq846,axiom,
    ( neq(s14,s4) )).

cnf(neq847,axiom,
    ( neq(s14,s5) )).

cnf(neq848,axiom,
    ( neq(s14,s6) )).

cnf(neq849,axiom,
    ( neq(s14,s7) )).

cnf(neq850,axiom,
    ( neq(s14,s8) )).

cnf(neq851,axiom,
    ( neq(s14,s9) )).

cnf(neq852,axiom,
    ( neq(s14,s10) )).

cnf(neq853,axiom,
    ( neq(s14,s11) )).

cnf(neq854,axiom,
    ( neq(s14,s12) )).

cnf(neq855,axiom,
    ( neq(s14,s13) )).

cnf(neq856,axiom,
    ( ~ neq(s14,s14) )).

cnf(neq857,axiom,
    ( neq(s14,p0_8) )).

cnf(neq858,axiom,
    ( neq(s14,p1_2) )).

cnf(neq859,axiom,
    ( neq(s14,p1_5) )).

cnf(neq860,axiom,
    ( neq(s14,p1_7) )).

cnf(neq861,axiom,
    ( neq(s14,p3_8) )).

cnf(neq862,axiom,
    ( neq(s14,p3_12) )).

cnf(neq863,axiom,
    ( neq(s14,p4_1) )).

cnf(neq864,axiom,
    ( neq(s14,p4_10) )).

cnf(neq865,axiom,
    ( neq(s14,p5_9) )).

cnf(neq866,axiom,
    ( neq(s14,p7_8) )).

cnf(neq867,axiom,
    ( neq(s14,p7_11) )).

cnf(neq868,axiom,
    ( neq(s14,p8_4) )).

cnf(neq869,axiom,
    ( neq(s14,p8_11) )).

cnf(neq870,axiom,
    ( neq(s14,p9_6) )).

cnf(neq871,axiom,
    ( neq(s14,p10_0) )).

cnf(neq872,axiom,
    ( neq(s14,p11_3) )).

cnf(neq873,axiom,
    ( neq(s14,p11_13) )).

cnf(neq874,axiom,
    ( neq(s14,p12_7) )).

cnf(neq875,axiom,
    ( neq(s14,p12_10) )).

cnf(neq876,axiom,
    ( neq(s14,p13_14) )).

cnf(neq877,axiom,
    ( neq(s14,p14_0) )).

cnf(neq878,axiom,
    ( neq(s14,p14_2) )).

cnf(neq879,axiom,
    ( neq(s14,p14_3) )).

cnf(neq880,axiom,
    ( neq(s14,p14_6) )).

cnf(neq881,axiom,
    ( neq(p0_8,truck1) )).

cnf(neq882,axiom,
    ( neq(p0_8,truck2) )).

cnf(neq883,axiom,
    ( neq(p0_8,truck3) )).

cnf(neq884,axiom,
    ( neq(p0_8,truck4) )).

cnf(neq885,axiom,
    ( neq(p0_8,truck5) )).

cnf(neq886,axiom,
    ( neq(p0_8,s0) )).

cnf(neq887,axiom,
    ( neq(p0_8,s1) )).

cnf(neq888,axiom,
    ( neq(p0_8,s2) )).

cnf(neq889,axiom,
    ( neq(p0_8,s3) )).

cnf(neq890,axiom,
    ( neq(p0_8,s4) )).

cnf(neq891,axiom,
    ( neq(p0_8,s5) )).

cnf(neq892,axiom,
    ( neq(p0_8,s6) )).

cnf(neq893,axiom,
    ( neq(p0_8,s7) )).

cnf(neq894,axiom,
    ( neq(p0_8,s8) )).

cnf(neq895,axiom,
    ( neq(p0_8,s9) )).

cnf(neq896,axiom,
    ( neq(p0_8,s10) )).

cnf(neq897,axiom,
    ( neq(p0_8,s11) )).

cnf(neq898,axiom,
    ( neq(p0_8,s12) )).

cnf(neq899,axiom,
    ( neq(p0_8,s13) )).

cnf(neq900,axiom,
    ( neq(p0_8,s14) )).

cnf(neq901,axiom,
    ( ~ neq(p0_8,p0_8) )).

cnf(neq902,axiom,
    ( neq(p0_8,p1_2) )).

cnf(neq903,axiom,
    ( neq(p0_8,p1_5) )).

cnf(neq904,axiom,
    ( neq(p0_8,p1_7) )).

cnf(neq905,axiom,
    ( neq(p0_8,p3_8) )).

cnf(neq906,axiom,
    ( neq(p0_8,p3_12) )).

cnf(neq907,axiom,
    ( neq(p0_8,p4_1) )).

cnf(neq908,axiom,
    ( neq(p0_8,p4_10) )).

cnf(neq909,axiom,
    ( neq(p0_8,p5_9) )).

cnf(neq910,axiom,
    ( neq(p0_8,p7_8) )).

cnf(neq911,axiom,
    ( neq(p0_8,p7_11) )).

cnf(neq912,axiom,
    ( neq(p0_8,p8_4) )).

cnf(neq913,axiom,
    ( neq(p0_8,p8_11) )).

cnf(neq914,axiom,
    ( neq(p0_8,p9_6) )).

cnf(neq915,axiom,
    ( neq(p0_8,p10_0) )).

cnf(neq916,axiom,
    ( neq(p0_8,p11_3) )).

cnf(neq917,axiom,
    ( neq(p0_8,p11_13) )).

cnf(neq918,axiom,
    ( neq(p0_8,p12_7) )).

cnf(neq919,axiom,
    ( neq(p0_8,p12_10) )).

cnf(neq920,axiom,
    ( neq(p0_8,p13_14) )).

cnf(neq921,axiom,
    ( neq(p0_8,p14_0) )).

cnf(neq922,axiom,
    ( neq(p0_8,p14_2) )).

cnf(neq923,axiom,
    ( neq(p0_8,p14_3) )).

cnf(neq924,axiom,
    ( neq(p0_8,p14_6) )).

cnf(neq925,axiom,
    ( neq(p1_2,truck1) )).

cnf(neq926,axiom,
    ( neq(p1_2,truck2) )).

cnf(neq927,axiom,
    ( neq(p1_2,truck3) )).

cnf(neq928,axiom,
    ( neq(p1_2,truck4) )).

cnf(neq929,axiom,
    ( neq(p1_2,truck5) )).

cnf(neq930,axiom,
    ( neq(p1_2,s0) )).

cnf(neq931,axiom,
    ( neq(p1_2,s1) )).

cnf(neq932,axiom,
    ( neq(p1_2,s2) )).

cnf(neq933,axiom,
    ( neq(p1_2,s3) )).

cnf(neq934,axiom,
    ( neq(p1_2,s4) )).

cnf(neq935,axiom,
    ( neq(p1_2,s5) )).

cnf(neq936,axiom,
    ( neq(p1_2,s6) )).

cnf(neq937,axiom,
    ( neq(p1_2,s7) )).

cnf(neq938,axiom,
    ( neq(p1_2,s8) )).

cnf(neq939,axiom,
    ( neq(p1_2,s9) )).

cnf(neq940,axiom,
    ( neq(p1_2,s10) )).

cnf(neq941,axiom,
    ( neq(p1_2,s11) )).

cnf(neq942,axiom,
    ( neq(p1_2,s12) )).

cnf(neq943,axiom,
    ( neq(p1_2,s13) )).

cnf(neq944,axiom,
    ( neq(p1_2,s14) )).

cnf(neq945,axiom,
    ( neq(p1_2,p0_8) )).

cnf(neq946,axiom,
    ( ~ neq(p1_2,p1_2) )).

cnf(neq947,axiom,
    ( neq(p1_2,p1_5) )).

cnf(neq948,axiom,
    ( neq(p1_2,p1_7) )).

cnf(neq949,axiom,
    ( neq(p1_2,p3_8) )).

cnf(neq950,axiom,
    ( neq(p1_2,p3_12) )).

cnf(neq951,axiom,
    ( neq(p1_2,p4_1) )).

cnf(neq952,axiom,
    ( neq(p1_2,p4_10) )).

cnf(neq953,axiom,
    ( neq(p1_2,p5_9) )).

cnf(neq954,axiom,
    ( neq(p1_2,p7_8) )).

cnf(neq955,axiom,
    ( neq(p1_2,p7_11) )).

cnf(neq956,axiom,
    ( neq(p1_2,p8_4) )).

cnf(neq957,axiom,
    ( neq(p1_2,p8_11) )).

cnf(neq958,axiom,
    ( neq(p1_2,p9_6) )).

cnf(neq959,axiom,
    ( neq(p1_2,p10_0) )).

cnf(neq960,axiom,
    ( neq(p1_2,p11_3) )).

cnf(neq961,axiom,
    ( neq(p1_2,p11_13) )).

cnf(neq962,axiom,
    ( neq(p1_2,p12_7) )).

cnf(neq963,axiom,
    ( neq(p1_2,p12_10) )).

cnf(neq964,axiom,
    ( neq(p1_2,p13_14) )).

cnf(neq965,axiom,
    ( neq(p1_2,p14_0) )).

cnf(neq966,axiom,
    ( neq(p1_2,p14_2) )).

cnf(neq967,axiom,
    ( neq(p1_2,p14_3) )).

cnf(neq968,axiom,
    ( neq(p1_2,p14_6) )).

cnf(neq969,axiom,
    ( neq(p1_5,truck1) )).

cnf(neq970,axiom,
    ( neq(p1_5,truck2) )).

cnf(neq971,axiom,
    ( neq(p1_5,truck3) )).

cnf(neq972,axiom,
    ( neq(p1_5,truck4) )).

cnf(neq973,axiom,
    ( neq(p1_5,truck5) )).

cnf(neq974,axiom,
    ( neq(p1_5,s0) )).

cnf(neq975,axiom,
    ( neq(p1_5,s1) )).

cnf(neq976,axiom,
    ( neq(p1_5,s2) )).

cnf(neq977,axiom,
    ( neq(p1_5,s3) )).

cnf(neq978,axiom,
    ( neq(p1_5,s4) )).

cnf(neq979,axiom,
    ( neq(p1_5,s5) )).

cnf(neq980,axiom,
    ( neq(p1_5,s6) )).

cnf(neq981,axiom,
    ( neq(p1_5,s7) )).

cnf(neq982,axiom,
    ( neq(p1_5,s8) )).

cnf(neq983,axiom,
    ( neq(p1_5,s9) )).

cnf(neq984,axiom,
    ( neq(p1_5,s10) )).

cnf(neq985,axiom,
    ( neq(p1_5,s11) )).

cnf(neq986,axiom,
    ( neq(p1_5,s12) )).

cnf(neq987,axiom,
    ( neq(p1_5,s13) )).

cnf(neq988,axiom,
    ( neq(p1_5,s14) )).

cnf(neq989,axiom,
    ( neq(p1_5,p0_8) )).

cnf(neq990,axiom,
    ( neq(p1_5,p1_2) )).

cnf(neq991,axiom,
    ( ~ neq(p1_5,p1_5) )).

cnf(neq992,axiom,
    ( neq(p1_5,p1_7) )).

cnf(neq993,axiom,
    ( neq(p1_5,p3_8) )).

cnf(neq994,axiom,
    ( neq(p1_5,p3_12) )).

cnf(neq995,axiom,
    ( neq(p1_5,p4_1) )).

cnf(neq996,axiom,
    ( neq(p1_5,p4_10) )).

cnf(neq997,axiom,
    ( neq(p1_5,p5_9) )).

cnf(neq998,axiom,
    ( neq(p1_5,p7_8) )).

cnf(neq999,axiom,
    ( neq(p1_5,p7_11) )).

cnf(neq1000,axiom,
    ( neq(p1_5,p8_4) )).

cnf(neq1001,axiom,
    ( neq(p1_5,p8_11) )).

cnf(neq1002,axiom,
    ( neq(p1_5,p9_6) )).

cnf(neq1003,axiom,
    ( neq(p1_5,p10_0) )).

cnf(neq1004,axiom,
    ( neq(p1_5,p11_3) )).

cnf(neq1005,axiom,
    ( neq(p1_5,p11_13) )).

cnf(neq1006,axiom,
    ( neq(p1_5,p12_7) )).

cnf(neq1007,axiom,
    ( neq(p1_5,p12_10) )).

cnf(neq1008,axiom,
    ( neq(p1_5,p13_14) )).

cnf(neq1009,axiom,
    ( neq(p1_5,p14_0) )).

cnf(neq1010,axiom,
    ( neq(p1_5,p14_2) )).

cnf(neq1011,axiom,
    ( neq(p1_5,p14_3) )).

cnf(neq1012,axiom,
    ( neq(p1_5,p14_6) )).

cnf(neq1013,axiom,
    ( neq(p1_7,truck1) )).

cnf(neq1014,axiom,
    ( neq(p1_7,truck2) )).

cnf(neq1015,axiom,
    ( neq(p1_7,truck3) )).

cnf(neq1016,axiom,
    ( neq(p1_7,truck4) )).

cnf(neq1017,axiom,
    ( neq(p1_7,truck5) )).

cnf(neq1018,axiom,
    ( neq(p1_7,s0) )).

cnf(neq1019,axiom,
    ( neq(p1_7,s1) )).

cnf(neq1020,axiom,
    ( neq(p1_7,s2) )).

cnf(neq1021,axiom,
    ( neq(p1_7,s3) )).

cnf(neq1022,axiom,
    ( neq(p1_7,s4) )).

cnf(neq1023,axiom,
    ( neq(p1_7,s5) )).

cnf(neq1024,axiom,
    ( neq(p1_7,s6) )).

cnf(neq1025,axiom,
    ( neq(p1_7,s7) )).

cnf(neq1026,axiom,
    ( neq(p1_7,s8) )).

cnf(neq1027,axiom,
    ( neq(p1_7,s9) )).

cnf(neq1028,axiom,
    ( neq(p1_7,s10) )).

cnf(neq1029,axiom,
    ( neq(p1_7,s11) )).

cnf(neq1030,axiom,
    ( neq(p1_7,s12) )).

cnf(neq1031,axiom,
    ( neq(p1_7,s13) )).

cnf(neq1032,axiom,
    ( neq(p1_7,s14) )).

cnf(neq1033,axiom,
    ( neq(p1_7,p0_8) )).

cnf(neq1034,axiom,
    ( neq(p1_7,p1_2) )).

cnf(neq1035,axiom,
    ( neq(p1_7,p1_5) )).

cnf(neq1036,axiom,
    ( ~ neq(p1_7,p1_7) )).

cnf(neq1037,axiom,
    ( neq(p1_7,p3_8) )).

cnf(neq1038,axiom,
    ( neq(p1_7,p3_12) )).

cnf(neq1039,axiom,
    ( neq(p1_7,p4_1) )).

cnf(neq1040,axiom,
    ( neq(p1_7,p4_10) )).

cnf(neq1041,axiom,
    ( neq(p1_7,p5_9) )).

cnf(neq1042,axiom,
    ( neq(p1_7,p7_8) )).

cnf(neq1043,axiom,
    ( neq(p1_7,p7_11) )).

cnf(neq1044,axiom,
    ( neq(p1_7,p8_4) )).

cnf(neq1045,axiom,
    ( neq(p1_7,p8_11) )).

cnf(neq1046,axiom,
    ( neq(p1_7,p9_6) )).

cnf(neq1047,axiom,
    ( neq(p1_7,p10_0) )).

cnf(neq1048,axiom,
    ( neq(p1_7,p11_3) )).

cnf(neq1049,axiom,
    ( neq(p1_7,p11_13) )).

cnf(neq1050,axiom,
    ( neq(p1_7,p12_7) )).

cnf(neq1051,axiom,
    ( neq(p1_7,p12_10) )).

cnf(neq1052,axiom,
    ( neq(p1_7,p13_14) )).

cnf(neq1053,axiom,
    ( neq(p1_7,p14_0) )).

cnf(neq1054,axiom,
    ( neq(p1_7,p14_2) )).

cnf(neq1055,axiom,
    ( neq(p1_7,p14_3) )).

cnf(neq1056,axiom,
    ( neq(p1_7,p14_6) )).

cnf(neq1057,axiom,
    ( neq(p3_8,truck1) )).

cnf(neq1058,axiom,
    ( neq(p3_8,truck2) )).

cnf(neq1059,axiom,
    ( neq(p3_8,truck3) )).

cnf(neq1060,axiom,
    ( neq(p3_8,truck4) )).

cnf(neq1061,axiom,
    ( neq(p3_8,truck5) )).

cnf(neq1062,axiom,
    ( neq(p3_8,s0) )).

cnf(neq1063,axiom,
    ( neq(p3_8,s1) )).

cnf(neq1064,axiom,
    ( neq(p3_8,s2) )).

cnf(neq1065,axiom,
    ( neq(p3_8,s3) )).

cnf(neq1066,axiom,
    ( neq(p3_8,s4) )).

cnf(neq1067,axiom,
    ( neq(p3_8,s5) )).

cnf(neq1068,axiom,
    ( neq(p3_8,s6) )).

cnf(neq1069,axiom,
    ( neq(p3_8,s7) )).

cnf(neq1070,axiom,
    ( neq(p3_8,s8) )).

cnf(neq1071,axiom,
    ( neq(p3_8,s9) )).

cnf(neq1072,axiom,
    ( neq(p3_8,s10) )).

cnf(neq1073,axiom,
    ( neq(p3_8,s11) )).

cnf(neq1074,axiom,
    ( neq(p3_8,s12) )).

cnf(neq1075,axiom,
    ( neq(p3_8,s13) )).

cnf(neq1076,axiom,
    ( neq(p3_8,s14) )).

cnf(neq1077,axiom,
    ( neq(p3_8,p0_8) )).

cnf(neq1078,axiom,
    ( neq(p3_8,p1_2) )).

cnf(neq1079,axiom,
    ( neq(p3_8,p1_5) )).

cnf(neq1080,axiom,
    ( neq(p3_8,p1_7) )).

cnf(neq1081,axiom,
    ( ~ neq(p3_8,p3_8) )).

cnf(neq1082,axiom,
    ( neq(p3_8,p3_12) )).

cnf(neq1083,axiom,
    ( neq(p3_8,p4_1) )).

cnf(neq1084,axiom,
    ( neq(p3_8,p4_10) )).

cnf(neq1085,axiom,
    ( neq(p3_8,p5_9) )).

cnf(neq1086,axiom,
    ( neq(p3_8,p7_8) )).

cnf(neq1087,axiom,
    ( neq(p3_8,p7_11) )).

cnf(neq1088,axiom,
    ( neq(p3_8,p8_4) )).

cnf(neq1089,axiom,
    ( neq(p3_8,p8_11) )).

cnf(neq1090,axiom,
    ( neq(p3_8,p9_6) )).

cnf(neq1091,axiom,
    ( neq(p3_8,p10_0) )).

cnf(neq1092,axiom,
    ( neq(p3_8,p11_3) )).

cnf(neq1093,axiom,
    ( neq(p3_8,p11_13) )).

cnf(neq1094,axiom,
    ( neq(p3_8,p12_7) )).

cnf(neq1095,axiom,
    ( neq(p3_8,p12_10) )).

cnf(neq1096,axiom,
    ( neq(p3_8,p13_14) )).

cnf(neq1097,axiom,
    ( neq(p3_8,p14_0) )).

cnf(neq1098,axiom,
    ( neq(p3_8,p14_2) )).

cnf(neq1099,axiom,
    ( neq(p3_8,p14_3) )).

cnf(neq1100,axiom,
    ( neq(p3_8,p14_6) )).

cnf(neq1101,axiom,
    ( neq(p3_12,truck1) )).

cnf(neq1102,axiom,
    ( neq(p3_12,truck2) )).

cnf(neq1103,axiom,
    ( neq(p3_12,truck3) )).

cnf(neq1104,axiom,
    ( neq(p3_12,truck4) )).

cnf(neq1105,axiom,
    ( neq(p3_12,truck5) )).

cnf(neq1106,axiom,
    ( neq(p3_12,s0) )).

cnf(neq1107,axiom,
    ( neq(p3_12,s1) )).

cnf(neq1108,axiom,
    ( neq(p3_12,s2) )).

cnf(neq1109,axiom,
    ( neq(p3_12,s3) )).

cnf(neq1110,axiom,
    ( neq(p3_12,s4) )).

cnf(neq1111,axiom,
    ( neq(p3_12,s5) )).

cnf(neq1112,axiom,
    ( neq(p3_12,s6) )).

cnf(neq1113,axiom,
    ( neq(p3_12,s7) )).

cnf(neq1114,axiom,
    ( neq(p3_12,s8) )).

cnf(neq1115,axiom,
    ( neq(p3_12,s9) )).

cnf(neq1116,axiom,
    ( neq(p3_12,s10) )).

cnf(neq1117,axiom,
    ( neq(p3_12,s11) )).

cnf(neq1118,axiom,
    ( neq(p3_12,s12) )).

cnf(neq1119,axiom,
    ( neq(p3_12,s13) )).

cnf(neq1120,axiom,
    ( neq(p3_12,s14) )).

cnf(neq1121,axiom,
    ( neq(p3_12,p0_8) )).

cnf(neq1122,axiom,
    ( neq(p3_12,p1_2) )).

cnf(neq1123,axiom,
    ( neq(p3_12,p1_5) )).

cnf(neq1124,axiom,
    ( neq(p3_12,p1_7) )).

cnf(neq1125,axiom,
    ( neq(p3_12,p3_8) )).

cnf(neq1126,axiom,
    ( ~ neq(p3_12,p3_12) )).

cnf(neq1127,axiom,
    ( neq(p3_12,p4_1) )).

cnf(neq1128,axiom,
    ( neq(p3_12,p4_10) )).

cnf(neq1129,axiom,
    ( neq(p3_12,p5_9) )).

cnf(neq1130,axiom,
    ( neq(p3_12,p7_8) )).

cnf(neq1131,axiom,
    ( neq(p3_12,p7_11) )).

cnf(neq1132,axiom,
    ( neq(p3_12,p8_4) )).

cnf(neq1133,axiom,
    ( neq(p3_12,p8_11) )).

cnf(neq1134,axiom,
    ( neq(p3_12,p9_6) )).

cnf(neq1135,axiom,
    ( neq(p3_12,p10_0) )).

cnf(neq1136,axiom,
    ( neq(p3_12,p11_3) )).

cnf(neq1137,axiom,
    ( neq(p3_12,p11_13) )).

cnf(neq1138,axiom,
    ( neq(p3_12,p12_7) )).

cnf(neq1139,axiom,
    ( neq(p3_12,p12_10) )).

cnf(neq1140,axiom,
    ( neq(p3_12,p13_14) )).

cnf(neq1141,axiom,
    ( neq(p3_12,p14_0) )).

cnf(neq1142,axiom,
    ( neq(p3_12,p14_2) )).

cnf(neq1143,axiom,
    ( neq(p3_12,p14_3) )).

cnf(neq1144,axiom,
    ( neq(p3_12,p14_6) )).

cnf(neq1145,axiom,
    ( neq(p4_1,truck1) )).

cnf(neq1146,axiom,
    ( neq(p4_1,truck2) )).

cnf(neq1147,axiom,
    ( neq(p4_1,truck3) )).

cnf(neq1148,axiom,
    ( neq(p4_1,truck4) )).

cnf(neq1149,axiom,
    ( neq(p4_1,truck5) )).

cnf(neq1150,axiom,
    ( neq(p4_1,s0) )).

cnf(neq1151,axiom,
    ( neq(p4_1,s1) )).

cnf(neq1152,axiom,
    ( neq(p4_1,s2) )).

cnf(neq1153,axiom,
    ( neq(p4_1,s3) )).

cnf(neq1154,axiom,
    ( neq(p4_1,s4) )).

cnf(neq1155,axiom,
    ( neq(p4_1,s5) )).

cnf(neq1156,axiom,
    ( neq(p4_1,s6) )).

cnf(neq1157,axiom,
    ( neq(p4_1,s7) )).

cnf(neq1158,axiom,
    ( neq(p4_1,s8) )).

cnf(neq1159,axiom,
    ( neq(p4_1,s9) )).

cnf(neq1160,axiom,
    ( neq(p4_1,s10) )).

cnf(neq1161,axiom,
    ( neq(p4_1,s11) )).

cnf(neq1162,axiom,
    ( neq(p4_1,s12) )).

cnf(neq1163,axiom,
    ( neq(p4_1,s13) )).

cnf(neq1164,axiom,
    ( neq(p4_1,s14) )).

cnf(neq1165,axiom,
    ( neq(p4_1,p0_8) )).

cnf(neq1166,axiom,
    ( neq(p4_1,p1_2) )).

cnf(neq1167,axiom,
    ( neq(p4_1,p1_5) )).

cnf(neq1168,axiom,
    ( neq(p4_1,p1_7) )).

cnf(neq1169,axiom,
    ( neq(p4_1,p3_8) )).

cnf(neq1170,axiom,
    ( neq(p4_1,p3_12) )).

cnf(neq1171,axiom,
    ( ~ neq(p4_1,p4_1) )).

cnf(neq1172,axiom,
    ( neq(p4_1,p4_10) )).

cnf(neq1173,axiom,
    ( neq(p4_1,p5_9) )).

cnf(neq1174,axiom,
    ( neq(p4_1,p7_8) )).

cnf(neq1175,axiom,
    ( neq(p4_1,p7_11) )).

cnf(neq1176,axiom,
    ( neq(p4_1,p8_4) )).

cnf(neq1177,axiom,
    ( neq(p4_1,p8_11) )).

cnf(neq1178,axiom,
    ( neq(p4_1,p9_6) )).

cnf(neq1179,axiom,
    ( neq(p4_1,p10_0) )).

cnf(neq1180,axiom,
    ( neq(p4_1,p11_3) )).

cnf(neq1181,axiom,
    ( neq(p4_1,p11_13) )).

cnf(neq1182,axiom,
    ( neq(p4_1,p12_7) )).

cnf(neq1183,axiom,
    ( neq(p4_1,p12_10) )).

cnf(neq1184,axiom,
    ( neq(p4_1,p13_14) )).

cnf(neq1185,axiom,
    ( neq(p4_1,p14_0) )).

cnf(neq1186,axiom,
    ( neq(p4_1,p14_2) )).

cnf(neq1187,axiom,
    ( neq(p4_1,p14_3) )).

cnf(neq1188,axiom,
    ( neq(p4_1,p14_6) )).

cnf(neq1189,axiom,
    ( neq(p4_10,truck1) )).

cnf(neq1190,axiom,
    ( neq(p4_10,truck2) )).

cnf(neq1191,axiom,
    ( neq(p4_10,truck3) )).

cnf(neq1192,axiom,
    ( neq(p4_10,truck4) )).

cnf(neq1193,axiom,
    ( neq(p4_10,truck5) )).

cnf(neq1194,axiom,
    ( neq(p4_10,s0) )).

cnf(neq1195,axiom,
    ( neq(p4_10,s1) )).

cnf(neq1196,axiom,
    ( neq(p4_10,s2) )).

cnf(neq1197,axiom,
    ( neq(p4_10,s3) )).

cnf(neq1198,axiom,
    ( neq(p4_10,s4) )).

cnf(neq1199,axiom,
    ( neq(p4_10,s5) )).

cnf(neq1200,axiom,
    ( neq(p4_10,s6) )).

cnf(neq1201,axiom,
    ( neq(p4_10,s7) )).

cnf(neq1202,axiom,
    ( neq(p4_10,s8) )).

cnf(neq1203,axiom,
    ( neq(p4_10,s9) )).

cnf(neq1204,axiom,
    ( neq(p4_10,s10) )).

cnf(neq1205,axiom,
    ( neq(p4_10,s11) )).

cnf(neq1206,axiom,
    ( neq(p4_10,s12) )).

cnf(neq1207,axiom,
    ( neq(p4_10,s13) )).

cnf(neq1208,axiom,
    ( neq(p4_10,s14) )).

cnf(neq1209,axiom,
    ( neq(p4_10,p0_8) )).

cnf(neq1210,axiom,
    ( neq(p4_10,p1_2) )).

cnf(neq1211,axiom,
    ( neq(p4_10,p1_5) )).

cnf(neq1212,axiom,
    ( neq(p4_10,p1_7) )).

cnf(neq1213,axiom,
    ( neq(p4_10,p3_8) )).

cnf(neq1214,axiom,
    ( neq(p4_10,p3_12) )).

cnf(neq1215,axiom,
    ( neq(p4_10,p4_1) )).

cnf(neq1216,axiom,
    ( ~ neq(p4_10,p4_10) )).

cnf(neq1217,axiom,
    ( neq(p4_10,p5_9) )).

cnf(neq1218,axiom,
    ( neq(p4_10,p7_8) )).

cnf(neq1219,axiom,
    ( neq(p4_10,p7_11) )).

cnf(neq1220,axiom,
    ( neq(p4_10,p8_4) )).

cnf(neq1221,axiom,
    ( neq(p4_10,p8_11) )).

cnf(neq1222,axiom,
    ( neq(p4_10,p9_6) )).

cnf(neq1223,axiom,
    ( neq(p4_10,p10_0) )).

cnf(neq1224,axiom,
    ( neq(p4_10,p11_3) )).

cnf(neq1225,axiom,
    ( neq(p4_10,p11_13) )).

cnf(neq1226,axiom,
    ( neq(p4_10,p12_7) )).

cnf(neq1227,axiom,
    ( neq(p4_10,p12_10) )).

cnf(neq1228,axiom,
    ( neq(p4_10,p13_14) )).

cnf(neq1229,axiom,
    ( neq(p4_10,p14_0) )).

cnf(neq1230,axiom,
    ( neq(p4_10,p14_2) )).

cnf(neq1231,axiom,
    ( neq(p4_10,p14_3) )).

cnf(neq1232,axiom,
    ( neq(p4_10,p14_6) )).

cnf(neq1233,axiom,
    ( neq(p5_9,truck1) )).

cnf(neq1234,axiom,
    ( neq(p5_9,truck2) )).

cnf(neq1235,axiom,
    ( neq(p5_9,truck3) )).

cnf(neq1236,axiom,
    ( neq(p5_9,truck4) )).

cnf(neq1237,axiom,
    ( neq(p5_9,truck5) )).

cnf(neq1238,axiom,
    ( neq(p5_9,s0) )).

cnf(neq1239,axiom,
    ( neq(p5_9,s1) )).

cnf(neq1240,axiom,
    ( neq(p5_9,s2) )).

cnf(neq1241,axiom,
    ( neq(p5_9,s3) )).

cnf(neq1242,axiom,
    ( neq(p5_9,s4) )).

cnf(neq1243,axiom,
    ( neq(p5_9,s5) )).

cnf(neq1244,axiom,
    ( neq(p5_9,s6) )).

cnf(neq1245,axiom,
    ( neq(p5_9,s7) )).

cnf(neq1246,axiom,
    ( neq(p5_9,s8) )).

cnf(neq1247,axiom,
    ( neq(p5_9,s9) )).

cnf(neq1248,axiom,
    ( neq(p5_9,s10) )).

cnf(neq1249,axiom,
    ( neq(p5_9,s11) )).

cnf(neq1250,axiom,
    ( neq(p5_9,s12) )).

cnf(neq1251,axiom,
    ( neq(p5_9,s13) )).

cnf(neq1252,axiom,
    ( neq(p5_9,s14) )).

cnf(neq1253,axiom,
    ( neq(p5_9,p0_8) )).

cnf(neq1254,axiom,
    ( neq(p5_9,p1_2) )).

cnf(neq1255,axiom,
    ( neq(p5_9,p1_5) )).

cnf(neq1256,axiom,
    ( neq(p5_9,p1_7) )).

cnf(neq1257,axiom,
    ( neq(p5_9,p3_8) )).

cnf(neq1258,axiom,
    ( neq(p5_9,p3_12) )).

cnf(neq1259,axiom,
    ( neq(p5_9,p4_1) )).

cnf(neq1260,axiom,
    ( neq(p5_9,p4_10) )).

cnf(neq1261,axiom,
    ( ~ neq(p5_9,p5_9) )).

cnf(neq1262,axiom,
    ( neq(p5_9,p7_8) )).

cnf(neq1263,axiom,
    ( neq(p5_9,p7_11) )).

cnf(neq1264,axiom,
    ( neq(p5_9,p8_4) )).

cnf(neq1265,axiom,
    ( neq(p5_9,p8_11) )).

cnf(neq1266,axiom,
    ( neq(p5_9,p9_6) )).

cnf(neq1267,axiom,
    ( neq(p5_9,p10_0) )).

cnf(neq1268,axiom,
    ( neq(p5_9,p11_3) )).

cnf(neq1269,axiom,
    ( neq(p5_9,p11_13) )).

cnf(neq1270,axiom,
    ( neq(p5_9,p12_7) )).

cnf(neq1271,axiom,
    ( neq(p5_9,p12_10) )).

cnf(neq1272,axiom,
    ( neq(p5_9,p13_14) )).

cnf(neq1273,axiom,
    ( neq(p5_9,p14_0) )).

cnf(neq1274,axiom,
    ( neq(p5_9,p14_2) )).

cnf(neq1275,axiom,
    ( neq(p5_9,p14_3) )).

cnf(neq1276,axiom,
    ( neq(p5_9,p14_6) )).

cnf(neq1277,axiom,
    ( neq(p7_8,truck1) )).

cnf(neq1278,axiom,
    ( neq(p7_8,truck2) )).

cnf(neq1279,axiom,
    ( neq(p7_8,truck3) )).

cnf(neq1280,axiom,
    ( neq(p7_8,truck4) )).

cnf(neq1281,axiom,
    ( neq(p7_8,truck5) )).

cnf(neq1282,axiom,
    ( neq(p7_8,s0) )).

cnf(neq1283,axiom,
    ( neq(p7_8,s1) )).

cnf(neq1284,axiom,
    ( neq(p7_8,s2) )).

cnf(neq1285,axiom,
    ( neq(p7_8,s3) )).

cnf(neq1286,axiom,
    ( neq(p7_8,s4) )).

cnf(neq1287,axiom,
    ( neq(p7_8,s5) )).

cnf(neq1288,axiom,
    ( neq(p7_8,s6) )).

cnf(neq1289,axiom,
    ( neq(p7_8,s7) )).

cnf(neq1290,axiom,
    ( neq(p7_8,s8) )).

cnf(neq1291,axiom,
    ( neq(p7_8,s9) )).

cnf(neq1292,axiom,
    ( neq(p7_8,s10) )).

cnf(neq1293,axiom,
    ( neq(p7_8,s11) )).

cnf(neq1294,axiom,
    ( neq(p7_8,s12) )).

cnf(neq1295,axiom,
    ( neq(p7_8,s13) )).

cnf(neq1296,axiom,
    ( neq(p7_8,s14) )).

cnf(neq1297,axiom,
    ( neq(p7_8,p0_8) )).

cnf(neq1298,axiom,
    ( neq(p7_8,p1_2) )).

cnf(neq1299,axiom,
    ( neq(p7_8,p1_5) )).

cnf(neq1300,axiom,
    ( neq(p7_8,p1_7) )).

cnf(neq1301,axiom,
    ( neq(p7_8,p3_8) )).

cnf(neq1302,axiom,
    ( neq(p7_8,p3_12) )).

cnf(neq1303,axiom,
    ( neq(p7_8,p4_1) )).

cnf(neq1304,axiom,
    ( neq(p7_8,p4_10) )).

cnf(neq1305,axiom,
    ( neq(p7_8,p5_9) )).

cnf(neq1306,axiom,
    ( ~ neq(p7_8,p7_8) )).

cnf(neq1307,axiom,
    ( neq(p7_8,p7_11) )).

cnf(neq1308,axiom,
    ( neq(p7_8,p8_4) )).

cnf(neq1309,axiom,
    ( neq(p7_8,p8_11) )).

cnf(neq1310,axiom,
    ( neq(p7_8,p9_6) )).

cnf(neq1311,axiom,
    ( neq(p7_8,p10_0) )).

cnf(neq1312,axiom,
    ( neq(p7_8,p11_3) )).

cnf(neq1313,axiom,
    ( neq(p7_8,p11_13) )).

cnf(neq1314,axiom,
    ( neq(p7_8,p12_7) )).

cnf(neq1315,axiom,
    ( neq(p7_8,p12_10) )).

cnf(neq1316,axiom,
    ( neq(p7_8,p13_14) )).

cnf(neq1317,axiom,
    ( neq(p7_8,p14_0) )).

cnf(neq1318,axiom,
    ( neq(p7_8,p14_2) )).

cnf(neq1319,axiom,
    ( neq(p7_8,p14_3) )).

cnf(neq1320,axiom,
    ( neq(p7_8,p14_6) )).

cnf(neq1321,axiom,
    ( neq(p7_11,truck1) )).

cnf(neq1322,axiom,
    ( neq(p7_11,truck2) )).

cnf(neq1323,axiom,
    ( neq(p7_11,truck3) )).

cnf(neq1324,axiom,
    ( neq(p7_11,truck4) )).

cnf(neq1325,axiom,
    ( neq(p7_11,truck5) )).

cnf(neq1326,axiom,
    ( neq(p7_11,s0) )).

cnf(neq1327,axiom,
    ( neq(p7_11,s1) )).

cnf(neq1328,axiom,
    ( neq(p7_11,s2) )).

cnf(neq1329,axiom,
    ( neq(p7_11,s3) )).

cnf(neq1330,axiom,
    ( neq(p7_11,s4) )).

cnf(neq1331,axiom,
    ( neq(p7_11,s5) )).

cnf(neq1332,axiom,
    ( neq(p7_11,s6) )).

cnf(neq1333,axiom,
    ( neq(p7_11,s7) )).

cnf(neq1334,axiom,
    ( neq(p7_11,s8) )).

cnf(neq1335,axiom,
    ( neq(p7_11,s9) )).

cnf(neq1336,axiom,
    ( neq(p7_11,s10) )).

cnf(neq1337,axiom,
    ( neq(p7_11,s11) )).

cnf(neq1338,axiom,
    ( neq(p7_11,s12) )).

cnf(neq1339,axiom,
    ( neq(p7_11,s13) )).

cnf(neq1340,axiom,
    ( neq(p7_11,s14) )).

cnf(neq1341,axiom,
    ( neq(p7_11,p0_8) )).

cnf(neq1342,axiom,
    ( neq(p7_11,p1_2) )).

cnf(neq1343,axiom,
    ( neq(p7_11,p1_5) )).

cnf(neq1344,axiom,
    ( neq(p7_11,p1_7) )).

cnf(neq1345,axiom,
    ( neq(p7_11,p3_8) )).

cnf(neq1346,axiom,
    ( neq(p7_11,p3_12) )).

cnf(neq1347,axiom,
    ( neq(p7_11,p4_1) )).

cnf(neq1348,axiom,
    ( neq(p7_11,p4_10) )).

cnf(neq1349,axiom,
    ( neq(p7_11,p5_9) )).

cnf(neq1350,axiom,
    ( neq(p7_11,p7_8) )).

cnf(neq1351,axiom,
    ( ~ neq(p7_11,p7_11) )).

cnf(neq1352,axiom,
    ( neq(p7_11,p8_4) )).

cnf(neq1353,axiom,
    ( neq(p7_11,p8_11) )).

cnf(neq1354,axiom,
    ( neq(p7_11,p9_6) )).

cnf(neq1355,axiom,
    ( neq(p7_11,p10_0) )).

cnf(neq1356,axiom,
    ( neq(p7_11,p11_3) )).

cnf(neq1357,axiom,
    ( neq(p7_11,p11_13) )).

cnf(neq1358,axiom,
    ( neq(p7_11,p12_7) )).

cnf(neq1359,axiom,
    ( neq(p7_11,p12_10) )).

cnf(neq1360,axiom,
    ( neq(p7_11,p13_14) )).

cnf(neq1361,axiom,
    ( neq(p7_11,p14_0) )).

cnf(neq1362,axiom,
    ( neq(p7_11,p14_2) )).

cnf(neq1363,axiom,
    ( neq(p7_11,p14_3) )).

cnf(neq1364,axiom,
    ( neq(p7_11,p14_6) )).

cnf(neq1365,axiom,
    ( neq(p8_4,truck1) )).

cnf(neq1366,axiom,
    ( neq(p8_4,truck2) )).

cnf(neq1367,axiom,
    ( neq(p8_4,truck3) )).

cnf(neq1368,axiom,
    ( neq(p8_4,truck4) )).

cnf(neq1369,axiom,
    ( neq(p8_4,truck5) )).

cnf(neq1370,axiom,
    ( neq(p8_4,s0) )).

cnf(neq1371,axiom,
    ( neq(p8_4,s1) )).

cnf(neq1372,axiom,
    ( neq(p8_4,s2) )).

cnf(neq1373,axiom,
    ( neq(p8_4,s3) )).

cnf(neq1374,axiom,
    ( neq(p8_4,s4) )).

cnf(neq1375,axiom,
    ( neq(p8_4,s5) )).

cnf(neq1376,axiom,
    ( neq(p8_4,s6) )).

cnf(neq1377,axiom,
    ( neq(p8_4,s7) )).

cnf(neq1378,axiom,
    ( neq(p8_4,s8) )).

cnf(neq1379,axiom,
    ( neq(p8_4,s9) )).

cnf(neq1380,axiom,
    ( neq(p8_4,s10) )).

cnf(neq1381,axiom,
    ( neq(p8_4,s11) )).

cnf(neq1382,axiom,
    ( neq(p8_4,s12) )).

cnf(neq1383,axiom,
    ( neq(p8_4,s13) )).

cnf(neq1384,axiom,
    ( neq(p8_4,s14) )).

cnf(neq1385,axiom,
    ( neq(p8_4,p0_8) )).

cnf(neq1386,axiom,
    ( neq(p8_4,p1_2) )).

cnf(neq1387,axiom,
    ( neq(p8_4,p1_5) )).

cnf(neq1388,axiom,
    ( neq(p8_4,p1_7) )).

cnf(neq1389,axiom,
    ( neq(p8_4,p3_8) )).

cnf(neq1390,axiom,
    ( neq(p8_4,p3_12) )).

cnf(neq1391,axiom,
    ( neq(p8_4,p4_1) )).

cnf(neq1392,axiom,
    ( neq(p8_4,p4_10) )).

cnf(neq1393,axiom,
    ( neq(p8_4,p5_9) )).

cnf(neq1394,axiom,
    ( neq(p8_4,p7_8) )).

cnf(neq1395,axiom,
    ( neq(p8_4,p7_11) )).

cnf(neq1396,axiom,
    ( ~ neq(p8_4,p8_4) )).

cnf(neq1397,axiom,
    ( neq(p8_4,p8_11) )).

cnf(neq1398,axiom,
    ( neq(p8_4,p9_6) )).

cnf(neq1399,axiom,
    ( neq(p8_4,p10_0) )).

cnf(neq1400,axiom,
    ( neq(p8_4,p11_3) )).

cnf(neq1401,axiom,
    ( neq(p8_4,p11_13) )).

cnf(neq1402,axiom,
    ( neq(p8_4,p12_7) )).

cnf(neq1403,axiom,
    ( neq(p8_4,p12_10) )).

cnf(neq1404,axiom,
    ( neq(p8_4,p13_14) )).

cnf(neq1405,axiom,
    ( neq(p8_4,p14_0) )).

cnf(neq1406,axiom,
    ( neq(p8_4,p14_2) )).

cnf(neq1407,axiom,
    ( neq(p8_4,p14_3) )).

cnf(neq1408,axiom,
    ( neq(p8_4,p14_6) )).

cnf(neq1409,axiom,
    ( neq(p8_11,truck1) )).

cnf(neq1410,axiom,
    ( neq(p8_11,truck2) )).

cnf(neq1411,axiom,
    ( neq(p8_11,truck3) )).

cnf(neq1412,axiom,
    ( neq(p8_11,truck4) )).

cnf(neq1413,axiom,
    ( neq(p8_11,truck5) )).

cnf(neq1414,axiom,
    ( neq(p8_11,s0) )).

cnf(neq1415,axiom,
    ( neq(p8_11,s1) )).

cnf(neq1416,axiom,
    ( neq(p8_11,s2) )).

cnf(neq1417,axiom,
    ( neq(p8_11,s3) )).

cnf(neq1418,axiom,
    ( neq(p8_11,s4) )).

cnf(neq1419,axiom,
    ( neq(p8_11,s5) )).

cnf(neq1420,axiom,
    ( neq(p8_11,s6) )).

cnf(neq1421,axiom,
    ( neq(p8_11,s7) )).

cnf(neq1422,axiom,
    ( neq(p8_11,s8) )).

cnf(neq1423,axiom,
    ( neq(p8_11,s9) )).

cnf(neq1424,axiom,
    ( neq(p8_11,s10) )).

cnf(neq1425,axiom,
    ( neq(p8_11,s11) )).

cnf(neq1426,axiom,
    ( neq(p8_11,s12) )).

cnf(neq1427,axiom,
    ( neq(p8_11,s13) )).

cnf(neq1428,axiom,
    ( neq(p8_11,s14) )).

cnf(neq1429,axiom,
    ( neq(p8_11,p0_8) )).

cnf(neq1430,axiom,
    ( neq(p8_11,p1_2) )).

cnf(neq1431,axiom,
    ( neq(p8_11,p1_5) )).

cnf(neq1432,axiom,
    ( neq(p8_11,p1_7) )).

cnf(neq1433,axiom,
    ( neq(p8_11,p3_8) )).

cnf(neq1434,axiom,
    ( neq(p8_11,p3_12) )).

cnf(neq1435,axiom,
    ( neq(p8_11,p4_1) )).

cnf(neq1436,axiom,
    ( neq(p8_11,p4_10) )).

cnf(neq1437,axiom,
    ( neq(p8_11,p5_9) )).

cnf(neq1438,axiom,
    ( neq(p8_11,p7_8) )).

cnf(neq1439,axiom,
    ( neq(p8_11,p7_11) )).

cnf(neq1440,axiom,
    ( neq(p8_11,p8_4) )).

cnf(neq1441,axiom,
    ( ~ neq(p8_11,p8_11) )).

cnf(neq1442,axiom,
    ( neq(p8_11,p9_6) )).

cnf(neq1443,axiom,
    ( neq(p8_11,p10_0) )).

cnf(neq1444,axiom,
    ( neq(p8_11,p11_3) )).

cnf(neq1445,axiom,
    ( neq(p8_11,p11_13) )).

cnf(neq1446,axiom,
    ( neq(p8_11,p12_7) )).

cnf(neq1447,axiom,
    ( neq(p8_11,p12_10) )).

cnf(neq1448,axiom,
    ( neq(p8_11,p13_14) )).

cnf(neq1449,axiom,
    ( neq(p8_11,p14_0) )).

cnf(neq1450,axiom,
    ( neq(p8_11,p14_2) )).

cnf(neq1451,axiom,
    ( neq(p8_11,p14_3) )).

cnf(neq1452,axiom,
    ( neq(p8_11,p14_6) )).

cnf(neq1453,axiom,
    ( neq(p9_6,truck1) )).

cnf(neq1454,axiom,
    ( neq(p9_6,truck2) )).

cnf(neq1455,axiom,
    ( neq(p9_6,truck3) )).

cnf(neq1456,axiom,
    ( neq(p9_6,truck4) )).

cnf(neq1457,axiom,
    ( neq(p9_6,truck5) )).

cnf(neq1458,axiom,
    ( neq(p9_6,s0) )).

cnf(neq1459,axiom,
    ( neq(p9_6,s1) )).

cnf(neq1460,axiom,
    ( neq(p9_6,s2) )).

cnf(neq1461,axiom,
    ( neq(p9_6,s3) )).

cnf(neq1462,axiom,
    ( neq(p9_6,s4) )).

cnf(neq1463,axiom,
    ( neq(p9_6,s5) )).

cnf(neq1464,axiom,
    ( neq(p9_6,s6) )).

cnf(neq1465,axiom,
    ( neq(p9_6,s7) )).

cnf(neq1466,axiom,
    ( neq(p9_6,s8) )).

cnf(neq1467,axiom,
    ( neq(p9_6,s9) )).

cnf(neq1468,axiom,
    ( neq(p9_6,s10) )).

cnf(neq1469,axiom,
    ( neq(p9_6,s11) )).

cnf(neq1470,axiom,
    ( neq(p9_6,s12) )).

cnf(neq1471,axiom,
    ( neq(p9_6,s13) )).

cnf(neq1472,axiom,
    ( neq(p9_6,s14) )).

cnf(neq1473,axiom,
    ( neq(p9_6,p0_8) )).

cnf(neq1474,axiom,
    ( neq(p9_6,p1_2) )).

cnf(neq1475,axiom,
    ( neq(p9_6,p1_5) )).

cnf(neq1476,axiom,
    ( neq(p9_6,p1_7) )).

cnf(neq1477,axiom,
    ( neq(p9_6,p3_8) )).

cnf(neq1478,axiom,
    ( neq(p9_6,p3_12) )).

cnf(neq1479,axiom,
    ( neq(p9_6,p4_1) )).

cnf(neq1480,axiom,
    ( neq(p9_6,p4_10) )).

cnf(neq1481,axiom,
    ( neq(p9_6,p5_9) )).

cnf(neq1482,axiom,
    ( neq(p9_6,p7_8) )).

cnf(neq1483,axiom,
    ( neq(p9_6,p7_11) )).

cnf(neq1484,axiom,
    ( neq(p9_6,p8_4) )).

cnf(neq1485,axiom,
    ( neq(p9_6,p8_11) )).

cnf(neq1486,axiom,
    ( ~ neq(p9_6,p9_6) )).

cnf(neq1487,axiom,
    ( neq(p9_6,p10_0) )).

cnf(neq1488,axiom,
    ( neq(p9_6,p11_3) )).

cnf(neq1489,axiom,
    ( neq(p9_6,p11_13) )).

cnf(neq1490,axiom,
    ( neq(p9_6,p12_7) )).

cnf(neq1491,axiom,
    ( neq(p9_6,p12_10) )).

cnf(neq1492,axiom,
    ( neq(p9_6,p13_14) )).

cnf(neq1493,axiom,
    ( neq(p9_6,p14_0) )).

cnf(neq1494,axiom,
    ( neq(p9_6,p14_2) )).

cnf(neq1495,axiom,
    ( neq(p9_6,p14_3) )).

cnf(neq1496,axiom,
    ( neq(p9_6,p14_6) )).

cnf(neq1497,axiom,
    ( neq(p10_0,truck1) )).

cnf(neq1498,axiom,
    ( neq(p10_0,truck2) )).

cnf(neq1499,axiom,
    ( neq(p10_0,truck3) )).

cnf(neq1500,axiom,
    ( neq(p10_0,truck4) )).

cnf(neq1501,axiom,
    ( neq(p10_0,truck5) )).

cnf(neq1502,axiom,
    ( neq(p10_0,s0) )).

cnf(neq1503,axiom,
    ( neq(p10_0,s1) )).

cnf(neq1504,axiom,
    ( neq(p10_0,s2) )).

cnf(neq1505,axiom,
    ( neq(p10_0,s3) )).

cnf(neq1506,axiom,
    ( neq(p10_0,s4) )).

cnf(neq1507,axiom,
    ( neq(p10_0,s5) )).

cnf(neq1508,axiom,
    ( neq(p10_0,s6) )).

cnf(neq1509,axiom,
    ( neq(p10_0,s7) )).

cnf(neq1510,axiom,
    ( neq(p10_0,s8) )).

cnf(neq1511,axiom,
    ( neq(p10_0,s9) )).

cnf(neq1512,axiom,
    ( neq(p10_0,s10) )).

cnf(neq1513,axiom,
    ( neq(p10_0,s11) )).

cnf(neq1514,axiom,
    ( neq(p10_0,s12) )).

cnf(neq1515,axiom,
    ( neq(p10_0,s13) )).

cnf(neq1516,axiom,
    ( neq(p10_0,s14) )).

cnf(neq1517,axiom,
    ( neq(p10_0,p0_8) )).

cnf(neq1518,axiom,
    ( neq(p10_0,p1_2) )).

cnf(neq1519,axiom,
    ( neq(p10_0,p1_5) )).

cnf(neq1520,axiom,
    ( neq(p10_0,p1_7) )).

cnf(neq1521,axiom,
    ( neq(p10_0,p3_8) )).

cnf(neq1522,axiom,
    ( neq(p10_0,p3_12) )).

cnf(neq1523,axiom,
    ( neq(p10_0,p4_1) )).

cnf(neq1524,axiom,
    ( neq(p10_0,p4_10) )).

cnf(neq1525,axiom,
    ( neq(p10_0,p5_9) )).

cnf(neq1526,axiom,
    ( neq(p10_0,p7_8) )).

cnf(neq1527,axiom,
    ( neq(p10_0,p7_11) )).

cnf(neq1528,axiom,
    ( neq(p10_0,p8_4) )).

cnf(neq1529,axiom,
    ( neq(p10_0,p8_11) )).

cnf(neq1530,axiom,
    ( neq(p10_0,p9_6) )).

cnf(neq1531,axiom,
    ( ~ neq(p10_0,p10_0) )).

cnf(neq1532,axiom,
    ( neq(p10_0,p11_3) )).

cnf(neq1533,axiom,
    ( neq(p10_0,p11_13) )).

cnf(neq1534,axiom,
    ( neq(p10_0,p12_7) )).

cnf(neq1535,axiom,
    ( neq(p10_0,p12_10) )).

cnf(neq1536,axiom,
    ( neq(p10_0,p13_14) )).

cnf(neq1537,axiom,
    ( neq(p10_0,p14_0) )).

cnf(neq1538,axiom,
    ( neq(p10_0,p14_2) )).

cnf(neq1539,axiom,
    ( neq(p10_0,p14_3) )).

cnf(neq1540,axiom,
    ( neq(p10_0,p14_6) )).

cnf(neq1541,axiom,
    ( neq(p11_3,truck1) )).

cnf(neq1542,axiom,
    ( neq(p11_3,truck2) )).

cnf(neq1543,axiom,
    ( neq(p11_3,truck3) )).

cnf(neq1544,axiom,
    ( neq(p11_3,truck4) )).

cnf(neq1545,axiom,
    ( neq(p11_3,truck5) )).

cnf(neq1546,axiom,
    ( neq(p11_3,s0) )).

cnf(neq1547,axiom,
    ( neq(p11_3,s1) )).

cnf(neq1548,axiom,
    ( neq(p11_3,s2) )).

cnf(neq1549,axiom,
    ( neq(p11_3,s3) )).

cnf(neq1550,axiom,
    ( neq(p11_3,s4) )).

cnf(neq1551,axiom,
    ( neq(p11_3,s5) )).

cnf(neq1552,axiom,
    ( neq(p11_3,s6) )).

cnf(neq1553,axiom,
    ( neq(p11_3,s7) )).

cnf(neq1554,axiom,
    ( neq(p11_3,s8) )).

cnf(neq1555,axiom,
    ( neq(p11_3,s9) )).

cnf(neq1556,axiom,
    ( neq(p11_3,s10) )).

cnf(neq1557,axiom,
    ( neq(p11_3,s11) )).

cnf(neq1558,axiom,
    ( neq(p11_3,s12) )).

cnf(neq1559,axiom,
    ( neq(p11_3,s13) )).

cnf(neq1560,axiom,
    ( neq(p11_3,s14) )).

cnf(neq1561,axiom,
    ( neq(p11_3,p0_8) )).

cnf(neq1562,axiom,
    ( neq(p11_3,p1_2) )).

cnf(neq1563,axiom,
    ( neq(p11_3,p1_5) )).

cnf(neq1564,axiom,
    ( neq(p11_3,p1_7) )).

cnf(neq1565,axiom,
    ( neq(p11_3,p3_8) )).

cnf(neq1566,axiom,
    ( neq(p11_3,p3_12) )).

cnf(neq1567,axiom,
    ( neq(p11_3,p4_1) )).

cnf(neq1568,axiom,
    ( neq(p11_3,p4_10) )).

cnf(neq1569,axiom,
    ( neq(p11_3,p5_9) )).

cnf(neq1570,axiom,
    ( neq(p11_3,p7_8) )).

cnf(neq1571,axiom,
    ( neq(p11_3,p7_11) )).

cnf(neq1572,axiom,
    ( neq(p11_3,p8_4) )).

cnf(neq1573,axiom,
    ( neq(p11_3,p8_11) )).

cnf(neq1574,axiom,
    ( neq(p11_3,p9_6) )).

cnf(neq1575,axiom,
    ( neq(p11_3,p10_0) )).

cnf(neq1576,axiom,
    ( ~ neq(p11_3,p11_3) )).

cnf(neq1577,axiom,
    ( neq(p11_3,p11_13) )).

cnf(neq1578,axiom,
    ( neq(p11_3,p12_7) )).

cnf(neq1579,axiom,
    ( neq(p11_3,p12_10) )).

cnf(neq1580,axiom,
    ( neq(p11_3,p13_14) )).

cnf(neq1581,axiom,
    ( neq(p11_3,p14_0) )).

cnf(neq1582,axiom,
    ( neq(p11_3,p14_2) )).

cnf(neq1583,axiom,
    ( neq(p11_3,p14_3) )).

cnf(neq1584,axiom,
    ( neq(p11_3,p14_6) )).

cnf(neq1585,axiom,
    ( neq(p11_13,truck1) )).

cnf(neq1586,axiom,
    ( neq(p11_13,truck2) )).

cnf(neq1587,axiom,
    ( neq(p11_13,truck3) )).

cnf(neq1588,axiom,
    ( neq(p11_13,truck4) )).

cnf(neq1589,axiom,
    ( neq(p11_13,truck5) )).

cnf(neq1590,axiom,
    ( neq(p11_13,s0) )).

cnf(neq1591,axiom,
    ( neq(p11_13,s1) )).

cnf(neq1592,axiom,
    ( neq(p11_13,s2) )).

cnf(neq1593,axiom,
    ( neq(p11_13,s3) )).

cnf(neq1594,axiom,
    ( neq(p11_13,s4) )).

cnf(neq1595,axiom,
    ( neq(p11_13,s5) )).

cnf(neq1596,axiom,
    ( neq(p11_13,s6) )).

cnf(neq1597,axiom,
    ( neq(p11_13,s7) )).

cnf(neq1598,axiom,
    ( neq(p11_13,s8) )).

cnf(neq1599,axiom,
    ( neq(p11_13,s9) )).

cnf(neq1600,axiom,
    ( neq(p11_13,s10) )).

cnf(neq1601,axiom,
    ( neq(p11_13,s11) )).

cnf(neq1602,axiom,
    ( neq(p11_13,s12) )).

cnf(neq1603,axiom,
    ( neq(p11_13,s13) )).

cnf(neq1604,axiom,
    ( neq(p11_13,s14) )).

cnf(neq1605,axiom,
    ( neq(p11_13,p0_8) )).

cnf(neq1606,axiom,
    ( neq(p11_13,p1_2) )).

cnf(neq1607,axiom,
    ( neq(p11_13,p1_5) )).

cnf(neq1608,axiom,
    ( neq(p11_13,p1_7) )).

cnf(neq1609,axiom,
    ( neq(p11_13,p3_8) )).

cnf(neq1610,axiom,
    ( neq(p11_13,p3_12) )).

cnf(neq1611,axiom,
    ( neq(p11_13,p4_1) )).

cnf(neq1612,axiom,
    ( neq(p11_13,p4_10) )).

cnf(neq1613,axiom,
    ( neq(p11_13,p5_9) )).

cnf(neq1614,axiom,
    ( neq(p11_13,p7_8) )).

cnf(neq1615,axiom,
    ( neq(p11_13,p7_11) )).

cnf(neq1616,axiom,
    ( neq(p11_13,p8_4) )).

cnf(neq1617,axiom,
    ( neq(p11_13,p8_11) )).

cnf(neq1618,axiom,
    ( neq(p11_13,p9_6) )).

cnf(neq1619,axiom,
    ( neq(p11_13,p10_0) )).

cnf(neq1620,axiom,
    ( neq(p11_13,p11_3) )).

cnf(neq1621,axiom,
    ( ~ neq(p11_13,p11_13) )).

cnf(neq1622,axiom,
    ( neq(p11_13,p12_7) )).

cnf(neq1623,axiom,
    ( neq(p11_13,p12_10) )).

cnf(neq1624,axiom,
    ( neq(p11_13,p13_14) )).

cnf(neq1625,axiom,
    ( neq(p11_13,p14_0) )).

cnf(neq1626,axiom,
    ( neq(p11_13,p14_2) )).

cnf(neq1627,axiom,
    ( neq(p11_13,p14_3) )).

cnf(neq1628,axiom,
    ( neq(p11_13,p14_6) )).

cnf(neq1629,axiom,
    ( neq(p12_7,truck1) )).

cnf(neq1630,axiom,
    ( neq(p12_7,truck2) )).

cnf(neq1631,axiom,
    ( neq(p12_7,truck3) )).

cnf(neq1632,axiom,
    ( neq(p12_7,truck4) )).

cnf(neq1633,axiom,
    ( neq(p12_7,truck5) )).

cnf(neq1634,axiom,
    ( neq(p12_7,s0) )).

cnf(neq1635,axiom,
    ( neq(p12_7,s1) )).

cnf(neq1636,axiom,
    ( neq(p12_7,s2) )).

cnf(neq1637,axiom,
    ( neq(p12_7,s3) )).

cnf(neq1638,axiom,
    ( neq(p12_7,s4) )).

cnf(neq1639,axiom,
    ( neq(p12_7,s5) )).

cnf(neq1640,axiom,
    ( neq(p12_7,s6) )).

cnf(neq1641,axiom,
    ( neq(p12_7,s7) )).

cnf(neq1642,axiom,
    ( neq(p12_7,s8) )).

cnf(neq1643,axiom,
    ( neq(p12_7,s9) )).

cnf(neq1644,axiom,
    ( neq(p12_7,s10) )).

cnf(neq1645,axiom,
    ( neq(p12_7,s11) )).

cnf(neq1646,axiom,
    ( neq(p12_7,s12) )).

cnf(neq1647,axiom,
    ( neq(p12_7,s13) )).

cnf(neq1648,axiom,
    ( neq(p12_7,s14) )).

cnf(neq1649,axiom,
    ( neq(p12_7,p0_8) )).

cnf(neq1650,axiom,
    ( neq(p12_7,p1_2) )).

cnf(neq1651,axiom,
    ( neq(p12_7,p1_5) )).

cnf(neq1652,axiom,
    ( neq(p12_7,p1_7) )).

cnf(neq1653,axiom,
    ( neq(p12_7,p3_8) )).

cnf(neq1654,axiom,
    ( neq(p12_7,p3_12) )).

cnf(neq1655,axiom,
    ( neq(p12_7,p4_1) )).

cnf(neq1656,axiom,
    ( neq(p12_7,p4_10) )).

cnf(neq1657,axiom,
    ( neq(p12_7,p5_9) )).

cnf(neq1658,axiom,
    ( neq(p12_7,p7_8) )).

cnf(neq1659,axiom,
    ( neq(p12_7,p7_11) )).

cnf(neq1660,axiom,
    ( neq(p12_7,p8_4) )).

cnf(neq1661,axiom,
    ( neq(p12_7,p8_11) )).

cnf(neq1662,axiom,
    ( neq(p12_7,p9_6) )).

cnf(neq1663,axiom,
    ( neq(p12_7,p10_0) )).

cnf(neq1664,axiom,
    ( neq(p12_7,p11_3) )).

cnf(neq1665,axiom,
    ( neq(p12_7,p11_13) )).

cnf(neq1666,axiom,
    ( ~ neq(p12_7,p12_7) )).

cnf(neq1667,axiom,
    ( neq(p12_7,p12_10) )).

cnf(neq1668,axiom,
    ( neq(p12_7,p13_14) )).

cnf(neq1669,axiom,
    ( neq(p12_7,p14_0) )).

cnf(neq1670,axiom,
    ( neq(p12_7,p14_2) )).

cnf(neq1671,axiom,
    ( neq(p12_7,p14_3) )).

cnf(neq1672,axiom,
    ( neq(p12_7,p14_6) )).

cnf(neq1673,axiom,
    ( neq(p12_10,truck1) )).

cnf(neq1674,axiom,
    ( neq(p12_10,truck2) )).

cnf(neq1675,axiom,
    ( neq(p12_10,truck3) )).

cnf(neq1676,axiom,
    ( neq(p12_10,truck4) )).

cnf(neq1677,axiom,
    ( neq(p12_10,truck5) )).

cnf(neq1678,axiom,
    ( neq(p12_10,s0) )).

cnf(neq1679,axiom,
    ( neq(p12_10,s1) )).

cnf(neq1680,axiom,
    ( neq(p12_10,s2) )).

cnf(neq1681,axiom,
    ( neq(p12_10,s3) )).

cnf(neq1682,axiom,
    ( neq(p12_10,s4) )).

cnf(neq1683,axiom,
    ( neq(p12_10,s5) )).

cnf(neq1684,axiom,
    ( neq(p12_10,s6) )).

cnf(neq1685,axiom,
    ( neq(p12_10,s7) )).

cnf(neq1686,axiom,
    ( neq(p12_10,s8) )).

cnf(neq1687,axiom,
    ( neq(p12_10,s9) )).

cnf(neq1688,axiom,
    ( neq(p12_10,s10) )).

cnf(neq1689,axiom,
    ( neq(p12_10,s11) )).

cnf(neq1690,axiom,
    ( neq(p12_10,s12) )).

cnf(neq1691,axiom,
    ( neq(p12_10,s13) )).

cnf(neq1692,axiom,
    ( neq(p12_10,s14) )).

cnf(neq1693,axiom,
    ( neq(p12_10,p0_8) )).

cnf(neq1694,axiom,
    ( neq(p12_10,p1_2) )).

cnf(neq1695,axiom,
    ( neq(p12_10,p1_5) )).

cnf(neq1696,axiom,
    ( neq(p12_10,p1_7) )).

cnf(neq1697,axiom,
    ( neq(p12_10,p3_8) )).

cnf(neq1698,axiom,
    ( neq(p12_10,p3_12) )).

cnf(neq1699,axiom,
    ( neq(p12_10,p4_1) )).

cnf(neq1700,axiom,
    ( neq(p12_10,p4_10) )).

cnf(neq1701,axiom,
    ( neq(p12_10,p5_9) )).

cnf(neq1702,axiom,
    ( neq(p12_10,p7_8) )).

cnf(neq1703,axiom,
    ( neq(p12_10,p7_11) )).

cnf(neq1704,axiom,
    ( neq(p12_10,p8_4) )).

cnf(neq1705,axiom,
    ( neq(p12_10,p8_11) )).

cnf(neq1706,axiom,
    ( neq(p12_10,p9_6) )).

cnf(neq1707,axiom,
    ( neq(p12_10,p10_0) )).

cnf(neq1708,axiom,
    ( neq(p12_10,p11_3) )).

cnf(neq1709,axiom,
    ( neq(p12_10,p11_13) )).

cnf(neq1710,axiom,
    ( neq(p12_10,p12_7) )).

cnf(neq1711,axiom,
    ( ~ neq(p12_10,p12_10) )).

cnf(neq1712,axiom,
    ( neq(p12_10,p13_14) )).

cnf(neq1713,axiom,
    ( neq(p12_10,p14_0) )).

cnf(neq1714,axiom,
    ( neq(p12_10,p14_2) )).

cnf(neq1715,axiom,
    ( neq(p12_10,p14_3) )).

cnf(neq1716,axiom,
    ( neq(p12_10,p14_6) )).

cnf(neq1717,axiom,
    ( neq(p13_14,truck1) )).

cnf(neq1718,axiom,
    ( neq(p13_14,truck2) )).

cnf(neq1719,axiom,
    ( neq(p13_14,truck3) )).

cnf(neq1720,axiom,
    ( neq(p13_14,truck4) )).

cnf(neq1721,axiom,
    ( neq(p13_14,truck5) )).

cnf(neq1722,axiom,
    ( neq(p13_14,s0) )).

cnf(neq1723,axiom,
    ( neq(p13_14,s1) )).

cnf(neq1724,axiom,
    ( neq(p13_14,s2) )).

cnf(neq1725,axiom,
    ( neq(p13_14,s3) )).

cnf(neq1726,axiom,
    ( neq(p13_14,s4) )).

cnf(neq1727,axiom,
    ( neq(p13_14,s5) )).

cnf(neq1728,axiom,
    ( neq(p13_14,s6) )).

cnf(neq1729,axiom,
    ( neq(p13_14,s7) )).

cnf(neq1730,axiom,
    ( neq(p13_14,s8) )).

cnf(neq1731,axiom,
    ( neq(p13_14,s9) )).

cnf(neq1732,axiom,
    ( neq(p13_14,s10) )).

cnf(neq1733,axiom,
    ( neq(p13_14,s11) )).

cnf(neq1734,axiom,
    ( neq(p13_14,s12) )).

cnf(neq1735,axiom,
    ( neq(p13_14,s13) )).

cnf(neq1736,axiom,
    ( neq(p13_14,s14) )).

cnf(neq1737,axiom,
    ( neq(p13_14,p0_8) )).

cnf(neq1738,axiom,
    ( neq(p13_14,p1_2) )).

cnf(neq1739,axiom,
    ( neq(p13_14,p1_5) )).

cnf(neq1740,axiom,
    ( neq(p13_14,p1_7) )).

cnf(neq1741,axiom,
    ( neq(p13_14,p3_8) )).

cnf(neq1742,axiom,
    ( neq(p13_14,p3_12) )).

cnf(neq1743,axiom,
    ( neq(p13_14,p4_1) )).

cnf(neq1744,axiom,
    ( neq(p13_14,p4_10) )).

cnf(neq1745,axiom,
    ( neq(p13_14,p5_9) )).

cnf(neq1746,axiom,
    ( neq(p13_14,p7_8) )).

cnf(neq1747,axiom,
    ( neq(p13_14,p7_11) )).

cnf(neq1748,axiom,
    ( neq(p13_14,p8_4) )).

cnf(neq1749,axiom,
    ( neq(p13_14,p8_11) )).

cnf(neq1750,axiom,
    ( neq(p13_14,p9_6) )).

cnf(neq1751,axiom,
    ( neq(p13_14,p10_0) )).

cnf(neq1752,axiom,
    ( neq(p13_14,p11_3) )).

cnf(neq1753,axiom,
    ( neq(p13_14,p11_13) )).

cnf(neq1754,axiom,
    ( neq(p13_14,p12_7) )).

cnf(neq1755,axiom,
    ( neq(p13_14,p12_10) )).

cnf(neq1756,axiom,
    ( ~ neq(p13_14,p13_14) )).

cnf(neq1757,axiom,
    ( neq(p13_14,p14_0) )).

cnf(neq1758,axiom,
    ( neq(p13_14,p14_2) )).

cnf(neq1759,axiom,
    ( neq(p13_14,p14_3) )).

cnf(neq1760,axiom,
    ( neq(p13_14,p14_6) )).

cnf(neq1761,axiom,
    ( neq(p14_0,truck1) )).

cnf(neq1762,axiom,
    ( neq(p14_0,truck2) )).

cnf(neq1763,axiom,
    ( neq(p14_0,truck3) )).

cnf(neq1764,axiom,
    ( neq(p14_0,truck4) )).

cnf(neq1765,axiom,
    ( neq(p14_0,truck5) )).

cnf(neq1766,axiom,
    ( neq(p14_0,s0) )).

cnf(neq1767,axiom,
    ( neq(p14_0,s1) )).

cnf(neq1768,axiom,
    ( neq(p14_0,s2) )).

cnf(neq1769,axiom,
    ( neq(p14_0,s3) )).

cnf(neq1770,axiom,
    ( neq(p14_0,s4) )).

cnf(neq1771,axiom,
    ( neq(p14_0,s5) )).

cnf(neq1772,axiom,
    ( neq(p14_0,s6) )).

cnf(neq1773,axiom,
    ( neq(p14_0,s7) )).

cnf(neq1774,axiom,
    ( neq(p14_0,s8) )).

cnf(neq1775,axiom,
    ( neq(p14_0,s9) )).

cnf(neq1776,axiom,
    ( neq(p14_0,s10) )).

cnf(neq1777,axiom,
    ( neq(p14_0,s11) )).

cnf(neq1778,axiom,
    ( neq(p14_0,s12) )).

cnf(neq1779,axiom,
    ( neq(p14_0,s13) )).

cnf(neq1780,axiom,
    ( neq(p14_0,s14) )).

cnf(neq1781,axiom,
    ( neq(p14_0,p0_8) )).

cnf(neq1782,axiom,
    ( neq(p14_0,p1_2) )).

cnf(neq1783,axiom,
    ( neq(p14_0,p1_5) )).

cnf(neq1784,axiom,
    ( neq(p14_0,p1_7) )).

cnf(neq1785,axiom,
    ( neq(p14_0,p3_8) )).

cnf(neq1786,axiom,
    ( neq(p14_0,p3_12) )).

cnf(neq1787,axiom,
    ( neq(p14_0,p4_1) )).

cnf(neq1788,axiom,
    ( neq(p14_0,p4_10) )).

cnf(neq1789,axiom,
    ( neq(p14_0,p5_9) )).

cnf(neq1790,axiom,
    ( neq(p14_0,p7_8) )).

cnf(neq1791,axiom,
    ( neq(p14_0,p7_11) )).

cnf(neq1792,axiom,
    ( neq(p14_0,p8_4) )).

cnf(neq1793,axiom,
    ( neq(p14_0,p8_11) )).

cnf(neq1794,axiom,
    ( neq(p14_0,p9_6) )).

cnf(neq1795,axiom,
    ( neq(p14_0,p10_0) )).

cnf(neq1796,axiom,
    ( neq(p14_0,p11_3) )).

cnf(neq1797,axiom,
    ( neq(p14_0,p11_13) )).

cnf(neq1798,axiom,
    ( neq(p14_0,p12_7) )).

cnf(neq1799,axiom,
    ( neq(p14_0,p12_10) )).

cnf(neq1800,axiom,
    ( neq(p14_0,p13_14) )).

cnf(neq1801,axiom,
    ( ~ neq(p14_0,p14_0) )).

cnf(neq1802,axiom,
    ( neq(p14_0,p14_2) )).

cnf(neq1803,axiom,
    ( neq(p14_0,p14_3) )).

cnf(neq1804,axiom,
    ( neq(p14_0,p14_6) )).

cnf(neq1805,axiom,
    ( neq(p14_2,truck1) )).

cnf(neq1806,axiom,
    ( neq(p14_2,truck2) )).

cnf(neq1807,axiom,
    ( neq(p14_2,truck3) )).

cnf(neq1808,axiom,
    ( neq(p14_2,truck4) )).

cnf(neq1809,axiom,
    ( neq(p14_2,truck5) )).

cnf(neq1810,axiom,
    ( neq(p14_2,s0) )).

cnf(neq1811,axiom,
    ( neq(p14_2,s1) )).

cnf(neq1812,axiom,
    ( neq(p14_2,s2) )).

cnf(neq1813,axiom,
    ( neq(p14_2,s3) )).

cnf(neq1814,axiom,
    ( neq(p14_2,s4) )).

cnf(neq1815,axiom,
    ( neq(p14_2,s5) )).

cnf(neq1816,axiom,
    ( neq(p14_2,s6) )).

cnf(neq1817,axiom,
    ( neq(p14_2,s7) )).

cnf(neq1818,axiom,
    ( neq(p14_2,s8) )).

cnf(neq1819,axiom,
    ( neq(p14_2,s9) )).

cnf(neq1820,axiom,
    ( neq(p14_2,s10) )).

cnf(neq1821,axiom,
    ( neq(p14_2,s11) )).

cnf(neq1822,axiom,
    ( neq(p14_2,s12) )).

cnf(neq1823,axiom,
    ( neq(p14_2,s13) )).

cnf(neq1824,axiom,
    ( neq(p14_2,s14) )).

cnf(neq1825,axiom,
    ( neq(p14_2,p0_8) )).

cnf(neq1826,axiom,
    ( neq(p14_2,p1_2) )).

cnf(neq1827,axiom,
    ( neq(p14_2,p1_5) )).

cnf(neq1828,axiom,
    ( neq(p14_2,p1_7) )).

cnf(neq1829,axiom,
    ( neq(p14_2,p3_8) )).

cnf(neq1830,axiom,
    ( neq(p14_2,p3_12) )).

cnf(neq1831,axiom,
    ( neq(p14_2,p4_1) )).

cnf(neq1832,axiom,
    ( neq(p14_2,p4_10) )).

cnf(neq1833,axiom,
    ( neq(p14_2,p5_9) )).

cnf(neq1834,axiom,
    ( neq(p14_2,p7_8) )).

cnf(neq1835,axiom,
    ( neq(p14_2,p7_11) )).

cnf(neq1836,axiom,
    ( neq(p14_2,p8_4) )).

cnf(neq1837,axiom,
    ( neq(p14_2,p8_11) )).

cnf(neq1838,axiom,
    ( neq(p14_2,p9_6) )).

cnf(neq1839,axiom,
    ( neq(p14_2,p10_0) )).

cnf(neq1840,axiom,
    ( neq(p14_2,p11_3) )).

cnf(neq1841,axiom,
    ( neq(p14_2,p11_13) )).

cnf(neq1842,axiom,
    ( neq(p14_2,p12_7) )).

cnf(neq1843,axiom,
    ( neq(p14_2,p12_10) )).

cnf(neq1844,axiom,
    ( neq(p14_2,p13_14) )).

cnf(neq1845,axiom,
    ( neq(p14_2,p14_0) )).

cnf(neq1846,axiom,
    ( ~ neq(p14_2,p14_2) )).

cnf(neq1847,axiom,
    ( neq(p14_2,p14_3) )).

cnf(neq1848,axiom,
    ( neq(p14_2,p14_6) )).

cnf(neq1849,axiom,
    ( neq(p14_3,truck1) )).

cnf(neq1850,axiom,
    ( neq(p14_3,truck2) )).

cnf(neq1851,axiom,
    ( neq(p14_3,truck3) )).

cnf(neq1852,axiom,
    ( neq(p14_3,truck4) )).

cnf(neq1853,axiom,
    ( neq(p14_3,truck5) )).

cnf(neq1854,axiom,
    ( neq(p14_3,s0) )).

cnf(neq1855,axiom,
    ( neq(p14_3,s1) )).

cnf(neq1856,axiom,
    ( neq(p14_3,s2) )).

cnf(neq1857,axiom,
    ( neq(p14_3,s3) )).

cnf(neq1858,axiom,
    ( neq(p14_3,s4) )).

cnf(neq1859,axiom,
    ( neq(p14_3,s5) )).

cnf(neq1860,axiom,
    ( neq(p14_3,s6) )).

cnf(neq1861,axiom,
    ( neq(p14_3,s7) )).

cnf(neq1862,axiom,
    ( neq(p14_3,s8) )).

cnf(neq1863,axiom,
    ( neq(p14_3,s9) )).

cnf(neq1864,axiom,
    ( neq(p14_3,s10) )).

cnf(neq1865,axiom,
    ( neq(p14_3,s11) )).

cnf(neq1866,axiom,
    ( neq(p14_3,s12) )).

cnf(neq1867,axiom,
    ( neq(p14_3,s13) )).

cnf(neq1868,axiom,
    ( neq(p14_3,s14) )).

cnf(neq1869,axiom,
    ( neq(p14_3,p0_8) )).

cnf(neq1870,axiom,
    ( neq(p14_3,p1_2) )).

cnf(neq1871,axiom,
    ( neq(p14_3,p1_5) )).

cnf(neq1872,axiom,
    ( neq(p14_3,p1_7) )).

cnf(neq1873,axiom,
    ( neq(p14_3,p3_8) )).

cnf(neq1874,axiom,
    ( neq(p14_3,p3_12) )).

cnf(neq1875,axiom,
    ( neq(p14_3,p4_1) )).

cnf(neq1876,axiom,
    ( neq(p14_3,p4_10) )).

cnf(neq1877,axiom,
    ( neq(p14_3,p5_9) )).

cnf(neq1878,axiom,
    ( neq(p14_3,p7_8) )).

cnf(neq1879,axiom,
    ( neq(p14_3,p7_11) )).

cnf(neq1880,axiom,
    ( neq(p14_3,p8_4) )).

cnf(neq1881,axiom,
    ( neq(p14_3,p8_11) )).

cnf(neq1882,axiom,
    ( neq(p14_3,p9_6) )).

cnf(neq1883,axiom,
    ( neq(p14_3,p10_0) )).

cnf(neq1884,axiom,
    ( neq(p14_3,p11_3) )).

cnf(neq1885,axiom,
    ( neq(p14_3,p11_13) )).

cnf(neq1886,axiom,
    ( neq(p14_3,p12_7) )).

cnf(neq1887,axiom,
    ( neq(p14_3,p12_10) )).

cnf(neq1888,axiom,
    ( neq(p14_3,p13_14) )).

cnf(neq1889,axiom,
    ( neq(p14_3,p14_0) )).

cnf(neq1890,axiom,
    ( neq(p14_3,p14_2) )).

cnf(neq1891,axiom,
    ( ~ neq(p14_3,p14_3) )).

cnf(neq1892,axiom,
    ( neq(p14_3,p14_6) )).

cnf(neq1893,axiom,
    ( neq(p14_6,truck1) )).

cnf(neq1894,axiom,
    ( neq(p14_6,truck2) )).

cnf(neq1895,axiom,
    ( neq(p14_6,truck3) )).

cnf(neq1896,axiom,
    ( neq(p14_6,truck4) )).

cnf(neq1897,axiom,
    ( neq(p14_6,truck5) )).

cnf(neq1898,axiom,
    ( neq(p14_6,s0) )).

cnf(neq1899,axiom,
    ( neq(p14_6,s1) )).

cnf(neq1900,axiom,
    ( neq(p14_6,s2) )).

cnf(neq1901,axiom,
    ( neq(p14_6,s3) )).

cnf(neq1902,axiom,
    ( neq(p14_6,s4) )).

cnf(neq1903,axiom,
    ( neq(p14_6,s5) )).

cnf(neq1904,axiom,
    ( neq(p14_6,s6) )).

cnf(neq1905,axiom,
    ( neq(p14_6,s7) )).

cnf(neq1906,axiom,
    ( neq(p14_6,s8) )).

cnf(neq1907,axiom,
    ( neq(p14_6,s9) )).

cnf(neq1908,axiom,
    ( neq(p14_6,s10) )).

cnf(neq1909,axiom,
    ( neq(p14_6,s11) )).

cnf(neq1910,axiom,
    ( neq(p14_6,s12) )).

cnf(neq1911,axiom,
    ( neq(p14_6,s13) )).

cnf(neq1912,axiom,
    ( neq(p14_6,s14) )).

cnf(neq1913,axiom,
    ( neq(p14_6,p0_8) )).

cnf(neq1914,axiom,
    ( neq(p14_6,p1_2) )).

cnf(neq1915,axiom,
    ( neq(p14_6,p1_5) )).

cnf(neq1916,axiom,
    ( neq(p14_6,p1_7) )).

cnf(neq1917,axiom,
    ( neq(p14_6,p3_8) )).

cnf(neq1918,axiom,
    ( neq(p14_6,p3_12) )).

cnf(neq1919,axiom,
    ( neq(p14_6,p4_1) )).

cnf(neq1920,axiom,
    ( neq(p14_6,p4_10) )).

cnf(neq1921,axiom,
    ( neq(p14_6,p5_9) )).

cnf(neq1922,axiom,
    ( neq(p14_6,p7_8) )).

cnf(neq1923,axiom,
    ( neq(p14_6,p7_11) )).

cnf(neq1924,axiom,
    ( neq(p14_6,p8_4) )).

cnf(neq1925,axiom,
    ( neq(p14_6,p8_11) )).

cnf(neq1926,axiom,
    ( neq(p14_6,p9_6) )).

cnf(neq1927,axiom,
    ( neq(p14_6,p10_0) )).

cnf(neq1928,axiom,
    ( neq(p14_6,p11_3) )).

cnf(neq1929,axiom,
    ( neq(p14_6,p11_13) )).

cnf(neq1930,axiom,
    ( neq(p14_6,p12_7) )).

cnf(neq1931,axiom,
    ( neq(p14_6,p12_10) )).

cnf(neq1932,axiom,
    ( neq(p14_6,p13_14) )).

cnf(neq1933,axiom,
    ( neq(p14_6,p14_0) )).

cnf(neq1934,axiom,
    ( neq(p14_6,p14_2) )).

cnf(neq1935,axiom,
    ( neq(p14_6,p14_3) )).

cnf(neq1936,axiom,
    ( ~ neq(p14_6,p14_6) )).

cnf(map1,axiom,
    ( path(s0,p0_8) )).

cnf(map2,axiom,
    ( path(p0_8,s0) )).

cnf(map3,axiom,
    ( path(s8,p0_8) )).

cnf(map4,axiom,
    ( path(p0_8,s8) )).

cnf(map5,axiom,
    ( path(s1,p1_2) )).

cnf(map6,axiom,
    ( path(p1_2,s1) )).

cnf(map7,axiom,
    ( path(s2,p1_2) )).

cnf(map8,axiom,
    ( path(p1_2,s2) )).

cnf(map9,axiom,
    ( path(s1,p1_5) )).

cnf(map10,axiom,
    ( path(p1_5,s1) )).

cnf(map11,axiom,
    ( path(s5,p1_5) )).

cnf(map12,axiom,
    ( path(p1_5,s5) )).

cnf(map13,axiom,
    ( path(s1,p1_7) )).

cnf(map14,axiom,
    ( path(p1_7,s1) )).

cnf(map15,axiom,
    ( path(s7,p1_7) )).

cnf(map16,axiom,
    ( path(p1_7,s7) )).

cnf(map17,axiom,
    ( path(s3,p3_8) )).

cnf(map18,axiom,
    ( path(p3_8,s3) )).

cnf(map19,axiom,
    ( path(s8,p3_8) )).

cnf(map20,axiom,
    ( path(p3_8,s8) )).

cnf(map21,axiom,
    ( path(s3,p3_12) )).

cnf(map22,axiom,
    ( path(p3_12,s3) )).

cnf(map23,axiom,
    ( path(s12,p3_12) )).

cnf(map24,axiom,
    ( path(p3_12,s12) )).

cnf(map25,axiom,
    ( path(s4,p4_1) )).

cnf(map26,axiom,
    ( path(p4_1,s4) )).

cnf(map27,axiom,
    ( path(s1,p4_1) )).

cnf(map28,axiom,
    ( path(p4_1,s1) )).

cnf(map29,axiom,
    ( path(s4,p4_10) )).

cnf(map30,axiom,
    ( path(p4_10,s4) )).

cnf(map31,axiom,
    ( path(s10,p4_10) )).

cnf(map32,axiom,
    ( path(p4_10,s10) )).

cnf(map33,axiom,
    ( path(s5,p5_9) )).

cnf(map34,axiom,
    ( path(p5_9,s5) )).

cnf(map35,axiom,
    ( path(s9,p5_9) )).

cnf(map36,axiom,
    ( path(p5_9,s9) )).

cnf(map37,axiom,
    ( path(s7,p7_8) )).

cnf(map38,axiom,
    ( path(p7_8,s7) )).

cnf(map39,axiom,
    ( path(s8,p7_8) )).

cnf(map40,axiom,
    ( path(p7_8,s8) )).

cnf(map41,axiom,
    ( path(s7,p7_11) )).

cnf(map42,axiom,
    ( path(p7_11,s7) )).

cnf(map43,axiom,
    ( path(s11,p7_11) )).

cnf(map44,axiom,
    ( path(p7_11,s11) )).

cnf(map45,axiom,
    ( path(s8,p8_4) )).

cnf(map46,axiom,
    ( path(p8_4,s8) )).

cnf(map47,axiom,
    ( path(s4,p8_4) )).

cnf(map48,axiom,
    ( path(p8_4,s4) )).

cnf(map49,axiom,
    ( path(s8,p8_11) )).

cnf(map50,axiom,
    ( path(p8_11,s8) )).

cnf(map51,axiom,
    ( path(s11,p8_11) )).

cnf(map52,axiom,
    ( path(p8_11,s11) )).

cnf(map53,axiom,
    ( path(s9,p9_6) )).

cnf(map54,axiom,
    ( path(p9_6,s9) )).

cnf(map55,axiom,
    ( path(s6,p9_6) )).

cnf(map56,axiom,
    ( path(p9_6,s6) )).

cnf(map57,axiom,
    ( path(s10,p10_0) )).

cnf(map58,axiom,
    ( path(p10_0,s10) )).

cnf(map59,axiom,
    ( path(s0,p10_0) )).

cnf(map60,axiom,
    ( path(p10_0,s0) )).

cnf(map61,axiom,
    ( path(s11,p11_3) )).

cnf(map62,axiom,
    ( path(p11_3,s11) )).

cnf(map63,axiom,
    ( path(s3,p11_3) )).

cnf(map64,axiom,
    ( path(p11_3,s3) )).

cnf(map65,axiom,
    ( path(s11,p11_13) )).

cnf(map66,axiom,
    ( path(p11_13,s11) )).

cnf(map67,axiom,
    ( path(s13,p11_13) )).

cnf(map68,axiom,
    ( path(p11_13,s13) )).

cnf(map69,axiom,
    ( path(s12,p12_7) )).

cnf(map70,axiom,
    ( path(p12_7,s12) )).

cnf(map71,axiom,
    ( path(s7,p12_7) )).

cnf(map72,axiom,
    ( path(p12_7,s7) )).

cnf(map73,axiom,
    ( path(s12,p12_10) )).

cnf(map74,axiom,
    ( path(p12_10,s12) )).

cnf(map75,axiom,
    ( path(s10,p12_10) )).

cnf(map76,axiom,
    ( path(p12_10,s10) )).

cnf(map77,axiom,
    ( path(s13,p13_14) )).

cnf(map78,axiom,
    ( path(p13_14,s13) )).

cnf(map79,axiom,
    ( path(s14,p13_14) )).

cnf(map80,axiom,
    ( path(p13_14,s14) )).

cnf(map81,axiom,
    ( path(s14,p14_0) )).

cnf(map82,axiom,
    ( path(p14_0,s14) )).

cnf(map83,axiom,
    ( path(s0,p14_0) )).

cnf(map84,axiom,
    ( path(p14_0,s0) )).

cnf(map85,axiom,
    ( path(s14,p14_2) )).

cnf(map86,axiom,
    ( path(p14_2,s14) )).

cnf(map87,axiom,
    ( path(s2,p14_2) )).

cnf(map88,axiom,
    ( path(p14_2,s2) )).

cnf(map89,axiom,
    ( path(s14,p14_3) )).

cnf(map90,axiom,
    ( path(p14_3,s14) )).

cnf(map91,axiom,
    ( path(s3,p14_3) )).

cnf(map92,axiom,
    ( path(p14_3,s3) )).

cnf(map93,axiom,
    ( path(s14,p14_6) )).

cnf(map94,axiom,
    ( path(p14_6,s14) )).

cnf(map95,axiom,
    ( path(s6,p14_6) )).

cnf(map96,axiom,
    ( path(p14_6,s6) )).

cnf(map97,axiom,
    ( link(s0,s1) )).

cnf(map98,axiom,
    ( link(s1,s0) )).

cnf(map99,axiom,
    ( link(s0,s2) )).

cnf(map100,axiom,
    ( link(s2,s0) )).

cnf(map101,axiom,
    ( link(s0,s6) )).

cnf(map102,axiom,
    ( link(s6,s0) )).

cnf(map103,axiom,
    ( link(s0,s10) )).

cnf(map104,axiom,
    ( link(s10,s0) )).

cnf(map105,axiom,
    ( link(s0,s12) )).

cnf(map106,axiom,
    ( link(s12,s0) )).

cnf(map107,axiom,
    ( link(s0,s13) )).

cnf(map108,axiom,
    ( link(s13,s0) )).

cnf(map109,axiom,
    ( link(s1,s7) )).

cnf(map110,axiom,
    ( link(s7,s1) )).

cnf(map111,axiom,
    ( link(s1,s10) )).

cnf(map112,axiom,
    ( link(s10,s1) )).

cnf(map113,axiom,
    ( link(s1,s13) )).

cnf(map114,axiom,
    ( link(s13,s1) )).

cnf(map115,axiom,
    ( link(s2,s7) )).

cnf(map116,axiom,
    ( link(s7,s2) )).

cnf(map117,axiom,
    ( link(s2,s14) )).

cnf(map118,axiom,
    ( link(s14,s2) )).

cnf(map119,axiom,
    ( link(s3,s8) )).

cnf(map120,axiom,
    ( link(s8,s3) )).

cnf(map121,axiom,
    ( link(s3,s10) )).

cnf(map122,axiom,
    ( link(s10,s3) )).

cnf(map123,axiom,
    ( link(s4,s0) )).

cnf(map124,axiom,
    ( link(s0,s4) )).

cnf(map125,axiom,
    ( link(s5,s1) )).

cnf(map126,axiom,
    ( link(s1,s5) )).

cnf(map127,axiom,
    ( link(s5,s2) )).

cnf(map128,axiom,
    ( link(s2,s5) )).

cnf(map129,axiom,
    ( link(s5,s6) )).

cnf(map130,axiom,
    ( link(s6,s5) )).

cnf(map131,axiom,
    ( link(s5,s9) )).

cnf(map132,axiom,
    ( link(s9,s5) )).

cnf(map133,axiom,
    ( link(s6,s1) )).

cnf(map134,axiom,
    ( link(s1,s6) )).

cnf(map135,axiom,
    ( link(s6,s3) )).

cnf(map136,axiom,
    ( link(s3,s6) )).

cnf(map137,axiom,
    ( link(s6,s11) )).

cnf(map138,axiom,
    ( link(s11,s6) )).

cnf(map139,axiom,
    ( link(s6,s14) )).

cnf(map140,axiom,
    ( link(s14,s6) )).

cnf(map141,axiom,
    ( link(s7,s3) )).

cnf(map142,axiom,
    ( link(s3,s7) )).

cnf(map143,axiom,
    ( link(s7,s6) )).

cnf(map144,axiom,
    ( link(s6,s7) )).

cnf(map145,axiom,
    ( link(s7,s11) )).

cnf(map146,axiom,
    ( link(s11,s7) )).

cnf(map147,axiom,
    ( link(s8,s2) )).

cnf(map148,axiom,
    ( link(s2,s8) )).

cnf(map149,axiom,
    ( link(s8,s13) )).

cnf(map150,axiom,
    ( link(s13,s8) )).

cnf(map151,axiom,
    ( link(s9,s2) )).

cnf(map152,axiom,
    ( link(s2,s9) )).

cnf(map153,axiom,
    ( link(s9,s6) )).

cnf(map154,axiom,
    ( link(s6,s9) )).

cnf(map155,axiom,
    ( link(s9,s8) )).

cnf(map156,axiom,
    ( link(s8,s9) )).

cnf(map157,axiom,
    ( link(s9,s11) )).

cnf(map158,axiom,
    ( link(s11,s9) )).

cnf(map159,axiom,
    ( link(s10,s4) )).

cnf(map160,axiom,
    ( link(s4,s10) )).

cnf(map161,axiom,
    ( link(s10,s9) )).

cnf(map162,axiom,
    ( link(s9,s10) )).

cnf(map163,axiom,
    ( link(s10,s11) )).

cnf(map164,axiom,
    ( link(s11,s10) )).

cnf(map165,axiom,
    ( link(s10,s12) )).

cnf(map166,axiom,
    ( link(s12,s10) )).

cnf(map167,axiom,
    ( link(s11,s3) )).

cnf(map168,axiom,
    ( link(s3,s11) )).

cnf(map169,axiom,
    ( link(s11,s13) )).

cnf(map170,axiom,
    ( link(s13,s11) )).

cnf(map171,axiom,
    ( link(s11,s14) )).

cnf(map172,axiom,
    ( link(s14,s11) )).

cnf(map173,axiom,
    ( link(s12,s6) )).

cnf(map174,axiom,
    ( link(s6,s12) )).

cnf(map175,axiom,
    ( link(s12,s7) )).

cnf(map176,axiom,
    ( link(s7,s12) )).

cnf(map177,axiom,
    ( link(s13,s2) )).

cnf(map178,axiom,
    ( link(s2,s13) )).

cnf(map179,axiom,
    ( link(s13,s4) )).

cnf(map180,axiom,
    ( link(s4,s13) )).

cnf(map181,axiom,
    ( link(s13,s5) )).

cnf(map182,axiom,
    ( link(s5,s13) )).

cnf(map183,axiom,
    ( link(s13,s9) )).

cnf(map184,axiom,
    ( link(s9,s13) )).

cnf(map185,axiom,
    ( link(s13,s14) )).

cnf(map186,axiom,
    ( link(s14,s13) )).

cnf(map187,axiom,
    ( link(s14,s1) )).

cnf(map188,axiom,
    ( link(s1,s14) )).

cnf(map189,axiom,
    ( link(s14,s4) )).

cnf(map190,axiom,
    ( link(s4,s14) )).

cnf(init,axiom,
    ( s(s1,s12,s5,s4,s13,s2,s5,s14,s14,s1,s9,s3,s1,s8,s2,s12,s11,s2,s2,s3) )).

cnf(goal,negated_conjecture,
    ( ~ s(s14,s3,s5,s14,s1,s14,s11,s13,s1,s4,s5,s2,s7,s9,X15,X16,s8,X18,X19,s5) )).

%------------------------------------------------------------------------------
