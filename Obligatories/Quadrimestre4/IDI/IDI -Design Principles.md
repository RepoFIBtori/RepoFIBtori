# IDI

## Principle concepts of Design

### Chunking

Fer trossos petits per a que l'usuari memoritzi la info més fàcilment. 

### Color

> Sóc subnormal i no sé que no he de saturar les coses amb molts colors o que els colors poden servir per a reforçar el significat de les coses. 

1. Number of colors(up to five)
2. Color Combinations
3. Saturation: Attracts attention
4. Symbolism

### Latch principle

Location, Alphabeat, Time, Category, Hierarchy

### Garbage-in garbage-out(GIGO)

##### 	·Type Error

##### 	·Quality Error: input of correcty type but has some slips

### Iconic Representation

Types: 

1. Similarity :arrow_right:(turn right)
2. Example :airplane: (airport)
3. Symbolic :unlock: (unlock)
4. Arbitrary (nuclear symbol)



## Principis de percepció: Gestalt Laws

#### Pragnänz Law (SIMPLICITY):

We tend to perceive simpler shapes

#### The law of closure 

The mind may experience elements that are not there in order to complete incomplete shapes.

#### The law of similarity

Juntem les coses que s'assemblen depenent de la forma, color, tamany o brillantor.

#### The law of proximity

Percebem totalitat o col·lectius si les coses estan aprop.

#### The law of symmetry.

Les imatges simètriques es perceben col·lectivament.

#### The law of continuity

Juntem les coses que estan aprop per a afavorir la continuitat. 

#### The law of common fate

Juntem coses quee es mouen en la mateixa direcció.




### Orientation Sensivity

Efficient perception of line orientation is highly limited.

1.	Vertical or horizontal orientation are ok, while oblique orientations are more difficult to distinguish.
  .	Due to two main phenomena in visual perception:
  .	Oblique effect (ens costa més pillar coses obliqües que les horitzontals o verticals)
  .	Pop-out effect 

### Pictorical Superiority effect

> Una imatge val més de 1000 paraules.

Millor una imatge si volem fer recordar a la gent més de 30 segons. Amb menys SUDA PASTÍS

### Rule of thirds

Dividir escena en 3 o 5 parts i en algun dels eixos hi ha d'haver les parts importants. 

### Signal to noise ratio

Ratio de lo que volem ensenyar i soroll que no comunica res (the goal of communication is maximizing signal).

>Diagrames de tipus pastís no, siusplau, no siusplau. Cada cop que es fa servir Déu mata un gatet



## Colour Principles

#### PROBLEMES GENERALS DE LA VISTA HUMANA

### Color design rules: 

#### Color Palettes

·	Categorical (no order required)
. 	Sequential (order required but no neutral value)
. ​	Diverging (order required and neutral value)

#### De-emphasizing

#### Avoiding combination red and green (DALTONICS GET REKT)

#### Use:

​	Opposite colors, complementary colors,  split-complementary colors, triad relationship, tetrad relationship, etc.



## INTERACTION DESIGN AND EVALUATION

#### Information Theory Elements (i.e. telegraph)

       	1.	Information source: the element that produces a message or sequences of messages.
   	2.	Transmitter: Operates on the message to make it transmissible through a medium. 
  .	Channel: The medium that transmits the message.
  .	Receiver: The element that reconstructs the message to the destination

##### Information Measures

​	Let d be a device that produces symbols A,B and C with the same probability.

    1. M = 3 is the total number of symbols.

2. Each time a symbol is produced we are uncertain on which symbol is going to be generated.

3. The probability of symbol to appear is 1/M : 1/3. The uncertainty is measured by ![](http://latex.codecogs.com/gif.latex?log_%7B2%7D3)

4. The uncertainty we have depends on the number M of symbols = ![](http://latex.codecogs.com/gif.latex?log_%7B2%7D%28M%29)

5. Logarithms are commonly taken in base, and the units are bits.

      ##### Example

      `We have two devices, one with outputs A,B,C and the second with outputs 1,2. We combine words by concatenating one symbol of device 1 and one with device 2. We will have 6 different words: A1,A2,B1,B2,C1,C2. Uncertainity of log2(6) = log2(2)+log2(3).   `

      

**Information is the reduction of uncertainty or average surprise of a set of symbols. **

### Shannon Entropy

**It measures the amount of information:** 

![Shannon Entropy](http://latex.codecogs.com/gif.latex?H%20%3D%20-%5Csum_%7Bi%20%3D%201%7D%5E%7BN%7D%20p_%7Bi%7D%20log_%7B2%7D%20p_%7Bi%7D)

* N is the number of alternatives 

* pi is the probability of the ith alternative

* **H is the entropy of the message that is to be transmitted, the amount of information expected to be received (no noise)**

  

**Average information faithfully transmitted(R):**

​						                                 R = H(x) - Hy(x)

*Hy(x) is the equivocation or conditional entropy of x when y is known.*



### Hick-Hyman Law

**Describes _human decision time_ as a function of the information content conveyed by a visual stimulus. It takes longer to respond to a stimulus of a large set than a smaller set of stimulus.**

**Time to make a decision (Reaction Time):**

​						RT = a + bHt

*a,b are constants*
**Ht transmitted information**

​						Ht = log2(n+1)

*n are the equiprobable alternatives*

*original formulation did not have the "+1" attends for the uncertainty whether to respond or not*

**Time to answer is the Reaction Time:**

​					  RT = a + b·log2(n+1)



[More: Hicks Law explained ](https://uxknowledgebase.com/hicks-law-7e9eb8ceaee0)

> Mirar si pregunten l'experiment que va fer el pavo als examens per mirar's-ho

### Fitts Law: Measuring Pointing Time

**Task difficulty:**

​					ID = log2*(2A/W)

*ID: Index of difficulty*

*A: Amplitude of movement*

*W: Target width*

*The larger the amplitude the higher the difficulty*

*The larger the target the lower the difficulty*



**Movement Time: Time to point a certain objective (target)**

​					MT = a + bID

*a start/stop times in seconds*

*b inherent speed of the device*

##### Original experiment

> Un pavo movent amb un boli diferents coses d'un lloc a un altre amb diferents mides.

![](https://www.researchgate.net/profile/Kyle_Brady3/publication/312937025/figure/fig3/AS:454819442892802@1485448813631/The-layout-used-to-test-Fitts-Law-on-discrete-motor-movements-2-dimensional-movement.jpg)

Results:

* Average error negligible
* **Most difficult condition: Smaller W and largest A** (what a surprise eh)
* Results show that there is a linear relationship between MT and ID

#### Variants

Puro sida... bueno poso les fórmules. Resum: altres pavos van fer altres fórmules que s'ajusten millor als experiments 

**Welford**:

​						MT = a + b log2((D+0.5*W)/W)

**MacKenzie:**

​						MT = a + b log2(D/W) +1



*D is the distance of movement*

*W is the width of the target*

**Vertical and horizontal movements can be treated equally**

**Used in evaluating/designing the UI and interaction**

## Possibles preguntes
**Defineix inconsistència induida i posa un exemple.**

Inconsistència induïda consisteix en reforçar visualment el fet de que objectes que són diferents es comporten diferentment, especialment quan hi ha canvis en el sistema. També es pot utilitzar la inconsistència induïda per reforçar la comunicació de que quelcom ha canviat en la interfície de forma substancial per evitar que l'usuari continuï emprant les mateixes accions que abans sense adonar-se'n. Per exemple, si un element de la interfície canvia el seu funcionament en una nova versió, mantenir la mateixa icona pot ser perjudicial. En aquest sentit, la inconsistència induïda consistiria en canviar de forma perceptible la icona per a que l'usuari se n'adoni que hi ha quelcom nou o diferent. 



**Defineix la llei de Hick-Hyman. Un cop definida explica com es calcula i finalment, dóna algun exemple on es pot utilitzar aquesta llei per a dissenyar interíficies. **

La llei de Hick-Hyman descriu el temps de decisió dels humans com una funció de la informació captada a través d'un estímul visual. En particular, el temps de decisió anomenat Temps de Reacció (Reaction Time) és lineal amb la quantitat d'informació transmesa. 

La fórmula que es va proposar per calcular-lo és la següent :

​	RT = a+bHt

On a i b són constants determinades de forma empírica. L'expressió Ht és la informació transmesa que es mesura com el logaritme en base de dos del nombre de estímuls més un:

​	Ht = log(n+1)

On n és el nombre d'alternatives equiprobables i el +1 indica la incertesa en si respondre o no. Més endavant es va desmostrar que les alternatives no havien de ser equiprobables. 

La llei de Hick-Hyman s'ha demostrat efectiva en tasques com la selecció d'elements en un menú. Si bé el temps que triga un usuari novell en escolliir una opció en un menú és lineal amb el nombre d'opcions, els usuaris experts triguen un temps que és logarítmic amb el nombre d'opcions, tal i com prediu la lllei de Hick-Hyman. 

**Explica breument la llei de crossing i steering.**

La llei de crossing és la llei que descriu el temps que es triga a creuar dos objectius amb un cursor o ratolí. El creuament dels objectius pot ser continu o discret. 

La llei de steering és la llei que modela el temps que es necessita per a recórrer una trajectòria (dirigir un moviment continu) en funció de la distància a recórrer i l'amplada del camí en cada moment. 

En ambdós casos, les lleis tenen la mateixa forma que la llei de Fitts, és a dir la relació entre el temps de movient és lineal amb ID. No són la llei de Fitts ni una extensió de la lllei de Fitts en el sentit que aquestes dues lleis pretenen mesurar coses diferents. En el cas de la llei de crossing, l'ID depèn de l'amplada dels objectius a travessar i la distància que els separa. En el cas de la llei de steering depèn de l'amplada del camçi a recórrer en cada punt i la distància a recórrer. 

La relació que hi ha entre ambdues lleis és que es pot arribar a la llei de steering a partir de la llei de crossing, ja que dirigir un punter per un camí d'amplada arbitrària es pot descompondre en una sèrie infinita de tasques de crossing. 

**Explica breument en què consisteix la tècnica de chunking i per a què s'utilitza.**

La tècnica de chunking consisteix en separar la informació en bocins que siguin fàcilment recordables per part dels usuaris.

És díficil distingit un nombre gran d'elements sense tenir cap referència i en particular és difícil recordar llistes llargues d'elements (sobretot tn ememòria a curt termini), i tendim a subdividir les llistes llargues en llistes més petites. Per això llistes d'elements que convé que l'usuari pugui tenir present en un moment determinat de la seva interacció, és convenient fer-les curtes. 

La tècnica s'empra per facilitar la interacció de l'usuari amb les interfícies a base de dividir en grups de pocs elements aquella informació que és important recordar.  

**Duck:** informació innecessària

**Five Hat Racks**: hi ha cinc maneres d'organitzar la informació (lo del LATCH: location, alphabeat, time, category and hierarchy)

**Per passar de RGB a CMY: simplement he d'agafar lo que em falta al RGB, per exemple: si tinc RGB (0,0,1) amb CMY seria (1,1,0).**

💙 RGB(0,0,1) or CMY(1,1,0)

🔴RGB(1,0,0) or CMY(0,1,1)

💚RGB(0,1,0) or CMY(1,0,1)

💛(1,1,0) or CMY(0,0,1)

**Non-perceived affordances:** quan una interfície no mostra de forma visual els elements amb els quals es pot interectuar 

# Usability Testing

### Concepts

- Usability
  - How much a product can be used by specified users to archieve **specified goals** with effectiveness, efficency and satisfaction in a **specified context of use**. 
  - Usability has to be specific. It must refer to particular tasks, particular enviornments and particular tasks, particular envionments and particular users. 
    - That's why we need testing.

#### How to test?

- Ease of use is inversely proportional to the number and severity of difficulties people have in using software.
- Major families by goals
  - Determine usability problems
    - Discovery, prioritization and resolution of usability problems
    - Iterative testing 
  - Measure task performance
    - The development of the usability objetives
    - Iterative testing to determine if the product under test has met the objectives
- Variety:
  - Informal/Formal
  - Observer might sit next ot the participant, watch through a one-way glass or whatever to check the behaviour of a participant who is performing specified tasks. 
  - Often use think-aloud(TA)
  - Observers might watch one or two participants at a time
  - Evaluated software can be varied:
    - Prototypes, under development, competitive products...
- Think-Aloud
  - Participants must talk about what they are doing as they do it.
    - What users say during tasks is more reliable than posterior interviews
      - In interviews users are inclined to answer what they think you would like them to.
      - When people verbalize after the experiment. they only note what they remember
      - People tries to rationalize their behaviour
  - Can be applied to almost any usability testing method
  - Seems to work better with pairs of participants
  - Better for problem discovery than measurement
- Testing techniques
  - Remote testing
  - Heuristic/expert evaluation
  - Formal usability tests 

#### Formal usability tests

- They required a controlled environment (inside a room, outside)

- Devices used

- Other conditions

- Set of soundproofed rooms

  - Proper recording and avoiding distractions to participants

- Different areas and equipment

  - Participant area
  - Observer area 
  - Executive viewing area behind the primary observer area
  - Video cameras and microphones

- Roles: Test administrator(A), Briefer(B), Camera Operator(CO), Data Recorder(DR), Help Desk Operator(HD), Product Expert(PE), Statistician (S)

- Preparation:

  - **Product understading**: purpose of the product, parts ready to test, type of users...
    1. Understand the purpose of the product
    2. Parts of the product are ready for testing
    3. Types of people who will use the product
    4. Determine the use given to the product
    5. Conditions of usage of the product
  - **Test purpose**: product comparison within/between subjects...
  - **Measures/goals**: Number of iterations, counting mistakes/errors, timing...

- Implementation:

  - Participant's selection
  - Task scenarios: initial conditions, steps.
    - Must be representative
      - Core tasks: features that everybody uses
      - Peripheral tasks: features used less often
    - Once the tasks are defined, scenarios of use must be created
      - Definte initial conditions 
      - Description of the scenario: **what to do and why**
        - Some action must be taken on finish
        - Should not prove step-by-step instructions but should include details
        - Not all users must be provided with the same scenarios
  - Pilot test: members of the team
  - Testing
    - Brief participants
    - Initial questionnaire
    - Develop tasks
    - Debrief
    - Final questionnaires

- Reporting 

  - Data analysis & Evaluation
  - Issues/Measures & Recommendations
    - Frequency (easier): number of users that find a problem divided by the number of users testing the app or web
    - Severity (more difficult): importance of the problem. Might be completely catastrophic or simply cosmetic
  - Report
    - Describe & prioritize the usability problems
    - Present quantitative measurements
    - Should indicate the importance: **severity**
    - Can be classified:
      1. Mistakes: errors due to incorrect intention 
      2. Slips: errors due to appropiate intention but incorrect action
    - Expertise does not affect on the number of errors
      - But affects how fast they are handled 
    - Recommendations:
      - Create a problem grid: frequency/impact
      - Global changes (prevent task completion) first
      - Must be checked
        - A missing help may be a global problem or something related with a concrete UI
      - Try to give at least one recommendation for each problem
        - Present the different trade-offs clearly
    - Rating the severity of usability problems
      - Some thoughts on severity and frequency
      - Local Evaluation: Jeff Rubin
        1. Unusuable: the user is not able to or will not want to use a particular part of the product because of the way that the product has been designed and implemented. 
        2. Severe: the user will probably use or attempt to use the product here, but will be severly limited in his ability to do so.
        3. Moderate: the user will be able to use the product in most cases, but will have to undertake some mdoerate effort in getting around the problem.
        4. Irritant:  the problem occurs only intermittently, can be circumvented easily, or is dependent on a standard that is outside the product boundaries.
      - Global evaluation: Dumas and Redish 
        1. Prevents Task Completion
        2. Creates significant delay and frustation 
        3. Problems have a minor effect on usability
        4. Subtle and possible enhancements/suggestions
    - Conclusions of problem evaluation
      - Do not use a large number of categories
      - Different evaluators may disagree on some problems' severity
      - Treat frequency separately from severity
      - Do not forget to point out positive findings

  

  #### Cheap tests

  Testing just a single person early is much better than 50 near the end.

  The point of testing is to inform your judgment.

  1. Guerrilla usability testing

  2. Steve Krug's "usability testing on 10 cents a day"

     

  **Guerrila usability testing**

  Take someone in a coffe or public space and ask her to use a website for a couple of minutes.

  Observer users, ask open-ended questions such as "What would you do here?"

  Get to know them a bit and analyse captured data(considering audience).

  **Usability testing on 10 cents a day**

  Prepare some task to evaluate, grab somebody from the company as user, gather stakeholders in an observing room, let the user do a set of tasks. Capture gestures, mouse, record... Discuss over lunch and report. 

