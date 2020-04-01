Rails.application.routes.draw do
  get 'clients/index'
  root "clients#index"
end
