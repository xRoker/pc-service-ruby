class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :password
      t.boolean :admin
      t.string :name
      t.string :surname
      t.string :phone
      t.string :company
      t.string :zip
      t.string :street
      t.string :appartment

      t.timestamps
    end
  end
end
