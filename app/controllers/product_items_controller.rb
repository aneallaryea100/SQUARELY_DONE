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
	#   product = Product.find(params[:product_id])
	#   @product_item = @cart.add_product(product.id)
	#   if @product_item.save
	# 	redirect_to root_url, notice: 'Product added to Cart'
	#   else
	# 	render :new
	#   end

	product = Product.find(params[:product_id])
	current_cart = @current_cart

  # If cart already has this product then find the relevant line_item and iterate quantity otherwise create a new line_item for this product
  if current_cart.products.include?(product)
    # Find the line_item with the chosen_product
    @product_item = current_cart.product_items.find_by(:product_id => product)
    # Iterate the product_item's quantity by one
    @product_item.quantity += 1
  else
    @product_item = @cart.add_product(product.id)
    @product_item.cart = current_cart
    @product_item.product = chosen_product
  end

  # Save and redirect to cart show path
  @product_item.save
  redirect_to root_url, notice: 'Product added to Cart'

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
  