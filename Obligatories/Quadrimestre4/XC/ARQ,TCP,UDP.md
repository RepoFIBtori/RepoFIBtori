# TEORIA

### Algorismes ARQ (Automatic Repeat reQuest)

L'objectiu és aconseguir un canal de comunicació fiable (sense errors ni dublicacions i en el mateix ordre en què s'envia).

Números de seqüència: es fan servir per relacionar els missatges d'informació i les seves corresponents confirmacions.

Protocol orientat a la connexió: protocol que hi és quan hi han fases de senyalització per saber en quina part estàs i reservar recursos.

1. Stop and Wait
2. Go back N
3. Retransmissió selectiva 

#### Stop and Wait

`Transmetre una PDU d'informació i esperar que es confirmi abans de transmetre'n una de nova.`

Explicació:

Tenim un primari i un secundari connectats per un cable de D km de distància i velocitat de transmissió de vt bps. La velocitat de propagació del senyal elèctric en el cable és de vp m/s. 

- El nivell superior escriu la informació que s'ha de transmetre, en un temps de procés que suposarem 0, el primari ensambla la PDU d'informació Ik de Lt bits amb aquesta informació, la guarda en el buffer de transmissió i la passa al nivell inferior per la seva transmissió.
- La transmissió comença immediatament i dura un temps tt (segons)= L(bits)/vt(bps)
- El temps de propagació de cada bit que es transmet dura tp (segons)= D(m)/vp(m/s). Si és el buit és la velocitat de la llum 3·10^8.
- Quan arriba l'últim bit de Ik al secundari, el nivell superior llegeix la informació rebuda en un temps de procés que suposarem 0 i el secundari envia la confirmació Ak.  Si la mida de la confirmació és de La bits, el temps de transmissió de la confirmació serà ta(segons) = La(bits) / vt(bps). 
- Els bits de la confirmació tarden un temps tp a arribar al primari. Quan arriba l'últim bit de la confirmació, el primari esborra Ik del buffer de transmissió i repeteix el procés per a una nova PDU (Ik+1) 

Cada vegada que el primari envia una PDU, activa un temporitzsador time-out To; si el temporitzador salta sense haver rebut la confirmació llavors el primari retransmet la PDU, així si hi ha errors i el secundari descarta la PDU o no arriba es retransmet.

`E = tt/ Tc = tt / tt +ta +2tp ≈ tt / tt +2tp = 1 / 1+2a , on a = tp / tt `

Si a és molt petit (tp és molt més petit que tt) l'eficiència és pròxima al 100%.

#### Protocols de transmissió contínua

Els protocols de transmissió contínua resolen el problema de que si la tp no és molt més petita que tc en el Stop and Wait és molt ineficient. Per fer-ho deixen que s'enviï més d'una PDU sense confirmar. Cada vegada que es transmet una PDU d'informació es guarda en el buffer de transmissió (per si s'ha de retransmetre). Quan es rep la corresponent confirmació s'esborra el buffer. 

En absència d'errors l'eficència del protocol (sense tenir en compte les capçaleres) és del 100%. Els algorismes bàsics de recuperació d'errros en una transmissió contínua son Go Back N i retransmissió selectiva. 

##### Go back N

En cas d'error el primari torna enrera fins la PDU que falta al secundari i comenci a transmetre novament a partit d'aquest punt. 

1. Les confirmacions són acumulatives, és a dir la confirmació Ak confirma totes les PDU d'infromació amb números de seqüència <= k
2. Si el secundari rep una PDU d'informació (Ik) amb errors o fora de seqüència: 
   1. Deixa d'enviar confirmacions fins que rep correctament la PDU que falta
   2. Descarta totes les PDU que rep amb número de seqüència diferent a k 
3. Quan salta el temporitzador de transmissió d'una PDU, el primari retransmet la PDU Ik i continua amb la tramissió Ik+1, Ik+2...

##### Retransmissió selectiva

IDEA GENERAL : Que el secundari no descarti mai les PDU que arriben correctament encara que arribin fora de seqüència.  S'ha d'emmagatzemar i ordena les PDUs que arriben fora de seqüència, no poden ser llegides immediatament del nivell superior.

1. Les confirmacions són acumulatives, és a dir la confirmació Ak confirma totes les PDU d'informació amb números de seqüència <= k. 
2. Si el secundari rep una PDU d'informació (Ik) amb errors o fora de seqüència: 
   1. Deixa d'enviar confirmacions fins que rep correctament la PDU que falta 
   2. Guarda totes les PDUs que rep amb números de seqüpencia diferent a k
3. Quan salta el TimeOut d'una PDU, el primari retransmet la PDU Ik, però no retransmet altres PDUs que ja havia enviat abans. És a dir només retransmet les PDUs per les quals salta el time-out. 
4. Quan el secundari rep una retransmissió, envia una confirmació acumulada que confirma fins a l'última PDU en seqüencia rebuda correctament. 

### El nivell de transport d'Internet

A Internet hi ha dos protocols de nivell de transport: UDP i TCP. 

A TCP/IP les connexions solen ser tipus client-servidor. El servidor espera les peticions dels clients, ñes a dir escolta les peticions adreçades en un port well-known. Els ports well-known tenen un valor entre 0 i 1023. El client és sempre el que inicia la connexió cap al servidor i té un port assignat pel sistema operatiu entre el 1024 i (2^16 )-1. Es diu port efímer perquè només identifica el procés del client mentre dura la connexió. 

#### UDP 

És un protocol de nivell de transport "orientat al datagrama". El servei UPD  és connectionless, d'extrem a extrem  i no fiable (si el datagrama UDP es perd, UDP no el retransmet). Una altra característica importat és que cada operació d’ escriptura del nivell d’aplicació genera un datagrama UDP. Les aplicacions en temps real fan servir UDP.

#### La capçalera UDP

Té mida fixa de 8 bytes i hi ha 4 camps:

1. Port font i destinació per identificar els processos que es comuniquen. 
2. Length amb la mida total del datagrama UDP (payload UDP +8)
3. Checksum: protegeix la capçalera i el camp de dades. Es calcula aplicant l'algorisme de checksum conjuntament amb una pseudo capçalera, la capçalera UDP i el camp de dades. La "pseudocapçalera" té alguns camps de la capçalera IP per fer una doble comprovació que el datagrama ha arribat a la destinació correcta. En UDP el cheksum és opcional i en cas de no fer-se servir és igual a 0. Si es fa servir NAT cal recaluclar el checksum de la capçalera.

#### TCP

Protocol de nivell de transport de transmissió fiable d'informació. TCP és un protocol d'extrem a extrem, ARQ i orientat al a connexió. 

- Recuperació d'errors, per tenir transmissió fiable. 
- Control de flux perquè el primari no envïi els segments a més velocitat de la que pot processar-los el secundari. Altrament hi hauria segments que es podrien perdre per vessament del buffer de recepció del secundari. 
- Control de congestió, perquè el primari no envïi els segments a més velocitat de la que pot processar-los la xarxa. Altrament hi hauria segments que es podrien perdre en el coll d'ampolla de la xarxa. El coll d'ampolla és l'enllaç en què els segments que envia el primari veuen una velocitat mitjana més petita. Si el primari envia segments a una velocitat major, s'omplirà el buffer del router que ha d'enviar els segments per aquest enllaç i es produiran pèrdues. En les connexions que travessen Internet això passa amb relativa freqüència. Les pèrdues per congestió no són un mal funcionament de TCP, a diferència del que serien les pèrdues degudes a un control de flux, això és perquè les pèrdues de control de flux es poden evitar fàcilment. Les pèrdues per confestió en canvi serveixen de senyal a TCP per adonar-se que ha superat la velocitat que imposa el coll d'ampolla. 
- Segments de mida òptima. A diferència d'UDP, TCP va agafant bytes de l'aplicació per generar segments de mida òptima. TCP manté una variable anomenada Maximum Segment Size(MSS) que és la mida del que considera òptima pel payload (camp de dades). Típicament la mida òptima és la major possible(per minimitzar l'overhead de les capçaleres) però que no produeixi fragmentació a nivell IP. 

##### Control de flux

Per evitar el vessament del buffer de Rx ( en cas que el primari enviï a una velocitat major de la que el secundari processa les dades), TCP fa servir la advertised window. La advertised window és una de les informacions que sempre s'envien en la capçalera TCP. Quan TCP rep un segment guarda el valor de la finestra advertida en la variable awnd. El primari no pot enviar mai més bytes sense confirmar dels que diu awnd. D'aquesta manera sempre hi haurà espai suficient per guardar els bytes enviats en el buffer d'Rx. Si el buffer d'RX s'omple, el secundari enviarà una finestra advertida igual a 0 i el primari es quedarà bloquejat fins que el secundari torni a enviar una finestra advertida major de 0. 

`Resum: awnd depen de lo que hi ha al buffer de Rx per a que no perdem merdes`

##### Control de congestió

Quan es produeixen pèrdues en algun coll d'ampolla de la xarxa, el primari ha de reduir el nombre de segments que envia, és dir ha de reduir la finestra transmisió. Per a fer aquest control TCP fa servir una altra finestra, la finestra de congestió. TCP manté la variable cwnd amb el valor d'aquesta finestra. Aquesta variable s'incrementa si no es detecten pèrdues i es decrementen en cas contrari. 

TCP fa servir en tot moment una finestra de transmissió (wnd) igual a:

​								wnd = min{awnd, cwnd}

Classificació de connexions :

1. Bulk transfer (massives): Durant la transmissió l'aplicació sempre té dades llestes per enviar. El buffer de transmissió sempre està ple i TCP envia segments de mida màxima.  La finestra de transmissió limita la velocitat efectiva de la connexió. FTP, web, mail...

2. Interactives: Són aplicacions en què l'usuari interactua amb la màquina remota. En aquest cas la informació s'envia en missatges de pocs bytes i de forma discontínua. TCP no necessita introduir limitacions en aquest tipus de transmissions a causa del poc tràfic que generen és a dir la quantitat de dades que s'envien està molt per sota del que permet la finestra de transmissió.  Telnet.

   Hi ha dos mecanismes per millorar la eficiència d'aquestes aplicacions: 

   - delayed acknowledgements que és tardar més en enviar ack per veure si arriben nous segments de informació i llavors enviar ack de tots els rebuts
   - Nagle algorithm que només permet enviar si hi ha prou bytes per enviar un segment de mida màxima al buffer de transmissió o si no hi ha bytes pendents de confirmar. 

   Algorismes per a ajustar cwnd:

   1. Slow Start / Congestion Avoidance

      1. cnwd, finestra de congestió
      2. snd_una (unacknowledged), és el primer segment no confirmat, és a dir el segment que fa més temps que espera en el buffer de transmissió per ser confirmat
      3. ssthresh (slow start threshold), llindar entre les fases de slow start i congestion avoidance

   2. Fast Retransmit / Fast Recovery

      1. Quan es detecten confirmacions consecutives que no confirmen noves dades, més en concret quan TCP rep el tercer ack duplicat (és a dir, 4 acks amb el mateix número de seqüència)
      2. Es retransmet el segment
      3. Calcula el ssthresh com la meita de la finestra actual (com si saltés el To)
      4. Fixa cwnd = ssthresh + 3 MSS: la finestra que suposa que hi havia abans de la pèrdua, més els 3 segments que han generat els acks duplicats
      5. Passa a la fase de fast recovery. Durant la fase de fast recovery, per cada ack duplicat s'incrementa la finestra en un MSS, per poder enviar un nou segment (si ho deixa la finestra).
      6. Quan arriba un segment que confirma noves dades, es surt de fast recovery i es posa cwnd = ssthresh per iniciar la fase de congestion avoidance. 

#### Capçalera TCP

- Source Port i Destination Port: Port font i destinació
- Sequence Number: Número de seqüència del segment
- Acknowledgement Number: Confirmació 
- Header length: Mida de la capçalera en words de 32 bits. Mida mínima de la capçalera TCP és de 20 bytes, la màxima és de 60 bytes. 
- Reserved: bits reservats per possibles ampliacions del protocol. Es posen a 0.
- flags, són els següents: 
  - URG(urgents), indica es que es fa servir el camp Urgent Pointer
  - ACK(Acknowledgement), indica que es fa servir el camp Acknowledgement
  - PSH(push), indica que s'ha de deixar llegir el buffer de Rx del secundari el més aviat possible. L'activació d'aquest flag depèn de la implementació. Les implementacions derivades de BSD l'activen quan el buffer de Tx es queda buit. 
  - RST(reset), s'activa quan es vol avortar la connexió. 
  - SYN(Synchronize), es fa servir en l'establiment de la connexió
  - FIN(Finalize), es fa servir en la finalització de la connexió
- Advertised window: indica la finestra advertida
- Checksum, el càlcul del cheksum és obligatori(no com UDP), s'agafa:
  - La pseudocapçalera amb camps de la capçalera IP (adreça font, destinació, protocol) i la mida del segment TCP (capçalera més el payload). 
  - La capçalera TCP
  - El camp de dades (payload) del segment
- Urgent Pointer, implementa un mecanisme per indicar dades "urgents" (s'han d'atendre el més aviat possible). Les dades urgents anirien del primer byte del segment fins al byte indicat per l'Urgent Pointer. Aquest flag es fa servir rares vegades. 
- Options: 
  - Maximum Segment Size, es fa servir durant l'establiment de la connexió per suggerir el valor de la MSS a l'altre extrem. El valor que la suggereix és la MTU de la xarxa on està connextada l'ingerfície menys la mida de la capçalera IP i TCP (sense opcions). 
  - Window scale factor: es fa servir durant l'establiment de la connexió per indicar que el valor de la finestra advertida s'ha de multiplicar per aquest facor d'escala. Això permet advertir finiestres majors de 2^16 bytes. 
  - Timestamp: es fa servir en el càlcul de l'RTT
  - SACK, permet que TCP faci retransmissió selectiva. TCP fa servir el camp ack per indicar fins on s'ha rebut correctament. Amb l'opció SACK el secundari pot indicar blocs de segments que s'han rebut correctament més enllà del segment confirmat per l'ack. D'aquesta manera, el primari pot triar millor els segments que s'han de retransmetre. 
- Padding: bytes de farcement afegits perquè la capçalera tingui un múltiple de 32 bits. 

#### Números de seqüència en TCP

En TCP els números de seqüència i les finestres es mesuren en bytes. És a dir, si un segment porta S bytes, el númeto de seqüència del pròxim segment s'incrementarà en S. El número de seqüència que porta la capçalera identifica el primer byte de dades del segment. Inicialment la finestra val MSS (només permet enviar un segment) i s'incrementa amb MSS cada vegada que arriba una ck que confirma noves dades. 

Les confirmacions porten un valor igual al número de sequência que porta el segment que confirmen més el nombre de bytes de dades del segment. Per exemple, si el segment amb número de seqüència Si porta MSS bytes(segment de mida màxima), aleshores la confirmació porta el valor: ack = Si + MSS.  Quan el primari rep la confirmació interpreta que tots els bytes identificats amb números de seqüència inferiors al de l'ack han arribat correctament al secundari i els esborra del buffer de transmissió. 

#### Establiment i terminació d'una connexió TCP 

L'estabilment d'una connexió TCP es coneix amb el nom de three-way-handshaking i consisteix smpre en l'intercanvi de tres segments que no porten dades (només la capçalera TCP): SYN/SYN+ack/ack

- El primer segment (SYN) sempre l'envia el client. Aquest segment té típicament un port well known com a destinació i un port efímer com a port origen. La caracterísdtica més important és que té el flag de SYN activat. Aquest segment Aquest segment és un dels pocs casos en què, per motius obvis no es confirma res (el flag d'ACK ha d'estar desactivat). Aquest segment típicament porta opcions com ara l'MSS o les opcions timestamp, window scale factor o SACK, com a inficació que es volen fer servir. Aquest segment també porta l'initial sequence number que és el número de seqüència inicial que es farà servir per identificar els bytes de dades enviats pel client. Aquest número és un número aleatori de 32 bits. 
- El segon segment (SYN + ack) l'envia el servidor. També té el flag de SYN activat i porta l'initial sequence number per identificar els bytes de dades enviats pel servidor. Els segments de SYN, tot i no portat cap byte de dades, consumeixen un número de seqüència. L'ack d'aquest segment, per tant, té un valor igual a l'initial sequence number del client més 1. 
- Finalment el client confirma la recepció de SYN+ack enviant la confirmació amb l'initial sequence number del servidor més 1. 

La terminació de la connexió es produeix amb l'intercanvi de 3 o 4 segments:  FIN/ack en un sentit i FIN/ack en el sentit contrari.

 El segment de FIN s'envia quan l'aplicació fa la crida close(). Igual que el SYN, el FIN consumeix un número de seqüència. Una diferència important és que el segment de FIN pot portar dades. De fet, és normal que això passi si encara hi ha bytes de dades per enviar en el buffer de transmissió de TCP quan l'aplicació fa la crida close(). Un altre detall és que fins que l'aplicació no fa la crida close(), pot continuar escrivint i TCP enviarà les dades. Si a l'altre extrem ja ha executat la crida close(), aleshores es diu que la connexió està half closed, i només es poden enviar dades en unsentit(el que encara no ha enviar el segment de FIN). A diferència del three-way-handshaking, on el client envia sempre el primer segment de SYN, el primer segment de FIN pot enviar-lo el client o el servidor. 

# Tests

En un protocol de finestra si la finestra de transmissió val 1 es comporta igual que Stop-and-Wait(mirar què és Stop-and-Wait).

Augmentant la mida de la finestra més enllà de la finestra òptima no es guanya eficiència.

Sempre cal un temporitzador de retransmissió (RTO).

Les capçaleres UDP i TCP tenen un camp amb el port font i el port destinació i tenen un camp checksum.

Respecte TCP, el temporitzador de retransmissió, RTO, s'actualitza a partir del càlcul que es fa del round trip time RTT. Hi ha algnes opcions que només es fan servir durant l'establiment de la connexió (three-way-handshake). El slow start treshold (mirar què és) no pot tenir un valor inferior a 2 segments (2 MSS bytes). És possible enviar una finestra anunciada (advertized window) igual a 0 bytes. 

En un switch ethernet on hi ha configurades 2 VLANs i un port en mode trunk és possible que una trama que arriba per el trunk es reenviï per més d'un port, és possible que una trama que arriba per el trunk es reenvïi per tots els ports d'una mateixa VLAN.

Respecte Ethernet en un switch hi pot haver ports full duplex i half duplex simultàniament, les trames Ethernet tenen un camp amb l'adreça destinació i un camp amb l'adreça font.

Se puede abortar una conexión TCP enviandon un segmento con el flag R activo. 

