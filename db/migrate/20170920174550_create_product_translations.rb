class CreateProductTranslations < ActiveRecord::Migration[5.0]
  def up
    # 1. Create translation table.
    create_table :product_translations do |t|
      t.integer :product_id, null: false
      t.string :locale, null: false
      t.string :summary
      t.text :description
      t.string :youtube_video_id

      t.timestamps

      t.index ['locale'], name: 'index_product_translations_on_locale'
      t.index ['product_id', 'locale'], name: 'index_product_translations_on_product_id_and_locale', unique: true
      t.index ['product_id'], name: 'index_product_translations_on_product_id'
    end

    # 2. Copy data from parent to translation table.
    execute %{
      INSERT INTO product_translations(product_id, locale, summary, description, youtube_video_id, created_at, updated_at)
      SELECT id, '#{I18n.default_locale.to_s}', summary, description, youtube_video_id, created_at, updated_at FROM products;
    }

    # 3. Remove translated fields from parent table.
    remove_column :products, :summary
    remove_column :products, :description
    remove_column :products, :youtube_video_id
  end

  def down
    # 1. Add translated fields to parent table.
    add_column :products, :summary, :string
    add_column :products, :description, :text
    add_column :products, :youtube_video_id, :string

    # 2. Copy data from translation to parent table.
    execute %{
      UPDATE products a
      SET summary = b.summary,
          description = b.description,
          youtube_video_id = b.youtube_video_id
      FROM product_translations b
      WHERE b.product_id = a.id
      AND b.locale = '#{I18n.default_locale.to_s}';
    }

    # 3. Drop translation table.
    drop_table :product_translations
  end
end
