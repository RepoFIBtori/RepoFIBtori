:- use_module(library(clpfd)).

% Now you are flying back from China, and you should write such a program to compute how many
% units of each one of six products you should take in your suitcase with capacity 80Kg, if you want
% to maximize the total value, and the products have the following weights (Kg) and values (Euros):
%           p1  p2  p3  p4  p5  p6
%   ------------------------------
%   weight: 1   2   3   5   6   7
%   value:  1   4   7   11  14  15
restricciomax([A1,A2,A3,A4,A5,A6],N) :-
	N #>= (A1*1 + A2*2 + A3*3 +A4*5 + A5*6 + A6*7).

calculavalor([A1,A2,A3,A4,A5,A6],S) :-
	S #= (A1*1 + A2*4 + A3*7 +A4*11 + A5*14 + A6*15).

main:-
		length(L,6),
		L ins 0..80,
		restricciomax(L,80),
		calculavalor(L,S),
		labeling([max(S)],L),
    write(L).
