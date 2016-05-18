class Song < ActiveRecord::Base
  
  belongs_to :user

  validates :name, presence: true, length: { maximum: 140 }
  validates :artist, presence: true, length: { maximum: 140 }
  validates :likes, presence: true, numericality: { only_integer: true }
  
end

