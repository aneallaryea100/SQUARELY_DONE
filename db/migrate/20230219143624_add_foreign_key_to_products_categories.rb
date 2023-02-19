class AddForeignKeyToProductsCategories < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :categories_products, :products, column: :product_id
    add_foreign_key :categories_products, :categories, column: :category_id
  end
end
