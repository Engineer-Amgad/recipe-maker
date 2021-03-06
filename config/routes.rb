Rails.application.routes.draw do
  root to: 'application#index'
  get '/login' => "sessions#new"
  post '/sessions' => "sessions#create"
  get '/logout' => "sessions#destroy"
  get '/auth/google_oauth2/callback' => 'sessions#create'
  resources :users, only: [:new, :create] do 
    resources :recipes, only: [:index]
  end

  resources :recipes, only: [:index, :new, :create, :show, :update] do
     resources :ingredients, only: [:new]
  end

end
