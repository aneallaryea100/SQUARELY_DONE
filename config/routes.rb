Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :products
  resources :carts
  resources :product_items

  root "squares#home"
end
