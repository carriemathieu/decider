Rails.application.routes.draw do

  # home page
  root 'sessions#home'

  # create an account route
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  # existing user login route
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"

  # logout route
  delete '/logout' => "sessions#destroy"

  resources :suggestions
  resources :tasks
  resources :users
  
end
