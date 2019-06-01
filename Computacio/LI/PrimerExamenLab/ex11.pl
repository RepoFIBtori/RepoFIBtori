ordenada([_|[]]).
ordenada([X1,X2|L]) :- X1 =< X2, ordenada([X2|L]).


esta_ordenada(L) :- ordenada(L), !, fail.
