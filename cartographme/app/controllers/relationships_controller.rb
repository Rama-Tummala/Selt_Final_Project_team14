class RelationshipsController < ApplicationController

    before_action :set_current_user
    
    def create
        user = User.find(params[:followed_id])
        @current_user.follow(user)
        flash[:notice] = "Following #{user.name}!"
        respond_to do |format|
            format.html { redirect_to user }
            format.js
        end
    end
    
    def destroy
        user = User.find(params[:user_id])
        @current_user.unfollow(user)
        flash[:notice] = "Unfollowing #{user.name}. Redirecting to main profile."
        respond_to do |format|
            format.html { redirect_to @current_user }
            format.js
        end
    end
end