class Users::FriendController < ApplicationController
  before_action :authenticate_user!

  def create  
    current_user.send_request current_user, params[:friend_id]
    @user = User.find params[:friend_id]
    redirect_to "/users/#{params[:friend_id]}"
  end

  def destroy

  end

end
