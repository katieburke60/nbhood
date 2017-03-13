Rails.application.routes.draw do
  resources :events
  resources :members
  resources :businesses

  get '/members', to: 'members#index'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registration#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'
  post '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
  get '/logout', to: 'sessions#logout', as: 'logout'

  post '/business_login', to: 'business_sessions#create'
  delete '/events/:event_id/rsvp/:id', to: 'events#destroy_rsvp', as: 'cancel_rsvp'
  get '/businesses/:business_id/event/new', to: 'event#new', as: 'business_new_event'
  get '/businesses/signup', to: 'business_account#new', as: 'new_business_account'
end
