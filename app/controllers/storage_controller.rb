class StorageController < ApplicationController
  before_action :authenticate_user!


  def index
    storages = Storage.all
    @storages_lass = []
    @storages_than = []
    storages.each do |s|
      if s.materials.where(piece: -Float::INFINITY..5).present?
        @storages_lass << s
      else
        @storages_than << s
      end
    end
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
    Material.where(storage: storage).delete_all
    storage.destroy
    flash[:success] = "Silindi"
    redirect_to storage_index_path
  end

  private
  def storage_params
    params.require("storage").permit(:name, :no)
  end

end
