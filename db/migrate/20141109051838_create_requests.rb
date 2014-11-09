class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.integer :user_id
      t.timestamp :time
      t.string :device_type
      t.string :model
      t.string :description
      t.boolean :warranty
      t.string :priority

      t.timestamps
    end
  end
end
