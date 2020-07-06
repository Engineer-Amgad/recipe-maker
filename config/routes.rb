Rails.application.routes.draw do

  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"

  resources :users, only: [:new, :create]

  resources :recipes, only: [:index, :new, :create, :show] do
     resources :ingredients, only: [:index, :new]
  end

end
