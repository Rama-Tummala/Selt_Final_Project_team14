class RelationshipsController < ApplicationController
    #before_action :logged_in_user
    before_action :set_current_user
    
    def create
        user = User.find(params[:followed_id])
        @current_user.follow(user)
        respond_to do |format|
            format.html { redirect_to user }
            format.js
        end
    end
    
    def destroy
        user = User.find(params[:user_id])
        #user = Relationship.find(params[:user_id]).followed
        #puts "*****"
        #puts "***** user =  #{params[:user]}"
        #puts "**** user.id = #{user.id}"
        #puts "****  Relationship.id = #{Relationship.find(params[:user_id]).id}"
        #puts "****  followed.id = #{Relationship.find(params[:user_id]).followed.id}"
        #puts "*****"
        @current_user.unfollow(user)
        respond_to do |format|
            format.html { redirect_to @current_user }
            format.js
        end
    end
end
