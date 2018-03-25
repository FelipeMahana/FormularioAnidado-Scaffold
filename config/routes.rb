Rails.application.routes.draw do
  resources :posts do
  	resources :comments, only: [:create, :destroy, :edit, :update]
  end

  get 'users/sign_up', to: "users#new"
  post 'users', to: "users#create"

  get 'users/sign_in', to: 'sessions#new'

  resources :sessions, only: [:create, :destroy]

  root 'posts#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
