%Concatenar dos listas en Prolog

%Concatenar (+Lista1,+Lista2,-Resultado)


%Solucion para el caso más pequeño
 
concatenar([],Lista2,Lista2).
concatenar([Cabeza|Resto], Lista2,[Cabeza|R]) :-
	concatenar(Resto,Lista2,R).