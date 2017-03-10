Rails.application.routes.draw do
  resources :events
  resources :members

  get '/members', to: 'members#index'
  post '/login', to: 'sessions#create'
  post '/signup', to: 'registrations#create'
  root 'root#index'
  get '/about', to: 'static#index'
  get '/account', to: 'accounts#show'

end
