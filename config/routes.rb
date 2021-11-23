Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :destroy]
  resources :dogs, only: [:index, :create, :show, :destroy]
  resources :breeds, only: [:index, :show, :create]
  post '/ratings', to: 'ratings#rate_dog'
  post '/login', to: 'auth#create'
  get '/me', to: 'auth#check_user'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
