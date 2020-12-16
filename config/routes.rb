Rails.application.routes.draw do
  devise_for :users, controllers: { 
    sessions: "users/sessions",
    registrations: 'users/registrations' 
  }
  root to: 'tweets#index'
  resources :tweets do
    resources :comments, only: :create
  end
  resources :users, only: [:show]
end
