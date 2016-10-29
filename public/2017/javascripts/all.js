$(document).foundation();

function initializeMap() {
  var mapCanvas = document.getElementById('map');
  if (mapCanvas == null) { return; }
  var mcecLatLng = new google.maps.LatLng(-37.8253897, 144.9509223);
  var mapOptions = {
    center: mcecLatLng,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    disableDefaultUI: true,
    styles:
      [
        {
            "featureType": "administrative.country",
            "elementType": "all",
            "stylers": [
                {
                    "color": "#6484df"
                },
                {
                    "saturation": "0"
                }
            ]
        },
        {
            "featureType": "administrative.locality",
            "elementType": "all",
            "stylers": [
                {
                    "saturation": "7"
                },
                {
                    "lightness": 19
                },
                {
                    "visibility": "on"
                },
                {
                    "color": "#6484df"
                },
                {
                    "weight": "0.01"
                }
            ]
        },
        {
            "featureType": "administrative.neighborhood",
            "elementType": "all",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "landscape",
            "elementType": "all",
            "stylers": [
                {
                    "hue": "#ffffff"
                },
                {
                    "saturation": -100
                },
                {
                    "lightness": 100
                },
                {
                    "visibility": "simplified"
                }
            ]
        },
        {
            "featureType": "landscape.man_made",
            "elementType": "geometry",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "landscape.man_made",
            "elementType": "labels",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "all",
            "stylers": [
                {
                    "hue": "#ff0000"
                },
                {
                    "saturation": -100
                },
                {
                    "lightness": 100
                },
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "geometry",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "poi",
            "elementType": "labels",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "road",
            "elementType": "geometry",
            "stylers": [
                {
                    "hue": "#bbc0c4"
                },
                {
                    "saturation": -93
                },
                {
                    "lightness": 31
                },
                {
                    "visibility": "simplified"
                }
            ]
        },
        {
            "featureType": "road",
            "elementType": "labels",
            "stylers": [
                {
                    "hue": "#bbc0c4"
                },
                {
                    "saturation": -93
                },
                {
                    "lightness": 31
                },
                {
                    "visibility": "on"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "color": "#fcdbdb"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "geometry.stroke",
            "stylers": [
                {
                    "visibility": "simplified"
                },
                {
                    "color": "#fcdbdb"
                }
            ]
        },
        {
            "featureType": "road.highway",
            "elementType": "labels",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "road.arterial",
            "elementType": "labels",
            "stylers": [
                {
                    "saturation": -93
                },
                {
                    "lightness": -2
                },
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "road.local",
            "elementType": "geometry",
            "stylers": [
                {
                    "hue": "#007fff"
                },
                {
                    "saturation": -90
                },
                {
                    "lightness": -8
                },
                {
                    "visibility": "on"
                }
            ]
        },
        {
            "featureType": "road.local",
            "elementType": "labels",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "transit",
            "elementType": "all",
            "stylers": [
                {
                    "hue": "#007fff"
                },
                {
                    "saturation": 10
                },
                {
                    "lightness": 69
                },
                {
                    "visibility": "on"
                }
            ]
        },
        {
            "featureType": "transit",
            "elementType": "labels",
            "stylers": [
                {
                    "visibility": "off"
                }
            ]
        },
        {
            "featureType": "water",
            "elementType": "all",
            "stylers": [
                {
                    "hue": "#e9ebed"
                },
                {
                    "saturation": -78
                },
                {
                    "lightness": 67
                },
                {
                    "visibility": "simplified"
                }
            ]
        },
        {
            "featureType": "water",
            "elementType": "geometry.fill",
            "stylers": [
                {
                    "color": "#6484df"
                },
                {
                    "lightness": "74"
                }
            ]
        }
    ]
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);

  var marker = new google.maps.Marker({
    position: mcecLatLng,
    map: map,
    title: 'Melbourne Convention and Exhibition Centre'
  });
}

// $('.top-bar .menu li a').click(function(e) {
//   e.preventDefault();
//   var target = $(this).attr('href');
//   $('body,html').animate({
//      scrollTop:$(target).offset().top - 120
//    }, 600);
// });

// google.maps.event.addDomListener(window, 'load', initializeMap);
