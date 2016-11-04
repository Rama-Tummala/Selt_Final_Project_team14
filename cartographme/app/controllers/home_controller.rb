#Controller for main page not asscociated with any 1 model
class HomeController < ApplicationController
  def index
    #adds test locations to all Markers will be from locations db when done
  
    testContent = "
    <div id='content'>
      <p>Englert Civic Theatre</p>
      <form method='get' action='/home/index' class='button_to'>
        <input type='hidden' name='location' value='Englert_Civic_Theatre'><br>
        <input value='TEST Button' type='submit' />
      </form>
    </div>"
    
    #<%= button_to 'Index', home_index_path %>"
    @allMarkers = [
      {
        "lat" => 41.659763, 
        "lng" => -91.532282,
        "infowindow" => testContent
      },
      {
        "lat" => 41.661291,
        "lng" => -91.536145,
        "infowindow" => "Old Capitol Museum."
      },
      {
        "lat" => 41.658718,
        "lng" => -91.551107,
        "infowindow" => "Kinnick Stadium."
      },
      {
        "lat" => 41.659401,
        "lng" => -91.526448,
        "infowindow" => "College Green Park."
      },
      {
        "lat" => 41.663622,
        "lng" => -91.530299,
        "infowindow" => "The Bluebird Diner."
      },
      {
        "lat" => 41.666768,
        "lng" => -91.527106,
        "infowindow" => "North Market Park."
      }
    ]
    gon.allMarkers = @allMarkers
  end
end
