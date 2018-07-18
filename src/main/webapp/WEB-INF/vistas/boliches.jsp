<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


<%@ include file="_header.jsp" %>

<c:if test="${not empty admin }">
	<%@ include file="_menuAdmin.jsp" %>
</c:if>


<div class="container">

	<br/>
	<h4 class="font-italic">BOLICHES</h4>
	<hr/>



<!-- LISTA DE EVENTOS  -->
 <div class="row py-2">
 	
 	<c:forEach items="${keyListarEventos}" var="evento">	
		
		<!-- SE AGREGO LA FUNCION IF DE 'SI' PARA MOSTRAR Y 'NO' PARA NO MOSTRAR EL EVENTO -->
		<c:if test="${ evento.getMostrar() eq 'si' }">
		 <div class="col-md-4">
		 
		   <div class="card">
		     <img class="card-img-top" src="img/${evento.getImagen1()}" alt="Card image cap">
		     <div class="card-body">
		       <h5 class="card-title">${ evento.getNombre() }</h5>
		       <p class="card-text">${ evento.getDescripcion() }</p>
		       <a href="#" class="btn btn-primary">+ Detalles </a>&nbsp;&nbsp;
		       
		       <c:if test="${ not empty nombre }">
		       		<a href="agregarEventoAlCarrito?id=${ evento.getId() }" class="btn btn-success">Agregar</a>&nbsp;&nbsp;
		       </c:if>
		       			<a class="btn btn-social-icon btn-facebook btn-xs" href="${evento.getFacebook()}"><span class="fa fa-facebook"></span></a>&nbsp;
		       			
				<a class="btn btn-social-icon btn-twitter btn-xs" href="${evento.getTwitter()}"><span class="fa fa-twitter"></span></a>&nbsp;
				
				<a class="btn btn-social-icon btn-instagram btn-xs" href="${evento.getInstagram()}"><span class="fa fa-instagram"></span></a>
		
		     </div>
		   </div>
		 </div>
		</c:if>

	</c:forEach>
     
</div>
</div>		<!-- cierre container -->

<br/>
 <%@ include file="_footer.jsp" %>