Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workspaces#index"

  resources :projects, only: %i[create]
  resources :workspaces, only: %i[index new create]
end
