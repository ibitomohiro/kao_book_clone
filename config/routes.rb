Rails.application.routes.draw do
  root 'posts#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users
  resources :posts
end
