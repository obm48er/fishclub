class Review < ApplicationRecord
  belongs_to :ship
  belongs_to :user
  has_many_attached :images
  # raty機能のため星
  validates :all_rating, numericality: {
    less_than_or_equal_to: 5,
    greater_than_or_equal_to: 1}, presence: true
end
