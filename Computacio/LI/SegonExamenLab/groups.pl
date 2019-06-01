% A university professor wants to organize students in groups in order
% to complete an assignment. She has done it before with previous
% assignments and now, in order to diversify the composition of the
% groups, has a list of pairs of students that cannot be in the same
% group. In addition, groups must have a minimum and a maximum number
% of members.

% Complete the following program to compute a feasible group distribution

%MANDATORY: Use the SAT variables: sg-S-G meaning "student S goes to group G"

numStudents(20).
numGroups(3).
minGroup(5).
maxGroup(9).
incompatible(1,2).
incompatible(1,3).
incompatible(1,5).
incompatible(1,12).
incompatible(1,19).
incompatible(1,25).
incompatible(3,7).
incompatible(3,12).
incompatible(6,12).
incompatible(6,19).
incompatible(7,12).
incompatible(8,10).
incompatible(8,11).
incompatible(10,11).
incompatible(10,12).
incompatible(10,18).
incompatible(12,19).
incompatible(12,20).
incompatible(13,14).
incompatible(14,16).
incompatible(14,18).
incompatible(16,17).
incompatible(18,19).
incompatible(19,20).
% end input

%Helpful prolog predicates
student(S):-numStudents(N),between(1,N,S).
group(G):-  numGroups(N),  between(1,N,G).

:-dynamic(varNumber/3).
symbolicOutput(0). % set to 1 to see symbolic output only; 0 otherwise.

unpergrup :-
	student(S),
	findall(sg-S-G,group(G),L),
	exactly(1,L),
	fail.
unpergrup.

incompatibles :-
	student(S1),
	incompatible(S1,S2),
	group(G),
	writeClause([\+sg-S1-G,\+sg-S2-G]),
	fail.
incompatibles.

minmax :-
	minGroup(N1),
	maxGroup(N2),
	group(G),
	findall(sg-S-G,student(S),L),
	atLeast(N1,L),
	atMost(N2,L),
	fail.
minmax.

writeClauses:-
  	minmax,
		unpergrup,
		incompatibles.


%% Display solution
displaySol(M):- group(G), nl, write('Group '), write(G), write(': '),
		findall(S,member(sg-S-G,M),L), write(L), fail.
displaySol(_).



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Everything below is given as a standard library, reusable for solving
%    with SAT many different problems.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Express that Var is equivalent to the disjunction of Lits:
expressOr( Var, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, Var ]), fail.
expressOr( Var, Lits ):- negate(Var,NVar), writeClause([ NVar | Lits ]),!.


%%%%%% Cardinality constraints on arbitrary sets of literals Lits:

exactly(K,Lits):- atLeast(K,Lits), atMost(K,Lits),!.

atMost(K,Lits):-   % l1+...+ln <= k:  in all subsets of size k+1, at least one is false:
	negateAll(Lits,NLits),
	K1 is K+1,    subsetOfSize(K1,NLits,Clause), writeClause(Clause),fail.
atMost(_,_).

atLeast(K,Lits):-  % l1+...+ln >= k: in all subsets of size n-k+1, at least one is true:
	length(Lits,N),
	K1 is N-K+1,  subsetOfSize(K1, Lits,Clause), writeClause(Clause),fail.
atLeast(_,_).

negateAll( [], [] ).
negateAll( [Lit|Lits], [NLit|NLits] ):- negate(Lit,NLit), negateAll( Lits, NLits ),!.

negate(\+Lit,  Lit):-!.
negate(  Lit,\+Lit):-!.

subsetOfSize(0,_,[]):-!.
subsetOfSize(N,[X|L],[X|S]):- N1 is N-1, length(L,Leng), Leng>=N1, subsetOfSize(N1,L,S).
subsetOfSize(N,[_|L],   S ):-            length(L,Leng), Leng>=N,  subsetOfSize( N,L,S).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% MAIN:

main:-  symbolicOutput(1), !, writeClauses, halt.   % print the clauses in symbolic form and halt
main:-  initClauseGeneration,
	tell(clauses), writeClauses, told,          % generate the (numeric) SAT clauses and call the solver
	tell(header),  writeHeader,  told,
	numVars(N), numClauses(C),
	write('Generated '), write(C), write(' clauses over '), write(N), write(' variables. '),nl,
	shell('cat header clauses > infile.cnf',_),
	write('Calling solver....'), nl,
	shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
	treatResult(Result),!.

treatResult(20):- write('Unsatisfiable'), nl, halt.
treatResult(10):- write('Solution found: '), nl, see(model), symbolicModel(M), seen, displaySol(M), nl,nl,halt.

initClauseGeneration:-  %initialize all info about variables and clauses:
	retractall(numClauses(   _)),
	retractall(numVars(      _)),
	retractall(varNumber(_,_,_)),
	assert(numClauses( 0 )),
	assert(numVars(    0 )),     !.

writeClause([]):- symbolicOutput(1),!, nl.
writeClause([]):- countClause, write(0), nl.
writeClause([Lit|C]):- w(Lit), writeClause(C),!.
w( Lit ):- symbolicOutput(1), write(Lit), write(' '),!.
w(\+Var):- var2num(Var,N), write(-), write(N), write(' '),!.
w(  Var):- var2num(Var,N),           write(N), write(' '),!.


% given the symbolic variable V, find its variable number N in the SAT solver:
var2num(V,N):- hash_term(V,Key), existsOrCreate(V,Key,N),!.
existsOrCreate(V,Key,N):- varNumber(Key,V,N),!.                            % V already existed with num N
existsOrCreate(V,Key,N):- newVarNumber(N), assert(varNumber(Key,V,N)), !.  % otherwise, introduce new N for V

writeHeader:- numVars(N),numClauses(C), write('p cnf '),write(N), write(' '),write(C),nl.

countClause:-     retract( numClauses(N0) ), N is N0+1, assert( numClauses(N) ),!.
newVarNumber(N):- retract( numVars(   N0) ), N is N0+1, assert(    numVars(N) ),!.

% Getting the symbolic model M from the output file:
symbolicModel(M):- get_code(Char), readWord(Char,W), symbolicModel(M1), addIfPositiveInt(W,M1,M),!.
symbolicModel([]).
addIfPositiveInt(W,L,[Var|L]):- W = [C|_], between(48,57,C), number_codes(N,W), N>0, varNumber(_,Var,N),!.
addIfPositiveInt(_,L,L).
readWord( 99,W):- repeat, get_code(Ch), member(Ch,[-1,10]), !, get_code(Ch1), readWord(Ch1,W),!. % skip line starting w/ c
readWord(115,W):- repeat, get_code(Ch), member(Ch,[-1,10]), !, get_code(Ch1), readWord(Ch1,W),!. % skip line starting w/ s
readWord(-1,_):-!, fail. %end of file
readWord(C,[]):- member(C,[10,32]), !. % newline or white space marks end of word
readWord(Char,[Char|W]):- get_code(Char1), readWord(Char1,W), !.
%========================================================================================
