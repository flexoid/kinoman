Kinoman::Application.routes.draw do

  resources :movies, only: [:show]
  resources :people, only: [:show]
end
