Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :planets
  namespace :owner do
    resources :planets, :registrations, only:[ :index, :show, :new, :create ]
  end
  namespace :tenant do
    resources :planets, :registrations, only:[ :index, :show, :new, :create ]
  end
  resources :registrations, only:[:index, :show, :new, :create]
end
