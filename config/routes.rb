Rails.application.routes.draw do
  authenticated :user do
    root 'dashboard#index', as: :authenticated_root
  end

  root 'pages#index'

  ActiveAdmin.routes(self)

  devise_for :users, controllers: {
    omniauth_callbacks: 'users/omniauth_callbacks',
    registrations: 'users/registrations'
  }

  resources :dashboard

  resource :profile, except: %i[index destroy]
  resources :tutors, only: %i[show]

  get ':page_name', controller: :pages,
                    action: :index,
                    constraints: { page_name: /(about|contacts|become_a_tutor|help|howitworks)/ }
end
