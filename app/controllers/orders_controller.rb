class OrdersController < ApplicationController
    def new
      @order = Order.new
    end

    def create
        @order = Order.new(order_params)
        if @order.save
          redirect_to @order
        else
          render :new
        end
      end
    
      private
    
      def order_params
        params.require(:order).permit(:shipping_address, :order_address, :order_email, :order_date, :order_state)
      end
  end
  