Rails.application.routes.draw do
  resources :scumbags, only: [:index, :show]
  resources :branches, only: [:show, :index]
  resources :cart, only: [:create, :index, :update, :destroy]

  resources :users, only: [:create, :new, :show]
  resources :orders, only: [:index, :show, :create]

  namespace :admin do
   resources :scumbags, only: [:create, :destroy, :new, :index]
   resources :orders, only: [:index, :update]
   get '/dashboard', to: 'base#show'
   resources :users, only: [:update, :edit]
  end

  root :to => "home#index"
  get '/dashboard', to: 'users#show'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
  get '/:category_slug', to: "branches#show"
end
