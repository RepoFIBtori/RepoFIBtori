Exercici 1 

```c
input y
{
	runmxx;
  	accept;
}
```



Exercici 2 

```c
input y
{
  if(mxxstopsininputsteps)
    infiniteloop;
  accept;
}
```

Exercici 3

```c
input y
{
  runmxx;
}
```
Exercici 4
```c
input y
{
  if(mxxstopsininputsteps)
    accept;
  infiniteloop;
}
```

Exercici 5

```c
input y
{	
  	if(mxxstopsininputsteps)
		infiniteloop;
  	output y;
}
```

Exercici 6

```c
input y
{	
  	if(mxxstopsininputsteps)
		infiniteloop;
  	output y;
}
```

Exercici 7

```c
input y
{	
  	if(mxxstopsininputsteps)
		infiniteloop;
  	output 0;
}
```

Exercici 8 

```c
input y
{
  if(not mxxstopsininputsteps){
  	if(y == 1) accept;
    	if(y == 2) runmxx;
  }
}
```



Exercici 9 

```c
input y
{
	runmxx;
	output 0; 
}
```



Exercici 10

```c
input y
{
  if (mxxstopsininputsteps) {
    output y;
  }
  if (y == 0 or y == 1) output y;
  else infiniteloop;
}
```

Exercici 11

```c
input y
{
  runmxx;
  output y;
}
```

Exercici 12

```c
input y
{
  if(mxxstopsininputsteps){
    output y;
  }
  if( y == 0) output 0;
  else output 1;
}
```

Exercici 13

```c
input y
{
  if(not mxxstopsininputsteps){
  	if(y% 2== 0) output y-1;
  
  }
}
```

Exercici 14

```c
input y
{
 	runmxx;
  	accept;
}

input y
{
	runmxx;
  	accept;
}
```

Exercici 15

```c
input y
{
  if (mxxstopsininputsteps) {
    infiniteloop;
  }
  accept;
}

input y
{
  runmxx;
  accept;
}
```

Exercici 16

```c
NO SOLUTION
```



Exercici 17

```c
input y
{
  runmxx;
  accept;
  
}

input y
{
  runmxx;
  accept;
}
```

Exercici 18

```c
input y
{
    if (mxxstopsininputsteps) {
    output y;
  }
  
  if(not mxxstopsininputsteps){
    if(y==0 or y ==1) {
	  accept;
    }
    else infiniteloop;
  }
}

input y
{
    if (mxxstopsininputsteps) {
    output y;
  }
  if(not mxxstopsininputsteps){
    if(y==0 or y == 1) {
	  accept;
    }
    else infiniteloop;
  }
}
```



Exercici 19

```c
input y
{
  if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 0;
  infiniteloop;
}

input y
{
    if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 0;
  infiniteloop;
}
```

Exercici 20

```c
input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 1;
  infiniteloop;
}

input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 1;
  infiniteloop;
}
```

Exercici 21 

```c
input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 2;
  infiniteloop;
}

input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 1;
  infiniteloop;
}
```

Exercici 22

```c
input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 0) output 2;
  infiniteloop;
}

input y
{
     if(mxxstopsininputsteps){
  	output y;
  }
  
  if(y == 3) output 1;
  infiniteloop;
}
```

Exercici 23 

```c
input y
{
  if(mxxstopsininputsteps){
   	output 50;
  }
  
  if(y == 0) output 2;
}

input y
{
  if(mxxstopsininputsteps){
    infiniteloop;
  }
  if(y == 0) output 1;
  if(y == 3) output 1;
}
```

Exercici 24 

```c
input y
{
  if(mxxstopsininputsteps){
   	output 50;
  }
  
  if(y == 0) output 2;
}

input y
{
  if(mxxstopsininputsteps){
    infiniteloop;
  }
  if(y == 0) output 1;
  if(y == 3) output 1;
}
```

Exercici 25 

```C
input y
{
  if(mxxstopsininputsteps) output y;
  if(not mxxstopsininputsteps){
  	if(y>1) output y-2;
  }
}

input y
{
  if(mxxstopsininputsteps) output y;
  if(not mxxstopsininputsteps){
  	if(y!=0) output 400;
  }
}
```

Exercici 26

```c
input y
{
  if(not mxxstopsininputsteps){
 	if(y%2 == 0)  	output y;
    	else infiniteloop;
  }
  else {
    output y;
  }

}

input y
{
  if(not mxxstopsininputsteps){
    if(y%2 == 1) output y; 	
    else infiniteloop;
  }
  else{
    output y;
  }
}
```

Exercici 27

```c
input y
{
  if(not mxxstopsininputsteps){
 	if(y%2 == 0) output y;
    	else infiniteloop;
  }
  else {
    output y;
  }

}

input y
{
  if(y==1) infiniteloop;
  if(not mxxstopsininputsteps){
    if(y%2 == 1) output y; 	
    else infiniteloop;
  }
  else{
    output y;
  }
}
```

