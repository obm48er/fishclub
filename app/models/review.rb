class Review < ApplicationRecord
  belongs_to :ships
  has_one_attached :images
end
