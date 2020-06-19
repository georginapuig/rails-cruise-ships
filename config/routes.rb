
Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :ships do
    collection do
     get "my_ships"
    end
  resources :bookings, only: [:index, :create]
  resources :reviews, only: [:create, :index, :show]
  end
end
