#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  before_filter :set_current_user
  def index
    # Finds current user
    user = User.find_by session_token: session[:session_token]
    #adds test locations to all Markers will be from locations db when done
      @all_locations = KeyLocation.all
      //
      @all_markers= Array.new
      @all_locations.each do |loc|
        if user != nil
          if loc.email == user.email or loc.email == 'admin'
            info_content = loc.getInfoString()
            marker={
              :lat => loc.lat,
              :lng => loc.lng,
              :infowindow => info_content,
              :icon => "green_dot.png"
            }
            @all_markers.push(marker)
          end
        end
        
      end
    gon.allMarkers = @all_markers
    
  end
  
end
