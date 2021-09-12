Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy]
  resources :dogs, only: [:index, :create, :destroy]
  resources :breeds, only: [:index, :show, :create]
  resources :ratings, only: [:create, :update]
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
