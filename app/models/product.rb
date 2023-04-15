class Product < ApplicationRecord

  before_destroy :ensure_not_product_item
  has_and_belongs_to_many :categories
  has_and_belongs_to_many :options
  has_one_attached :image
  has_many :product_items

  after_create :create_category
  
  validates :sku, presence: true, uniqueness: true
  validates :name, presence: true
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :price, presence: true, numericality: { greater_than_or_equal_to: 0.01}
  validates :category, presence: true

  def image_resizer
    image.variant(resize_to_limit: [300, 300]).processed
  end

  def ensure_not_product_item
    if product_items.empty?
      return true
    else
      error.add(:base, 'You have Product Items')
      return false
    end
  end

  private

  def create_category
    Category.create(name: self.name, description: self.description)
  end

end