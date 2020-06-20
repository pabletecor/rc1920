# Técnicas más usadas en Representación del conocimiento en el campo de la IA




:classical_building: Universidad de Huelva


:computer: Representación del Conocimiento


:spiral_calendar: Curso 2019/2020


:men_wrestling: Pablo Cordón Hidalgo y Manuel J. Reyes Capelo


![portada](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Teoria/Imagenes/knowledge.jpg)


## Introducción


La representación del conocimiento en el campo de la Inteligencia Artificial es, básicamente, un estudio de cómo las creencias, intenciones y juicios de un agente inteligente pueden ser expresadas correctamente para que este posea un razonamiento autónomo.


Uno de los propósitos primarios de la Representación del conocimiento es, simplemente, modelar el comportamiento de un agente inteligente.


El concepto “Representación del conocimiento” no es simplemente almacenar datos en una base de datos,  o entender cómo funciona un sistema operativo. Este permite a la máquina aprender de este conocimiento y actuar de forma inteligente, como lo haría un ser humano (o casi).




##Técnicas usadas


Hay cuatro técnicas para representar el conocimiento, que vienen listadas a continuación:


* Representación lógica
* Representación de redes semánticas
* Representación de “frames”
* Reglas de producción


![Diferentes tecnicas de RC](https://github.com/pabletecor/rc1920/blob/master/Trabajo%20Final/Practica/Teoria/Imagenes/Tecnicas_RC.png)


Vamos a indagar en cada una de ellas.


### Representación lógica


Consideramos representación lógica como un lenguaje, que tiene unas reglas definidas. Destaca el uso de predicados y la no-ambigüedad de la representación. Está definida por dos conceptos principales, la sintaxis y la semántica.




* Sintaxis: Define las construcciones de oraciones válidas en nuestro lenguaje, así como los símbolos permitidos.
* Semántica: Son las reglas con las que se puede interpretar una oración, y permite asignarle un significado.


### Representación de redes semánticas


Las redes semánticas se usan como una alternativa a la representación lógica. En ellas podemos representar nuestro conocimiento mediante el uso de grafos. En general usamos la Teoría de Dependencia Conceptual, donde asignamos los conceptos como nodos y las relaciones como las aristas del grafo.

Si bien el uso de redes semánticas es simple y fácil de entender, ya que es muy parecido al lenguaje natural, su coste computacional es alto y es difícil de saber si es posible automatizar la reducción a grafos para todas las oraciones de un lenguaje dado.


### Representación de **frames**


Llamamos **frame** a una estructura o plantilla que almacena una colección de atributos y valores para dichos atributos para describir una entidad del mundo (parecido a la programación orientada a objetos, o a los registros de bases de datos). 


Hay veces que al rellenar los valores de las casillas que conforman a un frame, esto puede encadenar que se tome una acción y que se cumplan las condiciones de otros frames. 


La principal ventaja que tiene el uso de frames es su fácil entendimiento, así como la posibilidad de tener valores nulos o por defecto. Su principal desventaja es que el mecanismo no es tan fácil de procesar, y su carácter genérico.




### Reglas de producción


En las reglas de producción, el agente chequea la **condición**, y si esta existe, entonces la regla de producción se **“dispara”** y realiza la acción correspondiente.


La condición determina que regla puede ser aplicada a un problema, mientras que la acción realiza la “resolución” del problema. Llamamos a este proceso un ciclo **reconoce-actúa.**


Un ejemplo de esto sería:


```
IF: temperatura = alta


AND sudoración = presente


AND dolor_muscular = presente


THEN: diagnostico_preliminar = gripe
```


Las Reglas de Producción constan de tres partes principales:


* El conjunto de reglas de producción
* La memoria de trabajo
* El ciclo **reconoce-actua**


Las principales ventajas que poseen las Reglas de Producción son su codificación en lenguaje natural, más entendible para el usuario con menor conocimiento de programación, y el hecho de que estas son altamente modulares, por lo que pueden ser fácilmente modificadas o borradas.


Entre sus desventajas cabe destacar su ineficiencia, pues durante la ejecución de un programa, varias reglas pueden estar activas.


## Bibliografía 


* [What is Knowledge Representation in AI?](https://www.edureka.co/blog/knowledge-representation-in-ai/#techniques)


* [Knowledge Representation in Artificial Inteligence](https://www.slideshare.net/YasirAhmedKhan/5-knowledgerepresentation-10-sldes)


* [Tecnicas de Representacion del Conocimiento](https://www.ecured.cu/T%C3%A9cnicas_de_Representaci%C3%B3n_de_Conocimiento#:~:text=T%C3%A9cnicas%20para%20la%20Representaci%C3%B3n%20del,razonamiento%20formal%20sobre%20los%20objetos)
