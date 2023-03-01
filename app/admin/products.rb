ActiveAdmin.register Product do

   permit_params :sku, :name, :description, :image, :stock, :price, :category
  #
  # or
  #
  # permit_params do
  #   permitted = [:sku, :name, :description, :image, :stock, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :sku
      f.input :name
      f.input :description
      f.input :image, as: :file
      f.input :stock
      f.input :price
      f.input :category
    end
    f.actions
  end
  
end
