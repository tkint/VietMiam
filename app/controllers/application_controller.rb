class ApplicationController < ActionController::Base
  helper_method :has_rights?

  protect_from_forgery with: :exception

  before_action :log_as_visitor
  before_action :restrict
  before_action :configure_permitted_parameters, if: :devise_controller?

  def has_rights?(entity, action)
    if !current_user.nil?
      entity_query = BaseEntity.where(:singular => entity).or(BaseEntity.where(:plural => entity)).first
      if !entity_query.nil?
        entity_id = entity_query.id
        if !entity_id.nil?
          right = Right.where(:user_group_id => current_user.user_group_id, :base_entity_id => entity_id).first
          case action
            when 'new', 'create'
              return right.right_create
            when 'index', 'show'
              return right.right_read
            when 'edit', 'update'
              return right.right_update
            when 'destroy'
              return right.right_delete
            else
              return true
          end
        else
          return true
        end
      else
        return true
      end
    else
      return false
    end
  end

  private

  def log_as_visitor
    if !current_user
      user = User.first
      @current_user = user
    end
  end

  def restrict
    if !['visitor', 'error_page'].include?(params[:controller].chop) && !has_rights?(params[:controller], params[:action])
      redirect_to unauthorized_path
    end
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:last_name, :first_name, :email, :password])
    devise_parameter_sanitizer.permit(:account_update, keys: [:last_name, :first_name, :email, :password, :current_password])
  end

end