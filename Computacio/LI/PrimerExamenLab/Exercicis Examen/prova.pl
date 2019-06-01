
path(_,N,N):- !. %quan N1 = N2 acabem ja que hem trobat un camí

path(G,N1,N2):- select([N1,N3],G,R), path(R,N3,N2),!.

negate(\+X,X):-!.

negate(X,\+X).

sat(N,S):- 

   %si p o q implica que no p implica q o no q implica p

   findall([XN,Y],(member([X,Y],S),negate(X,XN)),G1),

   findall([YN,X],(member([X,Y],S),negate(Y,YN)),G2),  
   
   append(G1,G2,G),

   \+badCycle(N,G).

	badCycle(N,G):- between(1,N,X), negate(X,XN), path(G,X,XN), path(G,XN,X).
