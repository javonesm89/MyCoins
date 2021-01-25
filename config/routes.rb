Rails.application.routes.draw do
  resources :strategies
  resources :actions
  root "users#index"
  
  resources :users

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
