Rails.application.routes.draw do
  get 'sessions/new'

  root 'pages#index'
  get 'pages/help'

  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  resources :users
  resources :topics do 
  resources :comments, only: [:create, :destroy]
  end

  get 'favorites/index'
  post '/favorites', to: 'favorites#create'
  delete 'favorites_path/:id' => 'favorites_path#destroy'
  
end