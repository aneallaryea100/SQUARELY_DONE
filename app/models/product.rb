class Product < ApplicationRecord
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :options
  
  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
end