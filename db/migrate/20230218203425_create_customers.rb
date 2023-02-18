class CreateCustomers < ActiveRecord::Migration[7.0]
  def change
    create_table :customers do |t|
      t.string :email, limit: 50
      t.string :password, limit: 50
      t.string :full_name, limit: 100
      t.text :billing_address
      t.text :default_shipping_address
      t.string :country, limit: 50
      t.string :phone, limit: 20

      t.timestamps
    end
  end
end
