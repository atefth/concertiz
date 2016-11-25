Rails.application.routes.draw do
  resources :tickets
  resources :concerts
	devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index', to: 'home#index', as: :home
  get 'home/concerts', to: 'home#concerts', as: :upcoming_concerts

  root 'home#index'
end
