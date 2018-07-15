package ar.edu.unlam.tallerweb1.servicios;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.dao.TipoEventoDao;
import ar.edu.unlam.tallerweb1.modelo.Evento;
import ar.edu.unlam.tallerweb1.modelo.TipoEvento;


@Service("servicioTipoEvento")
@Transactional
public class ServicioTipoEventoImpl implements ServicioTipoEvento {

	@Inject
	private TipoEventoDao tipoEventoDao;

	@Override
	public void crearTipoEventoSERVICE(TipoEvento tipoEvento) {
		tipoEventoDao.crearTipoEvento(tipoEvento);
		
	}

	@Override
	public List<TipoEvento> listarTodoTiposEventoSERVICE() {
		return tipoEventoDao.listarTodoTiposEvento();
	}

	@Override
	public List<Evento> listarEventosXTipoSERVICE(TipoEvento tipoEvento) {
		return tipoEventoDao.listarEventosXTipo(tipoEvento);
	}
	
	
	
}
