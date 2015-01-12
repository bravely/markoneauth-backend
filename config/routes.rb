require 'api_constraints'

Rails.application.routes.draw do
  devise_for :users, controllers: { sessions: 'sessions' }
  root to: 'home#index'

  namespace :api do
    scope module: :v1, constraints: ApiConstraints.new(version: 1, default: true) do
      # get :csrf, to: 'csrf#index'
      resources :users, only: [:index, :create], defaults: { format: :json }
    end
  end
end
