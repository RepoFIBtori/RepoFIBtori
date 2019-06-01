:- use_module(library(clpfd)).

reines :-
	L = [X1, X2, X3, X4, X5, X6, X7, X8],
%	L = [_, _, _, _, _, _, _, _],

	L ins 1..8,    %     <---- defineix dominis de
	write(L),
	segur(L),      %     <---- estableix les restriccions
	label(L),      %     <---- genera solucions
        write(L),      %     <---- escriu solucions
        nl.

segur([]).
segur([X|L]) :-
	no_ataca(X, L, 1),
	segur(L).

no_ataca(_, [], _).
no_ataca(X, [Y|L], I) :-
	X #\= Y,        %     <--- X i Y són diferents
	X #\= Y + I,    %     <--- X i Y + I són diferents
	X #\= Y - I,    %     <--- X i Y - I són diferents
	J is I + 1,
	no_ataca(X, L, J).
