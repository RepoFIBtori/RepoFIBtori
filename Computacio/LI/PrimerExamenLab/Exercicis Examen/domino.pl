%%%%%%%%%%%%%%%%%%%% p1.pl %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

flip([],[]).
flip([[X,Y]|L],[[X,Y]|F]):-flip(L,F).
flip([[X,Y]|L],[[Y,X]|F]):-flip(L,F).

ok([]).
ok([_]).
ok([[_,Y],[Y,Z]|L]):-
    ok([[Y,Z]|L]).

chain(L,R):-
    flip(L,R),
    ok(R).


%%%%%%%%%%%%%%% Alternative solution to p1.pl %%%%%%%%%%%%%%%%%%%%%%%

chain2([],[]).
chain2([[X,Y]], [[X,Y]]).
chain2([[X,Y]], [[Y,X]]).
chain2([[X,Y]|L], [[X,Y]|R]) :- chain2(L,R), R = [ [Y,_] | _ ].
chain2([[X,Y]|L], [[Y,X]|R]) :- chain2(L,R), R = [ [X,_] | _ ].


%%%%%%%%%%%%%%%%%%%%%%%% p2.pl %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

subcjt([],[]).
subcjt([_|L],S):-subcjt(L,S).
subcjt([X|L],[X|S]):-subcjt(L,S).

all_chains(L):-
    subcjt(L,S),
    permutation(S,P),
    chain(P,R),
    write(R),nl, fail.
all_chains(_).
