#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  before_filter :set_current_user
  def index
    # Finds current user
    user = User.find_by session_token: session[:session_token]
    #adds test locations to all Markers will be from locations db when done
      @all_locations = KeyLocation.all
      @all_markers= Array.new
    if user != nil
      @visited_locations = user.key_locations
      @visited_locations.uniq!
      @visited_locations.each {|a|puts(a.name)}
    end
      @all_locations.each do |loc|
        if user != nil
          if loc.email == user.email or loc.email == 'admin'
            if( @visited_locations.include?(loc) )
              marker_icon =  ActionController::Base.helpers.image_url('green_dot.png')
              info_content = loc.getVisitedInfoString()
            else
              marker_icon =  ActionController::Base.helpers.image_url('red_dot.png')
              info_content = loc.getInfoString()
            end
            marker={
              :lat => loc.lat,
              :lng => loc.lng,
              :infowindow => info_content,
              :picture => { :url=>marker_icon, :width => 10, :height => 10 },
            }
            @all_markers.push(marker)
          end
        end
        
      end
    gon.allMarkers = @all_markers
    
  end
  
end
