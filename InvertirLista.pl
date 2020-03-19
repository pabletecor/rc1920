 %invertir(+Lista,-Resultado)
 
 /*
 Es cierto si Resultado unifica con una lista que contienen los elementos de Lista en orden inverso.
 */

 %El inverso de una lista vacia es otra lista vacia. (caso base) 
 %P(n0)

 invertir([],[]).
 
 %P(n-1) -> P(n)
 %En prolog
 %P(n) :- P(n-1)
 
 invertir( [Cabeza|Resto], R2 ) :-
	invertir(Resto,R),
	append(R,[Cabeza],R2). %Append se usa para concatenar listas. (La lista concatenada se vuelca en R2)