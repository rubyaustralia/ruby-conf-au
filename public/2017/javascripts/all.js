$(document).foundation();

function initializeMap() {
  var mapCanvas = document.getElementById('map');
  if (mapCanvas == null) { return; }
  var mcecLatLng = new google.maps.LatLng(-37.8253897, 144.9509223);
  var mapOptions = {
    center: mcecLatLng,
    zoom: 13,
    mapTypeId: google.maps.MapTypeId.ROADMAP,
    styles: [{"featureType":"administrative","elementType":"all","stylers":[{"visibility":"on"},{"lightness":33}]},{"featureType":"landscape","elementType":"all","stylers":[{"color":"#f2e5d4"}]},{"featureType":"poi.park","elementType":"geometry","stylers":[{"color":"#c5dac6"}]},{"featureType":"poi.park","elementType":"labels","stylers":[{"visibility":"on"},{"lightness":20}]},{"featureType":"road","elementType":"all","stylers":[{"lightness":20}]},{"featureType":"road.highway","elementType":"geometry","stylers":[{"color":"#c5c6c6"}]},{"featureType":"road.arterial","elementType":"geometry","stylers":[{"color":"#e4d7c6"}]},{"featureType":"road.local","elementType":"geometry","stylers":[{"color":"#fbfaf7"}]},{"featureType":"water","elementType":"all","stylers":[{"visibility":"on"},{"color":"#acbcc9"}]}]
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
