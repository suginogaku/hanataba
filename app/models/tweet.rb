class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :image, :title, presence: true
  # validates :prefecture_id, numericality: { other_than: 1 } 

  # 検索処理の記述
  def self.search(search)
    if search != "" #検索フォームに何か値が入力されているかどうかで処理を分岐
      Tweet.where('text LIKE(?)', "%#{search}%")
    else
      Tweet.all
    end
  end
end