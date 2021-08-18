Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planets, only: [ :index, :show] do
    resources :bookings, only: [ :create, :new ]
  end
  namespace :owner do
    resources :bookings, only:[ :index, :show, :edit, :update, :destroy ]
    resources :planets, only:[ :new, :create ]
  end
  resources :bookings, only:[ :index, :show ]
end
