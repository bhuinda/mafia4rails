Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get 'users/me', to: 'users#me'
  post 'users/find', to: 'users#find'
  resources :users

  put 'friend_requests/:id/accept', to: 'friend_requests#update'
  delete 'friend_requests/:id/decline', to: 'friend_requests#destroy'
  resources :friend_requests

  resources :friendships

  post 'login', to: 'sessions#create'
  get 'validate_token', to: 'sessions#validate'

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
end
