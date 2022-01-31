Rails.application.routes.draw do
  get 'users/get_users'
  get 'teams/get_teams'
  get 'targets/get_targets'
  get 'employees/get_employees'
  get 'divisions/get_divisions'

  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
