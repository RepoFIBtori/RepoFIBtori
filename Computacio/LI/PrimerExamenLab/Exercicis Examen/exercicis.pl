pert(X,[X|_]).
pert(X,[_|L]):- pert(X,L).

%exercici 2: producte

prod([X],X).
prod([X|L],P) :- prod(L,S), X1 is S*X, P = X1.

%exercici 3: producte escalar de dos vectors, si tenen longitud diferent fallen

pescalar([],[],0).
pescalar([X1|L1],[X2|L2],P) :- pescalar(L1,L2,P1), P is P1 + (X1*X2).

%exercici 4: interseccion e union listas sin repeticiones

concat([],L,L).
concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3).

%intersec([],[],[]).
%intersec([X],[],[X]).
%intersec([],[X],[X]).
%intersec([X1|L1],[X2|L2],[X1|L3]) :- X1 = X2, intersec(L1,L2,L3). 
%intersec([X1|L1],L2,[X1|L3]) :- intersec(L1,L2,L3).
%intersec(L1,[X|L2],[X|L3]) :- intersec(L1,L2,L3).
%funcionaria si estigues ordenat

intersec([],_,[]).
intersec([X|L1],L2,[X|L3]):-pert(X,L2),!,intersec(L1,L2,L3).
intersec([_|L1],L2,L3):- intersec(L1,L2,L3).

%exerici 5: utilitzant el concat escriu predicats per el ultim de una llista donada i per l'invers

ultim(L,R) :- concat(L1,[R],L).

invers([],[]).
invers([X|L],R) :- invers(L,R1), concat(R1,[X],R).

%exercici 6: escriu un predicat que signifiqui F es el Nessim numero de Fibonacci per la N donada.

fib(1,1).
fib(2,1).
fib(N,F) :- N > 2, N1 is N-1, N2 is N-2, fib(N1,F1), fib(N2,F2), F is F1+F2.

%exercici 7: escriu un predicat prolog dados(P,N,L) que significa la llista L expressa una manera de sumar P punts llançant N daus

dados(0,0,[]).
dados(P,N,L) :- N > 0, between(1,6,K), N1 is N-1, P1 is P-K, dados(P1,N1,L1), concat([K],L1,L).

%exercici 8: suma_demas(L).

pert_r(X,[X|L],L).
pert_r(X,[Y|L],[Y|R]):- pert_r(X,L,R). 

suma([],0).
suma([X|L],R) :- suma(L,R1), R is X + R1.

suma_demas(L) :- pert_r(X,L,R), suma(R,S), S = X.

%exercici 9: suma_ants(L), algun elemento es igual a la suma de los elementos anteriores a el en L


suma_ants(L) :- pert(X,L), concat(L1,[X|L2],L), suma(L1,R), X = R, !.

%exercici 10: card(L), dada una lista de enteros L, escriba la lista que para cada elemento de L dice cuantas veces aparece este elemento en L.

conta(X,[],0).
conta(X,[X|L],S) :- conta(X,L,S1), S is S1+1.
conta(X,[N|L],S) :- conta(X,L,S).

borra([N|A],N,A) :- borra(A,N,A). 

card2(L,[],[]).
card2(L,A,R) :- pert(N,A), conta(N,L,S), borra(A,N,A1), card2(L,A1,R1), R = [[X,S]|R1].
 
card(L).
