Rails.application.routes.draw do

  # Root path is defined in config/initializers/high_voltage.rb

  resources :links, only: [:index, :new, :create, :show, :destroy]
  resources :redirects, only: :show
end
