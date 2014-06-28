Rails.application.routes.draw do

  root to: 'manufacturers#index'

  resources :manufacturers, only: [:index, :show, :new] do
    resources :cars, only: [:new]
  end
end
