Rails.application.routes.draw do
  root to:'home#show'

  get '/dashboard', to: 'dashboard#show'
  get '/auth/github/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get '/events', to: 'events#index'
  get '/pulls', to: 'pulls#index'
  get '/repos', to: 'repos#index'
  get '/commits', to: 'commits#index'
  get '/organizations', to: 'organizations#index'
  get '/following', to: 'following#index'
  get '/followers', to: 'followers#index'
  get '/following_events', to: 'following_events#index'
end
