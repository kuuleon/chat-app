Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users,  only: [:edit, :update,]#ユーザー編集に必要なルーティング
  resources :rooms,  only: [:new, :create]#新規チャットルームの作成で動くアクション
  
end
