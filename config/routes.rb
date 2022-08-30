# /config/routes.rb

Rails.application.routes.draw do
  resources :games
  root "games#index"
end
