<div id="map" style="height: 300px"></div>

<script>
    var locations = JSON.parse('${content.locations}');
    var directionsService = null;
    var directionsDisplay = null;
    var map = null;
    var marker = null;

    function initMap() {
        directionsService = new google.maps.DirectionsService;
        directionsDisplay = new google.maps.DirectionsRenderer;

        map = new google.maps.Map(document.getElementById('map'), {
            zoom: 8,
            center: {lat: 48.35712, lng: 10.899147},
            streetViewControl: false
        });
        directionsDisplay.setMap(map);


        if (locations.length > 1) {
            displayRoute();
        } else if (locations.length > 0) {
            displayMarker();
        }
    }

    function displayRoute() {
        if (locations[locations.length - 1])

        var bounds = new google.maps.LatLngBounds(new google.maps.LatLng(locations[locations.length - 1].lat, locations[locations.length - 1].lng),
          new google.maps.LatLng(locations[0].lat, locations[0].lng));
        map.fitBounds(bounds);

        var lastMarker = null;
        var currentMarker = null;
        for (var i = 0, cnt = locations.length; i < cnt; i++) {
            var currentMarker = new google.maps.Marker({
                map: map,
                position: {lat: locations[i].lat, lng: locations[i].lng}
            });

            if (lastMarker != null) {                        
                var geodesicPoly = new google.maps.Polyline({
                    strokeColor: '#CC0099',
                    strokeOpacity: 1.0,
                    strokeWeight: 3,
                    geodesic: true,
                    map: map
                });

                var path = [lastMarker.getPosition(), currentMarker.getPosition()];
                geodesicPoly.setPath(path);

                console.log("setting path from " + lastMarker.getPosition() + " to " + currentMarker.getPosition());
            }

            lastMarker = currentMarker;
        }

        /*
        directionsService.route({
            origin: new google.maps.LatLng(locations[0].lat, locations[0].lng),
            destination: new google.maps.LatLng(locations[locations.length - 1].lat, locations[locations.length - 1].lng),
            waypoints: wayPoints,
            travelMode: google.maps.TravelMode.TRANSIT,
            unitSystem: google.maps.UnitSystem.METRIC
        }, function (response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
            } else {
                alert('Could not display directions due to: ' + status);
            }
        });
        */
    }

    function displayMarker() {
        marker = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(locations[0].lat, locations[0].lng),
            title: locations[0].name,
            animation: google.maps.Animation.DROP
        });

        var offset = 0.02;
        var newUpperBounds = new google.maps.LatLng({
            lat: marker.getPosition().lat() + offset,
            lng: marker.getPosition().lng() + offset
        });

        var bounds = new google.maps.LatLngBounds();
        bounds.extend(newUpperBounds);
        var newLowerBounds = new google.maps.LatLng({
            lat: marker.getPosition().lat() - offset,
            lng: marker.getPosition().lng() - offset
        });
        bounds.extend(newLowerBounds);

        map.fitBounds(bounds);
    }
</script>
<script type="text/javascript" src="https://maps.googleapis.com/maps/api/js?key=${config.site_google_mapsid}&libraries=places&callback=initMap"></script>
