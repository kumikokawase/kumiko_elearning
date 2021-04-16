Rails.application.routes.draw do

  get 'sessions/new'
  get 'sessions/create'
  get 'sessions/destroy'
  root 'static_pages#home'
  
  get '/about', to: 'static_pages#about'
  get '/contact', to: 'static_pages#contact'
   
  get '/signup', to: 'users#new' 

   # /login
   get '/login', to: 'sessions#new'

   # /logout
   delete '/logout', to: 'sessions#destroy'
 
   resources :users
     
   # Sessions
   resources :sessions, only: [:new, :create, :destroy]
  

end
