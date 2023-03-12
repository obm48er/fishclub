class Review < ApplicationRecord
  belongs_to :ship
  belongs_to :user
  has_many_attached :images
end
