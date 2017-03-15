Rails.application.routes.draw do

  get '/events/categories/:category_id', to: 'events#category', as: 'category_show'
  get '/events/favorites', to: "events#followers", as: "followers"
  post '/ratings/:id', to: 'ratings#create', as: 'create_rating'
  resources :events
  resources :members
  resources :business_accounts, except: :new
  get '/members/:member_id/ratings/:id', to: 'ratings#new', as: 'new_rating'

  delete '/events/:id', to: "events#destroy"
  get '/members', to: 'members#index'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registration#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'
  get '/events/:id/rsvp', to: 'events#rsvp', as: 'rsvp'
  get '/events/:id/interest', to: 'events#interest', as: 'interest'
  get '/events/:event_id/interest/:id', to: 'events#destroy_interest', as: 'cancel_interest'
  get '/logout', to: 'sessions#logout', as: 'logout'
  post '/business_login', to: 'business_sessions#create'
  get '/events/:event_id/rsvp/:id', to: 'events#destroy_rsvp', as: 'cancel_rsvp'
  get '/businesses/signup', to: 'business_accounts#new', as: 'new_business_account'
  post 'businesses/signup', to: 'business_accounts#create'
  get '/business/followers', to: 'businesses#followers', as: 'business_followers'

  get '/business/:id/follow', to: 'followers#create', as: 'follow'
  get '/business/:id/unfollow', to: 'followers#destroy', as: 'unfollow'

  resources :businesses

  get '/businesses/:business_id/event/new', to: 'events#new', as: 'business_new_event'


end
