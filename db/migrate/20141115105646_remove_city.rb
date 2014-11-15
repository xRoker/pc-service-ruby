class RemoveCity < ActiveRecord::Migration
  def change
    add_column :requests, :city, :string
    remove_column :users, :city
  end
end
