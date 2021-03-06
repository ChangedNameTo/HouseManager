Rails.application.routes.draw do

  # Authentication
  get 'auth/:provider/callback', to: 'sessions#create'
  get 'auth/failure', to: redirect('/')
  get 'signout', to: 'sessions#destroy', as: 'signout'
  resources :sessions, only: [:create, :destroy]

  # Homepages
  root 'home#logged_in'
  get 'authenticate', to: 'home#logged_out'
  resource :home, only: [:logged_in, :logged_out]

  # Admin
  get :admin, to: 'admin#home'

  # Users
  resources :users do
    put :organization_enable, :organization_disable
  end

  # User roles
  resources :user_roles

  # Roles
  resources :roles

  # Organizations
  resources :organizations

  # Late Plates
  resources :late_plates

  # Meals
  resources :meals

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
