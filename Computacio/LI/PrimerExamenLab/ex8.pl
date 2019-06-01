pert(X,[X|_]).
pert(X,[_|L]) :- pert(X,L).

suma_elements([],0).
suma_elements([X|L],S) :- suma_elements(L,S1), S is S1+X.

suma_demas(L) :- pert(X,L), suma_elements(L,S), X is S-X.

