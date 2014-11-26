class ChangeDescriptionType < ActiveRecord::Migration
  def change
    change_column :requests, :description, :text
  end
end
