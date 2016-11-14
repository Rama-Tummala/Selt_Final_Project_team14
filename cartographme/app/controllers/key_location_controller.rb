class KeyLocationController < ApplicationController
  def new
    new_location = KeyLocation.create({:name => params["name"], :lat => params["lat"], :lng => params["lng"]})
    @new_marker = {:name => params["name"],:infowindow => new_location.getInfoString(), :lat => params["lat"], :lng => params["lng"]}
    render(:partial => "new", locals: {new_marker: @new_marker} )
  end
  
  def assign
    
    user = User.find_by session_token: session[:session_token]
    key_location = KeyLocation.find_by name: URI.decode(params["location"])
    
    key_location.visitors << user
    
    redirect_to '/home/index'
  end
  
end
