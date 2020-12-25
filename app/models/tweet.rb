class Tweet < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_one_attached :image
  # applicationrecordを継承したモデルとactivehashを継承したモデルの紐付け
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  validates :image, :title, presence: true
  validates :title, length: { maximum: 30 }
  validates :description, length: { maximum: 140 }
  validates :recommended, numericality: {
     only_interger: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: 'は1以上、5以下で入力して下さい'
     }, allow_nil: true

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