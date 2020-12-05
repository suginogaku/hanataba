class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :image, :title, presence: true
  # validates :prefecture_id, numericality: { other_than: 1 } 
end