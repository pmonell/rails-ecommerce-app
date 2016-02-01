require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    namespace :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      resources :customers, only: [:index, :show, :create] do
        resources :orders, only: [:show, :index, :create]
      end
      resources :products, only: [:show, :index, :create]
      resources :orders, only: [:show, :index]
    end
  end

end
