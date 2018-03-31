Rails.application.routes.draw do
  # API
  namespace :api do
    # Sponsors API
    resources :sponsors, only: [:index]

    # FAQ's API
    resources :faqs, only: [:index]

    # Events's API
    resources :events, only: [:index]

    # Food's API
    resources :foods, only: [:index]

    # Vendor's API
    resources :vendors, only: [:index]
  end

  # Sortable
  post 'sort', to: 'sort#sort'

  # Sponsors
  resources :sponsors

  # FAQ's
  resources :faqs

  # Events's
  resources :events

  # Foods
  resources :foods

  # Vendor
  resources :vendors

  # Login
  resources :sessions, only: [:create], path: 'login'

  get 'login', to: 'sessions#new', as: :login
  get 'logout', to: 'sessions#destroy', as: :logout

  resources :users, only: [:create]

  get 'dashboard', to: 'dashboard#index'

  # Homepage
  root 'sessions#new'
end
