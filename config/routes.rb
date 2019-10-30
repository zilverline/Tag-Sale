Rails.application.routes.draw do
  
  root 'welcome#home'
  
  get '/signup', to: 'users#new'
  post '/signup', to: 'users#create'

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/auth/facebook/callback', to: 'sessions#create'

  resources :users do
    resources :items
  end
  
  resources :users, only: [:new, :edit, :show]
  resources :items
  resources :categories, only: [:index, :show]
  
  #get '*path', to:  '/' }
end
