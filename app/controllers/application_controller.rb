class ApplicationController < ActionController::Base
  layout :layout
  before_action :authenticate_user!
  before_action :configure_sign_up_params, if: :devise_controller?

  private
  def layout
    devise_controller? ? "devise" : "application"
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :title])
  end

end
