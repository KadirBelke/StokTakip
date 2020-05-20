class CreateAdds < ActiveRecord::Migration[5.2]
  def change
    create_table :adds do |t|
      t.integer :count
      t.references :materials, foreign_key: true

      t.timestamps
    end
  end
end
