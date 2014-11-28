class ReplaceEmailWithIdInRequests < ActiveRecord::Migration
  def change
    remove_column :subscribers, :email, :string
    add_column :subscribers, :user_id, :integer
  end
end
