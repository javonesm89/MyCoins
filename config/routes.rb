Rails.application.routes.draw do
  root "users#index"
  
  resources :users

  get '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
end
