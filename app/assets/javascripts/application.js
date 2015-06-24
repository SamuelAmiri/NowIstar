//= require jquery
//= require bootstrap-sprockets
//= require jquery_ujs
//= require turbolinks
//= require_tree .
// The init function needs to run on load
google.maps.event.addDomListener(window, 'load', initialize_my_map)
google.maps.event.addDomListener(window, 'page:load', initialize_my_map)

// Define a function that should be ran on load (yay function hoisting)
function initialize_my_map() {

    // Find the map DIV (if it exists)
    var el = document.getElementById('googleMap')

    // Bail out if there's not an address map on the page
    if(!el) return


    // Get the page's marker data from the JSON API
    var url = window.location.origin + window.location.pathname + ".json" + window.location.search 
    console.log (window.location.origin)
    console.log (window.location.pathname)
    // Ajax the data URL (this retrieves the contents of that JSON url above)
    $.get(url, function(results){

    	console.log("Data returned from " + url, results)

        // Wrap the data in an array if it's not one already
        if(!(results instanceof Array)) results = [results] 
        console.log(results)

    	// Create a map
        var mapProps = {
        	zoom: 10,
      		center: new google.maps.LatLng(33.92, -118.25),
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(el, mapProps)

        // Bounds are cool because they center our map for us
        var bounds = new google.maps.LatLngBounds()
		var infowindow = new google.maps.InfoWindow();
		var markers = []
        
                
		for (i = 0; i < results.length; i++) {
			var markerPosition = new google.maps.LatLng(results[i].latitude, results[i].longitude)
			var marker = new google.maps.Marker({
                    position: markerPosition
                    
                	})
			marker.setMap(map)
			bounds.extend(markerPosition);
			map.fitBounds(bounds);
           	markers.push[marker]
            console.log(marker)

        }
           (marker, i);

    })
}
