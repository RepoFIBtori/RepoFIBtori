:-dynamic(varNumber/3).
symbolicOutput(0). % set to 1 to see symbolic output only; 0 otherwise.

% Extend the attached Prolog source to design an exam timetable:

%  - The exam calendar consists of 3 weeks.
%  - We have 15 courses for which we have to schedule an exam. At most 5 exams per week are allowed (for example, one per day)
%  - For each student we have the list of courses he/she is attending.
%  - For each course, we know its teacher.
%  - Each teacher can have at most one exam per week
%  - Each student can have at most 2 exams per week
%  - We want to minimize the number of students that have an exam during the last week.

%%%%%%%%%%%%%%%%%%%%% toy input example:

courses(15).
students(20).
teachers(7).
weeks(3).

student(1,[1,7,14]).
student(2,[2,4,15]).
student(3,[1,12,14]).
student(4,[2,5]).
student(5,[3,4,11]).
student(6,[2,7,13]).
student(7,[4,5,14]).
student(8,[6,7,12]).
student(9,[1,4,13]).
student(10,[3,4,7]).
student(11,[1,7,11]).
student(12,[2,3,12]).
student(13,[1,8,13]).
student(14,[2,6,14]).
student(15,[3,5,6]).
student(16,[2,7,12]).
student(17,[2,4,11]).
student(18,[6,8,15]).
student(19,[1,5,8]).
student(20,[4,6,13]).

course(1,1).
course(2,1).
course(3,5).
course(4,7).
course(5,2).
course(6,4).
course(7,6).
course(8,6).
course(9,3).
course(10,4).
course(11,5).
course(12,5).
course(13,3).
course(14,7).
course(15,6).

%%%%%% Some helpful definitions to make the code cleaner:
course(C):-   courses(N), between(1,N,C).
student(S):- students(N), between(1,N,S).
teacher(T):- teachers(N), between(1,N,T).
week(W)   :- weeks(N),    between(1,N,W).

studentCourses(S, C) :- student(S, L), member(C, L).   % all courses that student S attends to


%%%%%%  Variables: It is mandatory to use ONLY these variables!
% courseWeek-C-W      meaning "course C has its exam at week W" (1 <= C <= 15, 1 <= W <= 3)
% last-S              meaning "the student S has some exam during the last week" (1 <= S <= 20)

%satVariable(courseWeek-C-W) :- course(C), week(W).
%satVariable(last-S) :- student(S).
%cada curs té un examen
%cada setmana maxim 5 examens

juntem :-
	weeks(W),
	student(S,L),
	member(C,L),
	writeClause([\+courseWeek-C-W, last-S]),
	fail.
juntem.

cadasetmanamaximcincexamens :-
	week(W),
	findall(courseWeek-C-W,course(C),L),
	atMost(5,L),
	fail.
cadasetmanamaximcincexamens.

cadacursteunexamen :-
	course(C),
	findall(courseWeek-C-W,week(W),L),
	exactly(1,L),
	fail.
cadacursteunexamen.

cadaalumnefaexamens :-
	student(S),
	week(W),
	findall(courseWeek-C-W,(student(S,L), member(C,L)),L1),
	atMost(2,L1),
	fail.
cadaalumnefaexamens.

cadateacherunexam :-
	teacher(T),
	week(W),
	findall(courseWeek-C-W,course(C,T),L),
	atMost(1,L),
	fail.
cadateacherunexam.

atmostk(K) :-
	findall(last-S,student(S),L),
	atMost(K,L),
	fail.
atmostk(_).

% Write clauses imposing that at most K students have an exam during the last week
% The optimization loop has already been implemented
writeClauses(K):-
	juntem,
	cadacursteunexamen,
	cadasetmanamaximcincexamens,
	cadaalumnefaexamens,
	cadateacherunexam,
	atmostk(K).

%%%%%%%%%%%%%%%%%%%%%%%
%%%%%% show the solution. Here M contains the literals that are true in the model:

displaySol(M):-write('Teachers: '), teacher(T), nl, write('T'), write(T), write(' --> '),
    week(W), nl, write('\t'), write('W'), write(W), write(': '), course(C,T), member(courseWeek-C-W,M), write('C'), write(C), write(' '), fail.
displaySol(M):-nl,nl,write('Students: '), student(S), nl, write('S'), write(S), write(' --> '),
    week(W), nl, write('\t'), write('W'), write(W), write(': '),
    student(S,L), member(C,L), member(courseWeek-C-W,M), write('C'), write(C), write(' '), fail.
displaySol(M):- nl,nl,write('# of students with an exam last week: '),nl,write('\t'),
    findall(S,(student(S,_), examLastWeek(M,S)), L),
    length(L,N), write(N), write(' --> '), write(L),nl, fail.
displaySol(_).

solutionCost(M,K):- findall(S,(student(S,_), examLastWeek(M,S)), L), length(L,K),!.

examLastWeek(M,S):- student(S,Courses), member(C,Courses), member(courseWeek-C-3,M),!.
%%%%%%%%%%%%%%%%%%%%%%%%%%%

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


%%%%%% main:

main:-  symbolicOutput(1), !, students(K), writeClauses(K).   % print the clauses in symbolic form and halt
main:-  students(K), trySol(K,[]).

trySol(K,BestSolSoFar):- nl, write('Trying with: '), write(K), nl,
    initClauseGeneration,
    tell(clauses), writeClauses(K), told,          % generate the (numeric) SAT clauses and call the solver
    tell(header),  writeHeader,  told,
    numVars(N), numClauses(C),
    write('Generated '), write(C), write(' clauses over '), write(N), write(' variables. '),nl,
    shell('cat header clauses > infile.cnf',_),
    write('Calling solver....'), nl,
    shell('picosat -v -o model infile.cnf', Result),  % if sat: Result=10; if unsat: Result=20.
    treatResult(Result,BestSolSoFar).

treatResult(20,BestSolSoFar):-
    write('Unsat'), nl,nl, write('BEST SOLUTION IS: '), nl, displaySol(BestSolSoFar), nl, nl, halt.
treatResult(10,_):-
    see(model), symbolicModel(M), seen, solutionCost(M,K),
    write('Solution found with cost '), write(K), write('!'), nl, K1 is K-1, trySol(K1,M).

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
