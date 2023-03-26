class CartsController < ApplicationController

    before_action :set_cart
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    
    def index
        @cart = current_cart
    end
    
    def new
        @cart = Cart.new
    end

    def show
        @cart = current_cart
    end

    def add_product
        product = Product.find(params[:product_id])
        @cart.add_product(product)
        redirect_to cart_path(@cart), notice: "#{product.name} added to cart."
      end
      

    def destroy
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        redirect_to home_url, notice: 'Your cart is Empty'
    end

    private

    def set_cart
        @cart = Cart.find(params[:id])
    end

    def cart_params
        params[:cart]
    end

    def invalid_cart
        logger.error 'You are trying to access an ivalid cart'
        redirect_to root_path, notice: 'Invalid Cart'
    end
end
