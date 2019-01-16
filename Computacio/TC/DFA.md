## DFA

Exercici 7

```
  a  b 
I  P1 I 
P1 P1 P2
P2 P3 P5
P3 P1 P2 +
P5 P1 I  +
```

Exercici 10 

```
 a b
0 1 2 +
1 3 4 +
2 4 3 +
3 6 7 +
4 7 6 +
6 3 9 +
7 9 3 +
9 9 9
```

Exercici 11 

```
 a b
1 2 3 +
2 5 4 +
3 4 5 +
4 3 8 +
5 8 3 +
8 8 8
```

Exercici 12

``` 
  a   b  
L1  a   b   +
a   baa aab +
aab aba bab +
aba baa bab +
b   aba bbb +
baa bab aab +
bab bab bab
bbb bab bbb +
```

Exercici 17

```
    a   b  
I   a   b  
NOP NOP NOP
a   aa  ab 
aa  aaa ab 
aaa aaa ab  +
ab  NOP b  
b   ba  b  
ba  aa  NOP
```

Exercici 19

```
  a  b  c 
I  I  b  I  +
NO NO NO NO
a1 I  NO a1 +
b  a1 NO b  +
```

Exercici 26

```
    a   b  
I   a   b   +
a   baa aab +
aab aba no  +
aba baa no  +
b   aba bb  +
baa no  aab +
bb  no  no  +
no  no  no 
```

Exercici 27

```
  a    b   
I    POZO b    +
POZO POZO POZO
b    I    bb   +
bb   b    POZO +
```

Exercici 28

```
a    b   
I    a    b    +
POZO POZO POZO
a    aa   b   
aa   POZO ba  
b    a    bb   +
ba   aa   bb  
bb   ba   POZO +
```

Exercici 29

```
      a     b    
I     a     b    
a     a     ab   
ab    ba    abb  
ababb ababb ababb +
abb   ababb abb  
b     ba    bb   
ba    ba    bab  
bab   ba    ababb
bb    bba   bb   
bba   bba   ababb
```

