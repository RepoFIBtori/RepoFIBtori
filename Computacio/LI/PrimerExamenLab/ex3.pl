%ens calen dos vectors V1 i V2, i un enter P que representi el producte escalar
%cas base
pescalar([],[],0).
%cas recursiu
pescalar([X1|V1],[X2|V2],P) :- pescalar(V1,V2,P1), P is P1+X1*X2.
