class AddStatusToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :authority, :integer, :default => 0
    add_column :users, :status, :integer, :default => 0
  end
end
