class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :name
      t.string :surname
      t.string :phone
      t.string :company
      t.string :zip
      t.string :city
      t.string :street
      t.string :apartment
      t.integer :user_id

      t.timestamps
    end
  end
end
