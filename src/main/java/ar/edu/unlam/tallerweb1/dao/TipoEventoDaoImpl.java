package ar.edu.unlam.tallerweb1.dao;

import java.util.List;

import javax.inject.Inject;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ar.edu.unlam.tallerweb1.modelo.Evento;
import ar.edu.unlam.tallerweb1.modelo.TipoEvento;


@SuppressWarnings("unchecked")
@Repository("TipoEventoDao")
public class TipoEventoDaoImpl implements TipoEventoDao {

	
	@Inject
	private SessionFactory sessionFactory;
	
	
	@Transactional
	@Override
	public void crearTipoEvento(TipoEvento tipoEvento) {
		Session session = sessionFactory.getCurrentSession();
		session.save(tipoEvento);
	}
	
	
	@Transactional
	@Override
	public List<TipoEvento> listarTodoTiposEvento() {
		Session session = sessionFactory.getCurrentSession();
		List<TipoEvento> listado = session.createCriteria(TipoEvento.class).list();
		return listado;
	}
	
	
	@Transactional
	@Override
	public List<Evento> listarEventosXTipo(TipoEvento tipoEvento) {
		Session session = sessionFactory.getCurrentSession();
		List<Evento> listado = session.createCriteria(Evento.class)
								.createAlias("tipoEvento", "te")
								.add(Restrictions.eq("te.id", tipoEvento.getId()))
								.list();
		return listado;
	}
	
}
