# Resolución del Problema del Caballo en Prolog


:classical_building: Universidad de Huelva

:computer: Representación del Conocimiento

:spiral_calendar: Curso 2019/2020

:men_wrestling: Pablo Cordón Hidalgo y Manuel J. Reyes Capelo

# Problema del caballo (Knight’s Tour)

## Introducción

Este apartado del documento explica la implementación del conocido como Problema del Caballo (Knight’s Tour), que es un acertijo recurrente desde siglos atrás y que se ha intentado resolver por matemáticos como Euler. Vamos a comentar la implementación por Markus Triska

## Explicación del ejercicio implementado

El problema consiste en devolver las posiciones de un tablero de NxN casillas de manera que si un caballo del ajedrez se moviese en dicho orden pisase todas las casillas sin repetir ninguna, empezando siempre en nuestro caso por la casilla superior izquierda.

![Posible solución del problema](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/caballo.jpg)

## Aritmética declarativa CLP(FD)

En este ejercicio usamos la aritmética declarativa CLP(FD), que declara los números naturales usando los axiomas de Peano

Según los axiomas de Peano, 0 es un número natural, y los sucesores de cualquier número natural N se representa como s(N).
Así, el número 1 se representa como s(0), el 2 como s(s(0))...

Como la notación de peano no es como normalmente razonamos el prolog, usamos "predicados Built-in".

Estos predicados son conocidos como restricciones (Constraints) CLP(FD), que quiere decir " Constraint Logic Programming over Finite Domains",
es decir, en realidad solo podemos representar un número finito de enteros en las máquinas actuales.

Una restricción n-aria es una relación entre n variables.

Las restricciones más importantes en CLP(FD) son las restricciones aritméticas: 

A #= B -  A es igual a B
A #< B -  A es menor que B
A #> B -  A es mayor que B
A #\= B - A no es igual a B

## Predicados usados

- n_tour(?N,-Ts) Es cierto si Ts unifica con una lista en la que se guardan los pasos que tiene que dar el caballo para un tablero de tamaño NxN, suponiendo que empiece en la posición (1,1).

- length (+Ts,+N) - verdadero si N representa el número de elementos en Ts.

- maplist (:Goal, ?List) - verdadero si Goal es aplicado exitosamente en todos los elementos que coinciden de List.

- circuit(+Vs) - verdadero si la lista Vs de dominio finito produce un circuito Hamiltoniano, es decir, cada casilla sólo es visitada una sola vez.

- successors([Lista],N,K0) Es verdadero si cada posición del tablero unifica con la posición a la que debería ir un caballo en esa coordenada.

- findall(+A, :B, -C) Es verdadero si C unifica con todos los posibles resultados de B usando A como un argumento de B.

- foldl(:Goal, +List, +Start, -End) Verdadero si End unifica con el resultado de aplicar Goal a todos los elementos de List, de izquierda a derecha, usado Start como acumulador inicial.

- V in Dom comprueba si V pertenece al dominio Dom.

- K1 #= K0 + 1 Verdadero si K1 unifica con la suma aritmética de k0 y 1.

- num_to_dom(A, B, C) Unifica en C el resultado de realizar un or bit a bit entre A y B.

-  n_x_y_k(N, X, Y, K) Es cierto si K unifica con la posición en un tablero NxN dadas por las coordenadas X e Y.

- n_k_next(+N, +K, +Next) Verdadero si Next unifica con todos los posibles siguientes movimientos de K en un tablero NxN

#### Explicación del predicado successors más a fondo

El predicado successors principalmente analiza cuales son todas las posiciones válidas y disponibles desde la posición inicial hasta la final para un caballo en un tablero de NxN dimensiones.
	
Inicialmente se abrirán varias posibilidades de movimientos para las primeras casillas, pero una vez el problema avance solo serán viables los caminos que cumplen que para todas las casillas el caballo tenga un movimiento posible.
	
Más tarde nos quedaremos con un único camino que será el que cumpla la condición de ser un [circuito Hamiltoniano.](https://es.wikipedia.org/wiki/Camino_hamiltoniano)

![succesors](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/succesors.PNG)

## Posible solución del problema.

![Solución](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Codigo/Imagenes/solucion.PNG)


## Bibliografía

https://www.metalevel.at/knight/

https://www.metalevel.at/knight/knight.pl

https://es.wikipedia.org/wiki/Problema_del_caballo

[Video explicativo sobre el problema del caballo.](https://www.youtube.com/watch?v=xub1KmUgrdk)
