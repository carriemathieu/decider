Rails.application.routes.draw do

  # home page
  root 'sessions#home'

  # create an account route
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  # existing user login route
  get '/signin' => "sessions#new"
  post '/signin' => "sessions#create"

  # callback route for google oauth
  get '/auth/:provider/callback' => 'sessions#omniauth'

  # logout route
  delete '/logout' => "sessions#destroy"

  delete '/task/:id' => "tasks#destroy"

  delete '/suggestions/:id' => "suggestions#destroy"

  resources :friendships
  
  resources :suggestions
  resources :tasks do
    resources :suggestions, only: [:new, :create, :index, :edit]
  end
  resources :users do
    resources :tasks, only: [:new, :create, :index, :edit]
  end
end
