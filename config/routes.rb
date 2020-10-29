Rails.application.routes.draw do

  # create an account route
  get '/signup' => "users#new"
  post '/signup' => "users#create"

  # existing user login route
  get '/login' => "sessions#new"
  post '/login' => "sessionss#create"

  # logout route
  delete '/logout' => "sessions#destroy"
  
  resources :suggestions
  resources :tasks
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
