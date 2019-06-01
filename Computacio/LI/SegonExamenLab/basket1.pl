%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To use this prolog template for other optimization problems, replace the code parts 1,2,3,4 below. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% This was the original lab exercise:
%
% This Prolog source designs a Basketball League with N teams, with
% N-1 rounds (playing days), where every two teams play against each
% other on exactly one round, one team at home and the other team
% away, and on each round each team has exactly one match (home or away).
% Moreover, we say that a team has a "double" on round R iff it plays
% at home on rounds R-1 and on round R, or if it plays away on R-1 and on R.
% No "triples" are allowed: no three consecutive homes, nor three aways.
% The number of doubles of the team with the largest number of doubles is minimized.
% Also (see the input example below):
%  1. No doubles on certain rounds
%  2. Movistar has bought the tv rights for Sunday 8pm for all
%     matches among a group of teams (the so-called tv Teams) and wants
%     on every round at least one match between two tv Teams.
%  3. On certain rounds certain teams cannot play at home.


% This was what had to be added for the exam:
% Now ADD both the following additional constraints for this exam:
%
%
%  Each team should get approximately half its matches home, that is, N/2 or N/2 - 1, where N is the number of teams.
%
%  The teams 1,2,3,4 are from the same city. On each round, always two of them should play home and two away.
%

%%%%%%%%%%%%%%%%%%%%% toy input example:

numTeams(14).               % This number is always even.
noDoubles([3,6,7,12,13]).   % No team has a double on any of these rounds.
tvTeams([1,2,3,4,5,6]).     % The list of tv teams.
notHome( 1, [2,5,7,9]).     % Team 1 cannot play at home on round 2, also not on round 5, etc.
notHome( 2, [4,6,8,10]).
notHome( 3, [2,5,7,9,12]).
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1.- Declare SAT variables to be used
satVariable(match(S,T,R)):- team(S), team(T), round(R).   %meaning  "on round R there is a match S-T at home of S"
satVariable(home(S,R)   ):- team(S), round(R).            %meaning  "team S plays at home on round R"
satVariable(double(S,R) ):- team(S), round(R).            %meaning  "team S has a double on round R"



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. This predicate writeClauses(MaxCost) generates the clauses that guarantee that
% a solution with cost at most MaxCost is found


% 1. This predicate writeClauses(MaxCost) generates the clauses for the given MaxCost:
writeClauses(MaxCost):-
    eachTeamEachRoundExactlyOneMatch,
    everyTwoTeamsPlayExactlyOnce,
    matchImpliesHomeOrNot,
    relationHomeAndDouble,
    noDoubles,
    eachRoundTVMatch,
    notHomes,
    noTriples,
    maxCost(MaxCost),
    eachTeamAproxHalfTheRoundsHomeHalfAway,
    eachRoundTwoHomeTwoAwayOf1234,
    true,!.
writeClauses(_):- told, nl, write('writeClauses failed!'), nl,nl, halt.

eachRoundTwoHomeTwoAwayOf1234 :-

	round(R),
	exactly(2,[home(1,R),home(2,R),home(3,R),home(4,R)]),
	fail.
eachRoundTwoHomeTwoAwayOf1234.

eachTeamAproxHalfTheRoundsHomeHalfAway :-
	numTeams(N),
	team(S),
	N1 is N/2,
	N2 is  N1 - 1,
	findall(home(S,R),round(R),L),
	atLeast(N2,L),
	atMost(N1,L),
	fail.
eachTeamAproxHalfTheRoundsHomeHalfAway.


%% If you want to train on the original lab exercise, remove the following lines until point 3:
%%
%%
%%
eachTeamEachRoundExactlyOneMatch:- team(T), round(R),
    findall( match(S,T,R), difTeams(S,T), LitsH ),
    findall( match(T,S,R), difTeams(S,T), LitsA ), append(LitsH,LitsA,Lits), exactly(1,Lits), fail.
eachTeamEachRoundExactlyOneMatch.

everyTwoTeamsPlayExactlyOnce:- difTeams(S,T), S>T,
    findall( match(S,T,R), round(R),      LitsH ),
    findall( match(T,S,R), round(R),      LitsA ), append(LitsH,LitsA,Lits), exactly(1,Lits), fail.
everyTwoTeamsPlayExactlyOnce.

matchImpliesHomeOrNot:- difTeams(S,T), round(R),
    writeClause([ -match(S,T,R),   home(S,R) ]),
    writeClause([ -match(S,T,R), -home(T,R) ]), fail.
matchImpliesHomeOrNot.

relationHomeAndDouble:- team(S), round(R1), R2 is R1+1, round(R2),
    writeClause([  -home(S,R1),  -home(S,R2),    double(S,R2) ]),
    writeClause([   home(S,R1),   home(S,R2),    double(S,R2) ]),
    writeClause([  -home(S,R1),   home(S,R2),   -double(S,R2) ]),
    writeClause([   home(S,R1),  -home(S,R2),   -double(S,R2) ]), fail.
relationHomeAndDouble.

noDoubles:- noDoubles(L), member(R,L), team(S), writeClause([ -double(S,R) ]), fail.
noDoubles.

eachRoundTVMatch:- round(R),  findall(match(S,T,R),tvMatch(S,T),Lits),  writeClause(Lits), fail.
eachRoundTVMatch.

notHomes:- away(T,R), writeClause([ -home(T,R) ]), fail.
notHomes.

noTriples:- team(S), round(R1), R1>1, R2 is R1+1, round(R2),
    writeClause([  -double(S,R1), -double(S,R2) ]), fail.
noTriples.

maxCost(infinite):-!.
maxCost(Max):- team(T), findall(double(T,R), (round(R),R>1), Lits ), atMost(Max,Lits), fail.
maxCost(_).


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. This predicate displays a given solution M:

displaySol(M):- round(R), nl,  write('Round '), write2(R), write(':  '),
		member(match(S,T,R),M),  write('  '), writeMatch(S-T), fail.
displaySol(M):- nl, team(T), nl, write('Doubles of team '), write2(T), write(':      '),
		round(R), member(double(T,R),M), write('  '), write2(R), fail.
displaySol(M):- nl, team(T), nl, findall( R, member(home(T,R),M), L), length(L,N), write(N),
		write(' home matches of team '), write2(T), write(':      '),
		round(R), wHome(R,T,M), fail.
displaySol(M):- nl,nl, write('Tv matches: '), round(R), nl, write('Round '), write2(R), write(':  '),
		member(match(S,T,R), M ), tvMatch(S,T), write(' '), writeMatch(S-T), fail.
displaySol(_):- nl, nl, write('======================================================================'), nl,nl,nl,!.

wHome(R,T,M):- member(home(T,R),M), write('  h'), write2(R),!.
wHome(R,_,_):-                     write('   '), write2(R),!.

writeMatch(S-T):- write2(S), write('-'), write2(T), !.
write2(R):- R<10,!,write('0'),write(R),!.
write2(R):- write(R),!.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. This predicate computes the cost of a given solution M:
%
costOfThisSolution(M,Cost):- findall(N,(team(T),numberDoubles(T,M,N)), L), max_list(L,Cost),!.

numberDoubles(T,M,N):- findall( R, member(double(T,R),M), L), length(L,N), !.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% No need to modify anything beow this line:
symbolicOutput(0).
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
    costOfThisSolution(BestModel,Cost), write('Unsatisfiable. So the optimal solution was the previous one with cost '),
    write(Cost), write('.'), nl,nl,halt.
treatResult(10,_):- %   shell('cat model',_),
    write('Solution found '), flush_output,
    see(model), symbolicModel(M), seen,
    costOfThisSolution(M,Cost),
    write('with cost '), write(Cost), nl,nl,
    displaySol(M),
    Cost1 is Cost-1,   nl,nl,nl,nl,nl,  write('Now looking for solution with cost '), write(Cost1), write('...'), nl,
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
