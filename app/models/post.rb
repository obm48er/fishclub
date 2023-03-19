class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  
  scope :published, -> {where(is_deleted: false)}
  scope :unpublished, -> {where(is_deleted: true)}
  
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end
end
