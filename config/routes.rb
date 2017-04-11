Rails.application.routes.draw do
  resources :scumbags, only: [:index]
  resources :branches, only: [:show]
  resources :carts, only: [:create]

  get '/:category_slug', to: "branches#show"
end