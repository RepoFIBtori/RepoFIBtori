

# Patrones de Diseño

- Patrones creadores
- Patrones de comportamiento
  - Caracterizan la forma en que objetos o clases interactúan y distribuyen la responsabilidad
- Patrones estructurales

#### Patrón Singleton

Propósito: asegurarse de que una clase tiene sólo una instancia, y proporcionar un punto de acceso global a ésta.

Solución: hacer a la propia clase responsable de registrar su instancia única. La clase intercepta peticiones para crear nuevas instancias y proporciona una forma de acceder a la instancia en cuestión.

##### Tipos de implementación
Implementación 1
```java 
package singleton.demo;

public class Singleton {
    private static Singleton instance = null 
    private Singleton() {...}
    public static Singleton getInstance(){
        //inicialitzación "lazy"
        if(instance == null){
            instance = new Singleton);
        }
        return instance; 
    }
}

```
Implementación 2
```java
package singleton.demo;

public class Singleton {
    //inicialización "eager"
    private static Singleton instance = new Singleton();
    
    //la constructura es privada para prohibir la libre instanciación
    private Singleton(){...}
    public static Singleton getInstance(){
        return instance;
    }
}
```
Implementación 3
```java
package singleton.demo;

public class Singleton {
    //la inicialización podría suprimirse (default)
    private static Singleton instance = null;
    
    private Singleton(){...}
    private static class SingletonHelper{
        private static final Singleton instance = new Singleton();
    }
    public static Singleton getInstance(){
        return SingletonHelper.instance;
    }
}
```

#### Patrón Decorador

Propósito: asociar responsabilidades adicionales a un objeto de forma dinámica.

Aplicarlo para asociar responsabilidades a objetos individuales de forma dinámica y transparente (sin afectar a otros objetos),  para responsabilidades que puedan ser retiradas y para caseso en que usar subclases no es posible:

- Gran número de posibles extensiones independientes -> explosión de subclases para soportar cada combinación
- No es posible extender la clase

#### Patrón Estado

Propósito: permitir a un objeto alterar su comportamiento cuando su estado interno cambie. Parecerá que el objeto cambie de clase (sin hacerlo).

Aplicarlo cuando el comportamiento de un objeto depende de su estado, y éste ha de cambiar en tiempo de ejecución. Cuando las operaciones de la clase tienen múltiples instrucciones condicionales que dependen del estado del objeto.

#### Patrón Observador

Propósito: definir una dependencia uno-a-muchos entre objetos de forma que cuando un objeto cambie su estado interno, todos sus dependientes sean notificados y actualizados automáticamente. 

Aplicarlo cuando un cambio en un objeto requiere cambiar otros, y no sabemos cuántos objetos se necesita cambiar o cuando un objeto debería ser capaz de notificar a otros sin hacer suposiciones sobre quiénes son estos otros objetos (no queremos crear acoplamientos).

# Prueba de programas

### Stub

Trozo de código que se inserta en tiempo de ejecucción en lugar del código real, para aislar el objeto que lo utiliza de la implementación real. 

### Mock Objects

Sustitutos de objetos con los que los métodos test interactúan. Así como puede ser necesario que los stubs implementen fragmentos de la lógica de un programa, no es el caso de los mocks. Son objetos con métodos esencialmente vacíos.

# Arquitectura de 3 capas

- Capa de **Presentación**

- Capa de **Dominio**

- Capa de **Gestión de Datos**


### Capa de Presentación

Responsable de la interacción con el usuario	

- Interacción con el usuario
- Control de las peticiones del usuario
- Comunicación con la capa de dominio pasándole peticiones externas y recogiendo los datos que hay que presentar
- Vistas y controladores

### Capa de Dominio

Contiene el núcleo del programa. Es la capa que sabe transformar y manipular los datos del usuario en los resultados que espera (la capa no "sabe", sin embargo, ni de dónde vienen estos datos ni dónde están almacenados).

- Mantenimiento básico de los datos 
- Implementación de una parte de las funcionalidades principales (casos de uso) que corresponde a la capa de dominio: cálculos, modificación del estado del sistema, etc. 
- Comunicación con las capas de presentación y persistencia.
- Clases del modelo y controladores

### Capa de Persistencia

Esta capa es la responsable de almacenar los datos. 

## Controladores

Los controladores son clases propias de cada capa que tendrán la responsabilidad de:

- Comunicación entre capas, manteniendo la sincronización entre capas adyacentes
- Implementar los casos de uso y/o aglutinar funcionalidades de los casos de uso relacionados
- Organizar mejor el código



# Examen

**Buscar protective**

## Ejercicio 2
Primera opción

```java
public class C extends A{
    private B b = new B();
   	public String metC(int i,double b){...}
    public int metB_2(){
    //aquí podría haber una llamada a b.Met_B2(), no obligatorio porque podría estar definida en la C
    }
   	public void metB_1(int i){
   		b.metB_1(i);
    }
    public String metB_3(String s1, String s2){
        return b.metB_3(s1,s2);
    }   	
}
```
Segunda opción: a nivel de compatibilidad de tipos es mejor
```java
public interface B{
    //aquí las declaro
    metB1();
    metB2();
    metB3();
}
public class B1 implements B{
    //aquí las defino
	metB1() {}
	metB2() {}
	metB3() {}
 }
public class C extends A, implements B{
    private B1 b1;
}
```

## Ejercicio 3

```java
public ArrayList<Llibre> buscar_per_preu(double min, double max){
    ArrayList<Llibre> llibresPreu = new ArrayList<Llibre>();
    for(llibre lli : llibresCataleg){
        double preu = lli.getPreu();
        if(preu >= min && preu <= max){
            llibresPreu.add(lli);
        }
    }
    return llibresPreu;
}
```

```java
public ArrayList<A> buscar_per_preu(double min, double max){
    ArrayList<A> articlesPreu = new ArrayList<A>();
    for(A art : articlesCataleg){
        double preu = art.getPreu();
        if(preu >= min && preu <= max){
            articlesPreu.add(art);
        }
    }
    return articlesPreu;
}
```
## Ejercicio 3

Part básica
```java
public abstract class EnvioMensajes{
    public abstract void enviaMensaje();
}
public class EnvioBasicodeMensajes extends EnvioMensajes{
	public void enviaMensaje(){
        System.out.println("Querido Harry...");
	}        
}
```

Decorador
```java
public abstract class DecoradorEnviMens extends EnvioMensajes{
	private EnvioMensajes mensaje;
	public Decorador EnvMens(EnvioMensajes m){
        mensaje = m;
	}
	public void enviaMensaje(){
        mensaje.enviaMensaje();
	}

}

//ara fem amb envioPostal

public class EnvioPostal extends DecoradorEnviMens{
	private EnvioPostal(EnvioMensajes m){
        super(m);
	} 

	public void enviaMensaje(){
        super.enviaMensaje();
        System.out.println("Este mensaje ha sido enviado por correo postal");
	}

}

```

## Ejercicio 4

```java
//ESTADO 
public abstract class Estado {
    protected static boolean llauna = false;
    public boolean get_llauna(){
        boolean ll = llauna;
		llauna = false;
		return ll;
    }
    public abstract int get saldo();
    public abstract Estado add_5();
    public abstract Estado add_10();
}

//ESTADO 0

public class Estado0 extends Estado{
    public int getSaldo(){
        return 0;
    }
    public Estado add_5(){
        return new Estado5();
    }
    public Estado add_10(){
        return new Estado10();
	}
}

//ESTADO 5

public class Estado5 extends Estado{
    public int getSaldo(){
        return 5;
    }
    public Estado add_5(){
        return new Estado10();
    }
    public Estado add_10(){
        llauna = true;
        return new Estado0();
	}
}

//ESTADO 10 

public class Estado10 extends Estado{
    public int getSaldo(){
        return 10;
    }
    public Estado add_5(){
        llauna = true;
        return new Estado0();
    }
    public Estado add_10(){
        llauna = true;
        return new Estado5();
	}
}
//MaquinaVending

public class MaquinaVending{
    private Estado estado;
    public MaquinaVending(){
        estado = new Estado();
    }
    public int getSaldo(){
        return estado.getSaldo();
    }
    public void add_5_saldo(){
        estado = estado.add_5();
    }
    public void add_10_saldo(){
        estado = estado.add_10();
    }
}


```

