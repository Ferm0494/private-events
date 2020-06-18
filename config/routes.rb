Rails.application.routes.draw do
 
  # get 'events/new' => "events#new"
  # get '/events'=> "events#index"
  # get '/events/:id' => "events#show"

  resources :events, only: [:new,:index, :show]
  post '/events/new' => "events#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/login' => "sessions#destroy"
  get '/signup' => "users#new" 
  post '/signup'=> "users#create", as: "users"
  get '/user' => "users#show", as:"show_user"
  root  "sessions#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
