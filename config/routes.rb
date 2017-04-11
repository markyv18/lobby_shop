Rails.application.routes.draw do
  resources :scumbags, only: [:index]
  resources :branches, only: [:show]

  get '/:category_slug', to: "branches#show"
end