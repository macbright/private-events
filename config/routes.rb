Rails.application.routes.draw do
  get 'attendances/new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'

  root 'users#show'
  
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'

  get '/event', to: "events#show"
  
  resources :users
  resources :events
  resources :attendances
end
