Rails.application.routes.draw do
  root 'pages#index'

  ActiveAdmin.routes(self)

  devise_for :users, controllers: { registrations: 'users/registrations' }

  resources :dashboard
  resource :profile, only: %i[show new create edit]

  get ':page_name', controller: :pages,
                    action: :index,
                    constraints: { page_name: /(about|contacts|become_a_tutor|help|howitworks)/ }
end
