class Admin::BaseController < ApplicationController
  before_action :restrict

  # edit valid roles here
  MINIMUM_LEVEL = 50

  protected

  # redirect if user not logged in or does not have a valid role
  def restrict
    if current_user.nil? or current_user.user_group.level < MINIMUM_LEVEL
      redirect_to root_path # change this to your 404 page if needed
    end
  end

end