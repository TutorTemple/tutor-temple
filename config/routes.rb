Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'users/registrations' }
  get ':page_name', controller: :pages, action: :index, constraints: { page_name: /(about|contacts|become_a_tutor|help)/ }
  resources :dashboard
  root 'pages#index'
end
