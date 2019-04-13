package hibernateAS;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.AnnotationConfiguration;
import org.hibernate.tool.hbm2ddl.SchemaExport;

public class Test {
	
	public static void main(String[] args){
		AnnotationConfiguration config = new AnnotationConfiguration();
		config.addAnnotatedClass(Local.class);
		config.addAnnotatedClass(Seient.class);
		config.addAnnotatedClass(SeientPK.class);
		config.configure("hibernate.cfg.xml");
		
		new SchemaExport(config).create(true,true);
	
		SessionFactory factory = config.buildSessionFactory();
		Session session = factory.getCurrentSession();
		
		session.beginTransaction();
		
		//local A
		Local A = new Local("El Molino", "C/Vila i Vilà, 99"); //crea local
		Seient A11 = new Seient(1,1,A.getnom());	//crea seients
		Seient A12 = new Seient(1,2,A.getnom());
		A.afegirSeient (A11);	//afegeix seients al local A
		A.afegirSeient(A12);
		
		//local B
		Local B = new Local();	//crea local
		B.setnom("El Liceu");		//Modifica atributs
		B.setadreça("C/Les Rambles, 51-59");
		Seient B11 = new Seient(1,1,B.getnom());	//crea seients
		Seient B12 = new Seient(1,2,B.getnom());
		B.afegirSeient(B11);	//afegeix seients al local B
		B.afegirSeient(B12);
		
		session.save(A);
		session.save(B);
		session.save(A11);
		session.save(A12);
		session.getTransaction().commit();
		
	}
}
