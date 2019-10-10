Rails.application.routes.draw do
  resources :categories
  resources :items
  resources :users
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  root 'users#index'
end
