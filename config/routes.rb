Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions",
    registrations: 'users/registrations' 
  }
  root to: 'tweets#index'
  resources :tweets
  resources :users, only: [:show]
end
