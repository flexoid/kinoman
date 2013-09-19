Kinoman::Application.routes.draw do

  root to: 'home#index'

  resources :movies, only: [:show]
  resources :people, only: [:show]
end
