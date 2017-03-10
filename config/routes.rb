Rails.application.routes.draw do
  resources :events
  resources :members


  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'
  post '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
end
