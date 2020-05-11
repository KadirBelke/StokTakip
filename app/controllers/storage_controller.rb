class StorageController < ApplicationController
  before_action :authenticate_user!


  def index
    @storages = Storage.all
    @storage = Storage.new
  end

  def create
    stroge = Storage.new stroge_params
    if stroge.save
      flash[:success] = "Kaydedildi"
      #show sayfasına
    else
      flash[:error] = "Hata Oluştu"
      render :index
    end
  end

 private
 def stroge_params
   params.require("storage").permit(:name, :no)
 end

end
