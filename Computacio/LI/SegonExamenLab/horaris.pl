	:-dynamic(varNumber / 3).
symbolicOutput(0).  % set to 1 to see symbolic output only; 0 otherwise.

%% A university wants us to design to weekly schedule of a certain
%% degree, whose courses are organized in years (e.g. PRO1 is from
%% year 1, whereas EDA belong to year 2). The schedule should range
%% from Monday to Friday and from 8am until 8pm (i.e. last lecture
%% finishes at 8pm and hence we have 12 hours per day). For that
%% purpose, we know the set of existing courses, the set of available
%% rooms and the set of available professors. All lectures are
%% one-hour long, and all lectures of a given course are given by the
%% same professor and in the same room.  However, not every professor
%% can teach any course and similarly, not every course can be held at
%% any room.
%%
%% For each course we know:
%% - the year it belongs to
%% - the number of hours per week
%% - the list of rooms where this course can be taught
%% - the list of professors that can teach this course
%%
%% Consider that each course can have at most one-hour lecture per
%% day. Obviously, two courses cannot be simultaneously held at the
%% same room and no professor can simultaneously teach two
%% courses. Also, two courses from the same year cannot overlap in
%% time, since otherwise students of that year could not attend all
%% courses. Complete the following program in order to find a schedule
%% that uses the minimum number of professors.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% To use this prolog template for other optimization problems, replace the code parts 1,2,3,4 below. %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


%% Find the minimal number of colors needed to color a graph.
%% Example input:

numYears(4).
numCourses(23).
numRooms(3).
numProfessors(10).

% Sintaxi: course(year,courseId,numHoursPerWeek,possibleRooms,possibleProfessors).
course(1,1,3,[1,2,3],[5,8]).
course(1,2,5,[2,3],[1,7]).
course(1,3,5,[1],[1,3,5,7,10]).
course(1,4,3,[1,2],[2,3,4]).
course(1,5,5,[1,2,3],[1,2,4,5,9]).

course(2,6,3,[2],[1,2,3,4,6,9]).
course(2,7,5,[1,3],[1,2,3]).
course(2,8,4,[1,2,3],[3,5,8,10]).
course(2,9,5,[1,2,3],[4,7]).
course(2,10,4,[2,3],[1,3,4,5]).

course(3,11,3,[2],[1,2,3,4,5,9]).
course(3,12,4,[1,3],[2,4,5,6]).
course(3,13,3,[3],[1,2,3,5,7,10]).
course(3,14,3,[1],[1,2,3,4,5]).
course(3,15,5,[1],[1,3,4,5,7,9]).
course(3,16,3,[1],[1,2,3,4,5]).

course(4,17,3,[1],[2,6,8]).
course(4,18,4,[1,2,3],[4,7,9]).
course(4,19,4,[1,2,3],[1,2,3,4,5]).
course(4,20,3,[1,2,3],[1,3,5,9]).
course(4,21,3,[3],[1,3,4,5,7,8]).
course(4,22,3,[1,2,3],[1,2,3,4,10]).
course(4,23,5,[3],[1,3,4,6,8,10]).


%%%%%% Some helpful definitions to make the code cleaner:
course(C):-              numCourses(N), between(1,N,C).
room(R):-                numRooms(N), between(1,N,R).
professor(P):-           numProfessors(N), between(1,N,P).
year(Y):-                numYears(N), between(1,N,Y).
day(D):-                 between(1,5,D).
hour(H):-                between(8,19,H).
courseYear(C,Y):-        course(Y,C,_,_,_).
courseHours(C,Hs):-      course(_,C,Hs,_,_).
courseRooms(C,LR):-      course(_,C,_,LR,_).
courseProfessors(C,LP):- course(_,C,_,_,LP).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 1.- Declare SAT variables to be used
% cdh(C,D,H) meaning "course C taught on day D, hour H"
satVariable( cdh(C,D,H) ):- course(C), day(D), hour(H).
% cp(C,P) meaning "course C taught by professor P"
satVariable( cp(C,P)    ):- course(C), professor(P).
% cr(C,R) meaning "course C taught in room R"
satVariable( cr(C,R)    ):- course(C), room(R).

% meaning "course C in Day D"
satVariable(cd(C,D) ) :- course(C),day(D).

satVariable(p(P)) :- professor(P).

%% Use at least the previuos variables. Otherwise you should change displaySol.
%% However, more variables might be needed....

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 2. This predicate writeClauses(MaxCost) generates the clauses that guarantee that
% a solution with cost at most MaxCost is found

%% RESTRICCIONS
%% totes les classes dun curs concret es donen pel mateix profe i en la mateixa classe
%% la classe sha de fer en una aula possible
%% la classe  sha de fer per un professor possible
%% minim hores per setmana per classe
%% cada curs maxim una hora per dia
%% dos cursos no es poden solapar en la mateixa classe
%% dos professors no poden fer classe a la vegada
%% dos cursos del mateix any no es poden fer a la vegada

juntemprofessors :-
	course(C),
	professor(P),
	writeClause([-cp(C,P),p(P)]),
	fail.
juntemprofessors.

maximprofessors(N) :-
	findall(p(P),professor(P),L),
	exactly(N,L).

restriccioclasses :-
	course(C),
	day(D),
	findall(cdh(C,D,H),hour(H),L),
	expressOr(cd(C,D),L),
	fail.
restriccioclasses.

notsolappingcourse :-
	course(C1),
	courseYear(C1,Y1),
	course(C2),
	courseYear(C2,Y2),
	Y1 = Y2,
	C1 > C2,
	hour(H),
	day(D),
	writeClause([-cdh(C1,D,H),-cdh(C2,D,H)]),
	fail.
notsolappingcourse.

eachcourseatmostmaxhours :-
	course(C),
	courseHours(C,H1),
	findall(cd(C,D),day(D),L),
	exactly(H1,L),
	fail.
eachcourseatmostmaxhours.

eachcourseonehourday :-
	course(C),
	day(D),
	findall(cdh(C,D,H),hour(H),L),
	atMost(1,L),
	fail.
eachcourseonehourday.

eachroomonecourse :-
	room(R),
	course(C1),
	course(C2),
	day(D),
	hour(H),
	C1 > C2,
	writeClause([-cr(C1,R),-cr(C2,R),-cdh(C1,D,H),-cdh(C2,D,H)]),
	fail.
eachroomonecourse.

eachprofessorscantteleport :-
	professor(P),
	course(C1),
	course(C2),
	C1 \= C2,
	day(D),
	hour(H),
	writeClause([-cp(C1,P),-cp(C2,P),-cdh(C1,D,H),-cdh(C2,D,H)]),
	fail.
eachprofessorscantteleport.

eachcourseoneroom :-
	course(C),
	findall(cr(C,R),(room(R),courseRooms(C,LP),member(R,LP)),L),
	exactly(1,L),
	fail.
eachcourseoneroom.

professormembercourse :-
	course(C),
	findall(cp(C,P),(professor(P),courseProfessors(C,LP),member(P,LP)),L),
	exactly(1,L),
	fail.
professormembercourse.

writeClauses(infinite):- !, N = 1000, writeClauses(N),!. % N = 1000 should be replaced with by right N
writeClauses(MaxNumProf):-
	eachprofessorscantteleport, %un profe no pot estar fent dos classes a la vegada
	eachroomonecourse,			%en dia i hora concret nomes es pot fer un curs en una classe concreta
	restriccioclasses,				%juntem variable cd amb cdh
	eachcourseatmostmaxhours,	%curs per setmana hores concretes
	notsolappingcourse,			%dos cursos amb el mateix any no es solapen
	professormembercourse,		%un curs te un professor
	eachcourseonehourday,		%cada curs maxim una hora al dia
	eachcourseoneroom,			%cada curs exactament una aula
	juntemprofessors,				%juntem variable cp amb p
	maximprofessors(MaxNumProf),
  true,!.
writeClauses(_):- told, nl, write('writeClauses failed!'), nl,nl, halt.



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 3. This predicate displays a given solution M:

printWithSpacesIfNeeded(C,P,R):-
    C < 10, !, write(c-0), write(C-p-P-r-R).
printWithSpacesIfNeeded(C,P,R):-
    write(c-C-p-P-r-R).

printCourseYearDayHour(Y,D,H,M):-
    member(cdh(C,D,H),M), courseYear(C,Y), !, member(cp(C,P),M), member(cr(C,R),M), printWithSpacesIfNeeded(C,P,R).
printCourseYearDayHour(_,_,_,_):-write('............').

writeNDashes(N):- between(1,N,_), write('='), fail.
writeNDashes(_).

writeDashes(N):- N < 10, !, writeNDashes(78).
writeDashes(_):- writeNDashes(77).

displaySchedule(M):-
    hour(H), nl, nl, write(H), write(":00    "), writeDashes(H),
    year(Y), nl, write('Year '), write(Y),write('\t'),
    day(D),
    printCourseYearDayHour(Y,D,H,M),
    write('\t'),
    fail.

displayDays:-
    nl,write('INFORMATION!!!!: c-CC-p-P-r-R means course C with professor P and room R'),nl,nl,
    write('        '),
    member(X,['Monday  ', ' Tuesday ', ' Wednesday', 'Thursday ', 'Friday  ']),
    write(X), write('       '), fail.
displayDays.

displaySol(M):- nl, nl, displayDays, displaySchedule(M), nl, nl, fail.
displaySol(M):- nl,nl,courseHours(C,NH), write('Course '), write(C), write(' should have '), write(NH), write(' hours: '), findall([d-D,h-H],member(cdh(C,D,H),M),L), write(L), nl, fail.
displaySol(M):- nl,nl, courseProfessors(C,LP), write('Course '), write(C), write(' should have one of these professors: '), write(LP), write(' and it has: '), member(cp(C,P),M), write(P), nl, fail.
displaySol(M):- nl,nl, courseRooms(C,LR), write('Course '), write(C), write(' should have one of these rooms: '), write(LR), write(' and it has: '), member(cr(C,R),M), write(R), nl, fail.
displaySol(_):- nl,!.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% 4. This predicate computes the cost of a given solution M:

%costOfThisSolution(M,Cost):- Cost = 0.
%costOfThisSolution(M,Cost):- findall(C,member(x(_,C),M),L), sort(L,L1), length(L1,Cost), !.
costOfThisSolution(M,Cost):- findall(P, member(cp(_,P), M), L), sort(L, Ps), length(Ps,Cost), !. %minimitzar el nombre de numProfessors



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
