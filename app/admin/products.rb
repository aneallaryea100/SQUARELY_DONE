ActiveAdmin.register Product do

   permit_params :sku, :name, :description, :image, :stock, :price
  #
  # or
  #
  # permit_params do
  #   permitted = [:sku, :name, :description, :image, :stock, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
