class ApplicationController < ActionController::Base
  layout :layout
  before_action :authenticate_user!
  before_action :configure_sign_up_params, if: :devise_controller?
  before_action :user_waiting?, if: :user_signed_in?
  private
  def layout
    devise_controller? ? "devise" : "application"
  end

  def configure_sign_up_params
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :surname, :title])
  end

  def user_waiting?
    if current_user.waiting?
      sign_out
      flash[:error] = "Kullanıcı onayı bekleniyor"
      redirect_to new_user_session_path
    end
  end
end
