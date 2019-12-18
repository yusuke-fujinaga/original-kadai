class Winepost < ApplicationRecord
  belongs_to :user
  
  validates :wine_type, presence: true, length: { maximum: 255 }
  validates :grape_varieties, presence: true, length: { maximum: 255 }
  validates :country, presence: true, length: { maximum: 255 }
  validates :review, presence: true, length: { maximum: 255 }
  
end
