Rails.application.routes.draw do
  #Sidekiq web UI, only for admins
  require "sidekiq/web"
  authenticate :user, lambda { |u| u.admin } do
    mount Sidekiq::Web => '/sidekiq'
  end
  get 'contacts/new'
  get 'contacts/create'
  devise_for :users
  resources :contacts, only: %i[new create]
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
