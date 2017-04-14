Rails.application.routes.draw do
  resources :scumbags, only: [:index]
  resources :branches, only: [:index, :show]
  resources :cart, only: [:create, :index, :update, :destroy]

  resources :users, only: [:create, :new, :show]


  get '/', to: 'home#index'
  get '/dashboard', to: 'users#show'
  get '/:category_slug', to: "branches#show"
end
