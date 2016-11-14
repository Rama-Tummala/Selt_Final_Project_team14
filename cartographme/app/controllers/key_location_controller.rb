class KeyLocationController < ApplicationController
  def new
    new_location = KeyLocation.create({:name => params["name"], :lat => params["lat"], :lng => params["lng"]})
    @new_marker = {:name => params["name"],:infowindow => new_location.getInfoString(), :lat => params["lat"], :lng => params["lng"]}
    render(:partial => "new", locals: {new_marker: @new_marker} )
  end
end
