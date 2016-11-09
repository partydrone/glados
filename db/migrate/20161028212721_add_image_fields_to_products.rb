class AddImageFieldsToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :image_data, :text
    add_column :products, :billboard_data, :text
  end
end
