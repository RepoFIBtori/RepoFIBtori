## Regular descriptions

Exercici 1

```c
main
{
  a = "a"; 
  b = "b"; 
  s = (a|b)*;
  l1 = s a a a s;
  l2 = s b b b s; 
  l3 = s b a b s; 
  l4 = s a b a s; 
  r = l1 | l2 | l3 | l4;
  output r;
    
}
```

Exercici 2

```c
main
{
  // Write here your regular description...
  s = ("a"|"b")*;
  output (s "aaa" s) & (s "bbb" s) & (s "aba" s) & (s "bab" s);
  
}
```
Exercici 3

```c
main
{
  // Write here your regular description...
  s = ("a"|"b")*;
  sa = s "aaaa" s;
  sb = s  "bbbb" s;
  na = s "aaa" s "aaa" s;
  nb = s "bbb" s "bbb" s;
  output  ((s "aaa" s)- na) & ((s "bbb" s) - nb) -sa -sb;
}
```


Exercici 4

```c
main
{
  // Write here your regular description...
  s = ("a"|"b")*;
  na = s "aba" s "aba" s;
  nb = s "bab" s "bab" s;
  sa = s "ababa" s;
  sb = s "babab" s;
  output  ((s "aba" s)- na) & ((s "bab" s) - nb) - sa -sb;
}
```

Exercici 5

```c
main
{
  // Write here your regular description...
  s = ("a"|"b")*;
  sb = s "bbb" s;
  ab = "a"|"b";
  s5 = ab ab ab ab ab;
  output (s "a" s5) & sb; 
}
```

Exercici 6

```c
main
{
  
  s = ("0"|"1")*;
  buit = ("0")*;
  multiple4 = s "00";
  multiple3 = " 0 1
0 0 1 +
1 2 0
2 1 2 ";
  output multiple4 & multiple3 | buit;
}
```

Exercici 7

```c
main
{
  s = ("0"|"1")*;
  buit = ("0")*;
  multiple4 = s "00";
  multiple5 = " 0 1
  	0	0 1 +
	1	2 3
	2	4 0
	3	1 2
	4	3 4  
  ";
    output multiple5 & multiple4 | buit;
}
```

Exercici 8

```c
main
{
  s = ("0"|"1")*;
  buit = ("0")*;
  multiple4 = s "00";
  multiple5 = " 0 1
  	0	0 1 +
	1	2 3
	2	4 0
	3	1 2
	4	3 4  
  ";
  
  multiple3= " 	0 1
  	0	0 1 +
	1	2 0 
	2	1 2
  ";
    output multiple5 & multiple4 & multiple3 | buit;
}
```

Exercici 9

```c
main
{
  l = ("a"|"b")*;
  language = l "a"  ("a"|"b")  ("a"|"b");
  output substitution (language, "a"->"aba", "b"->"bab");
}
```

Exercici 10

```c
main
{
  l = ("a"|"b"|"c")*;
  la = l "a" ("a"|"b"|"c");
  lc =  l "c" ("a"|"b"|"c");  
  language = la | lc ;
  output substitution (language, "a"->"aba", "b"->"aa","c"->"b");
}
```

Exercici 11

```c
main
{
  s = ("a"|"b")*;
  sb = s "a" ("a"|"b")("a"|"b");
  output substitution (sb, "a"->("aa")*, "b"->("a"|"aba"|"bab") );
}
```

Exercici 12

```c
main
{
  L= "  a b c d
0 1 4 3 P
1 4 2 P 3
2 P 5 P P
3 2 P P P
4 0 0 5 2 +
5 4 P P P
P P P P P";
  R = substitution(L,"c"->"a","d"->"b");
  output R;
    
}
```

Exercici 13

```c
main
{
  L = " a b c d
  52	4 5 P P
  2	P 5 P P
  0	3 4 1 P
  1	4 2 P 3
  3	2 P P P
  4	0 0 5 2 +
  5	4 P P P
  P	P P P P  
  ";
  output substitution(L, "c"->"a", "d"->"b");
}
```

Exercici 14
```c
main
{
  c1= "aaaaaaaaaaaa"*;
  c2= "aaaaaaaaaaaaaaaa"*;
  c3= "aaaaaaaaaa";
  output c1 c2 c3;
}
```

Exercici 15
```c
main
{
 D = "
 	3 4 5 7 9 
 0	P 2 P 1 P
 1	P P P 1 3
 2	5 4 P P P 
 3	P 0 P P P
 4	3 P 2 P P
 5	P P P P 4 +
 P	P P P P P
 "
;
 output substitution(D, "3"-> "aaa", "4"-> "aaaa", "5"-> "aaaaa", "7"-> "aaaaaaa", "9"-> "aaaaaaaaa");
}
```


Exercici 16
```c
main
{
  L = " 1    2    3    a    b   
0aa  1a   2aa  POZO POZO POZO +
0a   1aa  2a   POZO POZO POZO
1a   POZO POZO POZO 0a   2aa 
1aa  POZO POZO POZO 0aa  2a  +
2a   POZO POZO 0a   1aa  POZO
2aa  POZO POZO 0aa  1a   POZO +
POZO POZO POZO POZO POZO POZO";
  
  r= substitution (L,"1"->"aba","2"->"bb","3"->"bbba");
  output r;
}
```


Exercici 17
```c
main
{
  L ="
     1    2    a    b   
0    0a   POZO POZO 1   
0a   aa   POZO POZO ab  
1    POZO 1    POZO 0a  
POZO POZO POZO POZO POZO
aa   aa   POZO POZO ab   +
ab   POZO 1    POZO 0a   +
  ";
  r = substitution(L, "1"->"aba","2"->"aa");
  output r;
}
```


Exercici 18
```c
main
{
  00 = "00";
  01 = "01";
  10 = "10";
  11 = "11";
  output  (00|11)* 10 (00|01|10|11)*;
}
```


Exercici 19
```c

  main
{
  00 = "00";
  01 = "01";
  10 = "10";
  11 = "11";
  output  (00|11)* 01 (00|01|10|11)*;
}

```


Exercici 20
```c
main
{
  000 = "000";
  001 = "001";
  010 = "010";
  011 = "011";
  100 = "100";
  101 = "101";
  111 = "111";
  110 = "110";

  
  r = (000|111)* 
    "110"   
    (("11"|"00")("0"|"1"))*
    "10" ("0"|"1") (000|001|010|011|100|101|110|111)*
    |
    (000|111)* 
    "100" 
    (("0"|"1")("00"|"11"))*
    ("0"|"1")"10"  (000|001|010|011|100|101|110|111)*;
	  
output r;
}
```


Exercici 21
```c
main
{
  000 = "000";
  001 = "001";
  010 = "010";
  011 = "011";
  100 = "100";
  101 = "101";
  111 = "111";
  110 = "110";
  
  r = (000|111)* 
    	(100(("0"|"1")("01"|"00"|"11"))*("0"|"1")"01"| 101  |  001(("11"|"10"|"00")("0"|"1"))* "10"("0"|"1"))
    (000|001|010|011|100|101|110|111)* ;
    
  output r;  
}
```


Exercici 22
```c
main
{
  r = ("00"|"11")* "10" (("10"|"00"|"11"|"01")*-"01"*);
  output r;
}
```

Exercici 23

```c
main
{
  r = (
       ("001" ("100"|"010"|"111")* "110")
       | ("011"|"101"|"000"))*;
  output r;
}
```


Exercici 24
```c
main
{
  major= ("xx00"|"xx11")* ("0010"|"0110"|"1110"|"1010") ("xxxx")* ;
    
  sum = ( ("001x" ("100x"|"010x"|"111x")* "110x")
       | ("011x"|"101x"|"000x"))*;
  
  major3 = substitution(major,"x"->("0"|"1"));
  suma = substitution(sum,"x"->("0"|"1"));
  output major3 & suma;
}
```


Exercici 25
```c
main
{
  major= ("xxa0"|"xxb1")* "xxb0" ("xx"("a"|"b")"x")* ;
    
  sum = ( ("00bx" ("10ax"|"01ax"|"11bx")* "11ax")
       | ("01bx"|"10bx"|"00ax"))*;
  
  major3 = substitution(major,"x"->("0"|"1"));
  suma = substitution(sum,"x"->("0"|"1"));
  
  output substitution(major3 & suma, "a" -> "", "b" -> "");
}
```