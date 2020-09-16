Rails.application.routes.draw do
  root 'homes#top'
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :show]
end
