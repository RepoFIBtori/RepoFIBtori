pert(X,[X|_]).
pert(X,[_|L]):- pert(X,L).

dados(0,0,[]).
dados(P,N,[X|L1]) :-  N>0, pert(X,[1,2,3,4,5,6]), P1 is P - X, N1 is N-1, dados(P1,N1,L1).
