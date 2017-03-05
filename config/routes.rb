Rails.application.routes.draw do

  # Homepages
  root 'home#logged_in'
	get 'home/logged_in'
  resource :home, only: [:logged_in, :logged_out]

  # Users
  resources :users

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
