Rails.application.routes.draw do
  root to:'home#show'

  get '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/events', to: 'events#index'

end
