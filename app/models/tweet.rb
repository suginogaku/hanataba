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
      # タイトル、花の名前、市町村、お店の名前で検索できるように実装
      Tweet.where('title LIKE(?) or flower_name LIKE(?) or city LIKE(?) or shop_name LIKE(?)', "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%")
    else
      Tweet.all
    end
  end
end