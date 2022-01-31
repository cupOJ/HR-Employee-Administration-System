Rails.application.routes.draw do
  resources :divisions
  resources :teams
  resources :employees
  resources :targets
  resources :users
  get 'users/index'
  get 'teams/index'
  get 'targets/index'
  get 'employees/index'
  get 'divisions/index'
  get 'home/index'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "home#index"
end
