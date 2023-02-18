class CreateOrders < ActiveRecord::Migration[7.0]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.decimal :amount
      t.text :shipping_address
      t.text :order_address
      t.string :order_email
      t.string :order_state
      t.date :order_date

      t.timestamps
    end
  end
end
