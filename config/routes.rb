Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }

  devise_scope :user do
    get '/users/sign_out', to: 'devise/sessions#destroy'
    root to: "devise/sessions#new"
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  namespace :api do
    get 'psgc/fetch_provinces', to: 'psgc#fetch_provinces'
    get 'psgc/fetch_cities_municipalities/:province_code', to: 'psgc#fetch_cities_municipalities'
    get 'psgc/fetch_barangays/:city_or_municipality_code', to: 'psgc#fetch_barangays'
  end
  
end
