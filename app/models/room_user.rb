class RoomUser < ApplicationRecord
  belongs_to :room
  belongs_to :user

end

#1つのチャットルームには、2人のユーザーが存在します。
#また、1人のユーザーは複数のチャットルームに参加出来ます。
#どのユーザーがどのチャットルームに参加しているかを管理するのが、
#中間テーブルである「room_userテーブル」となります。