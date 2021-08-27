class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users 
  #roomsテーブルはroom_usersテーブル（中間テーブル）をとうしてusersテーブルをたくさん持っている
  
  validates :name, presence:true
  #チャットルームを新規作成するにあたってルーム名が存在している場合のみ作成可
end
