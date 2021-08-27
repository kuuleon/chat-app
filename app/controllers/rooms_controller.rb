class RoomsController < ApplicationController
  def new #チャットルームの新規作成なのでnewアクションを定義
    @room = Room.new #form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
  end
end
