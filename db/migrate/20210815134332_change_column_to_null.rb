class ChangeColumnToNull < ActiveRecord::Migration[5.2]
  def up
    change_column_null :rooms, :user_id,    true
    change_column_null :rooms, :created_at, true
    change_column_null :rooms, :updated_at, true
  end

  def down
    change_column_null :rooms, :user_id,    false
    change_column_null :rooms, :created_at, false
    change_column_null :rooms, :updated_at, false
  end
end
