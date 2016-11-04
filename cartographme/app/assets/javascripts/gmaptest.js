RP1 = {
    setup: function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(gon.allMarkers);
      
      /*var circles = handler.addCircles(
        [{ lat: 41.662447, lng: -91.5311273, radius: 500 }],
        { strokeColor: '#2e633d', fillColor: '#37e869'}
      );*/
      
        var menu_content = "<div id='content'>"+
          "<p>Englert Civic Theatre</p>"+
          "<form method='get' action='/home/index' class='button_to'>"+
            "<input type='text' name='Location Name' value='...'><br>"+
            "<input type='text' name='Description' value='...'><br>"+
            "<input type='hidden' name='Longitude' value='...'><br>"+
            "<input type='hidden' name='Latitude' value='...'><br>"+
            "<input value='TEST Button' type='submit' />"+
          "</form>"+
        "</div>";
        
        var right_click_menu = new google.maps.InfoWindow({
          content: menu_content
        });
      
      
      handler.getMap().addListener('click', function(e) {
        handler.getMap().panTo(e.latLng);
      });
      
      
      handler.getMap().addListener('rightclick', function(e) {
        menu_content = "<div id='content'>"+
          "<p>Recomend Location</p>"+
          "<form method='get' action='/home/index' class='button_to'>"+
            "<label>Location Name<br><input type='text' name='location_name' value='...'></label><br>"+
            "<label>Description<br><input type='text' name='Description' value='...'></label><br>"+
            "<label>Latitude<input type='text' name='Latitude' value="+e.latLng.lat()+"></label><br>"+
            "<label>Longitude<input type='text' name='Longitude' value="+e.latLng.lng()+"></label><br>"+
            "<input value='TEST Button' type='submit' />"+
          "</form>"+
        "</div>";
        right_click_menu.setContent(menu_content);
        right_click_menu.setPosition(e.latLng);
        right_click_menu.open(handler.getMap());
      });
   
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
     // handler.getMap().fitBounds(new google.maps.LatLngBounds({lat: 41.653900, lng: -91.543399},{lat: 41.670018, lng: -91.514489});
    });
    }
}
$(RP1.setup);       // when document ready, run setup code
