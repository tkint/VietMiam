class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  before_action :show_flash
  before_filter :configure_permitted_parameters, if: :devise_controller?

  private

  def show_flash
    flash.now[:notice] = "Found the about page!" if request.path == '/pages/about'
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :email, :password, :current_password])
  end
end
