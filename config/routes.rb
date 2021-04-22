Rails.application.routes.draw do
  
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  # For follow and unfollow
  resources :relationships, only: [:create, :destroy]
  
  root 'static_pages#home'

  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'

  get '/signup', to: 'users#new'
  
  get '/login', to: 'sessions#new'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    member do
      get :following, :followers
    end
  end

  resources :categories, only: [:index]
    namespace :admin do
      resources :categories, only: [:index, :new, :create, :show, :edit, :update, :destroy]
    end
  
end