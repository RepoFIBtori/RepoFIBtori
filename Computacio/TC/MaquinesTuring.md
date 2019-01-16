# Maquinas de Turing

El **lenguaje generado** por una maquina de Turing son las palabras formadas (cada una) por todo lo que queda en la cinta al llegar al estado final.

Cada palabra generada es una distinta ejecución que ha dejado distintos carácteres en la cinta.

Se dice que una MT calcula una funcion **φ(w) = w'** donde **w'** es lo que queda en la cinta.

Decimos que una maquina M es **M(w)&darr;** si M con entrada w PARA en algun momento. Es **M(w)&uarr;** si NO PARA (bucle).

**φ<sub>M</sub>w&darr;**  si φ<sub>M</sub> sí está definida (M llega a estado final).

**φ<sub>M</sub>w&uarr;**  si φ<sub>M</sub> no está definida (M no llega a estado final).

φ<sub>M</sub> (w)&darr; **=>** M(w)&darr; pero no al revés ( **<=** ).
___
**DEF:** Un lenguaje L es **semi-deducible** si existe M tal que L<sub>M</sub> = L

**DEF:** Una función *f* es **calculable** si existe M tal que φ<sub>M</sub> = f

**DEF:** Un lenguaje es **deducible** si existe M tal que L<sub>M</sub> = L y M siempre para. 0
___
1. Cualquier algoritmo puede ser simulado por una MT (Tesis de Church-Turing)
2. Podemos suponer que los estados de una MT son numeros naturales w € &Sigma;*
3. Supondremos que las entradas son "correctas"
4. Trabajamos con MT en "alto nivel"
### La chicha &darr;
5. Las MT se pueden **ordenar** y codificar. Este proceso es constructivo -> existe una MT que recive como entrada otra MT y devuelve su número (número de Gödel)
6. Existe uan MT que simula cualquier otra MT con cualquier entrada -> **Máquina Universal**  U(m, w) donde *m* es una MT i *w* es la entrada de *m*. *U* simula *m* con la entrada *w*. 
7. Existe una MT que simula cualquier otra MT con cualquier entrada i cualquier número de pasos -> **Máquina Reloj** R(m, w, t) donde *t* es el número de pasos a simular. Si la ejecucion de *m* con entrada *w* es infinita, la ejecución de U(m, w) también lo es. La Máquina Reloj sirve para parar donde queramos.
___
Si:
  * M<sub>n</sub> es la MT de posición  *n*
  * L<sub>n</sub> es el lenguaje reconocido por la MT de posición *n*
  * φ<sub>n</sub> es la función calculada por la MT de posición *n*

Entonces:
  * L semi-deducible &#8803; &exist; n : L<sub>n</sub> = L
  * *f* calculable &#8803; &exist; n : φ<sub>n</sub> = *f*
  * L decidible &#8803; &exist; n : L<sub>n</sub> = L ^ &forall; n : M<sub>n</sub>(M)&darr;
___
___



