class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_details

  validates :amount, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :shipping_address, presence: true
  validates :order_address, presence: true
  validates :order_email, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :order_state, presence: true, inclusion: { in: %w(pending processing shipped delivered cancelled) }
  validates :order_date, presence: true  

  STATES = ['Pending', 'Processing', 'Shipped', 'Delivered'].freeze
end
  