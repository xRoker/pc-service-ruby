class RemoveTimeFromReuqest < ActiveRecord::Migration
  def change
    remove_column :requests, :time, :datetime

    add_column :requests, :address_id, :integer
  end
end
