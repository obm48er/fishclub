class Post < ApplicationRecord
  belongs_to :user
  has_many_attached :images
  has_many :favorites, dependent: :destroy
  has_many :post_comments, dependent: :destroy
  has_many :post_tags, dependent: :destroy, foreign_key: "post_id"
  has_many :tags, through: :post_tags

  scope :published, -> {where(is_deleted: false)}
  scope :unpublished, -> {where(is_deleted: true)}

  validates :title, presence: true
  validates :body, presence: true


  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def save_tag(sent_tags)
  # タグが存在していれば、タグの名前を配列として全て取得
    current_tags = self.tags.pluck(:name) unless self.tags.nil?
    # 現在取得したタグから送られてきたタグを除いてoldtagとする
    old_tags = current_tags - sent_tags
    # 送信されてきたタグから現在存在するタグを除いたタグをnewとする
    new_tags = sent_tags - current_tags

    # 古いタグを消す
    old_tags.each do |old|
      self.tags.delete　Tag.find_by(name: old)
    end

    # 新しいタグを保存
    new_tags.each do |new|
      new_post_tag = Tag.find_or_create_by(name: new)
      self.tags << new_post_tag
   end
  end

  #def self.ransackable_attributes(auth_object = nil)
    #["title","body","post_tags","tag","name","post_tags_tag_name"]
  #end
  
  #def ransackable_associations(auth_object = nil)
    #reflect_on_all_associations.map { |a| a.name.to_s }
  #end
end
