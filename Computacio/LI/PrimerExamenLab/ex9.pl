pert(X,[X|_]).
pert(X,[_|L]) :- pert(X,L).

suma(X,[X|_],0).
suma(X,[T|L],S) :- suma(X,L,S1), S is S1 + T. 

suma_ants(L) :- pert(X,L), suma(X,L,S), X is S.
