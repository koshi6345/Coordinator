class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorits, dependent: :destroy
  has_many :tag_relationships
  has_many :tags, through: :tag_relationships

  def favorited_by?(user)
    favorits.where(user_id: user.id).exists?
  end

  def tags_save(tag_list)

    if self.tags != nil
      tag_relationshipss_records = TagRelationship.where(post_id: self.id)
      tag_relationshipss_records.destroy_all
    end

    tag_list.each do |tag|
      inspected_tag = Tag.where(name: tag).first_or_create
      self.tags << inspected_tag
    end

  end

end
