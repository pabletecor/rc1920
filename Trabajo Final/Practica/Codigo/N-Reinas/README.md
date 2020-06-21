# Resolución del problema de las N-Reinas en Prolog


:classical_building: Universidad de Huelva

:computer: Representación del Conocimiento

:spiral_calendar: Curso 2019/2020

:men_wrestling: Pablo Cordón Hidalgo y Manuel J. Reyes Capelo


# Problema de las N Reinas (N-Queens)

## Introducción

El problema de las N-Reinas es un problema clásico de computación.

Hemos tomado el código de este problema del [problema 90 de los P-99: Ninety-nine Prolog Problems](https://www.ic.unicamp.br/~meidanis/courses/mc336/2009s2/prolog/problemas/)

El objetivo de este problema es colocar N-Reinas en un tablero NxN  de tal manera que NINGUNA reina ataque a otra. es decir : No puede haber dos reinas en la misma fila, columna o diagonal.
 
![Ejemplo 8-Reinas](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/n-reinas.jpg)

Representamos las posiciones de las reinas en una lista de números de 1..N. 
 
Por ejemplo : [4,2,5,1,3,4,7,6,8] quiere decir que la reina en la primera columna
está en la fila 4, la reina en la segunda columna está en la fila 2, y así sucesivamente.
 
Mediante las permutaciones de los números 1..N garantizamos que no haya dos columnas en la misma fila.
 
Para comprobar que no hay dos reinas en la misma diagonal tenemos en cuenta que, una reina posicionada en la fila X y columna Y ocupa dos diagonales: C = X-Y, de abajo a la izquierda a arriba a la derecha y C = X+Y,  de arriba a la izquierda a abajo a la derecha. 

Este problema tiene dos posibles resoluciones, que procedemos a desgranar.

## Primera solución

La primera solución es simplemente un genera y comprueba.

### queens_1(+Num,+Reinas)

Es cierto si Reinas contiene las filas en las que se pueden colocar reinas de forma que ninguna reina se encuentre en la misma línea diagonal, vertical
u horizontal del resto de reinas, dado un tablero de Num x Num

```
queens_1(N,Qs) :- range(1,N,Rs), permu(Rs,Qs), test(Qs).
```
### range(+NumI,+NumF,-Lista)

Es cierto si Lista unifica los números naturales consecutivos desde NumI hasta NumF

```
range(A,A,[A]).
range(A,B,[A|L]) :- A < B, A1 is A+1, range(A1,B,L).
```

### permu(+Xs,-Zs)
Es cierto si Zs unifica con la lista Xs con dos valores intercambiados

```
permu([],[]).
permu(Qs,[Y|Ys]) :- del(Y,Qs,Rs), permu(Rs,Ys).
``` 
### del(+Elem,+ListaI,-ListaF)

Es cierto si ListaF unifica con ListaI menos el elemento Elem

```
del(X,[X|Xs],Xs).
del(X,[Y|Ys],[Y|Zs]) :- del(X,Ys,Zs).
```

### test(+Qs)
Es cierto si Qs unifica una solución viable del problema
```
test(Qs) :- test(Qs,1,[],[]).
```
### test(+Qs,+X,+Cs,+Ds)
Es cierto si la reina en la fila Qs, y en la columna X, no entra en conflicto con las diagonales Cs y Ds

### '\'+ Meta:
Cierto si meta no puede ser probado

### memberchk(?Elem,+List): 
Cierto si Elem pertenece a List
```
test([],_,_,_).
test([Y|Ys],X,Cs,Ds) :- 
	C is X-Y, \+ memberchk(C,Cs),
	D is X+Y, \+ memberchk(D,Ds),
	X1 is X + 1,
	test(Ys,X1,[C|Cs],[D|Ds]).
```

## Segunda solución

En esta segunda solución, el tester está totalmente integrado en el código 
del generador permu.

### queens_2(+Num,+Reinas)

Es cierto si Reinas contiene las filas en las que se pueden colocar reinas
de forma que ninguna reina se encuentre en la misma linea diagonal, vertical
u horizontal del resto de reinas, dado un tablero de Num x Num

```
queens_2(N,Qs) :- range(1,N,Rs), permu_test(Rs,Qs,1,[],[]).
```

### permu_test(+ListaInicial,-ListaFinal,+Num,+DiaCs,+DiaDs)
Es cierto si ListaFinal unifica con una permutacion de ListaInicial, donde sus elementos no coinciden entre ellos en ninguna diagonal, siendo Num el contador que verifica en qué iteración se encuentra

```
permu_test([],[],_,_,_).
permu_test(Qs,[Y|Ys],X,Cs,Ds) :- 
	del(Y,Qs,Rs), 
	C is X-Y, \+ memberchk(C,Cs),
	D is X+Y, \+ memberchk(D,Ds),
	X1 is X+1,
	permu_test(Rs,Ys,X1,[C|Cs],[D|Ds]).
```

## Conclusiones y pruebas de ejecución

Tras ejecutar el predicado queens_1(+Num,+Reinas) para diferentes tamaños de tablero, podemos comprobar que cuanto mayor sea el tamaño de este, aumenta exponencialmente el tiempo que tarda el programa en encontrar una solución válida, llegando incluso a tardar 15 segundos y realizar 100 millones de inferencias para encontrar una solución para un tablero 12x12.

![Ejecución queens_1](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/queens_1.PNG)

Sin embargo, al ejecutar las mismas operaciones con la solución queens_2 podemos observar claramente que esta es mucho más eficiente, pues para el tablero 12x12 ni siquiera tarda 0.01 segundos en encontrar solución.

Esto se debe a que se ha optimizado código y tiempo de ejecución al unir las clases *permu* y *test* en una sola.

![Ejecución queens_2](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/queens_2.PNG)
