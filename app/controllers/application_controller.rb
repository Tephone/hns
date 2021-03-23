class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  layout :rendering_layouts

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :image])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :image])
  end

  def rendering_layouts
    if action_name == "new" && devise_controller?
      "sessions"
    elsif devise_controller? && @user.errors.present? 
      "sessions"
    else
      "application"
    end
  end 
end
