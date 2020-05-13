class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def index

    @storage = Storage.find(params[:id])
    @materials_than = Material.where(storage: params[:id], piece: 6..Float::INFINITY)
    @materials_less = Material.where(storage: params[:id], piece: -Float::INFINITY..5 )
    @material = Material.new
  end

  def create
    material = Material.new material_params
    if material.save
      flash[:success] = "Kaydedildi"
      redirect_to
    else
      flash[:error] = "Hata Oluştu"
      render :index
    end
  end

  def update
  end

  def destroy
  end

  private
  def material_params
    params.require("material").permit(:name, :no, :piece, :storage_id)
  end
end
