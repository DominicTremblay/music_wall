class Song < ActiveRecord::Base
  validates :name, presence: true, length: { maximum: 140 }
  validates :artist, presence: true, length: { maximum: 140 }
  validates :likes, presence: true, numericality: { only_integer: true }
  
end

