class UsersController < ApplicationController
  # GET /users
  def index
    size = 3
    page = params[:page].to_i || 0
    @pages = (User.all.size.to_f / size.to_f).ceil - 1
    @users = User.all[page * size, size]
  end

  # GET /users/1
  def show
    @user = User.find(params[:id])
  end
end
