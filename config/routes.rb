Rails.application.routes.draw do
  root "sessions#home"
  get "/signup", to: "users#new"
  post "/signup", to: "users#create"
  get "/login", to: "sessions#new"
  post "/login", to: "sessions#create"
  get "/logout", to: "sessions#destroy"
  get "/manage_users", to: "manage_users#new"
  resources :users, only: [:new, :edit, :update, :create]
  resources :manage_users, only: [:new, :edit, :update]
end
