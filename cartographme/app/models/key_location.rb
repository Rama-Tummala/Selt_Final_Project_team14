class KeyLocation < ActiveRecord::Base
  
  has_and_belongs_to_many :visitors, :class_name => "User"
  has_and_belongs_to_many :recommenders, :class_name => "User"
  
  #html used for gmap marker menu
  def getInfoString()
    contentString="
        <div id='content'>
          <p>#{name}</p>
          <form method='post' action='/key_location/assign' class='button_to'>
            <input type='hidden' name='location' value=#{URI.encode(name)}><br>
            <input value='Mark as visited' type='submit', id='visited_button'/>
          </form>
        </div>"
    
  end
  
  def getVisitedInfoString()
      contentString="
      <div class='marker_content'>
        <p>#{name}</p>
        <p>Visited</p>
      </div>"
  end

end

#<form method='delete' action='key_location/destroy' class='button_to'>
#            <input value='Delete' type='submit', id='delete_button'/>
#          </form>