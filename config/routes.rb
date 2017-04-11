Rails.application.routes.draw do

  resources :officials, only: [:index]

end
