variable(x).
variable(y).
variable(z).

instruccio(X1,X2) :- instruccio(X1), instruccio(X2).
			
instruccio([A,=,B,+,C]) :- variable(A), variable(B), variable(C).
			
instruccio([if|L]):- append(L1,[endif],L), % L1 es la instruccio sense if ni endif
					 append([X,=,Y,then],L2,L1), variable(X), variable(Y),
					 append(Is,[else|Is2],L2),
					 instruccions(Is), instruccions(Is2).
					
			
instruccions(X) :- instruccio(X).	  
instruccions(X) :- append(X1,[;|A],X), instruccions(A), instruccio(X1).

				 
%<instruccion> --> if <variable> = <variable> then <instrucciones> else <instrucciones> endif

programa(L) :- append([begin|X1],[end],L), instruccions(X1). 
