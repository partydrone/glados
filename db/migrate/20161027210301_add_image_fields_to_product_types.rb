class AddImageFieldsToProductTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :product_types, :icon_data, :text
    add_column :product_types, :billboard_data, :text
  end
end
