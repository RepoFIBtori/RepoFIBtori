

ok([[C12,M12],[C22,M22],_]) :- 
	M12 >= C12,
	M22 >= C22.
			
ok([[C12,M12],[_,M22],_]) :- 
	M22 = 0,
	M12 >= C12.
		
ok([[_,M12],[C22,M22],_]) :- 
	M12 = 0,
	M22 >= C22.
	
unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 

%ANADA AMB LA CANOA PLENA

%cas en que enviem un misioner i un canibal a la canoa
	T1 = 1, 
	C11 >= 1,
	M11 >= 1,
	C22 is C21 + 1,
	M22 is M21 + 1,
	C12 is C11 - 1,
	M12 is M11 - 1,
	T2 is 0,
	ok([[C12,M12],[C22,M22],T2]).
 

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 1, 
	C11 >= 2,
	C22 is C21 + 2,
	C12 is C11 - 2,
	M12 is M11,
	M22 is M21,
	T2 is 0,
	ok([[C12,M12],[C22,M22],T2]).

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 1, 
	M11 >= 2,
	M22 is M21 + 2,
	M12 is M11 - 2,
	C22 is C21,
	C12 is C11,
	T2 is 0,
	ok([[C12,M12],[C22,M22],T2]).

%TORNADA AMB LA CANOA PLENA

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 0, 
	C21 >= 1,
	M21 >= 1,
	C12 is C11 + 1,
	M12 is M11 +1,
	C22 is C21 - 1,
	M22 is M21 - 1,
	T2 is 1,
	ok([[C12,M12],[C22,M22],T2]).

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 0, 
	C21 >= 2,
	C12 is C11 + 2,
	C22 is C21 - 2,
	M22 is M21,
	M12 is M11,
	T2 is 1,
	ok([[C12,M12],[C22,M22],T2]).

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 0, 
	M11 >= 2,
	M22 is M21 + 2,
	M12 is M11 - 2,
	C22 is C21,
	C12 is C11,
	T2 is 1,
	ok([[C12,M12],[C22,M22],T2]).
	
%ANADA AMB UNA PERSONA	

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 1, 
	M11 >= 1,
	M22 is M21 + 1,
	M12 is M11 - 1,
	C12 is C11,
	C22 is C21,
	T2 is 0,
	ok([[C12,M12],[C22,M22],T2]).
	

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 1, 
	C11 >= 1,
	C22 is C21 + 1,
	C12 is C11 - 1,
	M22 is M21,
	M12 is M11,
	T2 is 0,
	ok([[C12,M12],[C22,M22],T2]).	
	
%TORNADA AMB UNA PERSONA
	
unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 0, 
	M21 >= 1,
	M12 is M11 + 1,
	M22 is M21 - 1,
	C22 is C21,
	C12 is C11,
	T2 is 1,
	ok([[C12,M12],[C22,M22],T2]).	

unPaso([[C11,M11],[C21,M21],T1],[[C12,M12],[C22,M22],T2]) :- 
	T1 = 0, 
	C21 >= 1,
	C12 is C11 + 1,
	C22 is C21 - 1,
	M22 is M21,
	M12 is M11,
	T2 is 1,
	ok([[C12,M12],[C22,M22],T2]).
	
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
	camino([[3,3],[0,0],1],[[0,0],[3,3],0],[[[3,3],[0,0],1]],C), % En "hacer aguas": -un estado es [cubo5,cubo8], y 
	length(C,N), % -el coste es la longitud de C.
	write(C).

