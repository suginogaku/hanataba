class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable

  validates :name, presence: true

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :email, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_many :tweets
  has_many :comments
  # userモデルにもactivestorageで画像ファイルを添付
  has_one_attached :image
end
