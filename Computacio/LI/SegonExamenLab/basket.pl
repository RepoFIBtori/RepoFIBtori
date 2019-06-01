%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To use this prolog template for other optimization problems, replace the code parts 1,2,3 below. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Extend this Prolog source to design a Basketball League with N
% teams, with N-1 rounds (playing days), where every two teams play
% against each other on exactly one round, one team at home and the other team
% away, and on each round each team has exactly one match (home or away).
% Moreover, we say that a team has a "double" on round R if it plays
% at home on rounds R-1 and on round R, or if it plays away on R-1 and on R.
% No "triples" are allowed: no three consecutive homes, nor three aways.
% Minimize the number of doubles of the team with the largest number of doubles.

% Additional constraints (see the input example below):
%  1. No doubles on certain rounds
%  2. Movistar has bought the tv rights for Sunday 8pm for all
%     matches among a group of teams (the so-called tv Teams) and wants
%     on every round at least one match between two tv Teams.
%  3. On certain rounds certain teams cannot play at home.


%%%%%%%%%%%%%%%%%%%%% toy input example:

numTeams(14).               % This number is always even.
noDoubles([2,8,13]).        % No team has a double on any of these rounds.
tvTeams([1,2,3,4,5,6]).     % The list of tv teams.
notHome( 1, [2,5,7,9,10]).  % Team 1 cannot play at home on round 2, also not on round 5, etc.
notHome( 2, [4,6,8,10]).
notHome( 3, [2,3,5,7,9,10]).
notHome( 4, [4,6,8,12]).
notHome( 5, [1,3,12]).
notHome( 6, [1,3,5,7,10]).
notHome( 7, [1,3,5,7,9]).
notHome( 8, [1,3,5,7,9]).
notHome( 9, [1,4,8,10]).
notHome(10, [2,4,8,9,11]).
notHome(11, [2,4,8,12]).
notHome(12, [6]).
notHome(13, [6,10,11,13]).
notHome(14, [2,4]).


%%%%%% Some helpful definitions to make the code cleaner:

team(T):- numTeams(N), between(1,N,T).
difTeams(S,T):- team(S), team(T), S\=T.
round(R):- numTeams(N), N1 is N-1, between(1,N1,R).
tvMatch(S,T):- tvTeams(TV), member(S,TV), member(T,TV), S\=T.
away(T,R):- notHome(T,L), member(R,L).

%%%%%%  Variables: It is mandatory to use these variables!
% match-S-T-R    meaning  "on round R there is a match S-T at home of S"
% home-S-R       meaning  "team S plays at home on round R"
% double-S-R     meaning  "team S has a double on round R"

symbolicOutput(0).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1. This predicate writeClauses(MaxCost) generates the clauses for the given MaxCost:

juntemvariables1 :-
	difTeams(S,T),
	round(R),
	writeClause([\+match-S-T-R,home-S-R]),
	writeClause([\+match-S-T-R,\+home-T-R]),
	fail.
juntemvariables1.

juntemvariables2 :-
	round(R),
	R1 is R - 1,
	round(R1),
	team(S),
	writeClause([\+home-S-R,\+home-S-R1,double-S-R]),
	writeClause([home-S-R,home-S-R1,double-S-R]),
	writeClause([\+home-S-R,home-S-R1,\+double-S-R]),
	writeClause([home-S-R,\+home-S-R1,\+double-S-R]),
	fail.
juntemvariables2.

juntemvariables3 :-
	round(R),
	R1 is R-1,
	round(R1),
	team(S),
	writeClause([home-S-R,home-S-R1,double-S-R]),
	fail.
juntemvariables3.


maxcost(MaxCost) :-
	team(T),
	findall(double-T-R, round(R), L),
	atMost(MaxCost,L).

eachteamplaysoneachround :-
	round(R),
	team(T),
	findall(match-S-T-R, team(S), L),
	exactly(1,L),
	fail.
eachteamplaysoneachround.

teamcantplayhome :-
	team(S),
	away(S,R),
	writeClause([\+home-S-R]),
	fail.
teamcantplayhome.

nodoublescertainrounds :-
	team(S),
	noDoubles(L),
	member(R,L),
	writeClause([\+double-S-R]),
	fail.
nodoublescertainrounds.

tvrestriction :-
	round(R),
	findall(match-S-T-R, tvMatch(S,T), L),
	atLeast(1,L),
	fail.
tvrestriction.

notriplets :-
	round(R),
	R1 is R-1,
	round(R1),
	team(T),
	writeClause([\+double-T-R, \+double-T-R1]),
	fail.

writeClauses(MaxCost):-
		juntemvariables1,
		juntemvariables2,
		juntemvariables3,
		eachteamplaysoneachround,
		teamcantplayhome,
		nodoublescertainrounds,
		%notriplets,
		tvrestriction,
    maxCost(MaxCost),
    true,!.
writeClauses(_):- told, nl, write('writeClauses failed!'), nl,nl, halt.



maxCost(infinite):-!.
maxCost(Max):- team(T), findall(double-T-R, round(R), Lits ), atMost(Max,Lits), fail.
maxCost(_).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. This predicate displays a given solution M:

displaySol(M):- round(R), nl,  write('Round '), write2(R), write(':  '),
		member(match-S-T-R,M),  write('  '), writeMatch(S-T), fail.
displaySol(M):- nl, team(T), nl, write('Doubles of team '), write2(T), write(':      '),
		round(R), member(double-T-R,M), write('  '), write2(R), fail.
displaySol(M):- nl,nl, write('Tv matches: '), round(R), nl, write('Round '), write2(R), write(':  '),
		member(match-S-T-R, M ), tvMatch(S,T), write(' '), writeMatch(S-T), fail.
displaySol(_):- nl, nl, write('======================================================================'), nl,nl,nl,!.

writeMatch(S-T):- write2(S), write('-'), write2(T), !.
write2(R):- R<10,!,write('0'),write(R),!.
write2(R):- write(R),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. This predicate computes the cost of a given solution M:
%
costOfThisSolution(M,Cost):- between(0,20,I), Cost is 20-I, team(T), findall(R,member(double-T-R,M),L), length(L,Cost), !.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No need to modify anything beow this line:

main:-  symbolicOutput(1), !, writeClauses(infinite), halt.   % print the clauses in symbolic form and halt
main:-
    told, write('Looking for initial solution with arbitrary cost...'), nl,
    initClauseGeneration,
    tell(clauses), writeClauses(infinite), told,
    tell(header),  writeHeader,  told,
    numVars(N), numClauses(C),
    write('Generated '), write(C), write(' clauses over '), write(N), write(' variables. '),nl,
    shell('cat header clauses > infile.cnf',_),
    write('Launching picosat...'), nl,
    shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
    treatResult(Result,[]),!.

treatResult(20,[]       ):- write('No solution exists.'), nl, halt.
treatResult(20,BestModel):-
    nl,nl, costOfThisSolution(BestModel,Cost), write('Unsatisfiable. So the optimal solution was this one with cost '),
    write(Cost), write(':'), nl, displaySol(BestModel), halt.
treatResult(10,_):- %   shell('cat model',_),
    write('Solution found '), flush_output,
    see(model), symbolicModel(M), seen,
    costOfThisSolution(M,Cost),
    write('with cost '), write(Cost), nl,nl,
    displaySol(M),
    Cost1 is Cost-1,     write('Now looking for solution with cost '), write(Cost1), write('...'), nl,
    initClauseGeneration, tell(clauses), writeClauses(Cost1), told,
    tell(header),  writeHeader,  told,
    numVars(N),numClauses(C),
    write('Generated '), write(C), write(' clauses over '), write(N), write(' variables. '),nl,
    shell('cat header clauses > infile.cnf',_),
    write('Launching picosat...'), nl,
    shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
    treatResult(Result,M),!.
treatResult(_,_):- write('cnf input error. Wrote something strange in your cnf?'), nl,nl, halt.


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


:-dynamic(varNumber/3).
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Standard library for cardinality constraints library on arbitrary sets of literals Lits:
%
% E.g., to generate the clauses expressing that exactly K literals of the list Lits are true:
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

% Express that Var is equivalent to the disjunction of Lits:
expressOr( Var, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, Var ]), fail.
expressOr( Var, Lits ):- negate(Var,NVar), writeClause([ NVar | Lits ]),!.

% Express that Var is equivalent to the conjunction of Lits:
expressAnd( Var, Lits ):- negate(Var,NVar), member(Lit,Lits),  writeClause([ NVar, Lit ]), fail.
expressAnd( Var, Lits ):- negateAll(Lits,NLits), writeClause([ Var | NLits ]),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
