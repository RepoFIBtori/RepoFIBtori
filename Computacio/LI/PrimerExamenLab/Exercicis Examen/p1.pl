concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).
pert_con_resto(X,L,R) :- concat(L1,[X|L2],L), concat(L1,L2,R).  
permutacion([],[]).
permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).
ultim([X],X).
ultim([N|L],X) :- ultim(L,X). 
%primer([X|L],R) :- R = X.
%chain2([X],[X]).
%chain2([X1,X2|L],R) :- permutacion(X1,P1), permutacion(X2,P2), primer(P2,X), ultim(P1,N1), N1 = X, chain2([P2|L],R1), R = [P1|R1].
%chain(L,R) :- chain2(L,R), write(R), nl, fail. 

ok([]).
ok([_]).
ok([[X1,Y1],[X2,Y2]|L]) :- Y1 = X2, ok([[X2,Y2]|L]).

flip([],[]).
flip([[X,Y]|L],[[Y,X]|R]) :- flip(L,R).
flip([[X,Y]|L],[[X,Y]|R]) :- flip(L,R).

chain(L,R) :- flip(L,R1), ok(R1), R = R1.
chain(L).

subcjt([],[]).
subcjt([_|L],S):-subcjt(L,S).
subcjt([X|L],[X|S]):-subcjt(L,S).

all_chains(L):-
    subcjt(L,S),
    permutation(S,P),
    chain(P,R),
    write(R),nl, fail.
all_chains(_).
