class UsersController < ApplicationController

  def edit   #ビューファイルを表示するだけなので、アクションの定義のみ
  end

  def update #Userモデルの更新を行うアクション
    if current_user.update(user_params) #ログインしているユーザーの情報を更新
        redirect_to root_path #成功した場合root（チャット画面）にリダイレクト
    else
       render :edit #失敗した場合、editのビューが表示される
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
    #ストロングパラメーターを使用し、user_paramsを定義します。
    #user_paramsの中でpermitメソッドを使用し、nameとemailの編集を許可
  end

end
