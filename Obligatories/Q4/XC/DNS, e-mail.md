# DNS (Domain Name System)

`Objectiu : permetre que els usuaris d'Internet puguin fer servir noms en comptes d'adreces IP`

1. Segueix el paradigma client/servidor amb nivell de transport TCP/UDP amb port well-known 53.

2. Hi ha una base de dades amb els noms i les adreces per poder fer la resolució.

3. El sistema de noms està organitzat en una jerarquia que permet distribuir la base de dades  arreu d'Internet, en comptes d'haver de mantenir-la centralitzada en un únic servidor. 

4. És un protocol d'aplicació.

   

### Jerarquia

La jerarquia del sistema de noms està organitzada en "dominis" o "zones". El domini arrel no té nom i d'ell pengen els top level domains (TLD). Cada un dels TLD té un administrador que delega part del domini en "sub-dominis".

El nom s'escriu començant pel host i separant els dominis per punts fins el TLD. El nom es pot fer acabar en un punt per indicar que s'especifiquen tots els dominis (fully qualified domain name).

Cada administrador d'un domini (o subdomini) ha de mantenir part de la base de dades de DNS en un "servidor primari" i un o més "servidors secundaris" (de backup). En l'argot DNS, aquests servidors també es coneixen com a "autoritat" (authority) del domini. En aquests servidors hi ha d'haver el nom i adreça dels hosts que pengen del seu domini i el nom i adreça dels servidors primaris i secundaris de les autoritats dels subdominis que hagi delegat. 

Actualment hi ha 13 servidors que tenen les adreces dels TLD anomenats root-servers i estan distribuïts arreu del món. 



### Accés a la base de dades de DNS

Exemple: accés a **mauriciabad.com**.

1. El host envia el nom que es vol resoldre al seu servidor de DNS.
2. El servidor envia la petició a un root-server, que li retorna l'adreça del servidor de noms del TLD, domini com.
3. Després el servidor s'adreça al servidor del domini com, que retorna l'adreça del servidor de noms del second level domain, domini mauriciabad.com.
4. Després el servidor s'adreça al servidor del domini mauriciabad.com, que li retorna l'adreça buscada.
5. Finalment el servidor retorna l'adreça buscada al host que ho havia sol·licitat.

La resolució que fa el host s'anomena **recursiva**. La resolució que fa el servidor de noms del host s'anomena **iterativa** perquè consulta iterativament els servidors dels dominis fins que resol l'adreça buscada. Una característica molt imporant és la *caching*. Consisteix en que el servidor de noms del host guardarà l'adreça sol·licitada. 



#### Tipus de Resource Record(RR)

- NS, Name Server

- MX, the domain Mail eXchange server

- A, A host address

- CNAME,  Canonical Name Record

  

####  Format dels missatges de DNS

- Header: Especifica el tipus de missatge
- Question: Especifica el que es vol resoldre
- Answer: Especifica la resposta
- Authority: Especifica el nom de l'autoritat del domini
- Additional: Informació addicional (típicament, les adreces IP de les autoritats del domini)



#### Header

En el header hi ha els següents camps:

- Identification, que permet relacionar els missatges de query (pregunta) i reply (resposta) amb un número random de 16 bits.

- Flags, on els més importants són:

  - Query-response (flag QR): indica si el paquet és de query o resposta.

  - Authoritative Answer (flag AA): indica si ha respost l'autoritat del domini, o si la resposta estava en la cache del servidor on s'ha fet la pregunta.

  - Rescursion-Desired (flag RD): indica si es desitja que la resolució sigui recursiva.

    

#### Question

Format del camp question: 

- QName: Especifica el nom que es vol resoldre. 

- QType: Especifica el tipus de pregunta. Alguns dels tipus són: 

  - Adress, A: pregunta l'adreça IP
  - Name Server, NS: pregunta el Name Server.
  - Pointer, PTR: pregunta una resolució inversa. 
  - Mail Exchange, MX: es fa servir per encaminar correu electrònic.

- QClass: Especifica el tipus d'adreça que es vol resoldre. En el cas de referir-se a una adreça d'Internet val 1.

  

#### Resource Records (DNS database entries)

Els camps Answer, Authority i Additional estan formats per seqüències d'un o més Resource Records. El seu format és el següent: 

- Els primers camps (Name Type i Class) tenen el mateix significat que en el camp Question. 

- TTL (Time To Live), el nombre de segons que es pot guardar el RR en la cache.

- RDLenth,  mida del camp Rdata en bytes.

- RData, és l'adreça IP si el RR és del tipus A(Adress), o el nom de l'autoritat si és del tipus NS, MX o CNAME.

  

# Email

- One of the first Internet applications
- Transport layer: TCP, well-known port: 25
- Simple Mail Transfer Protocol, SMTP, RFC821
- email text messages RFC822
- Retrieval protocols: IMAP, POP, HTTP

### SMTP (Simple Mail Transfer Protocol)

`Receiver : R and Sender : S`

#### Establiment de la connexió

​	S: Connexió open TCP

​	R: *220 server-domain* simple mail transfer service ready

​	S: HELO *host-domain* (identify SMTP client)

​	R: 250 *server-domain*

#### Origen i destí de la informació

​	S: MAIL FROM: host-domain (identify sender mailbox)

​	R: 250 OK

​	S: RCPT TO: *host-domain-to-be-sent* (identify recipient mailbox)

​	R: 250 OK

​	S: RCPT TO: *wrong-host-domain-to-be-sent*

​	R: 550 wrong address

####Transmissió del missatge i tancament

​	S: DATA

​	R: 354 start mail input, end with <CRLF>.<CRLF>

​	S: line 1

​	...

​	S: line n

​	S: <CRLF>.<CRLF>

​	R: 250 OK

​	S: QUIT

​	R: 221 *server-domain* Service closing transmission channel 

### MIME (Multipurpose Internet Mail Extensions)

Per indicar el tipus de media que va a continuació en un missatge, i.e. : application, audio, image, multipart, text o video.

L'estructura per a definir-los es -type/subtype. Alguns exemples: 

– application/pdf, application/msword, application/soap+xml, application/vnd.ms-powerpoint, application/vnd.nokia.radio-preset, ... 

– audio/GSM, audio/mpeg, audio/vnd.dolby.mps, … – image/gif, image/jpeg, image/png, image/vnd.adobe.photoshop, ... 

– text/plain, text/html, text/vnd.dvb.subtitle, …

 – message/rfc822, message/http, ...

 – model/images, … 

– multipart/mixed, multipart/alternative, …

 – video/H264, video/mp4, video/vnd.nokia.videovoip, … 

### Formats

- Header
  - From: , To: , Cc: , Bcc. , Subject: , Reply-To: , In-Reply-To: , Date: , Message-ID: , Blank line
- Body : Content sent by the user
  - Header + Body + boundary (i es repeteix tot el que volguem, fins i tot pot ser recursiu i dintre un body tenir-ne un altre)