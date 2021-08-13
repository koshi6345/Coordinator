class RemoveTagRelationshipIdFromPosts < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :tag_relationship_id, :integer
  end
end
