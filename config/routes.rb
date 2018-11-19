Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  # Root path is defined in config/initializers/high_voltage.rb

  get "/r/:token", controller: :redirects, action: :show, as: :redirect
  resources :links, only: [:index, :new, :create, :show, :destroy]
end
