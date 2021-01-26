Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  post 'login', to: 'auth#login'

  resources :roles, only: [:index]
  resources :users
end
