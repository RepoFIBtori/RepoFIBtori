%% The catalan supermarket CATSUP is open every day during 10 hours (from 10am to 8pm).
%% It wants to schedule the working times of its employees during a period of days.
%%    -For each hour h in this period, CATSUP has made a prediction of the number N_h employees
%%     that should work during hour h.
%%    -Each employee can work at most a given number of hours per day.
%%    -Nobody works more than a given number of consecutive working days in a row.

:- dynamic(varNumber/3).
:- dynamic(employeeRange/1).    % Aqui va el rango L-R de empleados que podemos utilizar

symbolicOutput(0). % set to 1 to see symbolic output only; 0 otherwise.

%%%%%%%%%%%%%%%%%%%%% toy input example:

%At hour H, exactly NH employees must work
employeesNeeded(H,NH):- HourInDay is (H-1) mod 10 + 1, needed(HourInDay,NH),!.
%needed( 1,1).  % early in the morning: only 1 worker needed
%needed( 2,2).
%needed( 3,3).
%needed( 4,4).  % central hours of the day: more workers
%needed( 5,4).
%needed( 6,4).
%needed( 7,4).
%needed( 8,3).
%needed( 9,2).
%needed(10,1).  % late in the day: only 1 worker needed

% easy problem
needed( 1,1).
needed( 2,1).
needed( 3,1).
needed( 4,1).
needed( 5,1).
needed( 6,1).
needed( 7,1).
needed( 8,1).
needed( 9,1).
needed(10,1).


numEmployees(15).
numHours(100).
numDays(10).
maxConsecutiveDays(4).
maxHoursPerDay(5).

%%%%%% Some helpful definitions to make the code cleaner:
employee(E):- numEmployees(N), between(1,N,E).
hour(H):-         numHours(N), between(1,N,H).
day(D):-           numDays(N), between(1,N,D).
hourOfDay(H,D):- day(D), hour(H), D is 1 + (H-1) div 10.

%%%%%% writeClauses:
% We use the following types of symbolic propositional variables:
%   1. wh-I-H means: "worker I works during hour H"
%   2. wd-I-D means: "worker I works on day D"
%   3. ww-I   means: "worker I does work"

writeClauses:-     initClauseGeneration,
    relationshipBetweenVars,
    enoughPeopleAtEachHour,
    notTooManyConsecutiveDays,
    maxHoursPerDay,
    relationshipBetweenVars2,
    atMostNWorkers,
    true.


%% Relationship between the variables wh and wd for each worker i:
%% For each day d with hours h1...h10, we express wd-i-d  <->  wh-i-h1 v...v wh-i-h10.
relationshipBetweenVars:- employee(I), day(D), findall( wh-I-H, hourOfDay(H,D), Lits ), expressOr( wd-I-D, Lits ), fail.
relationshipBetweenVars.

%% Enough people work at each hour:
%% One cardinality constraint wh-1-h+...+wh-N-h >= N_h for each hour h
%enoughPeopleAtEachHour:- hour(H), employeesNeeded(H,NH), findall(wh-I-H, employee(I), Lits), atLeast(NH,Lits), fail.
enoughPeopleAtEachHour:- hour(H), employeesNeeded(H,NH), findall(wh-I-H, employee(I), Lits), exactly(NH,Lits), fail.
enoughPeopleAtEachHour.


%% No worker works on M+1 consecutive days:
%% For each worker i and day d one clause \+wd-i-d v \+wd-i-d+1 v...v \+wd-i-d+M.
notTooManyConsecutiveDays:-
    maxConsecutiveDays(M), employee(I), day(D), DM is D+M, day(DM),
    findall( \+wd-I-Di, between(D,DM,Di), Lits ), writeClause(Lits), fail.
notTooManyConsecutiveDays.

% No employee works too many hours a day
maxHoursPerDay:- maxHoursPerDay(M), employee(I), day(D), findall( wh-I-H, hourOfDay(H,D), Lits ), atMost(M,Lits), fail.
maxHoursPerDay.


% Relationship between the variables wh and ww for each worker i:
% For each worker i and all H hours, we express ww-i  <->  wh-i-h1 v...v wh-i-hH.
relationshipBetweenVars2:- employee(I), findall( wh-I-H, hour(H), Lits ), expressOr( ww-I, Lits ), fail.
relationshipBetweenVars2.

% Find max numer of employees for this iteration
maxEmployeesNeeded(N):- employeeRange(L-R), N is (L+R)//2.  % "//" is integer division

% We can't use more than a certain number of employees
% One cardinality constraint ww-1+...+ww-N =< M
atMostNWorkers:- maxEmployeesNeeded(M), findall(ww-I, employee(I), Lits), atMost(M,Lits), fail.
atMostNWorkers.


% express that V is equivalent to the disjunction of Lits:
expressOr( V, Lits ):- member(Lit,Lits), negate(Lit,NLit), writeClause([ NLit, V ]), fail.
expressOr( V, Lits ):- negate(V,NV), writeClause([ NV | Lits ]),!.

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
subsetOfSize(N,[X|L],[X|S]):- N1 is N-1, subsetOfSize(N1,L,S).
subsetOfSize(N,[_|L],   S ):-            subsetOfSize( N,L,S).

%%%%%% show the solution:

% displaySol(M): displays the symbolic model M (the set of true symbolic variables):
displaySol(M):- sort(M,M1), nl,nl,
		write('At each hour, who is working? '),             nl, displaySol1(M1), nl,nl,
		write('For each employee, when is (s)he working? '), nl, displaySol2(M1), !.

displaySol1(M):- hour(H),     nl, write('hour '),     write(H), write(': '), member(wh-I-H, M), write(I), write(' '), fail.
displaySol1(_):- nl,nl,!.

displaySol2(M):- employee(I), nl, write('employee '), write(I), write(' works on days:  '),
		 member(wd-I-D, M), write(D), write(' '), fail.
displaySol2(M):- nl,nl,employee(I), nl, write('employee '), write(I), write(' works on hours: '),
		 member(wh-I-H, M), write(H), write(' '), fail.
displaySol2(_):- nl,nl,!.

displaySol2([]).
displaySol2([wd-I-D|S]):-  write('employee '),      write(I), write(': day '),  write(D), nl, displaySol2(S).
displaySol2([wh-I-H|S]):-  write('              '), write(I), write(': hour '), write(H), nl, displaySol2(S).


%%%%%% main:

% print range and numer of employees for this iteration
doPrint:- maxEmployeesNeeded(E), employeeRange(L-R),
  write("Interval = ["), write(L), write('-'), write(R), write("]; Max employees = "), write(E), nl.

% set the initial range 0-numEmployees and start
main:- numEmployees(E), assert(employeeRange(0-E)), doPrint, main2.

main2:-  symbolicOutput(1), !, writeClauses, halt.   % print the clauses in symbolic form and halt
main2:-  tell(clauses), writeClauses, told,          % generate the (numeric) SAT clauses and call the solver
	tell(header),  writeHeader,  told,
	numVars(N),numClauses(C),
	write('Generated '), write(C), write(' clauses over '), write(N), write(' variables. '),nl,
	shell('cat header clauses > infile.cnf',_),
	shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
	treatResult(Result), !.


% if unsat and L<R, look for the solution in the higher part of the interval
treatResult(20):- employeeRange(L-R), L<R,
  maxEmployeesNeeded(E),
  retract(employeeRange(_)),
  LI is E+1, assert(employeeRange(LI-R)),
  doPrint,
  main2.

% if unsat and L>=R, but we have no interval left, we need to ask the user for more employees to start off
treatResult(20):- employeeRange(L-R), L>=R,
  write("The given number of employees is not enough. Try with a higher value for 'numEmployees'\n"), halt.

% if sat and L>=R, then we have found our optimal solution
treatResult(10):- employeeRange(L-R), L>=R,
  shell('cat model',_), see(model), symbolicModel(M), seen, displaySol(M), halt.

% if sat and L<R, search the lower part of the interval
treatResult(10):- employeeRange(L-R), L<R,
  maxEmployeesNeeded(E),
  retract(employeeRange(_)),
  assert(employeeRange(L-E)),
  doPrint,
  main2.


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
