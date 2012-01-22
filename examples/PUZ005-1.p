%------------------------------------------------------------------------------
% File       : EP---1.1
% Problem    : PUZ005-1 : TPTP v4.0.0. Released v1.0.0.
% Transform  : none
% Format     : tptp:raw
% Command    : eproof --print-statistics -xAuto -tAuto --cpu-limit=%d --proof-time-unlimited --memory-limit=Auto --tstp-in --tstp-out %s

% Computer   : art06.cs.miami.edu
% Model      : i686 i686
% CPU        : Intel(R) Pentium(R) 4 CPU 2.80GHz @ 2793MHz
% Memory     : 1002MB
% OS         : Linux 2.6.26.8-57.fc8
% CPULimit   : 300s
% DateTime   : Tue Sep 22 20:44:16 EDT 2009

% Result     : Unsatisfiable 0.1s
% Output     : CNFRefutation 0.1s
% Verified   : 
% Statistics : Number of clauses        :   56 ( 126 expanded)
%              Number of leaves         :   23 (  63 expanded)
%              Depth                    :   19
%              Number of atoms          :  132 ( 339 expanded)
%              Number of equality atoms :    0 (   0 expanded)
%              Maximal clause size      :    6 (   2 average)
%              Maximal term depth       :    2 (   1 average)

% Comments   : 
%------------------------------------------------------------------------------
cnf(5,axiom,
    ( ~ monday(X1)
    | ~ friday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',monday_not_friday)).

cnf(6,axiom,
    ( ~ monday(X1)
    | ~ saturday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',monday_not_saturday)).

cnf(7,axiom,
    ( ~ monday(X1)
    | ~ sunday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',monday_not_sunday)).

cnf(9,axiom,
    ( ~ tuesday(X1)
    | ~ thursday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',tuesday_not_thursday)).

cnf(10,axiom,
    ( ~ tuesday(X1)
    | ~ friday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',tuesday_not_friday)).

cnf(11,axiom,
    ( ~ tuesday(X1)
    | ~ saturday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',tuesday_not_saturday)).

cnf(12,axiom,
    ( ~ tuesday(X1)
    | ~ sunday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',tuesday_not_sunday)).

cnf(14,axiom,
    ( ~ wednesday(X1)
    | ~ friday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',wednesday_not_friday)).

cnf(15,axiom,
    ( ~ wednesday(X1)
    | ~ saturday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',wednesday_not_saturday)).

cnf(16,axiom,
    ( ~ wednesday(X1)
    | ~ sunday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',wednesday_not_sunday)).

cnf(23,axiom,
    ( tuesday(X1)
    | ~ monday(yesterday(X1)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',monday_yesterday)).

cnf(25,axiom,
    ( thursday(X1)
    | ~ wednesday(yesterday(X1)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',wednesday_yesterday)).

cnf(26,axiom,
    ( friday(X1)
    | ~ thursday(yesterday(X1)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',thursday_yesterday)).

cnf(27,axiom,
    ( saturday(X1)
    | ~ friday(yesterday(X1)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',friday_yesterday)).

cnf(28,axiom,
    ( sunday(X1)
    | ~ saturday(yesterday(X1)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',saturday_yesterday)).

cnf(33,axiom,
    ( thursday(yesterday(X1))
    | ~ friday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',yesterday_thursday)).

cnf(34,axiom,
    ( friday(yesterday(X1))
    | ~ saturday(X1) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',yesterday_friday)).

cnf(37,axiom,
    ( monday(X1)
    | tuesday(X1)
    | wednesday(X1)
    | ~ member(X1,lying_days(lion)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',lions_lying_days)).

cnf(38,axiom,
    ( thursday(X1)
    | friday(X1)
    | saturday(X1)
    | ~ member(X1,lying_days(unicorn)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',unicorns_lying_days)).

cnf(45,axiom,
    ( member(X1,lying_days(X2))
    | member(X3,lying_days(X2))
    | ~ admits(X2,X1,X3) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',admissions1)).

cnf(49,axiom,
    ( admits(lion,today,yesterday(today)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',admissions5)).

cnf(50,axiom,
    ( admits(unicorn,today,yesterday(today)) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',admissions6)).

cnf(51,negated_conjecture,
    ( ~ thursday(today) ),
    file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p',prove_today_is_thursday)).

cnf(54,plain,
    ( ~ tuesday(yesterday(X1))
    | ~ friday(X1) ),
    inference(spm,[status(thm)],[9,33,theory(equality)])).

cnf(62,plain,
    ( ~ tuesday(yesterday(X1))
    | ~ saturday(X1) ),
    inference(spm,[status(thm)],[10,34,theory(equality)])).

cnf(93,plain,
    ( member(today,lying_days(lion))
    | member(yesterday(today),lying_days(lion)) ),
    inference(spm,[status(thm)],[45,49,theory(equality)])).

cnf(94,plain,
    ( member(today,lying_days(unicorn))
    | member(yesterday(today),lying_days(unicorn)) ),
    inference(spm,[status(thm)],[45,50,theory(equality)])).

cnf(101,plain,
    ( wednesday(yesterday(today))
    | tuesday(yesterday(today))
    | monday(yesterday(today))
    | member(today,lying_days(lion)) ),
    inference(spm,[status(thm)],[37,93,theory(equality)])).

cnf(105,plain,
    ( saturday(yesterday(today))
    | friday(yesterday(today))
    | thursday(yesterday(today))
    | member(today,lying_days(unicorn)) ),
    inference(spm,[status(thm)],[38,94,theory(equality)])).

cnf(106,plain,
    ( saturday(today)
    | friday(today)
    | thursday(today)
    | saturday(yesterday(today))
    | friday(yesterday(today))
    | thursday(yesterday(today)) ),
    inference(spm,[status(thm)],[38,105,theory(equality)])).

cnf(107,plain,
    ( saturday(today)
    | friday(today)
    | saturday(yesterday(today))
    | friday(yesterday(today))
    | thursday(yesterday(today)) ),
    inference(sr,[status(thm)],[106,51,theory(equality)])).

cnf(108,plain,
    ( saturday(yesterday(today))
    | saturday(today)
    | friday(yesterday(today))
    | friday(today) ),
    inference(csr,[status(thm)],[107,26])).

cnf(109,plain,
    ( saturday(yesterday(today))
    | saturday(today)
    | friday(today) ),
    inference(csr,[status(thm)],[108,27])).

cnf(112,plain,
    ( saturday(today)
    | friday(today)
    | ~ tuesday(yesterday(today)) ),
    inference(spm,[status(thm)],[11,109,theory(equality)])).

cnf(115,plain,
    ( sunday(today)
    | saturday(today)
    | friday(today) ),
    inference(spm,[status(thm)],[28,109,theory(equality)])).

cnf(119,plain,
    ( saturday(today)
    | friday(today)
    | ~ monday(today) ),
    inference(spm,[status(thm)],[7,115,theory(equality)])).

cnf(120,plain,
    ( saturday(today)
    | friday(today)
    | ~ tuesday(today) ),
    inference(spm,[status(thm)],[12,115,theory(equality)])).

cnf(121,plain,
    ( saturday(today)
    | friday(today)
    | ~ wednesday(today) ),
    inference(spm,[status(thm)],[16,115,theory(equality)])).

cnf(126,plain,
    ( saturday(today)
    | ~ monday(today) ),
    inference(csr,[status(thm)],[119,5])).

cnf(127,plain,
    ( ~ monday(today) ),
    inference(csr,[status(thm)],[126,6])).

cnf(128,plain,
    ( saturday(today)
    | ~ tuesday(today) ),
    inference(csr,[status(thm)],[120,10])).

cnf(129,plain,
    ( ~ tuesday(today) ),
    inference(csr,[status(thm)],[128,11])).

cnf(130,plain,
    ( saturday(today)
    | ~ wednesday(today) ),
    inference(csr,[status(thm)],[121,14])).

cnf(131,plain,
    ( ~ wednesday(today) ),
    inference(csr,[status(thm)],[130,15])).

cnf(142,plain,
    ( saturday(today)
    | ~ tuesday(yesterday(today)) ),
    inference(csr,[status(thm)],[112,54])).

cnf(143,plain,
    ( ~ tuesday(yesterday(today)) ),
    inference(csr,[status(thm)],[142,62])).

cnf(152,plain,
    ( wednesday(yesterday(today))
    | monday(yesterday(today))
    | member(today,lying_days(lion)) ),
    inference(sr,[status(thm)],[101,143,theory(equality)])).

cnf(153,plain,
    ( wednesday(today)
    | tuesday(today)
    | monday(today)
    | wednesday(yesterday(today))
    | monday(yesterday(today)) ),
    inference(spm,[status(thm)],[37,152,theory(equality)])).

cnf(154,plain,
    ( tuesday(today)
    | monday(today)
    | wednesday(yesterday(today))
    | monday(yesterday(today)) ),
    inference(sr,[status(thm)],[153,131,theory(equality)])).

cnf(155,plain,
    ( monday(today)
    | wednesday(yesterday(today))
    | monday(yesterday(today)) ),
    inference(sr,[status(thm)],[154,129,theory(equality)])).

cnf(156,plain,
    ( wednesday(yesterday(today))
    | monday(yesterday(today)) ),
    inference(sr,[status(thm)],[155,127,theory(equality)])).

cnf(158,plain,
    ( thursday(today)
    | monday(yesterday(today)) ),
    inference(spm,[status(thm)],[25,156,theory(equality)])).

cnf(163,plain,
    ( monday(yesterday(today)) ),
    inference(sr,[status(thm)],[158,51,theory(equality)])).

cnf(164,plain,
    ( tuesday(today) ),
    inference(spm,[status(thm)],[23,163,theory(equality)])).

cnf(173,plain,
    ( $false ),
    inference(sr,[status(thm)],[164,129,theory(equality)])).

cnf(174,plain,
    ( $false ),
    173,
    [proof]).

%------------------------------------------------------------------------------
%----ORIGINAL SYSTEM OUTPUT
% # Preprocessing time       : 0.014 s
% # Problem is unsatisfiable (or provable), constructing proof object
% # SZS status Unsatisfiable
% # SZS output start CNFRefutation.
% cnf(5,axiom,(~monday(X1)|~friday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', monday_not_friday)).
% cnf(6,axiom,(~monday(X1)|~saturday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', monday_not_saturday)).
% cnf(7,axiom,(~monday(X1)|~sunday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', monday_not_sunday)).
% cnf(9,axiom,(~tuesday(X1)|~thursday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', tuesday_not_thursday)).
% cnf(10,axiom,(~tuesday(X1)|~friday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', tuesday_not_friday)).
% cnf(11,axiom,(~tuesday(X1)|~saturday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', tuesday_not_saturday)).
% cnf(12,axiom,(~tuesday(X1)|~sunday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', tuesday_not_sunday)).
% cnf(14,axiom,(~wednesday(X1)|~friday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', wednesday_not_friday)).
% cnf(15,axiom,(~wednesday(X1)|~saturday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', wednesday_not_saturday)).
% cnf(16,axiom,(~wednesday(X1)|~sunday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', wednesday_not_sunday)).
% cnf(23,axiom,(tuesday(X1)|~monday(yesterday(X1))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', monday_yesterday)).
% cnf(25,axiom,(thursday(X1)|~wednesday(yesterday(X1))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', wednesday_yesterday)).
% cnf(26,axiom,(friday(X1)|~thursday(yesterday(X1))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', thursday_yesterday)).
% cnf(27,axiom,(saturday(X1)|~friday(yesterday(X1))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', friday_yesterday)).
% cnf(28,axiom,(sunday(X1)|~saturday(yesterday(X1))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', saturday_yesterday)).
% cnf(33,axiom,(thursday(yesterday(X1))|~friday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', yesterday_thursday)).
% cnf(34,axiom,(friday(yesterday(X1))|~saturday(X1)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', yesterday_friday)).
% cnf(37,axiom,(monday(X1)|tuesday(X1)|wednesday(X1)|~member(X1,lying_days(lion))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', lions_lying_days)).
% cnf(38,axiom,(thursday(X1)|friday(X1)|saturday(X1)|~member(X1,lying_days(unicorn))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', unicorns_lying_days)).
% cnf(45,axiom,(member(X1,lying_days(X2))|member(X3,lying_days(X2))|~admits(X2,X1,X3)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', admissions1)).
% cnf(49,axiom,(admits(lion,today,yesterday(today))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', admissions5)).
% cnf(50,axiom,(admits(unicorn,today,yesterday(today))),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', admissions6)).
% cnf(51,negated_conjecture,(~thursday(today)),file('/home/graph/tptp/TPTP/Problems/PUZ/PUZ005-1.p', prove_today_is_thursday)).
% cnf(54,plain,(~tuesday(yesterday(X1))|~friday(X1)),inference(spm,[status(thm)],[9,33,theory(equality)])).
% cnf(62,plain,(~tuesday(yesterday(X1))|~saturday(X1)),inference(spm,[status(thm)],[10,34,theory(equality)])).
% cnf(93,plain,(member(today,lying_days(lion))|member(yesterday(today),lying_days(lion))),inference(spm,[status(thm)],[45,49,theory(equality)])).
% cnf(94,plain,(member(today,lying_days(unicorn))|member(yesterday(today),lying_days(unicorn))),inference(spm,[status(thm)],[45,50,theory(equality)])).
% cnf(101,plain,(wednesday(yesterday(today))|tuesday(yesterday(today))|monday(yesterday(today))|member(today,lying_days(lion))),inference(spm,[status(thm)],[37,93,theory(equality)])).
% cnf(105,plain,(saturday(yesterday(today))|friday(yesterday(today))|thursday(yesterday(today))|member(today,lying_days(unicorn))),inference(spm,[status(thm)],[38,94,theory(equality)])).
% cnf(106,plain,(saturday(today)|friday(today)|thursday(today)|saturday(yesterday(today))|friday(yesterday(today))|thursday(yesterday(today))),inference(spm,[status(thm)],[38,105,theory(equality)])).
% cnf(107,plain,(saturday(today)|friday(today)|saturday(yesterday(today))|friday(yesterday(today))|thursday(yesterday(today))),inference(sr,[status(thm)],[106,51,theory(equality)])).
% cnf(108,plain,(saturday(yesterday(today))|saturday(today)|friday(yesterday(today))|friday(today)),inference(csr,[status(thm)],[107,26])).
% cnf(109,plain,(saturday(yesterday(today))|saturday(today)|friday(today)),inference(csr,[status(thm)],[108,27])).
% cnf(112,plain,(saturday(today)|friday(today)|~tuesday(yesterday(today))),inference(spm,[status(thm)],[11,109,theory(equality)])).
% cnf(115,plain,(sunday(today)|saturday(today)|friday(today)),inference(spm,[status(thm)],[28,109,theory(equality)])).
% cnf(119,plain,(saturday(today)|friday(today)|~monday(today)),inference(spm,[status(thm)],[7,115,theory(equality)])).
% cnf(120,plain,(saturday(today)|friday(today)|~tuesday(today)),inference(spm,[status(thm)],[12,115,theory(equality)])).
% cnf(121,plain,(saturday(today)|friday(today)|~wednesday(today)),inference(spm,[status(thm)],[16,115,theory(equality)])).
% cnf(126,plain,(saturday(today)|~monday(today)),inference(csr,[status(thm)],[119,5])).
% cnf(127,plain,(~monday(today)),inference(csr,[status(thm)],[126,6])).
% cnf(128,plain,(saturday(today)|~tuesday(today)),inference(csr,[status(thm)],[120,10])).
% cnf(129,plain,(~tuesday(today)),inference(csr,[status(thm)],[128,11])).
% cnf(130,plain,(saturday(today)|~wednesday(today)),inference(csr,[status(thm)],[121,14])).
% cnf(131,plain,(~wednesday(today)),inference(csr,[status(thm)],[130,15])).
% cnf(142,plain,(saturday(today)|~tuesday(yesterday(today))),inference(csr,[status(thm)],[112,54])).
% cnf(143,plain,(~tuesday(yesterday(today))),inference(csr,[status(thm)],[142,62])).
% cnf(152,plain,(wednesday(yesterday(today))|monday(yesterday(today))|member(today,lying_days(lion))),inference(sr,[status(thm)],[101,143,theory(equality)])).
% cnf(153,plain,(wednesday(today)|tuesday(today)|monday(today)|wednesday(yesterday(today))|monday(yesterday(today))),inference(spm,[status(thm)],[37,152,theory(equality)])).
% cnf(154,plain,(tuesday(today)|monday(today)|wednesday(yesterday(today))|monday(yesterday(today))),inference(sr,[status(thm)],[153,131,theory(equality)])).
% cnf(155,plain,(monday(today)|wednesday(yesterday(today))|monday(yesterday(today))),inference(sr,[status(thm)],[154,129,theory(equality)])).
% cnf(156,plain,(wednesday(yesterday(today))|monday(yesterday(today))),inference(sr,[status(thm)],[155,127,theory(equality)])).
% cnf(158,plain,(thursday(today)|monday(yesterday(today))),inference(spm,[status(thm)],[25,156,theory(equality)])).
% cnf(163,plain,(monday(yesterday(today))),inference(sr,[status(thm)],[158,51,theory(equality)])).
% cnf(164,plain,(tuesday(today)),inference(spm,[status(thm)],[23,163,theory(equality)])).
% cnf(173,plain,($false),inference(sr,[status(thm)],[164,129,theory(equality)])).
% cnf(174,plain,($false),173,['proof']).
% # SZS output end CNFRefutation
% # Parsed axioms                        : 51
% # Removed by relevancy pruning         : 0
% # Initial clauses                      : 51
% # Removed in clause preprocessing      : 0
% # Initial clauses in saturation        : 51
% # Processed clauses                    : 98
% # ...of these trivial                  : 0
% # ...subsumed                          : 19
% # ...remaining for further processing  : 79
% # Other redundant clauses eliminated   : 0
% # Clauses deleted for lack of memory   : 0
% # Backward-subsumed                    : 1
% # Backward-rewritten                   : 2
% # Generated clauses                    : 94
% # ...of the previous two non-trivial   : 63
% # Contextual simplify-reflections      : 18
% # Paramodulations                      : 94
% # Factorizations                       : 0
% # Equation resolutions                 : 0
% # Current number of processed clauses  : 76
% #    Positive orientable unit clauses  : 3
% #    Positive unorientable unit clauses: 0
% #    Negative unit clauses             : 5
% #    Non-unit-clauses                  : 68
% # Current number of unprocessed clauses: 12
% # ...number of literals in the above   : 28
% # Clause-clause subsumption calls (NU) : 86
% # Rec. Clause-clause subsumption calls : 86
% # Unit Clause-clause subsumption calls : 0
% # Rewrite failures with RHS unbound    : 0
% 
% # -------------------------------------------------
% # User time                : 0.017 s
% # System time              : 0.003 s
% # Total time               : 0.020 s
% # Maximum resident set size: 0 pages
% 
%------------------------------------------------------------------------------
