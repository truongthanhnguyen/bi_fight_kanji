class Users::UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    render "users/profile/show"
  end

  def index
    @list_requests = current_user.passive_friend_requests
    render "users/profile/index"
  end

end
