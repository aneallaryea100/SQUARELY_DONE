class CreateJoinTableOptionsProducts < ActiveRecord::Migration[7.0]
  def change
    create_join_table :options, :products do |t|
      # t.index [:option_id, :product_id]
      # t.index [:product_id, :option_id]
    end
  end
end
