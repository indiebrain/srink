Rails.application.routes.draw do
  root "pages#about"

  get "/about", controller: :pages, action: :about, as: :about
  resources :links, only: [:index, :new, :create, :show, :destroy]
  resources :redirects, only: :show
end
