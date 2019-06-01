:- use_module(library(clpfd)).

ejemplo(0,   26, [1,2,5,10] ).  % Solution: [1,0,1,2]
ejemplo(1,  361, [1,2,5,13,17,35,157]).

suma([],[],0).
suma([X|L],[N|C],S) :-
	suma(L,C,S1),
	S #= X*N + S1.

main:-
    ejemplo(0,Amount,Coins),
    nl, write('Paying amount '), write(Amount), write(' using the minimal number of coins of values '), write(Coins), nl,nl,
    length(Coins,N),
    length(Vars,N), % get list of N prolog vars
    Vars ins 0..Amount,
		suma(Vars,Coins,Amount),
		sum(Vars,#=,Min),
		labeling([min(Min)],Vars),
    nl, write(Vars), nl,nl, halt.
