package hibernateAS;

import java.io.Serializable;

import javax.persistence.Basic;
import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.JoinColumns;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.hibernate.annotations.ForeignKey;


@Entity
@IdClass(SeientPK.class)
public class Seient implements Serializable {

	@Id
	private int fila;
	@Id
	private int columna;
	@Id
	@ForeignKey(name = "local")
	@JoinColumns({
		@JoinColumn(name = "local", referencedColumnName = "nom")
	})
	@ManyToOne
	private String local;
	
	public Seient(){
		
	}
	public Seient(int fila, int col, String local){
		this.fila = fila;
		this.columna = col;
		this.local = local;
	}
	public int getfila() {
		return fila;
	}
	public void setfila(int fila) {
		this.fila = fila;
	}
	public int getcolumna() {
		return columna;
	}
	public void setcolumna(int columna) {
		this.columna = columna;
	}
	public String getlocal(){
		return local;
	}
	public void setlocal(String local){
		this.local = local;
	}
}
