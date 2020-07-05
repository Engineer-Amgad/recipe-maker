Rails.application.routes.draw do
  resources :recipes, only: [:index, :new, :create, :show] do
    # resources :ingredients, only: [:index, :new]
  end
 
end
