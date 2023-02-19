class Customer < ApplicationRecord
    has_many :orders
    validates :email, presence: true, uniqueness: true, length: { maximum: 50 }
    validates :password, presence: true, length: { maximum: 50 }
    validates :full_name, presence: true, length: { maximum: 100 }
    validates :billing_address, presence: true
    validates :default_shipping_address, presence: true
    validates :country, presence: true, length: { maximum: 50 }
    validates :phone, presence: true, length: { maximum: 20 }
  end
  