:- use_module(library(clpfd)).

%% A (6-sided) "letter dice" has on each side a different letter.
%% Find four of them, with the 24 letters abcdefghijklmnoprstuvwxy such
%% that you can make all the following words: bake, onyx, echo, oval,
%% gird, smug, jump, torn, luck, viny, lush, wrap.

%Some helpful predicates:

num(X,N):- nth1( N, [a,b,c,d,e,f,g,h,i,j,k,l,m,n,o,p,r,s,t,u,v,w,x,y], X ).

word( [b,a,k,e] ).
word( [o,n,y,x] ).
word( [e,c,h,o] ).

norepetits([],_).
norepetits([X|L],[_|L1]) :-
	\+member(X,L1),
	norepetits(L,L1).

divideix([],[]).
divideix(L,X) :-
	append(L1,L2,L),
	length(L1,6),
	divideix(L2,X1),
	append([L1],X1,X).

selecciona([],[]).
selecciona([K|X],L) :-
	member(N,K),
	selecciona(X,L1),
	append([N],L1,L).

transforma([],[]).
transforma([X|L],P) :-
	num(N,X),
	transforma(L,P1),
	append([N],P1,P).

comprova(X) :-
	selecciona(X,L),
	transforma(L,P),
	word(N),
	P = N,
	fail.
comprova(_).


main:-
	%definir una llista de llistes, on cada subllista representa un dau amb 6 lletres
	length(L,24),
	L ins 1..24,
	norepetits(L,L),
	divideix(L,X),
	comprova(X),
	labelling([ff],L),
  halt.

writeN(D):- findall(X,(member(N,D),num(X,N)),L), write(L), nl, !.
