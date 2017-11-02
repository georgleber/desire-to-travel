<div id="map" style="height: 300px"></div>

<script>
    var mapsConfig = JSON.parse(${content.mapsconfig});
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

        var locations = mapsConfig.locations;
        var type =  mapsConfig.type;
        if (mapsConfig.locations.length > 1 && type === 'transit') {
            displayTrack(locations);
        } else if (mapsConfig.locations.length > 1 && type !== 'transit') {
            displayRoute(locations, type);
        } else {
            displayMarker(locations);
        }
    }

    function displayTrack(locations) {
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

                if (window.console) {
                  console.log("setting path from " + lastMarker.getPosition() + " to " + currentMarker.getPosition());
                }
            }

            lastMarker = currentMarker;
        }
    }

    function displayRoute(locations, type) {
        var wayPoints = [];
        for (var i = 1, cnt = locations.length - 1; i < cnt; i++) {
            wayPoints.push({
                location: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                stopover: true
            });
        }

        var travelMode = null;
        if (type == 'driving') {
          travelMode = google.maps.TravelMode.DRIVING;
        } else if (type == 'walking') {
          travelMode = google.maps.TravelMode.WALKING;
        }

        directionsService.route({
            origin: new google.maps.LatLng(locations[0].lat, locations[0].lng),
            destination: new google.maps.LatLng(locations[locations.length - 1].lat, locations[locations.length - 1].lng),
            waypoints: wayPoints,
            travelMode: travelMode,
            unitSystem: google.maps.UnitSystem.METRIC
        }, function (response, status) {
            if (status === 'OK') {
                directionsDisplay.setDirections(response);
            } else {
                if (window.console) {
                    console.log('Could not display directions due to: ' + status);
                }
            }
        });
    }

    function displayMarker(locations) {
        map.setCenter(new google.maps.LatLng(locations[0].lat, locations[0].lng));

        marker = new google.maps.Marker({
            map: map,
            position: new google.maps.LatLng(locations[0].lat, locations[0].lng),
            title: locations[0].name,
            animation: google.maps.Animation.DROP
        });

        var offset = 0.02;
        var bounds = new google.maps.LatLngBounds();
        var newUpperBounds = new google.maps.LatLng({
            lat: marker.getPosition().lat() + offset,
            lng: marker.getPosition().lng() + offset
        });
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
