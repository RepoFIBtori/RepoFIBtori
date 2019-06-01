concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).

ultim(L,X) :- concat(_,[X],L).

inverso([],[]).
inverso(L,X|[L1]):-concat(L2,[X],L),inverso(L2,L1).
