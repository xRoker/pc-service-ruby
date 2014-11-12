class AddTempPassword < ActiveRecord::Migration
  def change
  	add_column :users, :password_encrypted, :string
  end
end
