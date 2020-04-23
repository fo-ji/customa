Rails.application.routes.draw do
  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }
  root "clients#index"
  resources :users,            only: [:index, :edit, :update]
  resources :clients,          except: :show
  resources :quotations,       except: :index do
    resources :comments do
      post "create_quotation", on: :member
    end
  end
  resources :minutes,          except: :index do
    resources :comments do
      post "create_minute",    on: :member
    end
  end
  resources :others,           except: :index do
    resources :comments do
      post "create_other",     on: :member
    end
  end
end
