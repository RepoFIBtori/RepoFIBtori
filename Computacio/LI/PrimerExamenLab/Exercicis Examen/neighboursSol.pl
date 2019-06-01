:-dynamic(varNumber / 3).
symbolicOutput(0).  % set to 1 to see symbolic output only; 0 otherwise.


% The city hall of a small village needs to select some inhabitants to
% act as representatives for the whole village in order to start
% important talks. For each inhabitant of the village we have the following
% information:
% 
% 1.- The list of neighbours that could represent her
% 2.- The neighbourhood where she lives
%
% The goal is to choose K representatives, all of them from different
% neighbourhoods, such that every neighbour is represented by at least
% one of the chosen representatives.
%
% Complete the following program to find a set of representatives.

%%%%%%%%%%%%%%%%%%%% input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

numRepresentatives(4).
numNeighbors(15).
%info(neighborId, ListOfNeighborsRepresenting, Neighborhood).
info(1, [  2,3,4,5,    8,9,10,11,   13,14,15], baix).
info(2, [1,2,      6,7,8,9,   11,12,13,   15], dalt).
info(3, [1,2,  4,5,    8,  10,11,12,   14   ], baix).
info(4, [    3,    6,7,  9,10,11,   13,14,15], rasa).
info(5, [1,2,  4,5,  7,8,9   ,11,12         ], baix).
info(6, [1,  3,4,  6               ,13,14,15], viny).
info(7, [1,2,3,4,5,  7,8,9,10,   12,   14   ], rasa).
info(8, [1,        6,    9,10,11,   13      ], dalt).
info(9, [1,2,3,  5,  7,8,     11,12,13,14,15], baix).
info(10,[1,2,3,4,5,6,7,8,9,10,   12,      15], rasa).
info(11,[1,    4,  6,7,  9,10,11,   13,14   ], dalt).
info(12,[  2,    5,    8,9,      12,      15], viny).
info(13,[1,  3,  5,6,7,  9,10,11,12,13,14,15], viny).
info(14,[    3,      7,8,  10,   12   ,14   ], dalt).
info(15,[1,2,3,  5,6,  8,9,10,11,12,   14,15], rasa).					     

%%%%%%%%%%%%%%%%% end input %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%Helpful prolog predicates:
neighbor(N):-numNeighbors(K), between(1,K,N).
neighborRepresentedBy(N,L):-info(N,L,_).
neighborNeighborhood(N,NH):-info(N,_,NH).

%%%%%%  SAT Variables:
satVariable( chosen(N) ):- neighbor(N).

writeClauses:-
    exactlyNumReps,
    everyBodyRepresented,
    differentNeighborhoods,
    true,!.                    % this way you can comment out ANY previous line of writeClauses
writeClauses:- told, nl, write('writeClauses failed!'), nl,nl, halt.

exactlyNumReps:-
    numRepresentatives(K),
    findall(chosen(N),neighbor(N),L),
    exactly(K,L),fail.
exactlyNumReps.

everyBodyRepresented:-
    neighborRepresentedBy(_,L),
    findall(chosen(N1),member(N1,L),Cl),
    writeClause(Cl),
    fail.
everyBodyRepresented.

differentNeighborhoods:-
    neighborNeighborhood(N1,NH),  neighborNeighborhood(N2,NH), N1 \= N2,
    writeClause([-chosen(N1), -chosen(N2)]),fail.
differentNeighborhoods.
    


%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% show the solution. Here M contains the literals that are true in the model:
displaySol(_):- write('Elected: '), nl, fail.
displaySol(M):- neighbor(N), member(chosen(N), M), neighborNeighborhood(N,NH),write(N), write('-'), write(NH), nl, fail.
displaySol(_):- nl.
%%%%%%%%%%%%%%%%%%%%%%%%%%%


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Everything below is given as a standard library, reusable for solving 
%    with SAT many different problems.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Express that Var is equivalent to the disjunction of Lits:
expressOr( Var, Lits) :- symbolicOutput(1), write( Var ), write(' <--> or('), write(Lits), write(')'), nl, !. 
expressOr( Var, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, Var ]), fail.
expressOr( Var, Lits ):- negate(Var,NVar), writeClause([ NVar | Lits ]),!.

% Express that Var is equivalent to the conjunction of Lits:
expressAnd( Var, Lits) :- symbolicOutput(1), write( Var ), write(' <--> and('), write(Lits), write(')'), nl, !. 
expressAnd( Var, Lits):- member(Lit,Lits), negate(Var,NVar), writeClause([ NVar, Lit ]), fail.
expressAnd( Var, Lits):- findall(NLit, (member(Lit,Lits), negate(Lit,NLit)), NLits), writeClause([ Var | NLits]), !.

%%%%%% Cardinality constraints on arbitrary sets of literals Lits:

exactly(K,Lits):- symbolicOutput(1), write( exactly(K,Lits) ), nl, !.
exactly(K,Lits):- atLeast(K,Lits), atMost(K,Lits),!.

atMost(K,Lits):- symbolicOutput(1), write( atMost(K,Lits) ), nl, !.
atMost(K,Lits):-   % l1+...+ln <= k:  in all subsets of size k+1, at least one is false:
	negateAll(Lits,NLits),
	K1 is K+1,    subsetOfSize(K1,NLits,Clause), writeClause(Clause),fail.
atMost(_,_).

atLeast(K,Lits):- symbolicOutput(1), write( atLeast(K,Lits) ), nl, !.
atLeast(K,Lits):-  % l1+...+ln >= k: in all subsets of size n-k+1, at least one is true:
	length(Lits,N),
	K1 is N-K+1,  subsetOfSize(K1, Lits,Clause), writeClause(Clause),fail.
atLeast(_,_).

negateAll( [], [] ).
negateAll( [Lit|Lits], [NLit|NLits] ):- negate(Lit,NLit), negateAll( Lits, NLits ),!.

negate( -Var,  Var):-!.
negate(  Var, -Var):-!.

subsetOfSize(0,_,[]):-!.
subsetOfSize(N,[X|L],[X|S]):- N1 is N-1, length(L,Leng), Leng>=N1, subsetOfSize(N1,L,S).
subsetOfSize(N,[_|L],   S ):-            length(L,Leng), Leng>=N,  subsetOfSize( N,L,S).


%%%%%% main:

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
treatResult( _):- write('cnf input error. Wrote anything strange in your cnf?'), nl,nl, halt.
    

initClauseGeneration:-  %initialize all info about variables and clauses:
	retractall(numClauses(   _)),
	retractall(numVars(      _)),
	retractall(varNumber(_,_,_)),
	assert(numClauses( 0 )),
	assert(numVars(    0 )),     !.

writeClause([]):- symbolicOutput(1),!, nl.
writeClause([]):- countClause, write(0), nl.
writeClause([Lit|C]):- w(Lit), writeClause(C),!.
w(-Var):- symbolicOutput(1), satVariable(Var), write(-Var), write(' '),!. 
w( Var):- symbolicOutput(1), satVariable(Var), write( Var), write(' '),!. 
w(-Var):- satVariable(Var),  var2num(Var,N),   write(-), write(N), write(' '),!.
w( Var):- satVariable(Var),  var2num(Var,N),             write(N), write(' '),!.
w( Lit):- told, write('ERROR: generating clause with undeclared variable in literal '), write(Lit), nl,nl, halt.


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
