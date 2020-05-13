class CreateMaterials < ActiveRecord::Migration[5.2]
  def change
    create_table :materials do |t|
      t.string :no
      t.string :name
      t.integer :piece

      t.timestamps
    end
  end
end
