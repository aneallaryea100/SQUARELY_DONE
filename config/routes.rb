Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :products
  post '/carts/:cart_id/add_product', to: 'carts#add_product', as: 'cart_add_product'
  resources :product_items

  root "squares#home"
end
