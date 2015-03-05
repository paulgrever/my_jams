class UsersController < ApplicationController
  def index
    redirect_unless_current_user
    @users = User.all
  end

  def new
    @user = User.new
  end

  def show
    redirect_unless_current_user
  end
end