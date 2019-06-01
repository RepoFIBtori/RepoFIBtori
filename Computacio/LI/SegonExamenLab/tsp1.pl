% Branch-and-bound solution for a Traveling-Salesman-like problem: find the
% shortest route in order to visit all 22 (or the first N) cities starting from
% city 1 (it does not matter in what city the trip ends).


nearestCityWithDistance(CurrC,[C],C,D):- distance(CurrC,C,D).
nearestCityWithDistance(CurrC,[C|Cities],C,D):- nearestCityWithDistance(CurrC,Cities,_,D1), distance(CurrC,C,D), D < D1.  % caso donde C es la mejor
nearestCityWithDistance(CurrC,[_|Cities],C,D):- nearestCityWithDistance(CurrC,Cities,C,D ).


orderCitiesbyDistance(CurrC, Cities,Cities1):-
    findall( [D,C], (member(C,Cities),distance(CurrC,C,D)), L ),  % L es la lista [[Dist1,C1],...,[Distn,Cn]],
    sort(L,L1),                                                   %L1 es ls misma lista de pares, pero ordenada de menor a mayor distancia
    findall( C, member([_,C], L1), Cities1 ),!.                   %Cities1 es la lista de las segundas componentes de los pares de L1

cotaInferior([],0).
cotaInferior([C|Cities],Km):- cotaInferior(Cities,Km1), mindist(C,D), Km is Km1+D,!.


main:- N=22, retractall(bestRouteSoFar(_,_)),  assertz(bestRouteSoFar(100000,[])),  % "infinite" distance
       findall(I,between(2,N,I),Cities), tsp( Cities, 0, [1] ).
main:- bestRouteSoFar(Km,ReverseRoute), reverse( ReverseRoute, Route ), nl,
       write('Optimal route: '), write(Route), write('. '), write(Km), write(' km.'), nl, nl, halt.

% tsp( Cities, AccumulatedKm, RouteSoFar )
tsp( [], AccumulatedKm, RouteSoFar ):- storeRouteIfBetter(AccumulatedKm,RouteSoFar), fail.

%De moment no fa re
%%%%tsp( _, AccumulatedKm,_  ):- bestRouteSoFar(Km,_), AccumulatedKm >= Km, !, fail.
tsp( Cities, AccumulatedKm, _):- cotaInferior(Cities,CI), bestRouteSoFar(Km,_), AccumulatedKm + CI >= Km, !, fail.
tsp( Cities, AccumulatedKm, [ CurrentCity | RouteSoFar ] ):-
    orderCitiesbyDistance(CurrentCity,Cities,Cities1),
		%append([City],RemainingCities,Cities1),
    select(City, Cities1, RemainingCities),
    distance( CurrentCity,City,Km),
    AccumulatedKm1 is AccumulatedKm+Km,
    tsp( RemainingCities, AccumulatedKm1, [ City, CurrentCity | RouteSoFar ] ).

storeRouteIfBetter( Km, Route ):-  bestRouteSoFar( BestKm, _ ), Km < BestKm,
    write('Improved solution. New best distance is '), write(Km), write(' km.'),nl,
    retractall(bestRouteSoFar(_,_)), assertz(bestRouteSoFar(Km,Route)),!.

mindist(1,20).
mindist(2,18).
mindist(3,42).
mindist(4,40).
mindist(5,17).
mindist(6,38).
mindist(7,26).
mindist(8,47).
mindist(9,17).
mindist(10,33).
mindist(11,19).
mindist(12,17).
mindist(13,17).
mindist(14,35).
mindist(15,28).
mindist(16,34).
mindist(17,28).
mindist(18,35).
mindist(19,28).
mindist(20,20).
mindist(21,19).
mindist(22,20).


%  Number of points N is   22
distance(A,B,Km):-
    M= [[   0,144,114,105, 31,109,135,132, 85, 79,158, 20, 73,162,127,190,156, 58, 87, 71,154, 55],
	[ 144,  0,144,181,147, 76,195, 73, 64,114,220,135, 71, 18, 39, 60, 37,101, 62,146,205,153],
	[ 114,144,  0, 49, 86,169, 51, 78,130, 42, 76, 94,114,154,105,151,125,137, 94, 46, 61, 66],
	[ 105,181, 49,  0, 73,189, 31,124,152, 67, 52, 88,135,195,146,197,169,147,123, 40, 51, 49],
	[  31,147, 86, 73,  0,128,104,119, 97, 57,126, 17, 82,164,122,184,151, 80, 85, 40,123, 24],
	[ 109, 76,169,189,128,  0,212,126, 38,128,238,112, 54, 92, 95,137,110, 51, 77,148,227,146],
	[ 135,195, 51, 31,104,212,  0,129,174, 85, 26,118,157,206,157,201,176,173,141, 67, 19, 79],
	[ 132, 73, 78,124,119,126,129,  0, 92, 65,153,115, 84, 80, 35, 73, 47,118, 55, 98,136,113],
	[  85, 64,130,152, 97, 38,174, 92,  0, 90,200, 82, 17, 82, 66,120, 89, 36, 39,112,189,111],
	[  79,114, 42, 67, 57,128, 85, 65, 90,  0,111, 59, 73,128, 80,137,106, 95, 57, 33, 99, 48],
	[ 158,220, 76, 52,126,238, 26,153,200,111,  0,141,183,231,182,224,201,198,167, 91, 19,102],
	[  20,135, 94, 88, 17,112,118,115, 82, 59,141,  0, 67,153,114,177,142, 63, 75, 52,137, 39],
	[  73, 71,114,135, 82, 54,157, 84, 17, 73,183, 67,  0, 90, 64,123, 89, 35, 28, 95,172, 95],
	[ 162, 18,154,195,164, 92,206, 80, 82,128,231,153, 90,  0, 49, 47, 35,119, 79,161,214,169],
	[ 127, 39,105,146,122, 95,157, 35, 66, 80,182,114, 64, 49,  0, 62, 28, 99, 40,113,166,124],
	[ 190, 60,151,197,184,137,201, 73,120,137,224,177,123, 47, 62,  0, 34,156,102,170,206,183],
	[ 156, 37,125,169,151,110,176, 47, 89,106,201,142, 89, 35, 28, 34,  0,123, 68,139,183,151],
	[  58,101,137,147, 80, 51,173,118, 36, 95,198, 63, 35,119, 99,156,123,  0, 63,106,190,100],
	[  87, 62, 94,123, 85, 77,141, 55, 39, 57,167, 75, 28, 79, 40,102, 68, 63,  0, 85,154, 91],
	[  71,146, 46, 40, 40,148, 67, 98,112, 33, 91, 52, 95,161,113,170,139,106, 85,  0, 85, 20],
	[ 154,205, 61, 51,123,227, 19,136,189, 99, 19,137,172,214,166,206,183,190,154, 85,  0, 98],
	[  55,153, 66, 49, 24,146, 79,113,111, 48,102, 39, 95,169,124,183,151,100, 91, 20, 98,  0]],
    nth1(A,M,Row), nth1(B,Row,Km),!.
