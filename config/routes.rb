Kinoman::Application.routes.draw do

  devise_for :users
  root to: 'home#index'

  get 'search/movies', to: 'search#movies'
  get 'search/people', to: 'search#people'

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
    resources :messages
  end
end
