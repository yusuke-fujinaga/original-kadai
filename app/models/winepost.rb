class Winepost < ApplicationRecord
  belongs_to :user
  
  validates :wine_type, presence: true, length: { maximum: 255 }
  validates :grape_varieties, presence: true, length: { maximum: 255 }
  validates :country, presence: true, length: { maximum: 255 }
  validates :review, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_favorite, class_name: 'favorite', foreign_key: 'winepost_id'
  has_many :liked, through: :reverses_of_favorite, source: :user
  
end
