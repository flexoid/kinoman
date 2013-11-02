Kinoman::Application.routes.draw do

  get "profiles/show"
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

  resource :profile, only: [:show] do
    get 'movies'
  end

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
