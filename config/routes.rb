Rails.application.routes.draw do

  # Defines the root path route ("/")
  root "home#index"

  resources :users, only:[:new, :create]
  
  get 'home/index', to: "home#index"
  post 'home/main'
  get 'home/main'
  post 'users/new'
  get 'login', to: "sessions#login"
  post 'login', to: "sessions#create"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

end
