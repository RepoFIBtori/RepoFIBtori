pert(X,[X|_]).
pert(X,[_|L]) :- pert(X,L).

borra([],_,[]).
borra([X|L],X,Li) :- !, borra(L,X,Li).
borra([X1|L],X,[X1|Li]) :- borra(L,X,Li).

conta(_,[],0).
conta(X,[X|L],N) :- !, conta(X,L,N1), N is N1 + 1.
conta(X,[_|L],N) :- conta(X,L,N).

card2([],[]).
card2(L,L1) :- pert(X,L), conta(X,L,N), borra(L,X,L2), card2(L2,L3), L1 = [[X,N]|L3].

card(L) :- card2(L,K), !, write(K).
