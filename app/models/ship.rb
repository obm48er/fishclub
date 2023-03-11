class Ship < ApplicationRecord
  has_many :reviwes, dependent: :destroy
  belongs_to :city, optional: true
  has_one_attached :image
end
