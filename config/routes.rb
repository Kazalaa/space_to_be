Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planets, only: [ :index, :show] do
    resources :registrations, only: [ :create, :new ]
  end
  namespace :owner do
    resources :registrations, only:[ :index, :show, :edit, :update, :destroy ]
    resources :planets, only:[ :new,:show]
  end
  resources :registrations, only:[ :index, :show ]
end
