Rails.application.routes.draw do
  namespace :admin do
    root "static_pages#home"
    resources :categories do
      resources :questions, only: [:index, :edit, :update, :delete]
    end
    resources :users, only: [:index, :destroy]
  end
  root "static_pages#home"
  post "login" => "sessions#create"
  delete "logout" => "sessions#destroy"
  get "signup"  => "users#new"
  resources :users
  resources :categories, only: :index do
    resources :lessons, except: [:new, :index, :destroy]
  end
  resources :results do
    resources :user, only: :index
  end

end
