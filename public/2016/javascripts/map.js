function initialize() {
  var mapCanvas = document.getElementById('map');
  var seaWorldLatLng = new google.maps.LatLng(-27.9575859, 153.4252022);
  var mapOptions = {
    center: seaWorldLatLng,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);

  var marker = new google.maps.Marker({
      position: seaWorldLatLng,
      map: map,
      title: 'Sea World Conference Centre'
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
