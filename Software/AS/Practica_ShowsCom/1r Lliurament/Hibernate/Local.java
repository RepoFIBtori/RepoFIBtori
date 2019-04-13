package hibernateAS;

import java.beans.Transient;
import java.util.ArrayList;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name="local")
public class Local{
	@Id
	@Column(name = "nom")
	private String nom;
	@Column(name = "adreça")
	private String adreça;
	@JoinColumn(name = "local")
	@javax.persistence.Transient
	private ArrayList<Seient> seients;
	
	
	public Local(){
		seients = new ArrayList<Seient>();
	}
	public Local(String n, String a){
		this.seients = new ArrayList<Seient>();
		this.nom = n;
		this.adreça = a;
	}
	public String getnom() {
		return nom;
	}
	public void setnom(String nom) {
		this.nom = nom;
	}
	public String getadreça() {
		return adreça;
	}
	public void setadreça(String adreça) {
		this.adreça = adreça;
	}
	public void afegirSeient(Seient seient){
		this.seients.add(seient);
	}
	public void eliminarSeient(Seient seient){
		this.seients.remove(seient);
	}
	public void setSeients(ArrayList<Seient> s){
		this.seients = s;
	}

}