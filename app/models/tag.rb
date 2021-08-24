class Tag < ApplicationRecord

  has_many :tag_relationships
  has_many :posts, through: :tag_relationships

  def self.search(keyword)
    @tags = Tag.where("name LIKE ?", "%#{keyword}%")
  end

end
