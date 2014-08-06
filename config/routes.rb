Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :update, :destroy]
  resources :circles
  resources :posts do
    resources :upvotes, only: [:create, :destroy]
    resources :comments, only: [:create, :destroy]
  end

  get "/", to: "static_pages#home", as: "home"
  get "/feed", to: "posts#feed", as: "feed"

  get "/forgot_password_page", to: "users#forgot_password_page", as: "forgot_password_page"
  post "/forgot_password", to: "users#forgot_password", as: "forgot_password"
  get "/confirm_identity_page/:token", to: "users#confirm_identity_page", as: "confirm_identity_page"
  get "/reset_password/:token", to: "users#reset_password", as: "reset_password"

end
