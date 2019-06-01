path(_, N, N):- !.
path(G,N1,N2):- select([N1,N3],G,G1), path(G1,N3,N2),!.

negate(\+X,X):-!.
negate(X,\+X).

sat(N,S):-
   findall( [NX,Y], (member([X,Y],S), negate(X,NX)), G1 ),
   findall( [NY,X], (member([X,Y],S), negate(Y,NY)), G2 ),  append(G1,G2,G),
   \+badCycle(N,G).
   
badCycle(N,G):-	between(1,N,X), negate(X,Neg), path(G,X,Neg), path(G,Neg,X).
