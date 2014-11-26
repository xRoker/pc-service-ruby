class RemoveAdressFromReuqest < ActiveRecord::Migration
  def change
    remove_column :requests, :name
    remove_column :requests, :surname
    remove_column :requests, :phone
    remove_column :requests, :company
    remove_column :requests, :zip
    remove_column :requests, :street
    remove_column :requests, :city
    remove_column :requests, :apartment
  end
end
