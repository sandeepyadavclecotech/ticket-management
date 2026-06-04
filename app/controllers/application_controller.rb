class ApplicationController < ActionController::Base
  before_action :configure_parameters, if: :devise_controller?

  protected

  def configure_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :phone_no])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :phone_no])
  end
end
