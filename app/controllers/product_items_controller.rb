class ProductItemsController < ApplicationController
	include CurrentCart
	before_action :set_cart, only: [:create]
	before_action :set_product_item, only: [:show, :destroy]
  
	def index
	  @product_items = ProductItem.includes(:product).all
	end

	def show
		@product_item = ProductItem.find(params[:id])
	end
  
	def create
	  product = Product.find(params[:product_id])
	  @product_item = @cart.add_product(product.id)
	  if @product_item.save
		redirect_to root_url, notice: 'Product added to Cart'
	  else
		render :new
	  end
	end

	def destroy
		@cart = current_cart
		@product_item = @cart.ProductItem.find(params[:id])
		@product_item.destroy
		redirect_to cart_path, notice: 'Item was successfully removed from your cart.'
	end
  
	private
  
	def set_product_item
	  @product_item = ProductItem.includes(:product).find(params[:id])
	end
  
	def product_item_params
	  params.require(:product_item).permit(:product_id) 
	end
  end
  