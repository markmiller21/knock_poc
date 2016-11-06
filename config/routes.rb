Rails.application.routes.draw do
  get 'landing/index'
 
  
  # homepage displays some users and a Knock synopsis
  root 'landing#index'

  devise_for :users
  resources :users, only: [:show]
end
