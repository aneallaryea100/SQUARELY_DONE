class Cart < ActiveRecord::Base
	
	has_many :product_items, dependent: :destroy
	has_many :products, through: :product_items
	
	def add_product(product_id, quantity)
        current_item = product_items.find_by(product_id: product_id)
        if current_item
          current_item.quantity += quantity
        else
          current_item = product_items.build(product_id: product_id, quantity: quantity)
        end
        current_item
    end

	def total_price
		product_items.to_a.sum { |item| item.product.price * item.quantity }
	end

	def check_total
		product_items.to_a.sum { |item| item.product.price * item.quantity }
	end

	def sub_total
		sum = 0
		self.product_items.each do |product_item|
		  sum+= product_item.total_price
		end
		return sum
	  end
	  

	def products
		product_items.map(&:product)
	end
	
end
