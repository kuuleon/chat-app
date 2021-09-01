class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true
  #フォームに情報が入力されず、値が空であるときは、送信できない
end
