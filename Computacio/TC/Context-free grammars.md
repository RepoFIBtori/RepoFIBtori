## Context-free grammars

Exercici 6
```c
S -> aSb | aSbb | aS |
```

Exercici 7
```c
S -> aXb | aSbb | aX |
X -> aX |
```
Exercici 8 
```c
S -> aaSb | X 
X -> aXb |
```

Exercici 9
```c
S -> AB 
A -> aA |
B -> bB |
```


Exercici 18
```c
S->aMa|bRb  
M ->aMa|bXb|b  
R->aXa|bRb|a  
X-> aXa|bXb|a|b|
```

Exercici 21
```c
S-> S(S)S| S[S]S|
```
Exercici 24
```c
S-> aSbS| bSaS| 
```
Exercici 28
```c
S-> aAS| bBS |
A -> b| aAA 
B -> a| bBB
```
Exercici 29
```c
S-> aAS| bBS |cS|
A -> b| aAA |cA
B -> a| bBB|cB
```
Exercici 30
```c
S-> cXS|aAS|bAS|
A->c|bAA|aAA
X-> a|b|cXX
```
Exercici 31
```c
S-> aBBS|bAS|bCBS|
B-> b|aBBB
A-> bC|bAA
C-> a| bAC
```
Exercici 32
```c
S->BaSbA|BcA
A->aA|
B->bB|
```
Exercici 39
```c
S-> X|Y
X-> aXb |aA|bB//coses que no haurien de passar 
A-> aA|
B-> bB|
Y-> ABbaW
W-> aW|bW| //aixo es pozo de que ja està bé 
```
Exercici 43
```c
S -> M/S | M*S | M+S | M-S | M
M -> (S) | N
N -> 0N | 1N | 2N | 3N | 4N | 5N | 6N | 7N | 8N | 9N | 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 |8|9
```