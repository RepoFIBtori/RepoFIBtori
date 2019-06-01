% John, Paul and Ringo are rich. Here we will count their money in natural numbers
% that represent millions of Euros. They all have more than zero and at most 10.

% John has at least twice the amount that Ringo has.
% Paul has at least 3 more than John.
% Ringo has at least 3.

:- use_module(library(clpfd)).

beatels:-
    Vars = [J,P,R],
    Vars ins 1..10,
		J #>= 2*R,
		P #>= 3 + J,
		R #>= 3,
		sum(Vars,#=,Max),
		labeling([ff,min(Max)],Vars),
		write(Vars).
