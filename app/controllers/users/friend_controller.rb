class Users::FriendController < ApplicationController
  before_action :authenticate_user!

  def create  
    current_user.send_request params[:friend_id]
    @user = User.find params[:friend_id]
    redirect_to "/users/#{params[:friend_id]}"
  end

  def destroy
    current_user.cancel_request params[:friend_id]
    @user = User.find params[:friend_id]
    redirect_to "/users/#{params[:friend_id]}"
  end

  def update
    current_user.change_request_status params[:friend_id]
    redirect_to "/users/#{params[:friend_id]}"
  end

end
