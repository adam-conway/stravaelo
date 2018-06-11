Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/strava', as: :strava_login
  get '/auth/strava/callback', to: 'sessions#create'
  get '/logout', to: 'sessions#destroy'
  get 'dashboard', to: 'dashboard#show'
  post '/user_tournaments/new', to: 'user_tournaments#create'

  resources :segments, only: [:index, :create, :destroy]
  resources :tournaments, only: [:new, :create, :show, :edit]
  resources :user_tournaments, only: [:new, :create, :destroy]
  resources :tournament_segments, only: [:destroy, :create, :new]
  resources :user_segments, only: [:update]
end
