Rails.application.routes.draw do
  root 'pages#index'

  devise_for :users

  get ':page_name', controller: :pages, action: :index, constraints: { page_name: /(about|contacts|become_a_tutor|help)/ }
end
