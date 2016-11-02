RP1 = {
    setup: function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(gon.allMarkers);
      
      /*var circles = handler.addCircles(
        [{ lat: 41.662447, lng: -91.5311273, radius: 500 }],
        { strokeColor: '#2e633d', fillColor: '#37e869'}
      );*/
      
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15)
     // handler.getMap().fitBounds(new google.maps.LatLngBounds({lat: 41.653900, lng: -91.543399},{lat: 41.670018, lng: -91.514489});
    });
    }
}
$(RP1.setup);       // when document ready, run setup code
