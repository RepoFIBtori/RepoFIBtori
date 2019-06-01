prod([],1).
prod([X|L],P) :- prod(L,P1), P is P1*X.

