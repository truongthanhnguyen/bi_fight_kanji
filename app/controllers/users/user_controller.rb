class Users::UserController < ApplicationController
  before_action :authenticate_user!

  def show
    @user = User.find(params[:id])
    render "users/profile/index"
  end

end
