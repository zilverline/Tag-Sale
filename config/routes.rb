Rails.application.routes.draw do
  
  root 'users#index'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :items
  end
  
  resources :users
  resources :items
  resources :categories

  

end
