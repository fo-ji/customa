Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  root "clients#index"

  resources :users,            only: [:index, :edit, :update]

  resources :clients do
    collection do
      get "selected_client",   default: { format: "json" }
    end
  end
  
  resources :documents,       except: :index do

    resources :comments, only: :create
    
    post "add"    => "bookmarks#create"
    delete "/add" => "bookmarks#destroy"
  end
end
