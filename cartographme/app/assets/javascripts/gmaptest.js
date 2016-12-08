
RP1 = {
    setup: function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(gon.allMarkers);
      
        right_click_menu = new google.maps.InfoWindow({
          content: ""
        });
      
      handler.getMap().addListener('click', function(e) {
        handler.getMap().panTo(e.latLng);
      });
      
      
      handler.getMap().addListener('rightclick', function(e) {
        var menu_content = "<div id='content'>"+
          "<h2>Recommend Location <span class='glyphicon glyphicon-map'></span></h2>"+
          "<form method='get' action='/home/index' class='button_to'>"+
            "<label>Location Name<br><input type='text' name='location_name' id='location_name' placeholder='Please enter location' required></label><br>"+
            "<label>Description<br><input type='text' name='description' id='description' placeholder='Please enter description' required></label><br>"+
           "<input type='hidden' name='latitude' id='latitude' value="+e.latLng.lat()+"></label>"+
            "<input type='hidden' name='longitude' id='longitude' value="+e.latLng.lng()+"></label>"+
            "<input value='Submit' type='submit' id='recomend_button' class='btn btn-success' />"+
          "</form>"+
        "</div>";
        right_click_menu.setContent(menu_content);
        right_click_menu.setPosition(e.latLng);
        right_click_menu.open(handler.getMap());
        $(document).on('click','#recomend_button',RP1.recomendLocation)
      });
   
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
    });
    },
    recomendLocation: function(){
      
      //validate length of description and location name
      if($( "input#location_name" ).val().length<3 || $("input#description" ).val().length<3  )
      {
        $('#content').prepend('<p id="name-length" class="invalid-form-warning">Location name and description must be at least 3 characters</p>');
        return (false);
      }
      else
      {
        $('.invalid-form-warning').hide();
        
      }
        
      
      $.ajax({type: 'POST',
              url: '/key_location/new',
              timeout: 5000,
              success: RP1.successfullRecomendation,
              error: function(data,requestStatus,xhrObject){ alert("Error sending recomendation.")}, 
              data:"name="+$( "input#location_name" ).val()+"&description="+$( "input#description" ).val()+"&lat="+$( "input#latitude" ).attr('value')+"&lng="+$( "input#longitude" ).attr('value')
      });
      right_click_menu.close();
      return(false);
    },
    successfullRecomendation: function(data,requestStatus,xhrObject){
      var lngData = $(data).find("li#lng").attr("value");
      var latData = $(data).find("li#lat").attr("value");
      handler.addMarkers([
        {
          "lat": latData,
          "lng": lngData,
          "infowindow": data,
          "picture": gon.markerUnvisitedIcon
        }
      ]);
    }
};
$(RP1.setup);       // when document ready, run setup code

