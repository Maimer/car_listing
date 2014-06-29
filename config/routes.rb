Rails.application.routes.draw do

  root to: 'manufacturers#index'

  resources :manufacturers, only: [:index, :show, :new, :create] do
    resources :cars, only: [:new, :create]
  end
end
