Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "clients#index"
  resources :users,      only: [:index, :edit, :update]
  resources :clients,    only: [:index, :new, :create]
  resources :quotations, only: [:new, :create, :show]
  resources :minutes,    only: [:new, :create, :show]
  resources :others,     only: [:new, :create, :show]
end
