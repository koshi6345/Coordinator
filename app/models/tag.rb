class Tag < ApplicationRecord

  has_many :tag_relationships
  has_many :posts, through: :tag_relationships

  # def self.looks(searchs, keywords)
  #   if searchs == "partial_match"
  #     @tags = Tag.where("name LIKE ?", "%#{keywords}%")
  #   else
  #     @tags = Tag.all
  #   end
  # end

  def self.search(keyword)
    @tags = Tag.where("name LIKE ?", "%#{keyword}%")
  end

end
