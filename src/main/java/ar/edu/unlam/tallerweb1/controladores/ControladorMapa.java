package ar.edu.unlam.tallerweb1.controladores;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ar.edu.unlam.tallerweb1.modelo.Direccion;
import ar.edu.unlam.tallerweb1.modelo.UbicacionJson;


@Controller
public class ControladorMapa {

	
	@RequestMapping(path = "/mapaJson",method=RequestMethod.POST)
	public ModelAndView inicioPost(@RequestBody UbicacionJson ubicacion) {
		
		ModelMap model = new ModelMap();

		System.out.println("dire:"+ubicacion.getFormatted_address());
		
		if (ubicacion.getStreet_number().equals("") || ubicacion.getRoute().equals("") || ubicacion.getAdministrative_area_level_1().equals("") ) {
			model.put("error", "La dirección esta incompleta.");
		}else{
			Direccion d = new Direccion(ubicacion.getStreet_number(), ubicacion.getRoute(), ubicacion.getLocality(), 
										ubicacion.getAdministrative_area_level_1(), ubicacion.getCountry(), ubicacion.getPostal_code(), 
										ubicacion.getLatitud(),ubicacion.getLongitud(),
										ubicacion.getFormatted_address());
			model.put("ok", "La dirreción es valida!");
			model.put("direccion",d);
			
		}
		

		return new ModelAndView ("crearEvento",model);
	}

}
