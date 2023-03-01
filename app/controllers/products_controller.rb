class ProductsController < ApplicationController
    def index
        @products = Product.all
      end
    
      def show
        @product = Product.find(params[:id])
      end
    
      def new
        @product = Product.new
      end
    
      # def create
      #   @product = Product.new(product_params)
        
      #   respond_to do |format|
      #   if @product.save
      #     # create category with same description as product
      #     Category.transaction do
      #     @category = Category.new(description: @product.description)
      #     @category.save!
      #     redirect_to products_path
      #   else
      #     render :new
      #   end
      # end
      # end

      def create
        @product = Product.new(product_params)
      
        respond_to do |format|
          if @product.save
            # create category with same description as product
            Category.transaction do
              @category = Category.new(name:@product.name, description: @product.description)
              @category.save!
              redirect_to products_path
            end
      
            format.html { redirect_to @product, notice: 'Product was successfully created.' }
            format.json { render :show, status: :created, location: @product }
          else
            format.html { render :new }
            format.json { render json: @product.errors, status: :unprocessable_entity }
          end
        end
      end
      
    
      def edit
        @product = Product.find(params[:id])
      end
    
      def update
        @product = Product.find(params[:id])
    
        if @product.update(product_params)
          redirect_to product_path(@product)
        else
          render :edit
        end
      end
    
      def destroy
        @product = Product.find(params[:id])
        @product.destroy
    
        redirect_to products_path
      end
    
      private
    
      def product_params
        params.require(:product).permit(:name, :description, :image, :category_id, :stock, :sku, :price, :category)
      end
end
