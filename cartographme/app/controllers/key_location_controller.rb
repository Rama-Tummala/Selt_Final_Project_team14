class KeyLocationController < ApplicationController
  def new
    user = User.find_by session_token: session[:session_token]
    new_location = KeyLocation.create(
      {:name => params["name"],
       :lat => params["lat"], 
       :lng => params["lng"],
       :description => params["description"],
       :email => user.email
      })
    @new_marker = {:name => params["name"],:infoWindow => new_location.getInfoString(), :description => params["description"], :lat => params["lat"], :lng => params["lng"]}
    new_location.recommenders << user
    
    render(:partial => "new", locals: {new_marker: @new_marker} )
  end
  
  def assign
    user = User.find_by session_token: session[:session_token]
    key_location = KeyLocation.find_by name: URI.decode(params["location"])

    key_location.visitors << user
    flash[:notice] = "Location '#{key_location.name}' marked as visited."
    redirect_to home_index_path
  end
  
end