Exercici 1

```c
input g1,g2
{
  output g1, g2, g1;
}
```

Exercici 2

```c
input g1,g2
{
 	g2 = (g2|"c");
  	c = "c";
	output g1, g2,c; 
}
```

Exercici 3

```c
input g1,g2
{
 	G1 = "a"g1;
  	G2 = "a"g2|"b";
	G3 = "b";
  	output G1,G2,G3; 
}
```

Exercici 4

```c
input g1,g2
{
 	G1 = "a"g1;
  	G2 = "a"g2;
	G3 = "c";
  	G4 = "c";
  	output G1,G2,G3,G4; 
}
```

Exercici 5

```c
input g1,g2
{
 	G1 = "a"g1;
  	G2 = "a"g2;
	G3 = "b";
  	G4 = "b";
  	output G1,G2,G3,G4; 
}
```

Exercici 6

```c
input g1,g2
{
  	G1 = "c"|g1;
	G2 = "c"|g2;
  	output G1,G2; 
}
```

Exercici 7

```c
input g1,g2
{
  G1 = "a"g1|"b";
  G2 = "a"g2|"b";
  output G1,G2;
}
```

Exercici 8

```c
input g
{
  S = ("a"|"b"|"c")*;
  G = g| S "c" S;
  output G; 
}
```

Exercici 9

```c
input g
{
  G2 = ("a"|"b")*;
  output G2,g;
  
}
```



Exercici 10

```c
input g
{
  output ("a"|"b")*, g;
}
```



Exercici 11

```c
input g1,g2
{
 output g1, g2;
}
```



Exercici 12

```c
input g
{
  output "" - "", g; //allò és el conjunt buit
}
```



Exercici 13

```c
input g
{
  output g, ("a"|"b")*;
}
```

Exercici 14

```c
input g
{
	output g"a";
}
```

Exercici 15

```c
input g
{
	output g"aa";
}
```

Exercici 16

```c
input g
{
  if("" belongsto g) output g-"";
  else output "a";
}
```

Exercici 17

```c
input g
{
  if ("a" belongsto g) output g-"a";
  else output "b";
}
```

Exercici 18

```c
input g
{
  if ("ab" belongsto g) output g-"ab";
  else output "b";
}
```

Exercici 19

```c
input g
{
  output g "a" ("b")*;
  
}
```

Exercici 21

```c
input g
{
  ab = ("ab"|"ba")*;
  aigualb = "S->aSbS|bSaS|";
  output substitution(g, "a"->"ab","b"->"ba") | (aigualb - ab);
}
```

