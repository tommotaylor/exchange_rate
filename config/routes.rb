Rails.application.routes.draw do
  root to: "conversions#new"
  resources :conversions, only: [:new, :create, :show]
  resources :rates, only: :create
end
