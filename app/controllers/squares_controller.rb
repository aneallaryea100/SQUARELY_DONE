class SquaresController < ApplicationController
    def home
        @products = Product.all 
    end
end