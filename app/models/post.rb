class Post < ApplicationRecord
  attachment :image
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :favorits, dependent: :destroy
  has_many :tag_relationships
  has_many :tags, through: :tag_relationships

  validates :introduction, presence: true
  validates :image, presence: true

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

  is_impressionable counter_cache: true

  def self.sort(selection)
    case selection
    when 'new'
      return all.order(created_at: :DESC)
    when 'old'
      return all.order(created_at: :ASC)
    when 'like'
      return all.includes(:favorits).sort {|a,b| b.favorits.count <=> a.favorits.count}
    when 'dislike'
      return all.includes(:favorits).sort {|a,b| a.favorits.count <=> b.favorits.count}
    when 'view'
      return all.order(impressions_count: :DESC)
    when 'not_view'
      return all.order(impressions_count: :ASC)
    end
  end

end
