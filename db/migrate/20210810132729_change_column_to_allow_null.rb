class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :posts, :comment_id, true
    change_column_null :posts, :tag_relationship_id, true
  end
  
  def down
    change_column_null :posts, :comment_id, false
    change_column_null :posts, :tag_relationship_id, false
  end
  
end
