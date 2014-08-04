Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :update, :destroy]
  resources :circles
  resources :posts

  get "/", to: "static_pages#home", as: "home"
  get "/feed", to: "posts#feed", as: "feed"

  get "/forgot_password", to: "users#forgot_password", as: "forgot_password"
  get "/reset_password/:token", to: "users#reset_password", as: "reset_password"

end
