
path(_,N,N):- !. %quan N1 = N2 acabem ja que hem trobat un camí

path(G,N1,N2):- select([N1,N3],G,R), path(R,N3,N2),!.

%et donen una llista de llistes, on cada subllista representa una adjacencia entre v i u, et demanen si hi ha un cami entre u i v

negate(\+X,X):-!.
negate(X,\+X).

sat(N,S):-
   findall( [NX,Y], (member([X,Y],S), negate(X,NX)), G1 ),
   findall( [NY,X], (member([X,Y],S), negate(Y,NY)), G2 ),  append(G1,G2,G),
   \+badCycle(N,G).
   
badCycle(N,G):-	between(1,N,X), negate(X,Neg), path(G,X,Neg), path(G,Neg,X).
