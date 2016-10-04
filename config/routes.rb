Rails.application.routes.draw do
  root "static_pages#home"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "users/new"

  root "static_pages#home"
  get "signup"  => "users#new"
  resources :users
  resources :categories, only: :index
end
