class AddForeignKeyToOrders < ActiveRecord::Migration[7.0]
  def change
    add_foreign_key :orders, :customers, column: :customer_id
  end
end
