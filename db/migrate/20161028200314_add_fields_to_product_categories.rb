class AddFieldsToProductCategories < ActiveRecord::Migration[5.0]
  def change
    add_column :product_categories, :icon_data, :text
    add_column :product_categories, :billboard_data, :text
  end
end
