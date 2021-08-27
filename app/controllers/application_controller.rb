class ApplicationController < ActionController::Base
  #ユーザーがログインしていなければ、そのユーザーをログイン画面に遷移
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?

  private #nameカラムの保存を可能とする記述 ストロングパラメーターを使えるようにする
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    #「特定のカラムを許容する」メソッド
  end
end
