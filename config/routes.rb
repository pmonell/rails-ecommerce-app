Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show, :create]
    
      resources :products, only: [:show, :index, :create]

      resources :orders, only: [:show]
    end
  end

end
