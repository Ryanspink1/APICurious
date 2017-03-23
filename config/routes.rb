Rails.application.routes.draw do
  root to:'home#show'

  get '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/events', to: 'events#index'
  get '/pulls', to: 'pulls#index'
  get '/repos', to: 'repos#index'
end
