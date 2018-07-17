package ar.edu.unlam.tallerweb1.controladores;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Usuario;
import ar.edu.unlam.tallerweb1.servicios.ServicioUsuario;


@Controller
public class ControladorUsuario {
	
	
	@Inject
	ServicioUsuario servicioUsuario;
	
	@Inject
	ServicioUsuario servicioLogin;
	
	
	// LISTAR TODOS LOS USUARIOS
	@RequestMapping(path = "/listarUsuarios")
	public ModelAndView listarUsuarios() {
		
		ModelMap model = new ModelMap();
		model.put("keyListarUsuarios", servicioUsuario.listarTodosLosUsuariosSERVICE());
		
		return new ModelAndView ("listarUsuarios",model);
	}
	
	
	// MODIFICAR USUARIO GET
	@RequestMapping(path = "/modificarUsuario")
	public ModelAndView modificarUsuario( HttpServletRequest request) {
	
		ModelMap model = new ModelMap();
		Usuario usuario = servicioUsuario.buscarUsuarioXIdSERVICE((Long) request.getSession().getAttribute("idUsuario"));
		model.put("usuarioModel", usuario);
		
		return new ModelAndView("modificarUsuario", model);
	}
	
	
	// MODIFICAR USUARIO POST
	@RequestMapping(path = "/validarModificarUsuario", method=RequestMethod.POST)
	public ModelAndView validarModificarUsuario(@ModelAttribute("usuarioModel") Usuario usuario ) {
	
		servicioUsuario.actualizarUsuarioSERVICE(usuario);
		return new ModelAndView("redirect:/inicioHome");

	}
	
	
	
}