class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture
end