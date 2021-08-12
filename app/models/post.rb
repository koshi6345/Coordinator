class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorits, dependent: :destroy

  def favorited_by?(user)
    favorits.where(user_id: user.id).exists?
  end

end
