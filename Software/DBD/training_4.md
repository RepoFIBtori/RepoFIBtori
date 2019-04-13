# TRAINING 4

## TRAINING ON SELECTION COST

### Qüestió 1.

0.5*B*D = 0.5*400*1 = 200

### Qüestió 2.

h*D + (O-1)/u * D + O*D = (log100(420*50)-1)*1 + (150-1)/100 * 1 + 150*1 = 153.49

### Qüestió 3.

h*D + (O-1)/u * D + O*D = (log80(1000*10)-1)*1 + (10000*0.5-1)/80 * 1 + (10000*0.5)*1 = 5064
Com es més gran que el número de blocs (1000), el cost és 1000.

### Qüestió 4.

h*D + D + 1.5*(O-1)/R * D = (log80(1000*10)-1)*1 + 1 + 1.5*(10000*0.5-1)/10 * 1 = 752.85

### Qüestió 5.

Com v = 1, perque és codiAssig = 1, utilitzem la següent formula:

H + D + k*D = 0 + 1 + (420*50)/200 *1 = 106

### Qüestió 6.

h*D + D = (log100(400*50)-1)*1 + 1 = 3

### Qüestió 7.

h*D + D + 1.5*(O-1)/R * D = (log100(420*50)-1)*1 + 1 + 1.5*((420*50)/140 - 1)/50 * 1 = 7.47

### Qüestió 8.

B*D = 420*1 = 420

### Qüestió 9.

h*D + D = (log100(420*50)-1)*1 + 1 = 3

### Qüestió 10.

h*D + (O-1)/u * D + O*D = (log80(1000*10)-1)*1 + ((1000*10)/200 -1)/80 * 1 + ((1000*10)/200)*1 = 52.6125

### Qüestió 11.

h*D + D = (log80(1000*10)-1)*1 +1 = 3

### Qüestió 12.

O = (1000*10)*(1000000000-900000000)(1000000000-600000000) = 2500
h*D + (O-1)/u * D + O*D = (log80(1000*10)-1)*1 + (2500-1)/80 * 1 + 2500*1 = 2533.2375
Com es més gran que el número de blocs (1000), el cost és 1000.

### Qüestió 13.

H + D + D = 0 + 1 + 1 = 2

### Qüestió 14.

h*D + D + 1.5*(O-1)/R * D = (log80(10*1000)-1)*1 + 1 + 1.5*((10*1000)/200 - 1)/10 * 1 = 10.35

### Qüestió 15.

h*D + D =  (log80(10*1000)-1)*1 + 1 = 3

### Qüestió 16.

O = (1000*10)*(1000000000-900000000)(1000000000-600000000) = 2500
h*D + D + 1.5*(O-1)/R * D = (log80(10*1000)-1)*1 + 1 + 1.5*(2500 - 1)/10 * 1 = 377.85

### Qüestió 17.

k = (10*1000)/(2000-1901) = 100
v*(H + D + k*D) = 50*(0 + 1 + 100*1) = 5050
Com es més gran que el número de blocs (1000), el cost és 1000.

### Qüestió 18.

k = (10*1000)/(200) = 50
H + D + k*D = 0 + 1 + 50*1 = 51

## TRAINING ON SELECTION AND JOIN COST

BR = Taula amb blocs més petit.
BS = Taula amb bloc més gran.

### Qüestió 1.

Carinalitat = 10000*10 = 100000
Cost = 
M = M-2 (always BlockNestedLoops) = 102-2 = 100
BS = 10000/0.6666 = 10000*1.5 = 150000 (clustered)
BR·D + BS· BR/M·D = 5000*1 + 15000*(5000/100) = 755000

### Qüestió 2.

Carinalitat = 10000*10 = 100000
Cost = 
RowNestedLoops = Not useful for no index attributes.
BlockNestedLoops = BR·D + BS· BR/M·D = 5000*1 + 10000*(5000/(102-2)) = 505000
SortMatch = 	2BR·logM(BR)·D = 2*5000*log100(5000)*1 = 20000
		2BS·logM(BS)·D = 2*10000*log100(10000)*1 = 40000
(BR+BS)*D = (5000+10000)*1 = 15000
20000 + 40000 + 15000 = 75000
HashJoin = (2BR)·D + (2BS)·D + (BR+BS)·D = 2*5000*1 + 2*10000*1 + (5000+10000)*1 = 45000

### Qüestió 3.

Carinalitat = 5000*20*(400/490) = 81632
Cost =
BR = 500*1.5 = 750
BS = 5000*1.5*(400/490) = 6122
BlockNestedLoops = BR·D + BS· BR/M·D = 750*1 + 6122*(750/4) = 1148625
RowNestedLoops = 
k = (5000*20)/5000 = 20
BR·D+ |R|·(hS·D+D+(1.5(k-1)/RS)·D) = 
750*1 + 7500*(log100(81632)-1)*1 + 1 + 1.5*(20-1)/20 = 33937.5
SortMatch =	2BR·logM(BR)·D = 2*750*log2(750)*1 = 15000
		2BS·logM(BS)·D = 2*6122*log2(6122)*1 = 159175
(BR+BS)*D = (750+6122)*1 = 6872
15000+ 159175+ 6872 = 181044
Resultat = 9958.41

### Qüestió 4.

Carinalitat = 3334*3/1000 * 10 = 100
Cost =
Select =
h·D + ((|O|-1)/u)·D + |O|·D = (log40(3334*4)-1)*1 + ((10-1)/40)*1 + 10*1 = 12.225

BR = 1.5*3334/1000 = 5
BS = 33334/0.8 = 41667
SortMatch = 	2BR·logM(BR)·D = 2*5*log4(5)*1 = 20
		2BS·logM(BS)·D = 2*41667*log4(41667)*1 = 666672
(BR+BS)*D = (5+41667)*1 = 41672
20 + 666672 + 41672 = 708364
HashJoin: 	Nothing because Bsmaller > M^2 + M = 20
BlockNestedLoops: BR·D + BS· BR/M·D = 5*1 + 41667*5/4 = 52088.75
RowNestedLoops: BR·D+ |R|·(H+D+k·D) = (10/3)*1 + 10*(0+1+10*1) = 113.33

Resultat = ?

### Qüestió 5.

Carinalitat = 10000*10 = 100000
Cost =
M = M-2 (always HashJoin) = 102-2 = 100

(2BR)·D + (2BS)·D + (BR+BS)·D = 2*5000*1 + 2*10000*1 + (5000+10000*1.5)*1 = 50000 
