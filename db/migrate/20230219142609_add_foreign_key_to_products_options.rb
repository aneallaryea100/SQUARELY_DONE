class AddForeignKeyToProductsOptions < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :options_products, :options, column: :option_id
    add_foreign_key :options_products, :products, column: :product_id
  end
end
