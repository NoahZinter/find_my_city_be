Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :city
    end
  end
end
