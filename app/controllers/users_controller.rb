class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :admin?, only: :index

  def index
    @users = User.all.sort_by{|u| u[:created_at]}
  end

  def update
    user = User.find(params[:id])
    if user.approved!
      flash[:success] = "Güncellendi"
      redirect_to users_path
    end
  end

  def update_password
    user = User.find(current_user.id)
    if user.valid_password?(params[:user][:current_password])
      if user.update password_params
        flash[:success] = "Parola Güncellendi"
        redirect_back fallback_location: root_path
      else
        flash[:error] = "Parola Güncellenemedi "
        redirect_back fallback_location: root_path
      end
    else
      flash[:error] = "Eski Parola Hatalı"
      redirect_back fallback_location: root_path
    end

  end

  private
  def admin?
    unless current_user.admin?
      flash[:error] = "Yetkiniz bulunamamaktadır."
      redirect_to root_path
    end
  end

  def password_params
      params.require(:user).permit(:password, :password_confirmation)
  end

end
