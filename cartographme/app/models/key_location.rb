class KeyLocation < ActiveRecord::Base
  
  has_and_belongs_to_many :visitors, :class_name => "User"
  has_and_belongs_to_many :recommenders, :class_name => "User"
  
  #html used for gmap marker menu
  def getInfoString()
    contentString="
        <div id='content'>
          <h2>#{name}</h2>
          <form method='post' action='/key_location/assign' class='button_to'>
            <input type='hidden' name='location' value=#{URI.encode(name)}><br>
            <input value='Mark as visited' type='submit', id='visited_button' class='btn btn-success'/>
          </form>
        </div>"
    
  end
  
  def getVisitedInfoString()
      contentString="
      <div class='marker_content'>
        <h2>#{name}</h2>
        <button type='button' class='btn btn-link'>Visited!</button>
      </div>"
  end

end
