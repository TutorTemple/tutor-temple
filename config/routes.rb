Rails.application.routes.draw do
  devise_for :users

  root to: 'welcome#index'

  get ':page_name', controller: :pages, action: :index, constraints: {page_name: /(about|contacts|become_a_tutor|help)/}
end
