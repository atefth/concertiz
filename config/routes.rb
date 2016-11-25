Rails.application.routes.draw do
  resources :tickets
  resources :concerts
	devise_for :users, controllers: { sessions: 'users/sessions', registrations: 'users/registrations', confirmations: 'users/confirmations', passwords: 'users/passwords' }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'home/index', to: 'home#index', as: :home
  get 'home/concerts', to: 'home#concerts', as: :upcoming_concerts

  # Profile
  get 'users/:id/profile', to: 'users#show', as: :profile
  get 'users/:id/edit', to: 'users#edit', as: :profile_edit

  patch 'users/:id/update', to: 'users#update', as: :profile_update
  get 'users/:id/history', to: 'users#history', as: :profile_history

  get 'users/:id/settings', to: 'users#settings', as: :profile_settings
  get 'users/:id/tickets', to: 'users#tickets', as: :profile_tickets
  get 'users/:id/concerts', to: 'users#concerts', as: :profile_concerts

  root 'home#index'
end
