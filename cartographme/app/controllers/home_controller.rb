#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  def index
    @allMarkers = [
      {
        "lat" => 47.662447,
        "lng" => -97.5311273,
        "infowindow" => "Potential Location!"
      },
      {
        "lat" => 42.662447,
        "lng" => -92.5311273,
        "infowindow" => "Potential Location!"
      }
    ]
    gon.allMarkers = @allMarkers
  end
end
