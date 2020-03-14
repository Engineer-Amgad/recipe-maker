Rails.application.routes.draw do
  resources :recipes, only: [:index, :new, :create, :show] do
    resources :ingredients, only: [:index, :new]
  end
  resources :ingredients, only: :create
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
