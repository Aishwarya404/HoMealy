Rails.application.routes.draw do

  root :to => 'home#index'

  resources :users, only:[:new, :create]
  resources :dishes, only:[:new, :create]
  
  get 'home/index', to: "home#index" 
  post 'home/main'
  get 'home/main'
  
  post 'users/new'
  get 'login', to: "sessions#login"
  post 'login', to: "sessions#create"
  get 'logout', to: 'sessions#destroy' 

  post 'dishes/new'
  get 'dishes/new'
end
