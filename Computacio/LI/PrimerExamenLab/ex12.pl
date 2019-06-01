pert(X,[X|_]).
pert(X,[_|L]) :- pert(X,L).

ordenada([_|[]]).
ordenada([X1,X2|L]) :- X1 =< X2, ordenada([X2|L]).

esta_ordenada(L) :- ordenada(L).

concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

pert_con_resto(X,L,R) :- concat(L1,[X|L2],L), concat(L1,L2,R).  

permutacion([],[]).
permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).

ordenacion(L1,L2):- permutacion(L1,R), esta_ordenada(R), R = L2.
