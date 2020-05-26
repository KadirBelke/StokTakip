class ReportsController < ApplicationController
  before_action :authenticate_user!

  def index
    @material_based = Operation.where(category: :minus).group(:material).sum(:piece).sort_by{|k,v| v}.reverse
    @user_based = Operation.where(category: :minus).group(:user).sum(:piece).sort_by{|k,v| v}.reverse
  end

end
