class AddStorageIdToMaterials < ActiveRecord::Migration[5.2]
  def change
    add_reference :materials, :storage, foreign_key: true
  end
end
