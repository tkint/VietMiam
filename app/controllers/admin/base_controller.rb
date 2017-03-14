class Admin::BaseController < ApplicationController
  before_action :restrict

  # edit valid roles here
  VALID_ROLES = ['admin']

  protected

  # redirect if user not logged in or does not have a valid role
  def restrict
    if current_user.nil? or !VALID_ROLES.include?(current_user.role)
      redirect_to root_path # change this to your 404 page if needed
    end
  end

end