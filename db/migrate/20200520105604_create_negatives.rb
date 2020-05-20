class CreateNegatives < ActiveRecord::Migration[5.2]
  def change
    create_table :negatives do |t|
      t.integer :count
      t.references :materials, foreign_key: true

      t.timestamps
    end
  end
end
