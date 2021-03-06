Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
    namespace :v1 do
      resources :weather, only: [:index]
      resources :city, only: [:index]
      resources :favorites, only: [:create, :destroy]
      resources :users, only: [:create]
      get '/users/:id/favorites', to: 'users#favorites'
    end
  end
end
