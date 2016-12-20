class AddHeroToFeatures < ActiveRecord::Migration[5.0]
  def change
    add_column :features, :hero_image_id, :string
    add_column :features, :hero_image_filename, :string
    add_column :features, :hero_image_size, :integer
    add_column :features, :hero_image_content_type, :string
    
    remove_column :features, :billboard_data, :text
  end
end
