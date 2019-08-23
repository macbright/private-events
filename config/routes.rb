Rails.application.routes.draw do
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  root 'users#show'
  
  get '/signup', to: 'users#new'
  get '/new', to: 'events#new'
  post '/signup',  to: 'users#create'
  
  resources :users
  resources :events
end
