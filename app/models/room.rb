class Room < ApplicationRecord
  has_many :room_users
  has_many :users, through: :room_users 
  #roomsテーブルはroom_usersテーブル（中間テーブル）をとうしてusersテーブルをたくさん持っている
end
