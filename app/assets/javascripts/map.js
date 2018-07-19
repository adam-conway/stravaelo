mapboxgl.accessToken = 'pk.eyJ1IjoiYWNvbndheSIsImEiOiJjamh5N3VseDAwanRjM3BwZDIzM2h2MnN1In0.WosoWy8SHHsSOuAPI36CCg';
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/aconway/cjhy8ohj435412rpnpwt0itac',
  center: [-122.271099, 37.804411],
  zoom: 8.5
});

map.on('load', function () {

  // Add zoom and rotation controls to the map.
  map.addControl(new mapboxgl.NavigationControl());

  var tournament_id = location.pathname.split('/').slice(-1)[0];
  debugger
})
