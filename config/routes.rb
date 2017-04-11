Rails.application.routes.draw do
  resources :scumbags, only: [:index]
  resources :branches, only: [:show]
end
