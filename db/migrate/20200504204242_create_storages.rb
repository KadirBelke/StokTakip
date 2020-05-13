class CreateStorages < ActiveRecord::Migration[5.2]
  def change
    create_table :storages do |t|
      t.string :no
      t.string :name

      t.timestamps
    end
  end
end
