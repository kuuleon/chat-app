class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true
  #ユーザー登録時に「name」を空欄にして登録しようとすると、エラーが発生

  has_many :room_users
  has_many :rooms, through: :room_users
  has_many :messages
end
