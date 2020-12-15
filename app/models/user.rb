class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true

  has_many :tweets
  has_many :comments
  # userモデルにもactivestorageで画像ファイルを添付
  has_one_attached :image
  # プロフィール編集時にエラーメッセージが出力されないように記述
  attr_accessor :current_password
end
