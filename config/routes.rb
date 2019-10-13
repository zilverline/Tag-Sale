Rails.application.routes.draw do
  
  root 'welcome#home'

  get '/signup', to: 'users#new'
  get '/login', to: 'sessions#new'
  get '/auth/facebook/callback', to: 'sessions#create'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  
  resources :users do
    resources :items
  end
  
  resources :users
  resources :items
  resources :categories

  

end
