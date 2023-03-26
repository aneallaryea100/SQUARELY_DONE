Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :products
  resources :carts, only: [:show, :destroy]
  resources :product_items

  root "squares#home"
end
