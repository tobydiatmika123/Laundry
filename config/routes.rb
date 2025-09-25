Rails.application.routes.draw do
  resources :customers
  resources :orders do
    patch :finish, on: :member
  end
  resources :shoes
  resources :services

  root "orders#index"
end
