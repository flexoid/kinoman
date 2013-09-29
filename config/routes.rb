Kinoman::Application.routes.draw do

  devise_for :users
  root to: 'home#index'

  resources :movies, only: [:show]
  resources :people, only: [:show]

  namespace :admin do

    resources :movies, except: [:show]
  end
end
