%concat([],L,L).
%concat([X|L1],L2,[X|L3]) :- concat(L1,L2,L3). 

%insercion(X,[],[X]). 
%insercion(X,[Y|L],[X,Y|L]) :- X=<Y. 
%insercion(X,[Y|L],[Y|L1]) :- X>Y, insercion(X,L,L1). 

%ordenacion([],[]).
%ordenacion([X|L1],L2) :- ordenacion(L1,L3), insercion(X,L3,L2).


