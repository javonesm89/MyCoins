Rails.application.routes.draw do
  root "users#index"
  
  resources :users

  get '/login' => 'sessions#new'
  delete '/logout' => 'sessions#destroy'
end
