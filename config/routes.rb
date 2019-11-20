Rails.application.routes.draw do
  root 'offices#index'

  resources :users
  resources :offices do
    resources :appointments, only: [:index, :new, :create, :destroy]
  end
end