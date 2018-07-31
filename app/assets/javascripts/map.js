mapboxgl.accessToken = 'pk.eyJ1IjoiYWNvbndheSIsImEiOiJjamh5N3VseDAwanRjM3BwZDIzM2h2MnN1In0.WosoWy8SHHsSOuAPI36CCg';

var map = new mapboxgl.Map({
  container: 'map',
  style: 'mapbox://styles/aconway/cjju8caf43oz02rl6w8qzeyw7',
  center: [-122.271099, 37.804411],
  zoom: 8.5
});

function baseURL() {
  const host = window.location.hostname
  if (host === "localhost" || host === "127.0.0.1") {
    return `http://localhost:3000`
  } else {
    return `http://www.stravaelo.com`
  }
}

map.on('load', function () {
  var nav = new mapboxgl.NavigationControl();
  map.addControl(nav, 'top-left');
  var id = getUserIdFromCookie("user_id")
  var tournament_id = location.pathname.split('/').slice(-1)[0];
  var base = baseURL()
  return fetch(`${base}/api/v1/tournaments/${tournament_id}/segments?user_id=${id}`)
    .then((response) => {
      return response.json()
    })
    .then((segments) => {
      segments.forEach(segment => populateMapWithSegment(segment));
    })
})


function populateMapWithSegment(segment) {
  var perf_perc = segment.perf_perc * 10
  var geojson = toGeoJSON(segment.polyline)
  var coordinates = decode(segment.polyline)
  // var marker = new mapboxgl.Marker({closeButton: false, closeOnClick:false})
  //       .setLngLat([coordinates[0][1], coordinates[0][0]])
  //       .addTo(map);
  var white_orange_gradient = ["#FFFFFF", "#FEEBE2", "#FED7C6", "#FEC3AA", "#FDAF8E", "#FD9B72", "#FD8756", "#FC733A", "#FC5F1E", "#FC4C02", "#FFDF00"]
  var blue_orange_gradient = ["#0017F5", "#1C1CDA", "#3822BF", "#5428A4", "#702E89", "#8C346E", "#A83A53", "#C44038", "#E0461D", "#FC4C02"]
  if (isNaN(perf_perc)) {
    var color = white_orange_gradient[getRandomInt(1, 9)]
  } else {
    var color = white_orange_gradient[Math.floor(perf_perc)]
  }

  map.addLayer({
        "id": segment.name,
        "type": "line",
        "source": {
            "type": "geojson",
            "data": geojson
        },
        "layout": {
            "line-join": "round",
            "line-cap": "round"
        },
        "paint": {
            "line-color": color,
            "line-width": 3
        }
  });
};

function getUserIdFromCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
};

function getRandomInt(min, max) {
  return Math.floor(Math.random() * (max - min + 1)) + min;
};




'use strict';

/**
 * Based off of [the offical Google document](https://developers.google.com/maps/documentation/utilities/polylinealgorithm)
 *
 * Some parts from [this implementation](http://facstaff.unca.edu/mcmcclur/GoogleMaps/EncodePolyline/PolylineEncoder.js)
 * by [Mark McClure](http://facstaff.unca.edu/mcmcclur/)
 *
 * @module polyline
 */

var polyline = {};

function py2_round(value) {
    // Google's polyline algorithm uses the same rounding strategy as Python 2, which is different from JS for negative values
    return Math.floor(Math.abs(value) + 0.5) * (value >= 0 ? 1 : -1);
}

function encode(current, previous, factor) {
    current = py2_round(current * factor);
    previous = py2_round(previous * factor);
    var coordinate = current - previous;
    coordinate <<= 1;
    if (current - previous < 0) {
        coordinate = ~coordinate;
    }
    var output = '';
    while (coordinate >= 0x20) {
        output += String.fromCharCode((0x20 | (coordinate & 0x1f)) + 63);
        coordinate >>= 5;
    }
    output += String.fromCharCode(coordinate + 63);
    return output;
}

/**
 * Decodes to a [latitude, longitude] coordinates array.
 *
 * This is adapted from the implementation in Project-OSRM.
 *
 * @param {String} str
 * @param {Number} precision
 * @returns {Array}
 *
 * @see https://github.com/Project-OSRM/osrm-frontend/blob/master/WebContent/routing/OSRM.RoutingGeometry.js
 */
decode = function(str, precision) {
    var index = 0,
        lat = 0,
        lng = 0,
        coordinates = [],
        shift = 0,
        result = 0,
        byte = null,
        latitude_change,
        longitude_change,
        factor = Math.pow(10, precision || 5);

    // Coordinates have variable length when encoded, so just keep
    // track of whether we've hit the end of the string. In each
    // loop iteration, a single coordinate is decoded.
    while (index < str.length) {

        // Reset shift, result, and byte
        byte = null;
        shift = 0;
        result = 0;

        do {
            byte = str.charCodeAt(index++) - 63;
            result |= (byte & 0x1f) << shift;
            shift += 5;
        } while (byte >= 0x20);

        latitude_change = ((result & 1) ? ~(result >> 1) : (result >> 1));

        shift = result = 0;

        do {
            byte = str.charCodeAt(index++) - 63;
            result |= (byte & 0x1f) << shift;
            shift += 5;
        } while (byte >= 0x20);

        longitude_change = ((result & 1) ? ~(result >> 1) : (result >> 1));

        lat += latitude_change;
        lng += longitude_change;

        coordinates.push([lat / factor, lng / factor]);
    }

    return coordinates;
};

/**
 * Encodes the given [latitude, longitude] coordinates array.
 *
 * @param {Array.<Array.<Number>>} coordinates
 * @param {Number} precision
 * @returns {String}
 */
encode = function(coordinates, precision) {
    if (!coordinates.length) { return ''; }

    var factor = Math.pow(10, precision || 5),
        output = encode(coordinates[0][0], 0, factor) + encode(coordinates[0][1], 0, factor);

    for (var i = 1; i < coordinates.length; i++) {
        var a = coordinates[i], b = coordinates[i - 1];
        output += encode(a[0], b[0], factor);
        output += encode(a[1], b[1], factor);
    }

    return output;
};

function flipped(coords) {
    var flipped = [];
    for (var i = 0; i < coords.length; i++) {
        flipped.push(coords[i].slice().reverse());
    }
    return flipped;
}

/**
 * Encodes a GeoJSON LineString feature/geometry.
 *
 * @param {Object} geojson
 * @param {Number} precision
 * @returns {String}
 */
polyline.fromGeoJSON = function(geojson, precision) {
    if (geojson && geojson.type === 'Feature') {
        geojson = geojson.geometry;
    }
    if (!geojson || geojson.type !== 'LineString') {
        throw new Error('Input must be a GeoJSON LineString');
    }
    return polyline.encode(flipped(geojson.coordinates), precision);
};

/**
 * Decodes to a GeoJSON LineString geometry.
 *
 * @param {String} str
 * @param {Number} precision
 * @returns {Object}
 */
toGeoJSON = function(str, precision) {
    var coords = decode(str, precision);
    return {
        type: 'LineString',
        coordinates: flipped(coords)
    };
};

if (typeof module === 'object' && module.exports) {
    module.exports = polyline;
}
