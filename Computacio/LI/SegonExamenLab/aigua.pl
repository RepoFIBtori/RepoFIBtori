
unPaso([A,B],[C,D]) :- L is 8 - B, L > 0, X is min(L,A), D is (B + X), C is (A - X).
unPaso([A,B],[C,D]) :- L is 5 - A, L > 0, X is min(L,B), C is (A + X), D is (B - X).
unPaso([S,A], [S,8]).
unPaso([A,S], [5,S]).
unPaso([_,S],[0,S]).
unPaso([S,_],[S,0]).

camino( E,E, C,C ).
camino( EstadoActual, EstadoFinal, CaminoHastaAhora, CaminoTotal ):-
	unPaso( EstadoActual, EstSiguiente ),
	\+member(EstSiguiente,CaminoHastaAhora),
	camino( EstSiguiente, EstadoFinal, [EstSiguiente|CaminoHastaAhora], CaminoTotal ).

nat(0).
nat(N) :- nat(N1), N is N1 + 1.

solucionOptima:-
	nat(N),
	 % Buscamos solución de "coste" 0; si no, de 1, etc.
	camino([0,0],[0,4],[[0,0]],C), % En "hacer aguas": -un estado es [cubo5,cubo8], y 
	length(C,N), % -el coste es la longitud de C.
	write(C).
