Rails.application.routes.draw do
  root "users#index"
  
  resources :users

  delete '/logout' => 'sessions#destroy'
end
