Kinoman::Application.routes.draw do

  namespace :forum do
    resources :messages
  end

  devise_for :users
  root to: 'home#index'

  resources :movies, only: [:show] do
    resources :reviews
  end
  resources :grades do
    post 'rate', on: :collection
  end

  resources :people, only: [:show]

  namespace :admin do
    resources :movies, except: [:show]
  end

  namespace :forum do
    root to: 'categories#index'

    resources :categories, except: [:index]
    resources :threads
  end
end
