require 'api_constraints'

Rails.application.routes.draw do
  namespace :api, defaults: { format: :json } do
    mount_devise_token_auth_for 'User', at: 'auth'

    scope module: :v1,
          constraints: ApiConstraints.new(version: 1, default: false) do
      resources :contacts
    end

    scope module: :v2,
          constraints: ApiConstraints.new(version: 2, default: true) do
      resources :contacts
    end
  end

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"

end

# blog/api/v1/contacts: default = false version = 1
# blog/api/v1/contacts: default = true version = 2

# blog/api/contacts
