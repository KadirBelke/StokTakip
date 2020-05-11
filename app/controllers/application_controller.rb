class ApplicationController < ActionController::Base
  layout :layout
  before_action :authenticate_user!

  private
  def layout
    devise_controller? ? "devise" : "application"
  end
end
