class AddHeroAndProductImagesToProducts < ActiveRecord::Migration[5.0]
  def change
    add_column :products, :hero_image_id, :string
    add_column :products, :hero_image_filename, :string
    add_column :products, :hero_image_size, :integer
    add_column :products, :hero_image_content_type, :string

    add_column :products, :product_image_id, :string
    add_column :products, :product_image_filename, :string
    add_column :products, :product_image_size, :integer
    add_column :products, :product_image_content_type, :string

    remove_column :products, :billboard_data, :text
    remove_column :products, :image_data, :text
  end
end
