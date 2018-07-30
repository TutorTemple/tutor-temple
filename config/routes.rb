Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  resources :help, only: [:index]
  resources :contacts, only: [:index]
  resources :about, only: [:index]
  resources :tutor, only: [:index], path: 'become a tutor'
end
