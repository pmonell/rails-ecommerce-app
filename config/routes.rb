Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'customer/index', :to => 'customer#index'
    end
  end

end
