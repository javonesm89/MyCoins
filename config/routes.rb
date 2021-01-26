Rails.application.routes.draw do
  root "users#index"
  
  resources :strategies

  resources :users do 
    resources :strategies
    resources :actions
  end
  resources :actions

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  delete '/logout' => 'sessions#destroy'
  
end
