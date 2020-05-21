class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.all.sort_by{|u| u[:created_at]}
  end
end
