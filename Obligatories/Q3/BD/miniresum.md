
# Mini Resum BD

## Procediments emmagatzemats

Base de dades d'exemple:

```sql
create table clients(
    dni varchar(9) primary key,
    nom varchar(15) not null,
    cognom1 varchar(15) not null,
    cognom2 varchar(15) not null,
    carrer varchar(20) not null,
    num_carrer varchar(4) not null,
    cp char(5) not null,
    ciutat varchar(15) not null,
    qtt_com integer
);
create table comandes (
    num_com integer primary key,
    dni varchar(9) not null references clients,
    data_arribada date not null,
    import_total integer );
create table items(
    num_item integer primary key,
    preu_unitat integer not null);
create table items_comanda(
    num_item integer references items,
    num_com integer references comandes,
    quantitat integer not null,
    primary key(num_item,num_com));
```

PL/pgSQL ens proporciona dos tipus de sentències:

- Sentències per definir i assignar valors a variables (DECLARE).
- Sentències per a controlar el flux d'execució d'un procediment:
  - Sentències condicionals: IF
  - Sentències iteratives: LOOP, FOR i WHILE.
  - Sentències per a la gesitó d'errors: EXCEPTION i RAISE EXCEPTION.

```sql
CREATE FUNCTION nom_func (param_entrada tipus) RETURNS tipus_retorn AS $$
				..............	........	...............
	RETURN variable_retorn;
END;
$$LANGUAGE plpgsql;
```

Així es la estructura bàsica d'una funció (procediment) en PL/pgSQL.

### Estructura per a una única tupla

A continuació veiem un exemple d'un procediment que obté la ciutat on viu el client amb el DNI del paràmetre d'entrada.

```sql
CREATE FUNCTION trobar_ciutat(dni_client varchar(9)) RETURNS varchar(15) AS $$
DECLARE
	ciutat_client varchar(15);
BEGIN
	SELECT ciutat INTO ciutat_client
	FROM clients
	WHERE dni = dni_client;
	
	RETURN ciutat_client;
END;
$$LANGUAGE plpgsql;
```

*Ara hem vist com seria l'estructura completa d'un procediment emmagatzemat que retorna UNA única tupla.

### Estructura per a més d'una tupla

Si ens interessa retornar un conjunt de tuples, el que farem és el següent:

```sql
CREATE FUNCTION nom_proc(param_entrada tipus) RETURN SETOF tipus AS $$
	.............
	RETURN NEXT ciutat_client;
	............
END;
$$LANGUAGE plpgsql;
```

La clàusula RETURN NEXT,  **no acaba el procediment**, sinó que va retornant a cada execució els valors de la variable. El procediment acaba quan s'executa un RETURN sense NEXT o quan s'arriba al final. Amés utilitzem el **SETOF** per a indicar que retornem un conjunt de tuples.

```sql
CREATE FUNCTION exemple_retorn_n_tuples(max integer) RETURNS SETOF integer AS $$
DECLARE
	i integer := 0;
BEGIN
	LOOP
		i:=i+1;
		RETURN NEXT i;
		EXIT WHEN i = max;
	END LOOP;
	RETURN;
END;
$$LANGUAGE plpgsql;
```

#### Declaració de variables

Les variables no són objectes de la BD i totes les variables definides e un procediment són locals i per tant només visibles per al procediment on s'han definit.

Sintaxis:

```sql
Nom_variable [CONSTANT] type [NOT NULL] [{DEFAULT | :=}expression];
```

Exemples:

```sql
DECLARE
	nom_client char(15);
	carrer varchar(20) not null;
	edat integer default 18;
	num constant integer default 0;
	
	dni_client clients.dni%TYPE;
```

Les variables prenen per defecte el valor NULL.

#### Creació de tipus

Necessari en casos com per exemple quan un procediment ha de retornar tuples amb un conjunt d'atributs.

```sql
CREATE TYPE tipusAdressa AS (
	carrer varchar(20),
	num_carrer varchar(4),
	ciutat varchar(15));

CREATE FUNCTION exNousTipus() RETURNS tipusAdressa AS $$
DECLARE
	adressa tipusAdressa;
	carrer varchar(20);
BEGIN
	...
	adressa.ciutat := 'Badalona';
	...
	carrer := adressa.carrer;
	...
RETURN adressa;
END;
$$ LANGUAGE plpgsql;
```

Exemple: Obtenir l'adreça (carrer, num_carrer i ciutat) d'un client:

```sql
CREATE TYPE TAdressa AS (
	carrer varchar(20),
	num_carrer varchar(4),
	ciutat varchar(15));

CREATE FUNCTION trobar_adressa_client (dni_client clients.dni%type) RETURNS TAdressa AS $$
DECLARE
	dadesCli TAdressa;
BEGIN
	SELECT carrer, num_carrer, ciutat INTO dadesCli
	FROM clients
	WHERE dni = dni_client;
	
	RETURN dadesCli;
END;
$$LANGUAGE plpgsql;

select * FROM trobar_adressa_client('41627330');
```

#### Assignació de valors

**Només té sentit per a procediments o sentències que retornen una fila**:

- Assignació de PL/pgSQL

  ​	numComclient := (SELECT num_com
  					FROM clients
  					WHERE dni = dni_client);

- SELECT ... INTO  (SQL)

  ​	SELECT ciutat INTO ciutat_client
  	FROM clients
  	WHERE dni = dni_client.

- Assignar a una variable  el que retorna un procediment:

  ​	imp_comanda := import_una_com(numero_com);
  	**o bé**
  	select * from import_una_com(numero_com) into imp_comanda;

### Sentències condicionals

Obté el descompte del client amb DNI que es passa per paràmetre. Aquest descompte depèn del nombre de comandes del client.

```sql
CREATE FUNCTION calcul_desc_client(dni_client clients.dni%type) RETURNS integer AS $$
DECLARE
    descompte INTEGER;
    qttComClient INTEGER;
BEGIN
    IF (EXISTS (SELECT * FROM clients WHERE dni=dni_client))THEN
        qttComclient:=(SELECT qtt_com FROM clients WHERE dni=dni_client);
        IF (qttComclient=0) THEN descompte:=0;
        ELSIF (qttComClient<5) THEN descompte:=1;
        ELSIF (qttComClient<10) THEN descompte:=3;
        ELSIF (qttComClient<15) THEN descompte:=5;
        ELSE descompte:=10;
        END IF;
    END IF;
	RETURN descompte;
END;
$$LANGUAGE plpgsql;

```

#### La variable FOUND

FOUND és de tipus booleà i en un principi té valor **False**. Aquest valor pot canviar quan s'executen els sentències següents:

- SELECT ... INTO posa FOUND a **True** si el select obté una fila i **False** si no n'obté cap.
- UPDATE, INSERT o DELETE posa FOUND a **True** si com a mínim una fila es veu afectada per la sentència, i False si cap fila s'ha vist afectada.
- FOR, dintre de cada iteració, el valor de la variable pot canviar segons les sentències que s'hi executen. Però en sortir del FOR es posa FOUND a **True** si t'ha iterat una o més vegades, sinó és posa a **False**

FOUND es una variable local en un procediment. Qualsevol canvi en aquesta variable afecta només al procediment on es produeix aquest canvi.
