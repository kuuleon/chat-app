class UsersController < ApplicationController

  def edit   
  end
  def update
    if current_user.update(user_params) 
        redirect_to root_path #成功した場合root（チャット画面）にリダイレクト
    else
       render :edit #失敗した場合、editのビューが表示される
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email)
  end

end
