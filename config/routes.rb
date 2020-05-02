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
  
  resources :quotations,       except: :index do
    resources :comments do
      post "create_quotation", on: :member
    end
    post "add"    => "bookmarks#create_quotation_bookmark"
    delete "/add" => "bookmarks#destroy_quotation_bookmark"
  end

  resources :minutes,          except: :index do
    resources :comments do
      post "create_minute",    on: :member
    end
    post "add"    => "bookmarks#create_minute_bookmark"
    delete "/add" => "bookmarks#destroy_minute_bookmark"
  end

  resources :others,           except: :index do
    resources :comments do
      post "create_other",     on: :member
    end
    post "add"    => "bookmarks#create_other_bookmark"
    delete "/add" => "bookmarks#destroy_other_bookmark"
  end
end
