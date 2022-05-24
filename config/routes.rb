# frozen_string_literal: true

Rails.application.routes.draw do
  resources :payments
  resources :categories
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
  unauthenticated do
    root "splash#index"
  end

  authenticated :user do
    root 'categories#index', as: :authenticated_root
  end
end
