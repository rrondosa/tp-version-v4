package ar.edu.unlam.tallerweb1.dao;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Evento;
import ar.edu.unlam.tallerweb1.modelo.TipoEvento;

public interface TipoEventoDao {

	public void crearTipoEvento(TipoEvento tipoEvento);
	public List<TipoEvento> listarTodoTiposEvento();
	public List<Evento> listarEventosXTipo(TipoEvento tipoEvento);	
	
}
