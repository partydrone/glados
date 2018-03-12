class AddMetaDescriptionToTranslationTables < ActiveRecord::Migration[5.0]
  def change
    add_column :article_translations, :meta_description, :string
    add_column :feature_translations, :meta_description, :string
    add_column :product_translations, :meta_description, :string
  end
end
