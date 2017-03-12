Rails.application.routes.draw do
  resources :events
  resources :members
  resources :businesses
  resources :business_accounts

  get '/members', to: 'members#index'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registration#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'
  post '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
  post '/business_login', to: 'business_sessions#create'
end
