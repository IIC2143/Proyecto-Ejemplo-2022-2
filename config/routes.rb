# /config/routes.rb

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :games
  root "games#index"

  resources :games do
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end

 
  # Reviews
  get '/reviews/:game_id/new', to: 'reviews#new', as: 'new_review'
  post '/reviews', to: 'reviews#create'
  delete '/reviews/:id', to: 'reviews#delete', as: 'reviews_delete'
end
