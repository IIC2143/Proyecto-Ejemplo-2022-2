# /config/routes.rb

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations'
  }
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root "games#index"

  resources :games do
    resources :reviews, only: [:new, :create, :destroy]
    member do
      post 'favorite'
      delete 'unfavorite'
    end
  end
end
