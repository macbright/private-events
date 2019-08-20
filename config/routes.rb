Rails.application.routes.draw do
 get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#delete'
  root 'users#show'
  get '/signup', to: 'users#new'
  post '/signup',  to: 'users#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users
end
