class AddHeroImageToArticles < ActiveRecord::Migration[5.0]
  def change
    add_column :articles, :hero_image_id, :string
    add_column :articles, :hero_image_filename, :string
    add_column :articles, :hero_image_size, :integer
    add_column :articles, :hero_image_content_type, :string
  end
end
