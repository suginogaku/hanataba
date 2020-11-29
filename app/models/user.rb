class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  # emailとpasswordは元々presence: trueがついてるから新たにつける必要はないけど、rails側にも一応つけた
  with_options presence: true do
    validates :name
    validates :email
    validates :password
  end
  validates :email, uniqueness: true
  validates :password, format: { with: /\A(?=.*?[a-z])(?=.*?\d)[a-z\d]+\z/i, message: 'は英字と数字の両方を含めて設定してください' }
end
