:- use_module(library(clpfd)).

%ejemplo(_, Big, [S1...SN]): how to fit all squares of sizes S1...SN in a square of size Big?
ejemplo(0,  3,[2,1,1,1,1,1]).
ejemplo(1,  4,[2,2,2,1,1,1,1]).
ejemplo(2,  5,[3,2,2,2,1,1,1,1]).
ejemplo(3, 19,[10,9,7,6,4,4,3,3,3,3,3,2,2,2,1,1,1,1,1,1]).
ejemplo(4,112,[50,42,37,35,33,29,27,25,24,19,18,17,16,15,11,9,8,7,6,4,2]).
ejemplo(5,175,[81,64,56,55,51,43,39,38,35,33,31,30,29,20,18,16,14,9,8,5,4,3,2,1]).


insideBigSquare([],[],_). %el que fem es definir les posicions on poden anar els quadrats en funcio del seu tamany (sent 0,0 el canto d'adalt a l'esquerra de la matriu)
insideBigSquare([X|Sides],[Y|L],Big):-
	Y #=< Big - X + 1,
	insideBigSquare(Sides,L,Big).

nosolapat(_,_,_,[],[],[]).
nosolapat(X,Y,Z,[X1|Sides],[Y1|Rows],[Z1|Cols]) :-	%comparem un quadrat amb tots els restants
	((Y1 + X1 #=< Y) #\/									%fila del quadrat nou + side del quadrat nou =< fila del nostre quadrat
	(X + Y #=< Y1))												%fila del nostre quadrat + side del nostre quadrat =< fila del quadrat nou
	#\/
	((Z1 + X1 #=< Z) #\/									%columna del quadrat nou + side del quadrat nou =< columne del nostre quadrat
	(Z + X #=< Z1)),											%columna del nostre quadrat + side del nostre quadrat =< columna del seu quadrat
	nosolapat(X,Y,Z,Sides,Rows,Cols).

nonoverlapping([],[],[]).
nonoverlapping([X|Sides],[Y|Rows],[Z|Cols]):-
	nosolapat(X,Y,Z,Sides,Rows,Cols),
	nonoverlapping(Sides,Rows,Cols).



main:-
  ejemplo(4,Big,Sides),
  nl, write('Fitting all squares of size '), write(Sides), write(' into big square of size '), write(Big), nl,nl,
  length(Sides,N),
  length(RowVars,N), % get list of N prolog vars: Row coordinates of each small square
	length(ColVars,N),
	RowVars ins 1..Big,
	ColVars ins  1..Big,
  insideBigSquare(Sides,RowVars,Big),
  insideBigSquare(Sides,ColVars,Big),
  nonoverlapping(Sides,RowVars,ColVars),
	append(RowVars,ColVars,Result),
	labeling([ff],Result),
  displaySol(N,Sides,RowVars,ColVars), halt.

displaySol(N,Sides,RowVars,ColVars):-
    between(1,N,Row), nl, between(1,N,Col),
    nth1(K,Sides,S),
    nth1(K,RowVars,RV),    RVS is RV+S-1,     between(RV,RVS,Row),
    nth1(K,ColVars,CV),    CVS is CV+S-1,     between(CV,CVS,Col),
    writeSide(S), fail.
displaySol(_,_,_,_):- nl,nl,!.

writeSide(S):- S<10, write('  '),write(S),!.
writeSide(S):-       write(' ' ),write(S),!.
