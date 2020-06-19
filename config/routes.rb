Rails.application.routes.draw do
 
  # post '/event_attendees/:id' => "event_attendees#create"
  # delete '/event_attendees/:id'  => "event_attendees#destroy"
  # get 'events/new' => "events#new"
  # get '/events'=> "events#index"
  # get '/events/:id' => "events#show"

  resources :events, only: [:new,:index, :show] do
     post '/event_attendees' => "event_attendees#create"
     delete '/event_attendees'  => "event_attendees#destroy"
  end
  post '/events/new' => "events#create"
  get '/login' => "sessions#new"
  post '/login' => "sessions#create"
  delete '/login' => "sessions#destroy"
  get '/signup' => "users#new" 
  post '/signup'=> "users#create", as: "users"
  get '/user' => "users#show", as:"show_profile"
  get '/user/:id'=> "users#show",as: "show_user"
  get '/users'=> "users#index", as: "show_users"
  root  "sessions#show"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
