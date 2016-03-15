Rails.application.routes.draw do
  root 'application#home'

  resources :orders
  
  get 'auth/facebook', as: :login
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
