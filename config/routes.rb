Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root "workspaces#index"

  resources :workspaces, only: %i[index new create]
  resources :projects, only: %i[index new create show]
  resources :lists, only: %i[new create]
end
