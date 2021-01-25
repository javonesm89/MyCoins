Rails.application.routes.draw do
  root "users#index"
  
  resources :users do 
    resources :strategies
  end
  resources :actions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
