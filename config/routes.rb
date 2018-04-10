Rails.application.routes.draw do
  root 'messages#index'
  resources :users
  resources :messages
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  get '/list', to: 'messages#restTest'
  post '/mypost', to: 'messages#mypost'
  
  mount ActionCable.server, at: '/cable'
end
