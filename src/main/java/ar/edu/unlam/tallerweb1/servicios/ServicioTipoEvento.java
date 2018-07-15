package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import ar.edu.unlam.tallerweb1.modelo.Evento;
import ar.edu.unlam.tallerweb1.modelo.TipoEvento;

public interface ServicioTipoEvento {

	public void crearTipoEventoSERVICE(TipoEvento tipoEvento);
	public List<TipoEvento> listarTodoTiposEventoSERVICE();
	public List<Evento> listarEventosXTipoSERVICE(TipoEvento tipoEvento);	
	
}
