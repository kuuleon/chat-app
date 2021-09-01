class MessagesController < ApplicationController
  def index
    @message = Message.new#Message.newで生成したMessageモデルのインスタンス情報を代入
    @room = Room.find(params[:room_id])#paramsに含まれているroom_idを代入
    @messages = @room.messages.includes(:user) #チャットルームに紐付いている全てのメッセージ（@room.messages）を@messagesと定義
  end
  #ルーティングをネストしているため/rooms/:room_id/messagesといったパスになる
  #パスにroom_idが含まれているため、paramsというハッシュオブジェクトの中に、room_idという値が存在する
  #そのため、params[:room_id]と記述することでroom_idを取得できる


  def create
    @room = Room.find(params[:room_id])
    @message = @room.messages.new(message_params)
    if @message.save #メッセージを保存できた場合とできなかった場合で条件分岐の処理
      redirect_to room_messages_path(@room)#メッセージの保存に成功した場合、redirect_toメソッドを用いてmessagesコントローラーのindexアクションに再度リクエストを送信し、新たにインスタンス変数を生成します。これによって保存後の情報に更新されます。
    else#メッセージの保存に失敗した場合、
      @messages = @room.messages.includes(:user) #@messagesが定義されていないとエラー
      render :index#renderメソッドを用いてindexアクションのindex.html.erbを表示するように指定。このとき、createアクションのインスタンス変数はそのままindex.html.erbに渡され、同じページに戻ります。
    end
  end
  #@room.messages.newでチャットルームに紐づいたメッセージのインスタンスを生成し、
  #message_paramsを引数にして、privateメソッドを呼び出します。
  #生成したインスタンスを@messageに代入し、
  #saveメソッドでメッセージの内容をmessagesテーブルに保存します。



  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  #privateメソッドとしてmessage_paramsを定義し、
  #メッセージの内容contentをmessagesテーブルへ保存できるようにします。
  #パラメーターの中に、ログインしているユーザーのidと紐付いている、
  #メッセージの内容contentを受け取れるように許可します。
end

