Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :admins, only: [:index] do
    collection do
      get :postcode_data
      get :infection_rate_postcode
      get :infection_rate_agegroup
    end
  end
  resources :test_results, only: [:index, :new, :create] do
    collection do
      get :validate_ttncode
      get :validate_email
    end
  end

end
