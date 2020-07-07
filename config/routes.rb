Rails.application.routes.draw do
  root to: 'application#index'
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  
  resources :users, only: [:new, :create]

  resources :recipes, only: [:index, :new, :create, :show] do
     resources :ingredients, only: [:index, :new]
  end

end
