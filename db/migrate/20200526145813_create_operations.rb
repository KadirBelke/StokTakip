class CreateOperations < ActiveRecord::Migration[5.2]
  def change
    create_table :operations do |t|
      t.integer :category
      t.integer :piece
      t.references :material, foreign_key: true
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
