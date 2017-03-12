Rails.application.routes.draw do
  resources :events
  resources :members

  get '/members', to: 'members#index'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registration#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'
  post '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
  delete '/events/:event_id/rsvp/:id', to: 'events#destroy_rsvp', as: 'cancel_rsvp'

end
