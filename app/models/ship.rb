class Ship < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :city, optional: true
  has_one_attached :image
  validates :name, presence: true
  validates :body, presence: true
  validates :image, presence: true
  VALID_PHONE_REGEX = /\A\d{10}$|^\d{11}\z/
  validates :phone_number, presence: true, format: { with: VALID_PHONE_REGEX }
end
