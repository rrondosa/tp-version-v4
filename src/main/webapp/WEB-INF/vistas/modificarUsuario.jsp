
<%@ include file="_header.jsp" %>



<div class="container" id="contenedor_form">    
	 
	  <br />
	<div class="row">

	 <div class="col-md-12">
    	
    	<!-- alerta de error si el email ya existe -->
    	<c:if test="${not empty error}">
			<h4><span class="alert alert-warning">${error}</span></h4><br />
       	</c:if>	
		<hr class="colorgraph">


	  <form:form action="validarModificarUsuario" method="POST" modelAttribute="usuarioModel">
	
		<form:input path="id" type="hidden" id="id" class="input form-control" placeholder="${ usuario.getId() }"/>
	
	   <div class="form-group">
	    <label>Nombre:</label>
	       <form:input path="nombre" type="text" id="nombre" class="input form-control" placeholder="${ usuario.getNombre() }" />
	       <small class="form-text text-muted">Nombre</small>
	   </div>
	   
	   <div class="form-group">
	    <label>Email:</label>
	       <form:input path="email" type="text" id="email" class="input form-control" placeholder="${ usuario.getEmail() }"/>
	   </div>
	
	   <div class="form-group">
	    <label>Contraseña:</label>
	    <form:input path="password" type="password" id="password" class="input form-control" placeholder="${ usuario.getNombre() }" />
	   </div>
	   
	   <form:input path="rol" type="hidden" id="rol" class="input form-control" value="user" />
	   
<%-- 	   <c:if test="${ not empty user } ">
	   		<div class="form-group">
	    		<label>Rol:</label>
	       		<form:select path="rol" id="rol" class="input form-control">
			    	<form:option value="user">Usuario</form:option>
			    </form:select>
	   		</div>	   
	   </c:if>
	   
	   <c:if test="${ not empty admin } ">
	   		<div class="form-group">
			    <label>Rol:</label>
			    <form:select path="rol" id="rol" class="input form-control">
			    	<form:option value="user">Usuario</form:option>
			      	<form:option value="admin">Administrador</form:option>
			    </form:select>
			 </div>
	   
	   </c:if> --%>
	   
	    <div class="form-group">
		    <label>Foto:
		    	<small class="form-text text-muted">(Importante!) Seleccione una foto que esten dentro de la carpeta img/</small>
		    </label><br/>
	        <form:input path="foto" type="file" accept=".jpg,.jpeg,.png" id="foto" name="foto" class=""/>
	    </div>	
	    
		<br />
	   <div class="form-group botones">
	    <button class="btn btn-primary boton" type="submit">Modificar Usuario</button>&nbsp;&nbsp;
	    <button class="btn btn-danger boton" type="reset">Cancelar</button>
	   </div>
	
	  </form:form>
    </div>
    
    
   </div>
 </div>

<br />
 
<%@ include file="_footer.jsp" %>
 
 
 
 
 
 
 
 