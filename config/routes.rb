Rails.application.routes.draw do
  
  resources :users
  
  resources :users do
    resources :items
  end

  resources :items
  resources :categories
  
  get '/login', to: "sessions#new"
  post '/login', to: "sessions#create"
  post '/logout', to: "sessions#destroy"

  root 'users#index'
end
