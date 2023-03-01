class AddCategoryToProducts < ActiveRecord::Migration[7.0]
  def change
    add_column :products, :category, :string
  end
end
