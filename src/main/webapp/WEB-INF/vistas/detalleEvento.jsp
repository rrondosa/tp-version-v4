<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ include file="_header.jsp" %>

<c:if test="${not empty admin }">
	<%@ include file="_menuAdmin.jsp" %>
</c:if>


<style>
      /* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
      #map {
        height: 100%;
        height: 300px;
      }
      /* Optional: Makes the sample page fill the window. */
      html, body {
        height: 100%;
        margin: 0;
        padding: 0;
      }
</style>
<script>

      function initMap() {
    	var lat = document.getElementById("lat").value;
    	var lng = document.getElementById("lng").value;
        var myLatLng = {lat:parseFloat(lat) , lng: parseFloat(lng)};

        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: myLatLng
        });

        var marker = new google.maps.Marker({
          position: myLatLng,
          map: map,
          title: 'Hello World!'
        });
      }
    </script>
    <script async defer
    src="https://maps.googleapis.com/maps/api/js?key=AIzaSyAKsOyLppGoYEHhTvwny8xDgKj96ZzSIFU&callback=initMap">
</script>



<div class="py-2">
    <div class="container">
    
    <!--  SLIDER CARRUSEL	 -->
    <div class="row">
	
		<div class="col-md-12">
			<br/>
			<h4 class="font-italic">Detalles del Lugar</h4>
			<hr />
	
			<div id="demo" class="carousel slide" data-ride="carousel">
			
  				<ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				 </ul>
				 
			  <div class="carousel-inner">
			  
			    <div class="carousel-item active">
			      <img src="img/${ keyEvento.getImagen1() }" alt="imagen1" width="1100" height="500">
			      <div class="carousel-caption">
			        <h1>${ keyEvento.getNombre() }</h1>
			        <!-- <p>Lalalala</p> -->
			      </div>   
			    </div>
			    
			    <div class="carousel-item">
			      <img src="img/${ keyEvento.getImagen2() }" alt="imagen2" width="1100" height="500">
			      <div class="carousel-caption">
			        <h1>${ keyEvento.getNombre() }</h1>
			        <!-- <p>Thank you, Chicago!</p> -->
			      </div>   
			    </div>
			    
			    <div class="carousel-item">
			      <img src="img/${ keyEvento.getImagen3() }" alt="imagen3" width="1100" height="500">
			      <div class="carousel-caption">
			        <h1>${ keyEvento.getNombre() }</h1>
			       <!--  <p>We love the Big Apple!</p> -->
			      </div>   
			    </div>
			    
			  </div>
			  
			  <a class="carousel-control-prev" href="#demo" data-slide="prev">
			    <span class="carousel-control-prev-icon"></span>
			  </a>
			  
			  <a class="carousel-control-next" href="#demo" data-slide="next">
			    <span class="carousel-control-next-icon"></span>
			  </a>
			  
			</div>	<!-- cierre class carrousel -->
    
    	</div>		<!-- cierre col-md-12 -->
    </div>		<!-- cierre row -->
	<br />
    
    <!-- COLUMNA DATOS DEL EVENTO -->
    <div class="row">
        
        <div class="col-md-7">
          
			<form:form class="" modelAttribute="keyEvento">
			
				<div class="form-group">
			    	<h3><strong>${ keyEvento.getNombre() }</strong></h3>
			    	<h4><small class="form-text text-muted font-italic">- ${ keyEvento.getTipo() } -</small></h4>
				</div>
				<br/>
				<div class="form-group">
			    	<span>Descripción</span>
				</div>
				
				<table class="table">
					<tr>
						<td>${ keyEvento.getDescripcion() }</td>
					</tr>
				</table>
				
				<br/><br/>
				
				<table class="table">
					<tr>
						<td>Fecha:</td>
						<td>${ keyEvento.getFecha() }</td>
					</tr>
					<tr>
						<td>Abres (hs):</td>
						<td>${ keyEvento.getHoraInicio() }</td>
					</tr>
					<tr>
						<td>Cierra (hs):</td>
						<td>${ keyEvento.getHoraFin() }</td>
					</tr>
					
<%-- 					<tr>
						<td>Mostrar?</td>
						<td class="text-uppercase font-weight-bold">${ keyEvento.getMostrar() }</td>
					</tr> --%>
				</table>
				<input id="lng" type="hidden" value=${ keyEvento.getDireccion().getLongitud()}>
				<input id="lat"  type="hidden" value=${ keyEvento.getDireccion().getLatitud()}>
	  		</form:form>
        
        </div>
          	
          	<!-- COLUMNA MAPA -->
			<div class="col-md-5">
			    <!--The div element for the map -->
			    <div id="map"></div>
			    
			    <form:form class="" modelAttribute="keyEvento">
					<table class="table">
						<tr>
							<td class="text-center"><i class="fa d-inline fa-lg fa-map-marker"></i></td>
							<td>${ keyEvento.getDireccion().getFormatted_address() }</td>
						</tr>
						<tr>
							<td class="text-center"><i class="fa d-inline fa-lg fa-phone-square"></i></td>
							<td>${ keyEvento.getTelefono() }</td>
						</tr>
						<tr>
							<td class="text-center"><i class="fa d-inline fa-lg fa-envelope-o"></i></td>
							<td>${ keyEvento.getCorreo() }</td>
						</tr>
			
						
					</table>
					
					<div class="container-fluid">
					      <div class="row text-center">
					        <div class="py-1 col-4" style="background-color:#3b5998">
					          <a href="https://www.facebook.com/${ keyEvento.getFacebook() }" target="_blank">
					            <i class="fa fa-fw fa-facebook fa-2x text-white"></i>
					          </a>
					        </div>
					        <div class="py-1 col-4" style="background-color:#00b2ff">
					          <a href="https://twitter.com//#!/${ keyEvento.getTwitter() }" target="_blank">
					            <i class="fa fa-fw fa-twitter fa-2x text-white"></i>
					          </a>
					        </div>
					        <div class="py-1 col-4" style="background-color:#4c68d7">
					          <a href="https://www.instagram.com/${ keyEvento.getInstagram() }" target="_blank">
					            <i class="fa fa-fw fa-instagram fa-2x text-white"></i>
					          </a>
					        </div>
					      </div>
					 </div>
				</form:form>

  			</div>		<!-- cierre col-md-5 -->
  			
  			

      </div>
      
      <br/>
      <div class="row">
      	<div class="col-md-12">
      		<h4><a href=<c:url value="inicioHome"/>><i class="fa fa-arrow-circle-o-left"></i> Volver al Home</a></h4>
      		<!-- tambien funciona asi: <h4><a href="./homeAdmin">Volver a la lista</a></h4> -->
     	</div> 
      </div>
    
    </div>
  </div>

  <br/>
 
  

<%@ include file="_footer.jsp" %>