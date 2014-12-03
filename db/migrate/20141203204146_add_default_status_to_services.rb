class AddDefaultStatusToServices < ActiveRecord::Migration
  def change
    change_column :services, :status, :integer, default: 1
  end
end
