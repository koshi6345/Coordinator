class RenameStaffIdColumToPosts < ActiveRecord::Migration[5.2]
  def change
    rename_column :posts, :staff_id, :user_id
  end
end
