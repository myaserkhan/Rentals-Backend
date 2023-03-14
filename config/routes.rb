Rails.application.routes.draw do
  get 'users/:username', to: 'users#index'
  namespace :api do
    namespace :v1 do
      resources :users
      resources :users do
        resources :reservations
      end
      resources :cars
    end
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
