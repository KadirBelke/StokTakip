class StorageController < ApplicationController
  before_action :authenticate_user!


  def index
    @storages = Storage.all
    @storage = Storage.new
  end

  def create
    stroge = Storage.new storage_params
    if stroge.save
      flash[:success] = "Kaydedildi"
      redirect_to storage_index_path
    else
      flash[:error] = "Hata Oluştu"
      render :index
    end
  end

  def update
    storage = Storage.find(params[:id])
    if storage.update storage_params
      flash[:success] = "Güncellendi"
      redirect_to storage_index_path
    else
      flash[:error] = "Hata Oluştu"
      render :index
    end
  end

  def destroy
    storage = Storage.find(params[:id])
    if storage.destroy
      flash[:success] = "Silindi"
      redirect_to storage_index_path
    else
      flash[:success] = "Silindi"
      render :index
    end
  end

  private
  def storage_params
    params.require("storage").permit(:name, :no)
  end

end
