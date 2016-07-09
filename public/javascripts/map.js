function initialize() {
  var mapCanvas = document.getElementById('map');
  if (mapCanvas == null) { return; }
  var seaWorldLatLng = new google.maps.LatLng(-27.9575859, 153.4252022);
  var mapOptions = {
    center: seaWorldLatLng,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
  }
  var map = new google.maps.Map(mapCanvas, mapOptions);

  var marker = new google.maps.Marker({
      position: seaWorldLatLng,
      map: map,
      title: 'Sea World Conference Centre'
  });
}

google.maps.event.addDomListener(window, 'load', initialize);
