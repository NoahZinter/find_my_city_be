Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :city
      resources :city_details
    end
  end
end
