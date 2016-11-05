#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  def index
    #adds test locations to all Markers will be from locations db when done
      @all_locations = Key_Location.all
      @all_markers= Array.new
      @all_locations.each do |loc|
        info_content = "
        <div id='content'>
          <p>#{loc.name}</p>
          <form method='get' action='/home/index' class='button_to'>
            <input type='hidden' name='location' value=#{loc.name}><br>
            <input value='Mark as visited.' type='submit' />
          </form>
        </div>"
        marker={
          "lat" => loc.lat,
          "lng" => loc.lng,
          "infowindow" => info_content,
          "icon" => "green_dot.png"
        }
       
        @all_markers.push(marker)
      end
    gon.allMarkers = @all_markers
    
  end
  
  def search_friends
  end
  
end
