Kinoman::Application.routes.draw do

  root to: 'home#index'

  resources :movies, only: [:show]
  resources :people, only: [:show]

  namespace :admin do

    resources :movies, except: [:show]
  end
end
