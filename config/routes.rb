Rails.application.routes.draw do
  resources :products

  root "squares#home"
end
