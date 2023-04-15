Rails.application.routes.draw do
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)
  
  resources :products
  post '/carts/:cart_id/add_product', to: 'carts#add_product', as: 'cart_add_product'
  get '/cart', to: 'carts#show'
  resources :product_items, only: [:create, :update, :destroy, :show]
  delete '/product_items/:id', to: 'product_items#destroy', as: 'remove_product_item'




  root "squares#home"
end
