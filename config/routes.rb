Rails.application.routes.draw do
  devise_for :users
  root to: "rooms#index"
  resources :users,  only: [:edit, :update,]#ユーザー編集に必要なルーティング
  
  resources :rooms, only: [:new, :create, :destroy] do #新規チャットルームの作成で動くアクション
    resources :messages, only: [:index, :create]#メッセージ送信機能に必要なルーティングを記述
    #ネストをすることにより、roomsが親で、messagesが子という親子関係
    #チャットルームに属しているメッセージという意味
    #メッセージに結びつくルームのidの情報を含んだパスを、受け取れるようにな
  end
end
