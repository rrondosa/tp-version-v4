package ar.edu.unlam.tallerweb1.modelo;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;


@Entity
public class TipoEvento {
	
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;
	
	private String descripcion;

	
	@OneToMany(mappedBy="tipoEvento")		// RELACION CON EVENTO
	private List<Evento> eventos = new ArrayList<>();

	
	
	
	public TipoEvento() {

	}

	public TipoEvento(String descripcion) {
		this.descripcion = descripcion;
	}
	
	public TipoEvento(String descripcion, List<Evento> eventos) {
		this.descripcion = descripcion;
		this.eventos = eventos;
	}

	

	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getDescripcion() {
		return descripcion;
	}


	public void setDescripcion(String descripcion) {
		this.descripcion = descripcion;
	}


	public List<Evento> getEventos() {
		return eventos;
	}


	public void setEventos(List<Evento> eventos) {
		this.eventos = eventos;
	}
	
	
	
	
	
}