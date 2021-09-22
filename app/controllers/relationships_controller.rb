class RelationshipsController < ApplicationController
  respond_to? :js # If you want to return all the existing action responds with js, you can do it with such a description.
   def create
     # If it is a login function that you created yourself, you should have implemented it yourself
     # Use logged_in? method so that you can follow only when logged in.
     if logged_in?
       @user = User.find(params[:relationship][:followed_id])
       current_user.follow!(@user)
     end

     def destroy
     @user = Relationship.find(params[:id]).followed
     current_user.unfollow!(@user)
   end
 end
