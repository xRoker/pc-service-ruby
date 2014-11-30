class RenameWokerIdInService < ActiveRecord::Migration
  def change
    rename_column :services, :worker_id, :user_id
  end
end
