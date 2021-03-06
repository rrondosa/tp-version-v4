function initAutocomplete() {
	  var map = new google.maps.Map(document.getElementById('map'), {
	    center: {lat: -34.607034, lng: -58.375516},
	    zoom: 14,
	    mapTypeId: 'roadmap'
	  });
	// Create the search box and link it to the UI element.
	  var input = document.getElementById('pac-input');
	  var searchBox = new google.maps.places.SearchBox(input);
	  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
	
	  // Bias the SearchBox results towards current map's viewport.
	  map.addListener('bounds_changed', function() {
	    searchBox.setBounds(map.getBounds());
	  });
	  
	google.maps.event.addDomListener(window, 'load', mapInitialize(map));
	
	function mapInitialize(map) {
		if (navigator.geolocation) {
			navigator.geolocation
					.getCurrentPosition(set_position_in_google_map);
		} else {
			alert("Tu navegador no soporta el API de geolocalización. Actualiza a un navegador más moderno.");
		}
	}
	function set_position_in_google_map(position) {
		var crds = position.coords;
		var mapPosition = new google.maps.LatLng(crds.latitude, crds.longitude);
//		var mapOptions = {
//			zoom : 15,
//			center : mapPosition,
//			mapTypeId: 'roadmap'
//		};
//		var map = new google.maps.Map(document.getElementById('map'),
//				mapOptions);
		map.setCenter(mapPosition);
		var infowindow = new google.maps.InfoWindow({
			map : map,
			position : mapPosition,
			content : 'Localizacion actual'
		});
		
//		// Create the search box and link it to the UI element.
//		  var input = document.getElementById('pac-input');
//		  var searchBox = new google.maps.places.SearchBox(input);
//		  map.controls[google.maps.ControlPosition.TOP_LEFT].push(input);
//
//		  // Bias the SearchBox results towards current map's viewport.
//		  map.addListener('bounds_changed', function() {
//		    searchBox.setBounds(map.getBounds());
//		  });
	
	}

  var markers = [];
  // Listen for the event fired when the user selects a prediction and retrieve
  // more details for that place.
  searchBox.addListener('places_changed', function() {
    var places = searchBox.getPlaces();

    if (places.length == 0) {
      return;
    }

    // Clear out the old markers.
    markers.forEach(function(marker) {
      marker.setMap(null);
    });
    markers = [];

    // For each place, get the icon, name and location.
    var bounds = new google.maps.LatLngBounds();
    places.forEach(function(place) {
      if (!place.geometry) {
        console.log("Returned place contains no geometry");
        return;
      }
      var icon = {
        url: place.icon,
        size: new google.maps.Size(71, 71),
        origin: new google.maps.Point(0, 0),
        anchor: new google.maps.Point(17, 34),
        scaledSize: new google.maps.Size(25, 25)
      };

      // Create a marker for each place.
      markers.push(new google.maps.Marker({
        map: map,
        icon: icon,
        title: place.name,
        position: place.geometry.location
      }));

      if (place.geometry.viewport) {
        // Only geocodes have viewport.
        bounds.union(place.geometry.viewport);
      } else {
        bounds.extend(place.geometry.location);
      }
      
    });
    console.log("place: ",places);
    console.log("place: ",places[0].formatted_address);
    console.log("lng: ",places[0].geometry.viewport.b.b);
    console.log("lat: ",places[0].geometry.viewport.f.f);
    
    var data ={
    		formatted_address : places[0].formatted_address,
    		lng : places[0].geometry.viewport.b.b,
    		lat : places[0].geometry.viewport.f.f
    	
    };
    ajaxPost(data);
    
    map.fitBounds(bounds);
    
    
  });

}

function ajaxPost(data){
	$.ajax({
    	type : 'POST',
    	url : 'inicioHome2',
    	contentType: 'application/json',
    	data : JSON.stringify(data),
    	success : function(data, status, xhr){

    		console.info(data);
    		console.log(status);
    		console.log(xhr);
	
    	},
    	error: function(error){
    		console.log("ERROR: ", error);
    	
    	}
	   
	});
}

//function ajaxPost(data){
//	$( document ).ready(function() {
//		console.log(data);
//  	$.ajax({
//			type : "POST",
//			contentType : "application/json",
//			url : window.location + "api/customer/save",
//			data : JSON.stringify(formData),
//			dataType : 'json',
//			success : function(result) {
//				if(result.status == "Done"){
//					$("#postResultDiv").html("<p style='background-color:#7FA7B0; color:white; padding:20px 20px 20px 20px'>" + 
//												"Post Successfully! <br>" +
//												"---> Customer's Info: FirstName = " + 
//												result.data.firstname + " ,LastName = " + result.data.lastname + "</p>");
//				}else{
//					$("#postResultDiv").html("<strong>Error</strong>");
//				}
//				console.log(result);
//			},
//			error : function(e) {
//				alert("Error!")
//				console.log("ERROR: ", e);
//			}
//  	    	type : 'POST',
//  	    	url : 'inicioHome',
//  	    	contentType: 'application/json',
//  	    	data :data,
//  	    	success : function(data, status, xhr){
//  	    		$("#result").html(data);
//  	    	},
//  	    	error: function(xhr, status, error){
//  	    		alert(error);
//  	    	}
//  	   
//		});
//  	
//
//  })
//}

