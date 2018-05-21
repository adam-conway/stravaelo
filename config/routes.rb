Rails.application.routes.draw do
  root 'welcome#index'

  get '/auth/strava', as: :strava_login
end
