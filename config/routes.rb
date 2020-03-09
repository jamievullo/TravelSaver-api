Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/logged_in', to: 'sessions#is_logged_in?'
  
  resources :users

  get '/popular_destinations', to: 'scrape#popular_destinations'
  get '/family_vacations', to: 'scrape#family_vacations'
  get '/weekend_getaways', to: 'scrape#weekend_getaways'
  get '/explore', to: 'scrape#explore'
  get '/tropical', to: 'scrape#tropical'
  get '/adventure', to: 'scrape#adventure'

end
