Rails.application.routes.draw do
  # Root
  # root 'application#index'

  namespace :api do
    namespace :v1 do
      resources :ingredients, only: :index
      resources :recipes, only: :index
    end
  end

  # Ingredients
  # resources :ingredients
  # post 'ingredients/import'

  # Users, with recipes and user_ingredients
  # resources :users do
  #   resources :recipes
  #   get 'recipes/ingredients/:id' => 'recipes#by_ingredient', as: "recipes_by_ingredient"
  #   post 'recipes/import'
  #   resources :ingredients, controller: 'user_ingredient_costs'
  # end

  # Session
  # get '/login' => 'sessions#new'
  # post '/login' => 'sessions#create'
  # get '/logout' => 'sessions#destroy'

  # Google authentication
  # get 'auth/:provider/callback', to: 'sessions#googleAuth'
  # get 'auth/failure', to: redirect('/')
end
