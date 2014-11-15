class AddAdressColumns < ActiveRecord::Migration
  def change
    add_column :requests, :name, :string
    add_column :requests, :surname, :string
    add_column :requests, :phone, :string
    add_column :requests, :company, :string 
    add_column :requests, :zip, :string
    add_column :requests, :street, :string 
    add_column :requests, :apartment, :string

    remove_column :users, :phone
    remove_column :users, :company 
    remove_column :users, :zip
    remove_column :users, :street
    remove_column :users, :appartment
  end
end
