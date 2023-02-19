class OrderDetail < ApplicationRecord
    belongs_to :order
    belongs_to :product
  
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :sku, presence: true
    validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  end