% P90 (**) Eight queens problem

% This is a classical problem in computer science. The objective is to
% place eight queens on a chessboard so that no two queens are attacking 
% each other; i.e., no two queens are in the same row, the same column, 
% or on the same diagonal. We generalize this original problem by 
% allowing for an arbitrary dimension N of the chessboard. 

/* - - - - - - - - - - - - - - - - - - - - 
	TRABAJO FINAL
	
	Pablo Cordón Hidalgo
	Manuel Jesus Reyes Capelo
- - - - - - - - - - - - - - - - - - - - */

/*

% We represent the positions of the queens as a list of numbers 1..N.
% Example: [4,2,7,3,6,8,5,1] means that the queen in the first column
% is in row 4, the queen in the second column is in row 2, etc.
% By using the permutations of the numbers 1..N we guarantee that
% no two queens are in the same row. The only test that remains
% to be made is the diagonal test. A queen placed at column X and 
% row Y occupies two diagonals: one of them, with number C = X-Y, goes
% from bottom-left to top-right, the other one, numbered D = X+Y, goes
% from top-left to bottom-right. In the test predicate we keep track
% of the already occupied diagonals in Cs and Ds.   

% The first version is a simple generate-and-test solution.

% queens_1(N,Qs) :- Qs is a solution of the N-queens problem

%% queens_1(+Num,+Reinas)
%% Es cierto si Reinas contiene las filas en las que se pueden colocar reinas
%% de forma que ninguna reina se encuentre en la misma linea diagonal, vertical
%% u horizontal del resto de reinas, dado un tablero de Num x Num
queens_1(N,Qs) :- range(1,N,Rs), permu(Rs,Qs), test(Qs).

% range(A,B,L) :- L is the list of numbers A..B
%% range(+NumI,+NumF,-Lista)
%% Es cierto si Lista unifica los numeros naturales consecutivos desde NumI hasta NumF
range(A,A,[A]).
range(A,B,[A|L]) :- A < B, A1 is A+1, range(A1,B,L).

% permu(Xs,Zs) :- the list Zs is a permutation of the list Xs

%% permu(+Xs,-Zs)
%% Es cierto si Zs unifica con la lista Xs con dos valores intercambiados

permu([],[]).
permu(Qs,[Y|Ys]) :- del(Y,Qs,Rs), permu(Rs,Ys).

%% del(+Elem,+ListaI,-ListaF)
%% Es cierto si ListaF unifica con ListaI menos el elemento Elem

del(X,[X|Xs],Xs).
del(X,[Y|Ys],[Y|Zs]) :- del(X,Ys,Zs).

% test(Qs) :- the list Qs represents a non-attacking queens solution

%% test(+Qs)
%% Es cierto si Qs unifica una solución viable del problema

test(Qs) :- test(Qs,1,[],[]).

% test(Qs,X,Cs,Ds) :- the queens in Qs, representing columns X to N,
% are not in conflict with the diagonals Cs and Ds

%% test(+Qs,+X,+Cs,+Ds)
%% Es cierto si la reina en la fila Qs, y en la columna X, no entra en conflicto
%% con las diagonales Cs y Ds
%% \+ Meta: Cierto si meta no puede ser probado
%% memberchk(?Elem,+List): Cierto si Elem pertenece a List

test([],_,_,_).
test([Y|Ys],X,Cs,Ds) :- 
	C is X-Y, \+ memberchk(C,Cs),
	D is X+Y, \+ memberchk(D,Ds),
	X1 is X + 1,
	test(Ys,X1,[C|Cs],[D|Ds]).

%--------------------------------------------------------------

% Now, in version 2, the tester is pushed completely inside the
% generator permu.

%% queens_2(+Num,+Reinas)
%% Es cierto si Reinas contiene las filas en las que se pueden colocar reinas
%% de forma que ninguna reina se encuentre en la misma linea diagonal, vertical
%% u horizontal del resto de reinas, dado un tablero de Num x Num

queens_2(N,Qs) :- range(1,N,Rs), permu_test(Rs,Qs,1,[],[]).

%% permu_test(+ListaInicial,-ListaFinal,+Num,+DiaCs,+DiaDs)
%% Es cierto si ListaFinal unifica con una permutacion de ListaInicial, donde
%% sus elementos no coinciden entre ellos en ninguna diagonal, siendo Num el contador
%% que verifica en que iteración se encuentra

permu_test([],[],_,_,_).
permu_test(Qs,[Y|Ys],X,Cs,Ds) :- 
	del(Y,Qs,Rs), 
	C is X-Y, \+ memberchk(C,Cs),
	D is X+Y, \+ memberchk(D,Ds),
	X1 is X+1,
	permu_test(Rs,Ys,X1,[C|Cs],[D|Ds]).
