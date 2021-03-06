class CreateNotifications < ActiveRecord::Migration[5.2]
  def change
    create_table :notifications do |t|

      t.integer :visitor_id
      t.integer :visited_id
      t.integer :room_id
      t.integer :message_id
      t.string :action
      t.boolean :checked, default: false

      t.timestamps
    end
  end
end
