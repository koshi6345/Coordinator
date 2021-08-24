class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|

      t.integer :staff_id,            null: false
      t.integer :comment_id,          null: false
      t.integer :tag_relationship_id, null: false
      t.string  :introduction,        null: false

      t.timestamps
    end
  end
end
