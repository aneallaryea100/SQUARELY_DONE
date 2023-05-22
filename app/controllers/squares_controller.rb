class SquaresController < ApplicationController
    def home
        @products = Product.all
        @cart = current_cart
        # @cart_items_count = @cart.product_items.sum(:quantity) 
    end

    def show
        @products = Product.find(params[:id])
    end
end