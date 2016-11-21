RP1 = {
    setup: function() {
    handler = Gmaps.build('Google');
    handler.buildMap({ provider: {}, internal: {id: 'map'}}, function(){
      markers = handler.addMarkers(gon.allMarkers);
      
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
        
        right_click_menu = new google.maps.InfoWindow({
          content: menu_content
        });
      
      
      handler.getMap().addListener('rightclick', RP1.addRightClickMenu);
   
      handler.bounds.extendWith(markers);
      handler.fitMapToBounds();
      handler.getMap().setZoom(15);
    });
    },
    recomendLocation: function(){
      
      //validate length of description and location name
      if($( "input#location_name" ).val().length<3 || $("input#description" ).val().length<3  )
      {
        $('#content').prepend('<p id="name-lenght" class="invalid-form-warning">Location name and description must be at least 3 characters</p>');
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
              data:"name="+$( "input#location_name" ).val()+"&lat="+$( "input#latitude" ).attr('value')+"&lng="+$( "input#longitude" ).attr('value')
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
          "infowindow": data
        }
      ]);
    },
    addRightClickMenu: function(e){
       menu_content = "<div id='content'>"+
          "<p>Recomend Location</p>"+
          "<form method='get' action='/home/index' class='button_to'>"+
            "<label>Location Name<br><input type='text' name='location_name' id='location_name' value='...'></label><br>"+
            "<label>Description<br><input type='text' name='description' id='description' value='...'></label><br>"+
            "<label>Latitude<input type='text' name='latitude' id='latitude' value="+e.latLng.lat()+"></label><br>"+
            "<label>Longitude<input type='text' name='longitude' id='longitude' value="+e.latLng.lng()+"></label><br>"+
            "<input value='Submit' type='submit' id='recomend_button' />"+
          "</form>"+
        "</div>";
        right_click_menu.setContent(menu_content);
        right_click_menu.setPosition(e.latLng);
        right_click_menu.open(handler.getMap());
        $(document).on('click','#recomend_button',RP1.recomendLocation);
    }
    
    

};
$(RP1.setup);       // when document ready, run setup code

