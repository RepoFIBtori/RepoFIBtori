
%exercici 1: producte

prod([X],X).
prod([X|L],P) :- prod(L,S), X1 is S*X, P = X1.
