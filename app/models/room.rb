class Room < ApplicationRecord
  has_many :room_users, dependent: :destroy
  #Room（親モデル）が削除されたときに、関連付けしているRoomUser（子モデル）も削除
  has_many :users, through: :room_users 
  #roomsテーブルはroom_usersテーブル（中間テーブル）をとうしてusersテーブルをたくさん持っている
  has_many :messages, dependent: :destroy
  #Room（親モデル）が削除されたときに、関連付けしているMessage（子モデル）も削除

  validates :name, presence: true
  #チャットルームを新規作成するにあたってルーム名が存在している場合のみ作成可
end
