
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
    resources :ships do
      resources :bookings, only: [:index, :create]
    end
    resources :users, only: [] do
      collection do
        get :ships
      end
    end
end