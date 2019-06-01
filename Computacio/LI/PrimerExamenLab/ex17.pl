
pert([X|_],X).
pert([_|L],N) :- pert(L,N).

concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

pertr(X,L,R) :- concat(L1,[X|L2],L), concat(L1,L2,R).  

escriu([]) :- write(' '),!.
escriu([X|L]) :- write(X), escriu(L).

nmembers(_,0,[]):-!.
nmembers(A,N,[X|L]):- pert(A,X), N1 is N-1,nmembers(A,N1,L).


diccionario(A,N) :- nmembers(A,N,L), escriu(L), fail.


