class CreateSubscribes < ActiveRecord::Migration[6.0]
  def change
    create_table :subscribes do |t|
      t.integer :subscriber_id
      t.integer :subscribe_id

      t.timestamps
    end
    add_index :subscribes, :subscriber_id
    add_index :subscribes, :subscribe_id
    add_index :subscribes, [:subscriber_id, :subscribe_id], unique: true
  end
end
