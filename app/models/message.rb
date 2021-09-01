class Message < ApplicationRecord
  belongs_to :room
  belongs_to :user
  has_one_attached :image

  validates :content, presence: true, unless: :was_attached?
  #unlessオプションにメソッド名を指定することで、
  #「メソッドの返り値がfalseならばバリデーションによる検証を行う」という条件を作っている
  def was_attached?
    self.image.attached?  
  end
  #self.image.attached?によって、画像があればtrue、なければfalseを返す
  #画像が存在しなければテキストが必要となり、画像があればテキストは不要
end
