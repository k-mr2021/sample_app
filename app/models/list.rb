class List < ApplicationRecord
  has_one_attached :image
  
  validates :title, presence: true
  validates :body, presence: true
  
  # コメントアウト外す
  validates :image, presence: true 
end
