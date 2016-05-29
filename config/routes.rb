Rails.application.routes.draw do
  resources :conversions, only: [:new, :create, :show]
  resources :rates, only: :create
end
