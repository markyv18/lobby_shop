Rails.application.routes.draw do
  resources :scumbags, only: [:index]
  resources :branches, only: [:show]
  resources :cart, only: [:create, :index, :update, :destroy]
  get '/', to: "home#index"

  get '/:category_slug', to: "branches#show"
end
