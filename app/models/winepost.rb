class Winepost < ApplicationRecord
	
	default_scope -> { order(created_at: :desc) }
	
  belongs_to :user
  
  validates :wine_name, presence: true, length: { maximum: 255 }
  validates :grape_year, presence: true, length: { maximum: 255 }
  validates :wine_type, presence: true, length: { maximum: 255 }
  validates :grape_varieties, presence: true, length: { maximum: 255 }
  validates :country, presence: true, length: { maximum: 255 }
  validates :review, presence: true, length: { maximum: 255 }
  
  has_many :reverses_of_favorite, dependent: :destroy,  class_name: 'Favorite', foreign_key: 'winepost_id'
  has_many :liked, through: :reverses_of_favorite, source: :user
  
  mount_uploader :image, ImageUploader
  
end


