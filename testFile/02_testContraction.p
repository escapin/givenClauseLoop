%cnf(test, test, ( p(f(X),b) | ~p(f(X),b) )).

%cnf(test, test, ( p(f(X),b) | ~p(f(X),b) | quad(X, Y, Z) )).

cnf(test, test, ( p(Y, Q)  | quad(H, K, A) )).

cnf(test, test, ( ~p(Z, H) )).

cnf(test, test, ( p(Z, H) )).
