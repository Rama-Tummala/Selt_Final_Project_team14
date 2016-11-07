#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  before_filter :set_current_user
  def index
    #adds test locations to all Markers will be from locations db when done
      @all_locations = Key_Location.all
      @all_markers= Array.new
      @all_locations.each do |loc|
        info_content = loc.getInfoString()
        marker={
          :lat => loc.lat,
          :lng => loc.lng,
          :infowindow => info_content,
          :icon => "green_dot.png"
        }
       
        @all_markers.push(marker)
      end
    gon.allMarkers = @all_markers
    
  end
  
  def search_friends
  end
  
end
