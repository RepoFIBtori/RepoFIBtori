concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

contaelem([_],1).
contaelem([_|L],N) :- contaelem(L,N1), N is N1+1.

contaelem2(L) :- contaelem(L,N), write(N).

ultim([X],X).
ultim([_|L],N) :- ultim(L,N).

borraultim([_],[]).
borraultim([X|L],L3) :- borraultim(L,L2), concat([X],L2,L3).

%el merge es fa entre dos llistes
merge(X,[],X).
merge([],X,X).
merge([X1|L1],[X2|L2],[X1|L3]) :- X1 =< X2, !, merge(L1,[X2|L2],L3).
merge([X1|L1],[X2|L2],[X2|L3]) :- merge([X1|L1],L2,L3).

ordenacio([X],[X]).
ordenacio(L1,L2) :- concat(L3,L4,L1), contaelem(L3,N1), contaelem(L4,N2), N1 = N2, write(N1), write(N2), ordenacio(L3, F1), ordenacio(L4, F2), merge(F1,F2,L2).
ordenacio(L1,L2) :- concat(L3,L4,L1), contaelem(L3,N1), contaelem(L4,N2), N3 is N2 + 1, N1 = N3, write(N1), write(N2), ordenacio(L3, F1), ordenacio(L4, F2), merge(F1,F2,L2).


