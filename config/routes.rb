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
    put :organization_enable, :organization_disable, :organization_enable_all, :organization_disable_all
  end

  # User roles
  resources :user_roles

  # Roles
  resources :roles

  # Organizations
  resources :organizations do
    put :organization_enable_all, :organization_disable_all
  end

  # Late Plates
  resources :late_plates

  # Meals
  resources :meals

  # Announcements
  resources :announcements

  # Maintenance Requests
  resources :maintenance_requests do
    put :change_started_status, :change_finished_status
  end
  resources :maintenance_request_comments

  # Service Hours
  resources :service_hours do
    get :admin, on: :collection
    get :show_user
  end
end
