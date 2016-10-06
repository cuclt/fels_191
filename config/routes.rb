Rails.application.routes.draw do
  root "static_pages#home"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "users/new"
  get "signup"  => "users#new"
  resources :users
  resources :categories, only: :index do
    resources :lessons, only: :create
  end
  resources :results do
    resources :user, only: :index
  end
  resources :categories, only: :index
end
