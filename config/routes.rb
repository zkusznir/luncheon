Rails.application.routes.draw do
  root 'orders#index'

  get 'auth/facebook', as: :login
  get 'auth/facebook/callback', to: 'sessions#create'
  get 'logout', to: 'sessions#destroy'
end
