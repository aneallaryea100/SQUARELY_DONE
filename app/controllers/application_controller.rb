class ApplicationController < ActionController::Base
  before_action :set_cart  
  helper_method :current_cart

  def current_cart
    @current_cart ||= Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
    @current_cart = Cart.create
    session[:cart_id] = @current_cart.id
    @current_cart
  end

  def cart_items_count
    current_cart.product_items.count
  end

  private

  def set_cart
    @cart = Cart.find_by(id: session[:cart_id])
    @cart ||= Cart.create
    session[:cart_id] ||= @cart.id
  end
  
end
