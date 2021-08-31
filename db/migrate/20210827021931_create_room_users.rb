class CreateRoomUsers < ActiveRecord::Migration[6.0]
  def change
    #中間テーブル（どのユーザーがどのチャットルームに参加しているかを管理）
    create_table :room_users do |t| 
      t.references :user, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      #t.references :userと記載すれば、user_idというカラムが生成
      #ここに保存する「ユーザー」と「チャットグループ」は必ず存在している事が前提なので、
      #「usersテーブル」と「roomsテーブル」の情報を参照する
      #参照する役割を果たすのが「foreign_key: true」
      t.timestamps
    end
  end
end

