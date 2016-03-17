Rails.application.routes.draw do
  root 'application#home'

  resources :orders, only: [:create, :update]
  resources :orders, only: :index do
    resources :meals, only: [:index, :create]
  end
  
  get 'auth/facebook', as: :login
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
