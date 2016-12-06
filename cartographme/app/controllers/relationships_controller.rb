class RelationshipsController < ApplicationController
    #before_action :signed_in_user
    
    def create
        #user = User.find_by session_token: session[:session_token]
        user = User.find(params[:followed_id])
        current_user.follow(user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
    
    def destroy
        user = Relationship.find(params[:id]).followed
        #user = User.find_by session_token: session[:session_token]
        current_user.unfollow(@user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
end
