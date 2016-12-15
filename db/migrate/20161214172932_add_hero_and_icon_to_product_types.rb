class AddHeroAndIconToProductTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :product_types, :hero_image_id, :string
    add_column :product_types, :hero_image_filename, :string
    add_column :product_types, :hero_image_size, :integer
    add_column :product_types, :hero_image_content_type, :string

    add_column :product_types, :icon_image_id, :string
    add_column :product_types, :icon_image_filename, :string
    add_column :product_types, :icon_image_size, :integer
    add_column :product_types, :icon_image_content_type, :string

    remove_column :product_types, :billboard_data, :text
    remove_column :product_types, :icon_data, :text
  end
end
