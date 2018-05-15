Rails.application.routes.draw do

  resources :users
  resource :session, only: [:create, :new, :destroy]

  resources :bands
  resources :albums, except: [:index]
end
