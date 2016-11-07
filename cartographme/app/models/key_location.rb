class Key_Location < ActiveRecord::Base
  
  #html used for gmap marker menu
  def getInfoString()
    contentString="
        <div id='content'>
          <p>#{name}</p>
          <form method='get' action='/home/index' class='button_to'>
            <input type='hidden' name='location' value=#{name}><br>
            <input value='Mark as visited.' type='submit', id='visited_button' />
          </form>
        </div>"
    
  end
  def getHamlInfoString()
    contentString="%#content\n  %p#{name}"
  end
end