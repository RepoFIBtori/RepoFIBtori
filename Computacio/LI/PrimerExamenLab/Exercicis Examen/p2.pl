
path([[N1,N2]|_],N1,N2):- !.

path([[N1,_]|G],N1,N2):- select([_,N2],G,R), path(R,N1,N2),!.
