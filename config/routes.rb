Rails.application.routes.draw do
  root 'posts#home'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
  resources :posts
end
