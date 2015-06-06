Rails.application.routes.draw do

  # Root path is defined in config/initializers/high_voltage.rb

  get "/r/:token", controller: :redirects, action: :show, as: :redirect
  resources :links, only: [:index, :new, :create, :show, :destroy]
end
