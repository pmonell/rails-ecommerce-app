Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :customers, only: [:index, :show, :create]
    
      resources :products, only: [:show, :index]
    end
  end

end
