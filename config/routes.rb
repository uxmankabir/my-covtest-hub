Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'home#index'
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'

  resources :admins, only: [:index]
  resources :test_results, only: [:index, :new, :create] do
    collection do
      get :ttn_code
    end
  end

end
