Rails.application.routes.draw do
  resource :session, only: [:new, :create, :destroy]

  resources :users, only: [:new, :create, :destroy]
  resources :circles
  resources :posts

  get "/", to: "static_pages#home", as: "home"

end
