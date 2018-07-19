
mapboxgl.accessToken = 'pk.eyJ1IjoiYWNvbndheSIsImEiOiJjamh5N3VseDAwanRjM3BwZDIzM2h2MnN1In0.WosoWy8SHHsSOuAPI36CCg';
var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/aconway/cjhy8ohj435412rpnpwt0itac',
  center: [-105.58887, 39.2501],
  zoom: 6.5
});

map.on('load', function () {

  // Add zoom and rotation controls to the map.
  map.addControl(new mapboxgl.NavigationControl());

  map.addSource('district1', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-1/shape.geojson'
  });

  map.addSource('district2', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-2/shape.geojson'
  });

  map.addSource('district3', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-3/shape.geojson'
  });

  map.addSource('district4', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-4/shape.geojson'
  });

  map.addSource('district5', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-5/shape.geojson'
  });

  map.addSource('district6', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-6/shape.geojson'
  });

  map.addSource('district7', {
    type: 'geojson',
    data: 'https://raw.githubusercontent.com/unitedstates/districts/gh-pages/cds/2016/CO-7/shape.geojson'
  });

  map.addLayer({
        'id': 'district1',
        'type': 'fill',
        'source': 'district1',
        'layout': {},
        'paint': {
            'fill-color': '#FB4D3D',
            'fill-opacity': 0.3
        }
    });

    map.addLayer({
        'id': 'district2',
        'type': 'fill',
        'source': 'district2',
        'layout': {},
        'paint': {
            'fill-color': '#419D78',
            'fill-opacity': 0.3
        }
    });

    map.addLayer({
        'id': 'district3',
        'type': 'fill',
        'source': 'district3',
        'layout': {},
        'paint': {
            'fill-color': '#C04ABC',
            'fill-opacity': 0.3
        }
    });

    map.addLayer({
        'id': 'district4',
        'type': 'fill',
        'source': 'district4',
        'layout': {},
        'paint': {
            'fill-color': '#2D3047',
            'fill-opacity': 0.3
        }
    });

    map.addLayer({
        'id': 'district5',
        'type': 'fill',
        'source': 'district5',
        'layout': {},
        'paint': {
            'fill-color': '#FC60A8',
            'fill-opacity': 0.4
        }
    });

    map.addLayer({
        'id': 'district6',
        'type': 'fill',
        'source': 'district6',
        'layout': {},
        'paint': {
            'fill-color': '#345995',
            'fill-opacity': 0.3
        }
    });

    map.addLayer({
        'id': 'district7',
        'type': 'fill',
        'source': 'district7',
        'layout': {},
        'paint': {
            'fill-color': '#EAC435',
            'fill-opacity': 0.3
        }
    });
  });

  var district1 = new mapboxgl.Popup({closeButton: false, closeOnClick:false})
        .setLngLat([-104.9903, 39.7392])
        .setHTML("<a href='representatives/1'>1</a>")
        .addTo(map);

  var district2 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
        .setLngLat([-105.5217, 40.3772])
        .setHTML("<a href='representatives/2'>2</a>")
        .addTo(map);

  var district3 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
      .setLngLat([-107.849520, 39.113329])
      .setHTML("<a href='representatives/3'>3</a>")
      .addTo(map);

  var district4 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
      .setLngLat([-102.914130, 39.003565])
      .setHTML("<a href='representatives/4'>4</a>")
      .addTo(map);

  var district5 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
      .setLngLat([-104.8214, 38.8339])
      .setHTML("<a href='representatives/5'>5</a>")
      .addTo(map);

  var district6 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
      .setLngLat([-104.8319, 39.7294])
      .setHTML("<a href='representatives/6'>6</a>")
      .addTo(map);

  var district7 = new mapboxgl.Popup({closeButton: false, closeOnClick: false})
      .setLngLat([-105.2211, 39.7555])
      .setHTML("<a href='representatives/7'>7</a>")
      .addTo(map);
