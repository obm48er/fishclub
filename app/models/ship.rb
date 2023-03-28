class Ship < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :city, optional: true
  has_one_attached :image
  
end
