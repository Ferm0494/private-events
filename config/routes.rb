Rails.application.routes.draw do
 
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/login' => "sessions#destroy"
  get '/signup' => "users#new" 
  post '/signup'=> "users#create", as: "users"
  get '/users' => "users#show", as:"show_user"
  root  "sessions#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
