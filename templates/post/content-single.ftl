<article class="post">
  <#include "header.ftl">

  <#if (config.site_google_mapsid?has_content && content?? && content.locations??)>
    <div class="ribbon-container">
      <a href="#map" class="ribbon">
        <i class="fa fa-map-marker"></i> Google Maps
      </a>
    </div>
  </#if>

  <#include "../commons/featured.ftl">

  <div id="content">
    ${post.body}
  </div>

  <#if (config.site_google_mapsid?has_content && content?? && content.locations??)>
    <div id="map" style="height: 300px"></div>
  </#if>

  <footer>
  	<#include "../commons/footer-tags.ftl">
  </footer>
</article>

<#if (config.site_google_mapsid?has_content && content?? && content.locations??)>
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
          var wayPoints = [];
          for (var i = 1, cnt = locations.length - 1; i < cnt; i++) {
              wayPoints.push({
                  location: new google.maps.LatLng(locations[i].lat, locations[i].lng),
                  stopover: true
              });
          }

          directionsService.route({
              origin: new google.maps.LatLng(locations[0].lat, locations[0].lng),
              destination: new google.maps.LatLng(locations[locations.length - 1].lat, locations[locations.length - 1].lng),
              waypoints: wayPoints,
              travelMode: google.maps.TravelMode.DRIVING,
              unitSystem: google.maps.UnitSystem.METRIC
          }, function (response, status) {
              if (status === 'OK') {
                  directionsDisplay.setDirections(response);
              } else {
                  alert('Could not display directions due to: ' + status);
              }
          });
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
</#if>
