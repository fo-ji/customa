Rails.application.routes.draw do
  devise_for :users
  root "clients#index"
end
