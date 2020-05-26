class MaterialsController < ApplicationController
  before_action :authenticate_user!

  def index
    @storage = Storage.find(params[:id])
    @materials_than = Material.where("storage_id = ? AND piece > 5", params[:id])
    @materials_less = Material.where("storage_id = ? AND piece < 6", params[:id])
    @material = Material.new
  end

  def create
    material = Material.new material_params
    if material.save
      flash[:success] = "Kaydedildi"
      redirect_to materials_index_path(material.storage_id)
    else
      flash[:error] = "Hata Oluştu"
      render :index
    end
  end

  def update
    material = Material.find(params[:id])
    if params[:state] == "edit"
      if material.update material_params
        flash[:success] = "Güncellendi"
        redirect_to materials_index_path(material.storage_id)
      else
        flash[:error] = "Hata Oluştu"
        render :index
      end
    else
      material.piece += params[:material][:piece].to_i if params[:state] == "add"
      material.piece -= params[:material][:piece].to_i if params[:state] == "minus"
      if material.save
        flash[:success] = "Güncellendi"
        operation = Operation.new
        operation.category = params[:state]
        operation.piece = params[:material][:piece]
        operation.user_id = current_user.id
        operation.material_id = material.id
        operation.save!
        redirect_to materials_index_path(material.storage_id)
      else
        flash[:error] = "Hata Oluştu"
        redirect_to materials_index_path(material.storage_id)
      end
    end
  end

  def destroy
    material = Material.find(params[:id])
    material.destroy
    flash[:success] = "Silindi"
    redirect_to materials_index_path(material.storage_id)
  end

  private
  def material_params
    params.require("material").permit(:name, :no, :piece, :storage_id)
  end
end
