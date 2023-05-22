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
        @product_item = ProductItem.all
    end

    def add_product
        product = Product.find(params[:product_id])
        current_cart = @cart
        if current_cart.product_items.include?(product)
            @product_item = current_cart.product_items.find_by(:product_id => product)
            @product_item.quantity += 1
        else
            product_item = @cart.product_items.build(product: product)
            quantity = params[:quantity].to_i
            product_item.quantity += quantity
            product_item.save
            @cart.add_product(product, quantity)
            redirect_to root_path(@cart), notice: "#{product.name} added to cart."
        end
    end
      

    def destroy
        @cart = current_cart
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        redirect_to root_url, notice: 'Your cart is Empty'
    end

    private

    def set_cart
        @cart = Cart.find_by(id: session[:cart_id])
        if @cart.nil?
          redirect_to root_path, notice: 'Invalid Cart'
        end
      end
      

    def cart_params
        params[:cart]
    end

    def invalid_cart
        logger.error 'You are trying to access an ivalid cart'
        redirect_to root_path, notice: 'Invalid Cart'
    end
end
