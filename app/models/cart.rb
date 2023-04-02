class Cart < ActiveRecord::Base
	
	has_many :product_items, dependent: :destroy
	
	def add_product(product_id, quantity)
		current_item = product_items.find_by(product_id: product_id)
		if current_item
		  current_item.quantity += quantity
		  return false, "Product already in cart"
		else
		  current_item = product_items.build(product_id: product_id, quantity: quantity)
		  current_item.save
		  return true, "Product added to cart"
		end
	  end

	def total_price
		product_items.to_a.sum { |item| item.product.price * item.quantity }
	end

	def check_total
		product_items.to_a.sum { |item| item.product.price * item.quantity }
	end
	  

	def products
		product_items.map(&:product)
	end
	
end
