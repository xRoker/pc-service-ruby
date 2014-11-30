class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.belongs_to :request
      t.integer :request_id
      t.integer :worker_id
      t.datetime :expected_term
      t.datetime :closed_time
      t.text :notes
      t.float :cost
      t.timestamps
    end
    add_index :services, :request_id
    add_index :services, :worker_id
  end
end
