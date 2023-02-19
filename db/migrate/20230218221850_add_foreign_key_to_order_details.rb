class AddForeignKeyToOrderDetails < ActiveRecord::Migration[7.0]
  def change
    add_reference :order_details, :option, null: false, foreign_key: {to_table: :options}
    add_reference :order_details, :product, null: false, foreign_key: {to_table: :products}
  end
end
