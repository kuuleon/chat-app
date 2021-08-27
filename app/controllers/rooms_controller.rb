class RoomsController < ApplicationController
  
  def new #チャットルームの新規作成なのでnewアクションを定義
    @room = Room.new #form_withに渡す引数として、値が空のRoomインスタンスを@roomに代入
  end

  def create
    @room = Room.new(room_params)
    if @room.save #保存が成功したかどうかで処理を分岐
      redirect_to root_path#成功した場合はredirect_toメソッドでルートパスにリダイレクト
    else#失敗した場合はrenderメソッドでrooms/new.html.erbのページを表示
      render :new
    end
  end
 

  private
  
  def room_params
    params.require(:room).permit(:name, user_ids: [])
    #配列に対して保存を許可したい場合は、キーに対し[]を値として記述
  end

end
