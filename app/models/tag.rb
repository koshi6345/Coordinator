class Tag < ApplicationRecord

  has_many :tag_relationships
  has_many :posts, through: :tag_relationships

end
