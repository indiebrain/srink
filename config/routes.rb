Rails.application.routes.draw do
  root "home#index"

  resources :links, only: [:index, :new, :create, :show]
end
