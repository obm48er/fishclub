class City < ApplicationRecord
  include JpPrefecture
  jp_prefecture :prefecture_code
  validates :name, presence: true,uniqueness: true
end
