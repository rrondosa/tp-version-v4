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
      <div class="row">
        
        <div class="col-md-7">
          
			<form:form class="" modelAttribute="keyEvento">
			
				<div class="form-group">
			    	<h3 >${ keyEvento.getNombre() }</h3>
				</div>
				
				<table class="table">
					<tr>
						<td>Descripcion:</td>
						<td class="font-weight-bold">${ keyEvento.getDescripcion() }</td>
					</tr>
					<tr>
						<td>Dirección:</td>
						<td class="font-weight-bold">${ keyEvento.getDireccion().getFormatted_address() }</td>
					</tr>
					<tr>
						<td>Fecha:</td>
						<td class="font-weight-bold">${ keyEvento.getFecha() }</td>
					</tr>
					<tr>
						<td>Hora de Inicio:</td>
						<td class="font-weight-bold">${ keyEvento.getHoraInicio() }</td>
					</tr>
					<tr>
						<td>Hora de Finalizacion:</td>
						<td class="font-weight-bold">${ keyEvento.getHoraFin() }</td>
					</tr>
					<tr>
						<td>Telefono:</td>
						<td class="font-weight-bold">${ keyEvento.getTelefono() }</td>
					</tr>
					<tr>
						<td>Correo:</td>
						<td class="font-weight-bold">${ keyEvento.getCorreo() }</td>
					</tr>
					<tr>
						<td>Facebook:</td>
						<td class="font-weight-bold">${ keyEvento.getFacebook() }</td>
					</tr>
					<tr>
						<td>Twitter:</td>
						<td class="font-weight-bold">${ keyEvento.getTwitter() }</td>
					</tr>
					<tr>
						<td>Instagram:</td>
						<td class="font-weight-bold">${ keyEvento.getInstagram() }</td>
					</tr>
					<tr>
						<td>Mostrar?</td>
						<td class="text-uppercase font-weight-bold">${ keyEvento.getMostrar() }</td>
					</tr>
				</table>
				<input id="lng" type="hidden" value=${ keyEvento.getDireccion().getLongitud()}>
				<input id="lat"  type="hidden" value=${ keyEvento.getDireccion().getLatitud()}>
	  		</form:form>
        
        </div>
          	
			<div class="col-md-5">
				
				<!-- CARROUSEL -->
				<div id="carousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
					
						<div class="carousel-item active">
							<img class="d-block img-fluid w-100" src="img/${ keyEvento.getImagen1() }" />
							<div class="carousel-caption"><h3>IMG 1: ${ keyEvento.getImagen1() }</h3></div>
						</div>

						<div class="carousel-item">
							<img class="d-block img-fluid w-100" src="img/${ keyEvento.getImagen2() }" />
							<div class="carousel-caption"><h3>IMG 2: ${ keyEvento.getImagen2() }</h3></div>
						</div>
						
						<div class="carousel-item">
							<img class="d-block img-fluid w-100" src="img/${ keyEvento.getImagen3() }" />
							<div class="carousel-caption"><h3>IMG 3: ${ keyEvento.getImagen3() }</h3></div>
						</div>
						
					</div>
					
					<a class="carousel-control-prev" href="#carousel" role="button" data-slide="prev"> 
						<span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Anterior</span>
					</a> 
					<a class="carousel-control-next" href="#carousel" role="button" data-slide="next"> 
						<span class="carousel-control-next-icon"></span>
						<span class="sr-only">Siguente</span>
					</a>
				</div>
				</br>
			    <!--The div element for the map -->
			    <div id="map"></div>
		    
  			</div>

      </div>
      <div>
      		<h4><a href=<c:url value="homeAdmin" /> >Volver a la lista</a></h4>
      		<!-- tambien funciona asi: <h4><a href="./homeAdmin">Volver a la lista</a></h4> -->
      		
      </div>
    </div>
  </div>

  <br/>
  

<%@ include file="_footer.jsp" %>