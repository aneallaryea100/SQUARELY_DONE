class SquaresController < ApplicationController
    def home
        @products = Product.all 
    end

    def show
        @products = Product.find(params[:id])
    end
end