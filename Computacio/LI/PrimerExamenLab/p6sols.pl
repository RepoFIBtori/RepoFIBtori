% Exemples
%=========

padre(juan,pedro).
padre(maria,pedro).
hermano(pedro,vicente).
hermano(pedro,alberto).
tio(X,Y):- padre(X,Z), hermano(Z,Y).

pert(X,[X|_]).
pert(X,[_|L]):- pert(X,L).

concat([],L,L).
concat([X|L1],L2,[X|L3]):- concat(L1,L2,L3).


fact(0,1):-!.
fact(X,F):-  X1 is X - 1, fact(X1,F1), F is X * F1.

nat(0).
nat(N):- nat(N1), N is N1 + 1.

%mul(X,Y,M):- nat(M), 0 is M mod X, 0 is M mod Y.
mul(X,Y,M):- nat(N), M is N * X,   0 is M mod Y.

pert_con_resto(X,L,Resto):- concat(L1,[X|L2],L), concat(L1,L2,Resto).

% Alternativa una mica més eficient.
%pert_r(X,[X|L],L).
%pert_r(X,[Y|L],[Y|R]):- pert_r(X,L,R). 

long([],0).
long([_|L],M):- long(L,N),M is N+1.







%factores_primos(1,[]) :- !.
%factores_primos(N,[F|L]):- nat(F), F>1, 0 is N mod F, N1 is N // F, 
%                factores_primos(N1,L),!.

f(1,[]).
f(N,[F|L]):- N > 1, nat(F), write(F), nl, F>1, 0 is N mod F, N1 is N // F, 
                f(N1,L), !.

permutacion([],[]).
permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).









subcjto([],[]).  %subcjto(L,S) significa "S es un subconjunto de L".
subcjto([X|C],[X|S]):-subcjto(C,S).
subcjto([_|C],S):-subcjto(C,S).

cifras(L,N):- subcjto(L,S), permutacion(S,P), expresion(P,E), 
              N is E, write(E),nl,fail.                       

expresion([X],X).                                             
expresion(L,E1+E2):- concat(L1,L2,L),  L1\=[],L2\=[],         
                     expresion(L1,E1), expresion(L2,E2).      
expresion(L,E1-E2):- concat(L1,L2,L),  L1\=[],L2\=[],         
                     expresion(L1,E1), expresion(L2,E2).      
expresion(L,E1*E2):- concat(L1,L2,L),  L1\=[],L2\=[],         
                     expresion(L1,E1), expresion(L2,E2).      

% expresion(L,E1//E2):- concat(L1,L2,L),  L1\=[],L2\=[],         
%                      expresion(L1,E1), expresion(L2,E2),
% 		     X is E2, X \= 0, 0 is E1 mod E2. 


der(X, X, 1):-!.
der(C, _, 0) :- number(C).
der(A+B, X, A1+B1) :- der(A, X, A1), der(B, X, B1).
der(A-B, X, A1-B1) :- der(A, X, A1), der(B, X, B1).
der(A*B, X, A*B1+B*A1) :- der(A, X, A1), der(B, X, B1).
der(sin(A), X, cos(A)*B) :- der(A, X, B).
der(cos(A), X, -sin(A)*B) :- der(A, X, B).
der(e^A, X, B*e^A) :- der(A, X, B).
der(ln(A), X, B*1/A) :- der(A, X, B).


simplifica(E,E1):- unpaso(E,E2),!, simplifica(E2,E1).
simplifica(E,E).

unpaso(A+B,A+C):- unpaso(B,C),!.
unpaso(B+A,C+A):- unpaso(B,C),!.
unpaso(A*B,A*C):- unpaso(B,C),!.
unpaso(B*A,C*A):- unpaso(B,C),!.
unpaso(0*_,0):-!.
unpaso(_*0,0):-!.
unpaso(1*X,X):-!.
unpaso(X*1,X):-!.
unpaso(0+X,X):-!.
unpaso(X+0,X):-!.
unpaso(N1+N2,N3):- number(N1), number(N2), N3 is N1+N2,!.
unpaso(N1*N2,N3):- number(N1), number(N2), N3 is N1*N2,!.
unpaso(N1*X+N2*X,N3*X):- number(N1), number(N2), N3 is N1+N2,!.
unpaso(N1*X+X*N2,N3*X):- number(N1), number(N2), N3 is N1+N2,!.
unpaso(X*N1+N2*X,N3*X):- number(N1), number(N2), N3 is N1+N2,!.
unpaso(X*N1+X*N2,N3*X):- number(N1), number(N2), N3 is N1+N2,!.


% Exercicis
%==========

%2

prod([X|L],P):- prod(L,P1), P = P1*X.
prod([],1).

%3
pescalar([],[],0).
pescalar([X|L1],[Y|L2],P):-
	pescalar(L1,L2,P1),
	P is P1+X*Y.


%4
interseccion([],_,[]).
interseccion([X|L1],L2,[X|L3]):-
	pert(X,L2),!,
	interseccion(L1,L2,L3).
interseccion([_|L1],L2,   L3 ):-
	interseccion(L1,L2,L3).

union([],L,L).
union([X|L1],L2,   L3 ):-
	pert(X,L2),!,
	union(L1,L2,L3).
union([X|L1],L2,[X|L3]):-
	union(L1,L2,L3).

%5
ultimo(L,X):- concat(_,[X],L).

inverso([],[]).
inverso(L,[X|L1]):- concat(L2,[X],L), inverso(L2,L1).

%6
fib(1,1).
fib(2,1).
fib(N,F):-
        N > 2,
	N1 is N-1,
	N2 is N-2,
	fib(N1,F1), fib(N2,F2), F is F1+F2.





%7
dados(0,0,[]).
dados(P,N,[X|L]) :-
	N>0,
	pert(X,[1,2,3,4,5,6]),
	Q is P-X,
	M is N-1, dados(Q,M,L).


%--------------------------------------------------------------------------

% concat([],L,L).
% concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

% pert(X,[X|_]).
% pert(X,[_|Y]) :- pert(X,Y). 

% pert_con_resto(X,L,R) :- concat(L1,[X|L2],L), concat(L1,L2,R).  

% permutacion([],[]).
% permutacion(L,[X|P]) :- pert_con_resto(X,L,R), permutacion(R,P).

% long([],0).
% long([_|L],M) :- long(L,N), M is N+1.

% subcjto([],[]). 
% subcjto([_|C],S) :- subcjto(C,S). 
% subcjto([X|C],[X|S]) :- subcjto(C,S). 


%--------------------------------------------------------------------------
% Ejercicio 8

suma_demas(L) :- pert_con_resto(X,L,R), suma(R,X), !. % si encontramos uno basta

%--------------------------------------------------------------------------
% Ejercicio 9

suma([],0).
suma([X|L],S) :- suma(L,S1), S is S1+X.

suma_ants(L) :- concat(L1,[X|_],L), suma(L1,X), !. % si encontramos uno basta

%--------------------------------------------------------------------------
% Ejercicio 10

car([],[]).
car( [X|L] , [ [X,N1] |Cr] ):-car(L,C),pert_con_resto([X,N],C,Cr),!,N1 is N+1.
car( [X|L] , [ [X,1]   |C] ):-car(L,C).

car(L):-car(L,C),write(C).


%--------------------------------------------------------------------------
% Ejercicio 11

esta_ordenada([]).
esta_ordenada([_]) :- !.
% Este corte no es necesario estrictamente, sólo por GPROLOG.
esta_ordenada([X,Y|L]) :- X =< Y, esta_ordenada([Y|L]).


%--------------------------------------------------------------------------
% Ejercicio 12

ordenacion(L1,L2) :- permutacion(L1,L2), esta_ordenada(L2).  


%--------------------------------------------------------------------------
% Ejercicio 13 
% Sea n la longitud de la lista L. 

% esta_ordenada(L) tiene complejidad lineal, ya que se hacen n-1 comparaciones 
% en el peor caso (cuando la lista L está ordenada).
% 
% En el peor caso el predicado ordenacion(L,LO) tiene que generar todas las 
% permutaciones (hay n!) y comprobar que si están ordenadas. Por tanto en el  
% peor caso el coste es (n!)n < (n+1)!, donde n es la longitud de la lista L. 
% Complejidad factorial en n+1.
% Nótese que n! crece muy rápido: 2^n < n! a partir de n=4.

%--------------------------------------------------------------------------
% Ejercicios 14 y 15
% Sea n la longitud de la lista.

% Insertar un elemento en una lista ordenada tiene complejidad lineal, ya 
% que en el peor caso hay que compararlo con los n elementos de la lista.

% Ordenación por inserción inserta el último elemento en la lista vacía, 
% el penúltimo en una lista de un elemento, y así sucesivamente. Se hacen 
% 1 + 2 + ... + n-1 = n(n-1)/2 comparaciones en el peor caso. Complejidad 
% cuadrática.

% En el mejor caso (la lista ya está ordenada) la complejidad es lineal. 

ord([],[]). 
ord([X|L],L1) :- ord(L,L2), insercion(X,L2,L1).

insercion(X,[],[X]). 
insercion(X,[Y|L],[X,Y|L]) :- X=<Y. 
insercion(X,[Y|L],[Y|L1]) :- X>Y, insercion(X,L,L1). 


%--------------------------------------------------------------------------
% Ejercicio 16

% Divide una lista en dos mitades 
split([],[],[]).
split([A],[A],[]).
split([A,B|R],[A|Ra],[B|Rb]) :-  split(R,Ra,Rb).

merge_sort([],[])   :- !.
merge_sort([X],[X]) :- !.
merge_sort(L,L3) :- split(L,L1,L2), merge_sort(L1,L11), merge_sort(L2,L22), 
  merge(L11,L22,L3). 
  
merge(L, [], L) :- !.
merge([], L, L).
merge([X|L1],[Y|L2],[X|L3]) :- X=<Y, !, merge(L1,[Y|L2],L3). % regla adecuada 
merge([X|L1],[Y|L2],[Y|L3]) :- merge([X|L1],L2,L3). 


%--------------------------------------------------------------------------
% Ejercicio 17

diccionario(A,N):-  nperts(A,N,S), escribir(S), fail.

nperts(_,0,[]):-!.
nperts(L,N,[X|S]):- pert(X,L), N1 is N-1, nperts(L,N1,S).

escribir([]):-write(' '),nl,!.
escribir([X|L]):- write(X), escribir(L).


%--------------------------------------------------------------------------
% Ejercicio 18

palindromos(L) :- permutacion(L,P), es_palindromo(P), 
  write(P), nl, fail. 
palindromos(_). 

es_palindromo([]).
es_palindromo([_]) :- !. % regla adecuada
es_palindromo([X|L]) :- concat(L1,[X],L), es_palindromo(L1). 

% Si no queremos que escriba repetidos se puede usar setof. 
palindroms(L) :- setof(P,(permutation(L,P), es_palindromo(P)),S), write(S). 

% Otra solución sin usar setof:

% concat([], L, L).
% concat([X|L1], L2, [X|L3]) :-
% 	concat(L1, L2, L3).

% pert_con_resto(X, L, R) :-
% 	concat(L1, [X|L2], L),
% 	concat(L1, L2, R).

% pert(X, L) :- pert_con_resto(X, L, _).

% no_pert(X, L) :- pert(X, L), !, fail.
% no_pert(_, _).

% permutacion([], []).
% permutacion(L, [X|P]) :-
% 	pert_con_resto(X, L, R),
% 	permutacion(R, P).

% inverso([],[]).
% inverso(L,[X|L1]):- concat(L2,[X],L), inverso(L2,L1).

% permutaciones_distintas(L, A, [P|X]) :-
% 	permutacion(L, P),
% 	no_pert(P, A),
% 	permutaciones_distintas(L, [P|A], X).
% permutaciones_distintas(_, _, []).

% escribir_palindromos(P) :-
% 	pert(X, P),
% 	inverso(X, X),
% 	write(X), nl, fail.
% escribir_palindromos(_).

% palindromos(L) :-
% 	permutaciones_distintas(L, [], P),
% 	escribir_palindromos(P),
% 	!.


%19
suma([],[],[],C,C).
suma([X1|L1],[X2|L2],[X3|L3],Cin,Cout) :-
	X3 is (X1 + X2 + Cin) mod 10,
	C  is (X1 + X2 + Cin) //  10,
	suma(L1,L2,L3,C,Cout).


send_more_money1 :-

	L = [S, E, N, D, M, O, R, Y, _, _],
	permutacion(L, [0,1,2,3,4,5,6,7,8,9]),
	suma([D, N, E, S], [E, R, O, M], [Y, E, N, O], 0, M),

	write('S = '), write(S), nl,
	write('E = '), write(E), nl,
	write('N = '), write(N), nl,
	write('D = '), write(D), nl,
	write('M = '), write(M), nl,
	write('O = '), write(O), nl,
	write('R = '), write(R), nl,
	write('Y = '), write(Y), nl,
	write('  '), write([S,E,N,D]), nl,
	write('  '), write([M,O,R,E]), nl,
	write('-------------------'), nl,
	write([M,O,N,E,Y]), nl.


send_more_money2 :-

	L = [0,1,2,3,4,5,6,7,8,9],
	pert_con_resto(M,  [0,1], _),
	pert_con_resto(M,  L,  L0),
	pert_con_resto(O, L0, L1),
	pert_con_resto(R, L1, L2),
	pert_con_resto(Y, L2, L3),
	pert_con_resto(S, L3, L4),
	pert_con_resto(E, L4, L5),
	pert_con_resto(N, L5, L6),
	pert_con_resto(D, L6, _),
	suma([D, N, E, S], [E, R, O, M], [Y, E, N, O], 0, M),

	write('S = '), write(S), nl,
	write('E = '), write(E), nl,
	write('N = '), write(N), nl,
	write('D = '), write(D), nl,
	write('M = '), write(M), nl,
	write('O = '), write(O), nl,
	write('R = '), write(R), nl,
	write('Y = '), write(Y), nl,
	write('  '), write([S,E,N,D]), nl,
	write('  '), write([M,O,R,E]), nl,
	write('-------------------'), nl,
	write([M,O,N,E,Y]), nl.

%20
% simplif: solucion ya venia en la lista de ejemplos


%21
mis:- camino( [lado1,3,3], [lado2,0,0], [[lado1,3,3]] ).

camino(Fin,Fin,Cam):- inverso(Cam,Sol), write(Sol), nl.
camino(Ini,Fin,Cam):- paso(Ini,E), novisitado(E,Cam), camino(E,Fin,[E|Cam]).

novisitado(E,Cam):- pert(E,Cam), !,fail.
novisitado(_,_).

paso( [lado1,M1,C1], [lado2,M2,C2] ):- pasan(M,C), M2 is M1-M, C2 is C1-C, safe(M2,C2).
paso( [lado2,M1,C1], [lado1,M2,C2] ):- pasan(M,C), M2 is M1+M, C2 is C1+C, safe(M2,C2).

pasan(M,C):- member( [M,C], [ [0,1], [0,2], [1,0], [1,1], [2,0] ] ).

safe(M,C):- M>=0, M=<3, C>=0, C=<3, nocomen( M, C),
            M1 is 3-M,  C1 is 3-C,  nocomen(M1,C1).

nocomen(0,_).
nocomen(M,C):- M>=C.
